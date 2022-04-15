#pragma once

#include "eval/DISB.h"
#include "reef/client/client.h"
#include "reef/server/scheduler.h"

namespace reef {
namespace eval {

class REEFDISBRemoteClient : public DISB::BenchmarkClient {
public:
    virtual ~REEFDISBRemoteClient() {}
    virtual void init(ClientInitConfig* client_init_config) override;
    virtual void load_model(LoadModelConfig* load_model_config) override;
    virtual void set_input(void* input_data) override;
    virtual void get_output(void* output_data) override;
    virtual void infer() override;
    virtual std::shared_ptr<ClientInitConfig> generate_client_config(const DISB::BenchmarkConfig::TaskConfig& task_conf) override;
    virtual std::shared_ptr<LoadModelConfig> generate_model_config(const DISB::BenchmarkConfig::TaskConfig& task_conf) override;

private:
    std::unique_ptr<client::REEFClient> client;
    std::shared_ptr<client::ModelHandle> model;
};

class REEFDISBClient : public DISB::BenchmarkClient {
public:
    virtual ~REEFDISBClient() {}
    virtual void init(ClientInitConfig* client_init_config) override;
    virtual void load_model(LoadModelConfig* load_model_config) override;
    virtual void set_input(void* input_data) override;
    virtual void get_output(void* output_data) override;
    virtual void infer() override;
    virtual std::shared_ptr<ClientInitConfig> generate_client_config(const DISB::BenchmarkConfig::TaskConfig& task_conf) override;
    virtual std::shared_ptr<LoadModelConfig> generate_model_config(const DISB::BenchmarkConfig::TaskConfig& task_conf) override;

    static reef::server::REEFScheduler* scheduler; // global scheduler

private:
    server::REEFScheduler::ModelID mid;
    server::REEFScheduler::QueueID qid;
    
};



} // namespace eval
} // namespace reef