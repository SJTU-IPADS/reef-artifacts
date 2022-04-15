#pragma once
#include <vector>
#include <fstream>
#include <sstream>
#include <map>
#include <memory>
#include <chrono>
#include <thread>
#include <list>
#include <iostream>
#include "reef/util/json.h"

#ifndef RESOURCE_DIR
#define RESOURCE_DIR "../resource"
#endif


namespace DISB {

struct BenchmarkConfig {
    struct TaskConfig {
        TaskConfig(const std::string& _model_path, const std::string& _model_name,int _freq, int _prio);
        std::string model_path;
        std::string model_name;
        int frequency;
        int priority;

        struct Trace {
            Trace(int submit);
            int submit_time; // ms
        };
        std::shared_ptr<std::vector<Trace>> traces;
    };
    int time; // second
    std::vector<TaskConfig> tasks;
    void from_json(const std::string &path);
};

class BenchmarkClient {
public:
    class ClientInitConfig {
    public:
        int priority;
    };
    class LoadModelConfig {
    public: 
        std::string model_path;
        std::string model_name;
        int frequency;
    };
    virtual ~BenchmarkClient() {}
    virtual void init(ClientInitConfig* client_init_config) = 0;
    virtual void load_model(LoadModelConfig* load_model_config) = 0;
    virtual void set_input(void* input_data) = 0;
    virtual void get_output(void* output_data) = 0;
    virtual void infer() = 0;
    virtual std::shared_ptr<ClientInitConfig> generate_client_config(const BenchmarkConfig::TaskConfig& task_conf) = 0;
    virtual std::shared_ptr<LoadModelConfig> generate_model_config(const BenchmarkConfig::TaskConfig& task_conf) = 0;
};

using std::chrono::system_clock;
using std::chrono::duration_cast;
using std::chrono::microseconds;
using std::chrono::nanoseconds;

template<typename InferClient>
class BenchmarkSuite {

static_assert(std::is_base_of<BenchmarkClient, InferClient>(), "InferClient must inheirt from BenchmarkClient");

public:
    BenchmarkSuite() {}
    ~BenchmarkSuite() {}
    void init(const BenchmarkConfig& conf);
    
    void run();

    float get_throughput(int client_idx);
    
    float get_throughput();

    float get_avg_latency(int client_idx);

    float get_avg_latency_by_priority(int priority);

