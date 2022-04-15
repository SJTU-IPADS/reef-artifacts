#include "reef/executor/hybrid_executor.h"
#include <algorithm>

using namespace reef::executor;

void run(HybridExecutor* executor, int num_test, std::vector<int64_t>* d, bool sycn_device) {
    std::vector<int64_t>& durations = *d;
    durations.reserve(num_test);
    for (int i = 0; i < num_test; i++) {
        auto start = std::chrono::system_clock::now();
        // executor->reset();
        executor->execute_preemptale(executor->stream());
        hipStreamSynchronize(executor->stream());
        auto end = std::chrono::system_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
        durations.push_back(duration.count());
    }
    int64_t max = durations[0], min = durations[0], sum = 0;
    for (int i = 0; i < num_test; i++) {
        max = std::max(max, durations[i]);
        min = std::min(min, durations[i]);
        sum += durations[i];
    }

    // std::cerr << "num_tests: " << num_test << ", max: " << ((double)max)/1000.0 
    //     << "ms, min: " << ((double)min)/1000.0 
    //     << "ms, avg: " << ((double)sum)/1000.0/num_test
    //     << "ms, throughput: " << ((double)num_test) * 1000 * 1000 / ((double) sum)
    //     << "req/s\n";  
}

int main(int argc, char** argv) {

    if (argc != 3) {
        std::cerr << "Usage: ./dkm_stream resource_dir model_name" << std::endl;
        exit(1);
    }

    std::string resource_dir(argv[1]);
    std::string model_name(argv[2]);

    int num_test = 100;
    if (argc == 4) {
        num_test = atoi(argv[3]);
    }

    int concurrency = 2;
    HybridExecutor** executors = new HybridExecutor*[concurrency];
    std::vector<int64_t>** durations = new std::vector<int64_t>*[concurrency];
    for (int i = 0; i < concurrency; i++) {
        executors[i] = new HybridExecutor();
        executors[i]->load_hybrid_model_from_file(
            (resource_dir + "/" + model_name + "/" + model_name + ".json").c_str(),
            (resource_dir + "/" + model_name + "/" + model_name + ".profile.json").c_str(),
            (resource_dir + "/" + model_name + "/" + model_name + ".trans.co").c_str(),
            (resource_dir + "/" + model_name + "/" + model_name + ".be.co").c_str()
        );
        hipStream_t s;
        hipStreamCreate(&s);
        hipStreamCreate(&s);
        hipStreamCreate(&s);
        hipStreamCreate(&s);
        // hipStreamCreate(&s);
        durations[i] = new std::vector<int64_t>;
        executors[i]->execute_preemptale();
    }

    std::thread** threads = new std::thread*[concurrency];
    auto start = std::chrono::system_clock::now();
    for (int i = 0; i < concurrency; i++) {
        bool sycn_device = i == 0 ? true : false;
        threads[i] = new std::thread(run, executors[i], num_test, durations[i], sycn_device);
    }
    
    for (int i = 0; i < concurrency; i++)
        threads[i]->join();
    auto end = std::chrono::system_clock::now();

    std::vector<int64_t> final_duration;
    
    double sum_throughput = 0.0;
    for (int i = 0; i <concurrency; i++) {
        std::vector<int64_t> *duration = durations[i];
        int64_t sum = 0;
        for (auto d : *duration) {
            final_duration.push_back(d);
            sum += d;
            // float latency = d / 1000.0;
            // std::cout << latency << std::endl;
        }
        sum_throughput += ((double)num_test) * 1000 * 1000 / ((double) sum);
    }


    int64_t max = final_duration[0], min = final_duration[0], sum = 0;
    for (auto d : final_duration) {
        max = std::max(max, d);
        min = std::min(min, d);
        sum += d;
        float latency = d / 1000.0;
        // std::cout << latency << std::endl;
    }

    std::sort(final_duration.begin(), final_duration.end());

    auto total_duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    int total_tests = num_test * concurrency;
    std::cerr << "num_tests: " << total_tests
              << ", min: " << ((double)final_duration[0]) / 1000.0
              << ", 25%: " << ((double)final_duration[total_tests / 4]) / 1000.0
              << ", 50%: " << ((double)final_duration[total_tests / 2]) / 1000.0
              << ", 75%: " << ((double)final_duration[total_tests / 4 * 3]) / 1000.0
              << ", max: " << ((double)final_duration[total_tests-1]) / 1000.0
              << "ms, avg: " << ((double)sum)/1000.0/total_tests
              << "ms, throughput: " << ((double)total_tests) * 1000 * 1000 / ((double) total_duration.count())
              << "req/s, sum_throughput: " << sum_throughput
              << "req/s" << std::endl;
              

    return 0;
}