#include "reef/server/scheduler.h"

using namespace reef;
using namespace reef::server;

int main(int argc, char** argv) {
    if (argc != 5) {
        std::cout << "usage: ./DNN-preempt model concurrency [wait|reset|reset-raw] test_time" << std::endl;
        exit(1);
    }

    std::string resource_dir(RESOURCE_DIR);
    std::string model_name(argv[1]);
    int concurrency = atoi(argv[2]);
    std::string method(argv[3]);
    int test_time = atoi(argv[4]);

    
    REEFScheduler::ScheduleMode mode;
    if (method == "wait") {
        mode = REEFScheduler::ScheduleMode::WaitPreempt;
    } else if (method == "reset") {
        mode = REEFScheduler::ScheduleMode::REEF;
    } else if (method == "reset-raw") {
        mode = REEFScheduler::ScheduleMode::REEF;
    } else {
        std::cout << "method not support: " << method << std::endl;
        exit(1);
    }

    if (concurrency < 1) concurrency = 1;

    std::vector<REEFScheduler::ModelID> be_models;
    REEFScheduler scheduler(mode);
    if (method == "reset-raw") {
        scheduler.set_wait_sync(true);
        scheduler.set_be_stream_cap(256);
    }
    for (int i = 0 ; i < concurrency; i++) {
        REEFScheduler::QueueID qid;
        scheduler.create_queue(
            REEFScheduler::TaskQueueType::BestEffortQueue, 
            qid
        );
        REEFScheduler::ModelID mid;
        scheduler.load_model(
            resource_dir + "/" + model_name,
            model_name,
            mid
        );
        scheduler.bind_model_queue(qid, mid);
        be_models.push_back(mid);
    }

    REEFScheduler::ModelID rt_model;
    // use a mocked model for rt_model
    {
        REEFScheduler::QueueID qid;
        scheduler.create_queue(
            REEFScheduler::TaskQueueType::RealTimeQueue, 
            qid
        );
        REEFScheduler::ModelID mid;
        scheduler.load_model(
            resource_dir + "/" + "mocked_kernel",
            "mocked_kernel",
            mid
        );
        scheduler.bind_model_queue(qid, mid);
        rt_model = mid;
    }

    scheduler.run();

    auto start = std::chrono::system_clock::now() + std::chrono::milliseconds(100);
    auto end = std::chrono::system_clock::now() + std::chrono::seconds(test_time);
    
    std::vector<std::unique_ptr<std::thread>> be_threads;
    for (int i = 0; i < concurrency; i++) {
        be_threads.push_back(std::unique_ptr<std::thread>(new std::thread([=, &scheduler, &be_models](){
            auto mid = be_models[i];
            auto now = std::chrono::system_clock::now();
            std::this_thread::sleep_until(start);
            while (std::chrono::system_clock::now() < end) {
                REEFScheduler::TaskID tid;
                scheduler.new_task(mid, tid);
                // std::cout << "new task " << tid << std::endl;
                scheduler.wait_task(tid);
                // std::cout << "task done " << tid << std::endl;
            }
        })));
    }

    std::this_thread::sleep_until(start);
    while (std::chrono::system_clock::now() < end) {
        REEFScheduler::TaskID tid;
        scheduler.new_task(rt_model, tid);
        scheduler.wait_task(tid);
        std::this_thread::sleep_for(std::chrono::microseconds(1000 + random() % (1000 * concurrency )));
    }

    for (auto& t : be_threads) {
        t->join();
    }
    std::cout << "method: " << method << std::endl
              << "Preempt avg latency: " << scheduler.avg_preempt_latency() << " us" << std::endl;
    scheduler.shutdown();
    return 0;
}