#include "reef/client/client.h"
#include "reef/server/server.h"

using namespace reef;
int main() {
    int num_tests = 1000;
    std::vector<unsigned long> latency(num_tests);
    server::REEFServer server(DEFAULT_REEF_ADDR);
    server.run();
    auto sche = server.get_scheduler();
    // sche->load_model()
    client::REEFClient client(DEFAULT_REEF_ADDR);
    client.init(true);
    auto model = client.load_model("../../resource/vgg_low", "vgg_low");
    // model->infer();
    server::REEFScheduler::ModelID mid = 0;

    auto eval_start = std::chrono::system_clock::now();
    for (int i = 0; i < num_tests; i++) {
        server::REEFScheduler::TaskID tid;
        auto start = std::chrono::system_clock::now();
        sche->new_task(mid, tid);
        sche->wait_task(tid);
        auto end = std::chrono::system_clock::now();
        latency[i] = std::chrono::duration_cast<std::chrono::microseconds>(end-start).count();
    }




    // auto eval_start = std::chrono::system_clock::now();
    // for (int i = 0; i < num_tests; i++) {
    //     auto start = std::chrono::system_clock::now();
    //     model->infer();
    //     auto end = std::chrono::system_clock::now();
    //     latency[i] = std::chrono::duration_cast<std::chrono::microseconds>(end-start).count();
    // }
    auto eval_end = std::chrono::system_clock::now();
    auto throughput = 
        (float)num_tests * 1000 * 1000/ std::chrono::duration_cast<std::chrono::microseconds>(eval_end-eval_start).count();
    unsigned long avg_lat = 0;
    std::sort(latency.begin(), latency.end());
    unsigned long max_lat = latency[num_tests-1];
    unsigned long min_lat = latency[0];
    for (auto l : latency)  avg_lat += l;
    avg_lat = avg_lat / num_tests;
    printf("throughput: %f reqs/s, min: %f ms, max: %f ms, avg: %f ms\n",
        throughput, (float)min_lat/1000, (float)max_lat/1000, (float)avg_lat/1000);
    server.shutdown();
    return 0;
}