    void print_client_latency(int client_idx);
protected:
    int eval_time_sec = 1; // second
    BenchmarkConfig conf;
    std::vector<std::unique_ptr<BenchmarkClient>> clients;
    std::vector<std::list<nanoseconds>> infer_latency;
    // void  
};

template<typename InferClient>
void BenchmarkSuite<InferClient>::init(const BenchmarkConfig& conf) {
    eval_time_sec = conf.time;
    for (auto task_conf : conf.tasks) {
        std::unique_ptr<BenchmarkClient> client(new InferClient);
        auto client_conf = client->generate_client_config(task_conf);
        // auto model_conf = client->generate_model_config(task_conf);
        client->init(client_conf.get());
        // client->load_model(model_conf.get());
        clients.push_back(std::move(client));
    }
    for (int i = 0; i < conf.tasks.size(); i++) {
        auto model_conf = clients[i]->generate_model_config(conf.tasks[i]);
        clients[i]->load_model(model_conf.get());
    }
    this->conf = conf;
}

template<typename InferClient>
void BenchmarkSuite<InferClient>::run() {
    // 1. warm up
    for (auto& client : clients)
        client->infer();
    
    // 2. measure the average latency of each model
    const int measure_time = 5;
    std::vector<nanoseconds> model_latency;
    nanoseconds all_sum_latency;
    int num_rt_clients = 0;
    for (int i = 0; i < clients.size(); i++) {
        if (conf.tasks[i].priority != 0) continue;
        nanoseconds sum_latency(0);
        for (int j = 0; j < measure_time; j++) {
            auto start = system_clock::now();
            clients[i]->infer();
            auto end = system_clock::now();
            auto latency = end - start;
            sum_latency += latency;
        }
        model_latency.push_back(sum_latency / measure_time);
        all_sum_latency = all_sum_latency + sum_latency / measure_time;
        num_rt_clients ++;
    }

    // check if need delay start time?
    nanoseconds avg_delay(0);
    bool need_delay = num_rt_clients > 1;
    int rt_task_freq = 0; // reqs/s
    for (int i = 0; i < conf.tasks.size(); i++) {
        auto &task_conf = conf.tasks[i];
        if (task_conf.priority == 0) {
            if (rt_task_freq == 0)
                rt_task_freq = task_conf.frequency;
            else if (rt_task_freq != task_conf.frequency)
                need_delay = false;
        }
    }
    if (need_delay) {
        nanoseconds period(1000*1000*1000/rt_task_freq);
        if (period < all_sum_latency) {
            // report?
        } else {
            avg_delay = (period - all_sum_latency) / num_rt_clients;
        }
    }
    
    // 3. run evaluation
    auto start_time = system_clock::now() + std::chrono::seconds(1);
    auto end_time = start_time + std::chrono::seconds(eval_time_sec);
    infer_latency.resize(clients.size());
    std::vector<std::unique_ptr<std::thread>> threads(clients.size());
    std::vector<std::list<uint64_t>> latency_record(clients.size());
    nanoseconds start_delay(0);
    for (int i = 0; i < clients.size(); i++) {
        threads[i].reset(
            new std::thread([=, &latency_record]() {
                auto& client = this->clients[i];
                auto& client_trace = this->conf.tasks[i].traces;
                nanoseconds period_ns(1000*1000*1000/this->conf.tasks[i].frequency);
                auto next_period = start_time + start_delay;
                int trace_idx = 0;
                if (client_trace.get() != nullptr && client_trace->size() > 0) {
                    next_period = start_time + 
                        std::chrono::milliseconds(client_trace->at(0).submit_time);
                    trace_idx ++;
                }
                while (true) {
                    auto current = system_clock::now();
                    if (current >= end_time) break;
                    if (current >= next_period) {
                        if (client_trace.get() != nullptr) {
                            if (trace_idx < client_trace->size()) {
                                next_period = start_time + 
                                    std::chrono::milliseconds(client_trace->at(trace_idx).submit_time);
                                trace_idx ++;
                            }
                        } else {
                            next_period = next_period + period_ns;
                        }
                        client->infer();
                        auto complete_time = system_clock::now();
                        auto latency = complete_time - current;
                        // printf("model %d : %ld us\n", i, latency.count() / 1000);
                        this->infer_latency[i].push_back(latency);
                    } else {
                        std::this_thread::sleep_for(microseconds(50));
                    }
                    if (client_trace.get() != nullptr && trace_idx >= client_trace->size())
                        break; 
                }

            })
        );
        if (conf.tasks[i].priority == 0) {
            start_delay += model_latency[i] + avg_delay;
        }
    }

    for (auto &t : threads) {
        t->join();
    }
}

template<typename InferClient>
float BenchmarkSuite<InferClient>::get_throughput(int client_idx) {
    return (float)infer_latency[client_idx].size() / (float)eval_time_sec;
}

template<typename InferClient> 
float BenchmarkSuite<InferClient>::get_throughput() {
    float sum = 0;
    for (int i = 0; i < infer_latency.size(); i++) {
        sum += get_throughput(i);
    }
    return sum;
}

template<typename InferClient> 
float BenchmarkSuite<InferClient>::get_avg_latency(int client_idx) {
    float sum = 0;
    float count = 0;
    for (auto lat : infer_latency[client_idx]) {
        sum += (float)lat.count()/1000.0;
        count += 1;
    }
    if (count == 0) return 0;
    return (sum / count) / 1000.0;
}

template<typename InferClient> 
float BenchmarkSuite<InferClient>::get_avg_latency_by_priority(int priority) {
    float sum = 0;
    float count = 0;
    for (int client_idx = 0; client_idx < conf.tasks.size(); client_idx++) {
        if (conf.tasks[client_idx].priority != priority) continue;
        for (auto lat : infer_latency[client_idx]) {
            sum += (float)lat.count()/1000.0;
            count += 1;
        }
    }
    if (count == 0) return 0;
    return (sum / count) / 1000.0;
}


template<typename InferClient> 
void BenchmarkSuite<InferClient>::print_client_latency(int client_idx) {
    for (auto lat : infer_latency[client_idx]) {
        printf("model %d : %ld us\n", client_idx, lat.count() / 1000);
    }
}

} // namespace DISB