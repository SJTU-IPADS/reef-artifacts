import sys, json
from transform_kernel import replace_global_with_device,replace_blockIdx_with_task_idx, find_all_func_params
from transform_kernel import add_device_function_param,add_global_definition, generate_function_declaration

def add_preemption_proxy():
    temp = """
extern "C" __global__ void preemption_proxy(volatile int* stop, volatile int* host, volatile int* device) {
    while(!(*stop)) {
        *device = *host;
        long long start_clock = clock64();
        while (clock64() < (start_clock+10000)) {}
    }
}
"""
    return temp.splitlines(True)

def generate_persistent_thread(func_params, launch_params):
    result = []
    for func_name, func_param in func_params.items():
        launch_param = [1, 1, 1, 1, 1, 1]
        if func_name.strip() in launch_params:
            launch_param = launch_params[func_name.strip()]
        params_name = ["task_idx", "thread_idx"]
        for i in range(len(func_param)):
            params_name.append("(%s)args[%d]" %(func_param[i]["type"], i))
        func_call = func_name+ "_device(" + ", ".join(params_name) + ")"

        func_template = """
extern "C" __global__ void %s(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(%d,%d,%d);
    dim3 thread_idx = dim3(threadIdx.x, threadIdx.y, threadIdx.z);
    __shared__ int idx[1];
    while (true) {
        if (*preempted) return;
        if (threadIdx.x + threadIdx.y + threadIdx.z == 0) {
            // first thread of the block
            int temp = atomicAdd(task_slot, 1);
            idx[0] = temp + task_offset;
        }
        __syncthreads();
        if (idx[0] >= task_num) return;
        dim3 task_idx = get_3d_idx(idx[0], task_dim);
        %s;
    }
}
""" % (func_name, 
launch_param[0], launch_param[1], launch_param[2],
func_call
)
        result.extend(func_template.splitlines(True))
    return result


if __name__ == "__main__":

    if len(sys.argv) != 3:
        print("Usage: python preemptable_kernel.py input_file schedule.json")
        exit(0)

    f = open(sys.argv[1], "r")
    lines = f.readlines()
    f.close()


    schedule = json.loads(open(sys.argv[2], "r").read())

    launch_params = {}
    for kernel in schedule["kernels"]:
        launch_params[kernel["name"]] = kernel["launch_params"]

    func_params = find_all_func_params(lines)
    lines = replace_global_with_device(lines)
    lines = replace_blockIdx_with_task_idx(lines)
    lines = add_device_function_param(lines)
    lines = add_global_definition(lines)
    lines.extend(generate_persistent_thread(func_params, launch_params))
    lines.extend(add_preemption_proxy())

    output_f_name = sys.argv[1][:sys.argv[1].rfind(".")] + ".preempt.cu"

    f = open(output_f_name, "w")
    f.writelines(lines)
    f.close()
    