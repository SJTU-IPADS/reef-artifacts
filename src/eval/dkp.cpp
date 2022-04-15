#include "reef/server/server.h"

using namespace reef::server;
int main(int argc, char* argv[]) {
    if (argc != 4) {
        std::cout << "usage: dkp_throughput model_name [dkp|stream|rt] num_test\n";
        return 0;
    }
    
    std::string resource_dir(RESOURCE_DIR);
    std::string model_name(argv[1]);
    std::string method(argv[2]);
    int num_tests = std::atoi(argv[3]);
    REEFScheduler::ScheduleMode mode;
    if (method == "dkp") {
        mode = REEFScheduler::REEF;
    } else if (method == "stream") {
        mode = REEFScheduler::MultiStream;
    } else if (method == "rt") {
        mode = REEFScheduler::REEF;
    } else {
        std::cout << "unknown method: " << method << std::endl;
        return 0;
    }

    REEFScheduler scheduler(mode);
    REEFScheduler::ModelID rt_mid;
    std::vector<REEFScheduler::ModelID> be_mids;
    REEFScheduler::QueueID rt_qid;
    std::vector<REEFScheduler::QueueID> be_qids;
    {
        if (method == "stream")
            scheduler.create_queue(REEFScheduler::BestEffortQueue, rt_qid);
        else
            scheduler.create_queue(REEFScheduler::RealTimeQueue, rt_qid);
        scheduler.load_model(resource_dir + "/" + model_name, model_name, rt_mid);
        scheduler.bind_model_queue(rt_qid, rt_mid);
    }

    int num_be_queues;
    if (method == "dkp") num_be_queues = 5;
    else if (method == "stream") num_be_queues = 1;
    else if (method == "rt") num_be_queues = 0;

    for (int i = 0; i < num_be_queues; i++)
    {
        REEFScheduler::QueueID qid;
        REEFScheduler::ModelID mid;
        scheduler.load_model(resource_dir + "/" + model_name, model_name, mid);
        scheduler.create_queue(REEFScheduler::BestEffortQueue, qid);
        scheduler.bind_model_queue(qid, mid);
        be_mids.push_back(mid);
        be_qids.push_back(qid);
    }

    // num_tests = 100;
    std::vector<REEFScheduler::TaskID> rt_tasks;
    std::vector<REEFScheduler::TaskID> be_tasks;    
    for (int i = 0; i < num_tests; i++) {
        REEFScheduler::TaskID tid;
        scheduler.new_task(rt_mid, tid);
        rt_tasks.push_back(tid);
    }
    for (int i = 0; i < num_be_queues; i++) {
        for (int j = 0; j < num_tests; j++) {
            REEFScheduler::TaskID tid;
            scheduler.new_task(be_mids[i], tid);
            be_tasks.push_back(tid);
        }
    }

    auto start = std::chrono::system_clock::now();
    scheduler.run();
    scheduler.wait_task(rt_tasks[num_tests - 1]);
    auto end = std::chrono::system_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();
    scheduler.shutdown();

    int64_t throughput = 0;
    int64_t sum_lat = 0;
    for (int i = 0; i < num_tests; i++) {
        std::shared_ptr<REEFScheduler::Task> t;
        scheduler.get_task(rt_tasks[i], t);
        auto lat = t->get_timestamp();
        auto exe_lat = std::chrono::duration_cast<std::chrono::microseconds>(lat[2] - lat[1]).count();
        sum_lat += exe_lat;
        std::cout << "RT execution latency: " << exe_lat << " us\n";
        throughput ++;
    }
    for (int i = 0; i < be_tasks.size(); i++) {
        std::shared_ptr<REEFScheduler::Task> t;
        scheduler.get_task(be_tasks[i], t);
        if (method == "dkp" && t->is_padded()) throughput ++;
        if (method == "stream") throughput ++;
    }

    std::cout << "RT avg latency: " << (float)(sum_lat / num_tests) / 1000.0 << " ms\n";
    std::cout << "Throughput: " << (float)(throughput * 1000 * 1000 / duration) << " reqs/s\n";
    return 0;
}