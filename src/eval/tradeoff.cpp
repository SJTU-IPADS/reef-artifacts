
#include <sys/time.h>
#include <fstream>

#include "reef/executor/hybrid_executor.h"
#include "reef/server/scheduler.h"


using namespace reef;
using namespace reef::server;

int main(int argc, const char* argv[]) {
    if (argc != 4) {
        printf("Usage: tradeoff model_name queue_size test_time\n");
        return 0;
    }

    std::string rscdir(RESOURCE_DIR);
    int queue_size = std::atoi(argv[2]);
    std::string model_name(argv[1]);
    int test_time = std::atoi(argv[3]);
    
    REEFScheduler::ScheduleMode mode;

    REEFScheduler scheduler;
    scheduler.set_wait_sync(true);
    scheduler.set_be_stream_cap(queue_size);
    REEFScheduler::ModelID be_mid, rt_mid;
    REEFScheduler::QueueID rt_qid, be_qid;
    scheduler.create_queue(
        REEFScheduler::TaskQueueType::BestEffortQueue, 
        be_qid
    );
    scheduler.load_model(rscdir+"/"+model_name, model_name, be_mid);
    scheduler.create_queue(
        REEFScheduler::TaskQueueType::RealTimeQueue, 
        rt_qid
    );
    scheduler.load_model(rscdir+"/mocked_kernel", "mocked_kernel", rt_mid);

    scheduler.bind_model_queue(rt_qid, rt_mid);
    scheduler.bind_model_queue(be_qid, be_mid);

    scheduler.run();
    int64_t exe_latency;
    {
        // evaluate execution latency
        int64_t sum_lat = 0;
        for (int i = 0; i < 50; i++) {
            REEFScheduler::TaskID tid;
            scheduler.new_task(be_mid, tid);
            auto start = std::chrono::system_clock::now();
            std::shared_ptr<REEFScheduler::Task> task;
            scheduler.get_task(tid, task);
            scheduler.wait_task(tid); 
            auto end = std::chrono::system_clock::now();
            // sum_lat += std::chrono::duration_cast<std::chrono::microseconds>(end-start).count();
            auto time_stamp = task->get_timestamp();
            sum_lat += std::chrono::duration_cast<std::chrono::microseconds>(time_stamp[2]-time_stamp[1]).count();
        }
        exe_latency = sum_lat / 50;
    }

    auto start = std::chrono::system_clock::now() + std::chrono::milliseconds(100);
    auto end = std::chrono::system_clock::now() + std::chrono::seconds(test_time);

    if (queue_size != 1) { // currently, the implementation may have BUG when queue size = 1
        std::thread be_thread([=, &scheduler](){
            std::this_thread::sleep_until(start);
            while (std::chrono::system_clock::now() < end) {
                REEFScheduler::TaskID tid;
                scheduler.new_task(be_mid, tid);
                // std::cout << "new task " << tid << std::endl;
                scheduler.wait_task(tid);
                // std::cout << "task done " << tid << std::endl;
            }
            return;
        });
    

        std::this_thread::sleep_until(start);
        while (std::chrono::system_clock::now() < end) {
            REEFScheduler::TaskID tid;
            scheduler.new_task(rt_mid, tid);
            scheduler.wait_task(tid);
            std::this_thread::sleep_for(std::chrono::microseconds(1000));
        }

        be_thread.join();
    }
    scheduler.shutdown();

    std::cout << "Execute avg latency: " << exe_latency << " us\n";
    std::cout << "Preempt avg latency: " << scheduler.avg_preempt_latency() << " us\n";

    return 0;
}
