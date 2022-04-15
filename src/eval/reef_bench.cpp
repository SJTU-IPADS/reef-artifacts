#include "eval/reef_bench.h"

namespace reef {
namespace eval {

void REEFDISBRemoteClient::init(ClientInitConfig* client_init_config) {
    client.reset(new client::REEFClient(DEFAULT_REEF_ADDR));
    ASSERT(client.get() != nullptr);
    ASSERT(client->init(client_init_config->priority == 0));
}

void REEFDISBRemoteClient::load_model(LoadModelConfig* load_model_config) {
    ASSERT(client.get() != nullptr);
    model = client->load_model(
        load_model_config->model_path, 
        load_model_config->model_name
    );
    ASSERT(model.get() != nullptr);
}

void REEFDISBRemoteClient::set_input(void* input_data) {
    
}

void REEFDISBRemoteClient::get_output(void* output_data) {
    
}

void REEFDISBRemoteClient::infer() {
    ASSERT(model.get() != nullptr);
    model->infer();
}

std::shared_ptr<DISB::BenchmarkClient::ClientInitConfig> REEFDISBRemoteClient::generate_client_config(const DISB::BenchmarkConfig::TaskConfig& task_conf) {
    auto conf = std::make_shared<DISB::BenchmarkClient::ClientInitConfig>();
    conf->priority = task_conf.priority;
    return conf;
}

std::shared_ptr<DISB::BenchmarkClient::LoadModelConfig> REEFDISBRemoteClient::generate_model_config(const DISB::BenchmarkConfig::TaskConfig& task_conf) {
    auto conf = std::make_shared<DISB::BenchmarkClient::LoadModelConfig>();
    conf->frequency = task_conf.frequency;
    conf->model_path = task_conf.model_path;
    conf->model_name = task_conf.model_name;
    return conf;
}

server::REEFScheduler* REEFDISBClient::scheduler = nullptr;


void REEFDISBClient::init(ClientInitConfig* client_init_config) {
    ASSERT(REEFDISBClient::scheduler != nullptr);
    server::REEFScheduler::TaskQueueType qtp = 
        client_init_config->priority == 0? 
        server::REEFScheduler::TaskQueueType::RealTimeQueue :
        server::REEFScheduler::TaskQueueType::BestEffortQueue;
    switch (REEFDISBClient::scheduler->sche_mode()) {
    case server::REEFScheduler::ScheduleMode::NoPreempt: {
        // sequential execution only need one BE queue
        static server::REEFScheduler::QueueID be_qid = 0;
        static bool be_queue_created = false;
        if (qtp == server::REEFScheduler::TaskQueueType::BestEffortQueue) {
            if (be_queue_created) {
                this->qid = be_qid;
                return;
            }
            ASSERT(
                REEFDISBClient::scheduler->create_queue(qtp, this->qid)
                == Status::Succ
            );
            be_qid = qtp;
            be_queue_created = true;
        }
        break;
    }
    case server::REEFScheduler::ScheduleMode::MultiStream: {
        // multistream don't distinguish RT/BE task
        qtp = server::REEFScheduler::TaskQueueType::BestEffortQueue;
        break;
    }
    default:
        break;
    }
    ASSERT(
        REEFDISBClient::scheduler->create_queue(qtp, this->qid)
        == Status::Succ
    );
}

void REEFDISBClient::load_model(LoadModelConfig* load_model_config) {
    ASSERT(REEFDISBClient::scheduler != nullptr);
    ASSERT(REEFDISBClient::scheduler->load_model(
        load_model_config->model_path + "/" + load_model_config->model_name + ".trans.co",
        load_model_config->model_path + "/" + load_model_config->model_name + ".be.co",
        load_model_config->model_path + "/" + load_model_config->model_name + ".json",
        load_model_config->model_path + "/" + load_model_config->model_name + ".profile.json",
        "",
        this->mid)
        == Status::Succ
    );
    ASSERT(
        REEFDISBClient::scheduler->bind_model_queue(this->qid, this->mid)
        == Status::Succ
    );
}

void REEFDISBClient::set_input(void* input_data) {
    
}

void REEFDISBClient::get_output(void* output_data) {
    
}

void REEFDISBClient::infer() {
    ASSERT(REEFDISBClient::scheduler != nullptr);
    server::REEFScheduler::TaskID tid;
    ASSERT(REEFDISBClient::scheduler->new_task(this->mid, tid) == Status::Succ);
    ASSERT(REEFDISBClient::scheduler->wait_task(tid) == Status::Succ);
}

std::shared_ptr<DISB::BenchmarkClient::ClientInitConfig> REEFDISBClient::generate_client_config(const DISB::BenchmarkConfig::TaskConfig& task_conf) {
    auto conf = std::make_shared<DISB::BenchmarkClient::ClientInitConfig>();
    conf->priority = task_conf.priority;
    return conf;
}

std::shared_ptr<DISB::BenchmarkClient::LoadModelConfig> REEFDISBClient::generate_model_config(const DISB::BenchmarkConfig::TaskConfig& task_conf) {
    auto conf = std::make_shared<DISB::BenchmarkClient::LoadModelConfig>();
    conf->frequency = task_conf.frequency;
    conf->model_path = task_conf.model_path;
    conf->model_name = task_conf.model_name;
    return conf;
}

} // namespace eval
} // namespace reef