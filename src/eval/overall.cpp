#include "reef/client/client.h"
#include "reef/server/server.h"
#include "reef/util/json.h"

#include "eval/DISB.h"
#include "eval/reef_bench.h"

using namespace reef;
using namespace DISB;

server::REEFScheduler::ScheduleMode get_test_method(const std::string &method)
{
    if (method == "RT") return server::REEFScheduler::REEF;
    if (method == "RESET") return server::REEFScheduler::Reset; // Reset Preemption
    if (method == "REEF") return server::REEFScheduler::REEF; // Reset Preemption + Dynamic Padding
    if (method == "STREAM") return server::REEFScheduler::MultiStream; // Multiple GPU stream
    if (method == "SEQ") return server::REEFScheduler::NoPreempt;  // No Preemption
    if (method == "WAIT") return server::REEFScheduler::WaitPreempt; // Wait Preemption
    std::cerr << "Unknown method " << method << std::endl;
    exit(-1);
    return server::REEFScheduler::REEF;
}

int main(int argc, char** argv) {
   if (argc != 3 && argc != 4) {
        std::cout << "usage:" << argv[0] << " method config.json [test_time]" << std::endl;
        exit(1);
    }    
    std::string method(argv[1]);
    auto sche_mode = get_test_method(method);
    DISB::BenchmarkConfig conf;
    conf.from_json(argv[2]);
    if (argc == 4) {
        int test_time = std::atoi(argv[3]);
        conf.time = test_time;
        std::cout << "override test time to: " << test_time << " s\n";
    }
    if (method == "RT") {
        std::vector<DISB::BenchmarkConfig::TaskConfig> new_tasks;
        for (auto task : conf.tasks) {
            if (task.priority == 0) new_tasks.push_back(task);
        }
        conf.tasks = new_tasks; // only keep real-time tasks
    }
    // reef::server::REEFServer server(DEFAULT_REEF_ADDR);
    // server.run();
    reef::server::REEFScheduler scheduler(sche_mode);
    scheduler.set_wait_sync(true);
    reef::eval::REEFDISBClient::scheduler = &scheduler;
    hipStreamSynchronize(GPUStreamDefault);

    DISB::BenchmarkSuite<reef::eval::REEFDISBClient> bench;
    bench.init(conf);
    scheduler.run();
    bench.run();

    scheduler.shutdown();
    // server.shutdown();
    
    for (int i = 0; i < conf.tasks.size(); i++) {
        bench.print_client_latency(i);
    }

    std::cout << "thoughputs: \n";
    for (int i = 0; i < conf.tasks.size(); i++) {
        std::cout << "idx: " << i << ", prio: " << conf.tasks[i].priority
            << ", throughput: " << bench.get_throughput(i) << " resqs/s\n";
    }
    std::cout << "overall throughput: " << bench.get_throughput() << " reqs/s\n";

    std::cout << "RT avg latency: " << bench.get_avg_latency_by_priority(0) << " ms\n";
    std::cout << "Preemption avg latency: " << scheduler.avg_preempt_latency() << " us\n";
    std::cout << "Kernel selection latency: " << scheduler.avg_kernel_sel_latency() << " ns\n";
    return 0;
}