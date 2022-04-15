#include "DISB.h"

namespace DISB {


BenchmarkConfig::TaskConfig::TaskConfig(const std::string& _model_path, const std::string& _model_name, int _freq, int _prio) :
    model_path(_model_path), model_name(_model_name), frequency(_freq), priority(_prio) {}

BenchmarkConfig::TaskConfig::Trace::Trace(int submit) : submit_time(submit) {}

void BenchmarkConfig::from_json(const std::string& path) {
    std::ifstream f(path);
    std::string tmp, j = "";
    while (getline(f, tmp)) j += tmp;
    f.close();
    reef::util::JsonParser p;
    auto obj = p.parse(j);
    time = obj->mval["time"]->ival;
    for (auto obj : obj->mval["rt"]->lval) {
        // auto model_path = obj->mval["path"]->sval;
        auto model_name = obj->mval["name"]->sval;
        auto model_path = std::string(RESOURCE_DIR) + "/" + model_name;
        auto freq = obj->mval["frequency"]->ival;
        BenchmarkConfig::TaskConfig task(model_path, model_name, freq, 0);
        auto trace = obj->mval.find("trace");
        if (trace != obj->mval.end()) {
            task.traces.reset(new std::vector<TaskConfig::Trace>());
            task.traces->reserve(trace->second->lval.size());
            for (auto t : trace->second->lval) {
                task.traces->push_back(t->ival);
            }
        }
        tasks.push_back(task);
    }
    for (auto obj : obj->mval["be"]->lval) {
        auto model_name = obj->mval["name"]->sval;
        auto model_path = std::string(RESOURCE_DIR) + "/" + model_name;
        auto freq = obj->mval["frequency"]->ival;
        tasks.push_back(TaskConfig(model_path, model_name, freq, 1));
    }
    delete obj;
}


    

} // namespace DISB