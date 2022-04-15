#include "reef/executor/hybrid_executor.h"

using namespace reef;

void load_executor(std::string name, executor::HybridExecutor &exe) {
    std::string resource(RESOURCE_DIR);
    std::string be = resource + name + "/" + name + ".be.co";
    std::string rt = resource + name + "/" + name + ".trans.co";
    std::string json = resource + name + "/" + name + ".json";
    std::string profile = resource + name + "/" + name + ".profile.json";
    exe.load_hybrid_model_from_file(
        json.c_str(),
        profile.c_str(),
        rt.c_str(),
        be.c_str()
    );
}

using namespace std::chrono;
void run(executor::HybridExecutor *exe, hipStream_t s, system_clock::time_point start, system_clock::time_point end) {
    while (system_clock::now() < start) std::this_thread::sleep_for(microseconds(50));
    int count = 0;
    int64_t sum = 0;
    while (system_clock::now() < end) {
        auto t1 = system_clock::now();
        exe->execute_preemptale(s);
        auto t2 = system_clock::now();
        count++;
        sum += duration_cast<microseconds>(t2-t1).count();
    }
    int throughput = count * 1000 * 1000 / duration_cast<microseconds>(end-start).count();
    float lat = (float)sum / count / 1000.0;
    std::cout << "throughput: " << throughput << ", latency: " << lat << std::endl;
}

int main() {
    executor::HybridExecutor e1, e2, e3;
    load_executor("vgg_low", e1);
    load_executor("resnet152_small", e2);
    load_executor("resnet152_small", e3);

    hipStream_t s1, s2,s3;
    hipStreamCreate(&s1);
    hipStreamCreate(&s2);
    hipStreamCreate(&s3);

    auto n = system_clock::now();
    std::thread t1([&](){
        run(&e1, s1, n + milliseconds(100), n + seconds(1));
    });
    std::thread t2([&](){
        run(&e2, s2, n + milliseconds(100), n + seconds(1));
    });
    std::thread t3([&](){
        run(&e3, s3, n + milliseconds(100), n + seconds(1));
    });
    t1.join();
    t2.join();
    t3.join();
    return 0;
}