import sys,json
from transform_kernel import replace_global_with_device,replace_blockIdx_with_task_idx, find_all_func_params, replace_shared_memory
from transform_kernel import add_device_function_param,add_global_definition, generate_function_declaration, split_function_declaration

def add_proxy_kernels():
    template = """
#define CALL_FRAMEWORK(idx) \\
extern "C" __global__ void proxy_kernel_##idx(\\
  void* func, float** param) \\
{\\
  asm volatile(\\
    "  s_load_dwordx4 s[16:19], s[4:5], 0x0\\n"\\
    "  s_waitcnt lgkmcnt(0)\\n"\\
    "  s_mov_b64 s[4:5], s[18:19]\\n"\\
    "  s_setpc_b64 s[16:17]\\n"\\
    "  s_endpgm\\n"\\
  );\\
}    

"""
    for i in range(1, 11):
        template += f"CALL_FRAMEWORK({i})\n"
    for i in range(1, 11):
        template += f"CALL_FRAMEWORK(nostack_{i})\n"
    return template.splitlines(True)

def generate_ids(lines):
    new_lines = []
    for l in lines:
        new_lines.append(l)
        if l.find("__global__") != -1:
            new_lines.append(
                "    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;\n"
            )
    return new_lines


if __name__ == "__main__":

    if len(sys.argv) != 3:
        print("Usage: python pointer_baseline.py input_file schedule.json")
        exit(0)

    f = open(sys.argv[1], "r")
    lines = f.readlines()
    f.close()


    schedule = json.loads(open(sys.argv[2], "r").read())

    launch_params = {}
    for kernel in schedule["kernels"]:
        launch_params[kernel["name"]] = kernel["launch_params"]

    func_params = find_all_func_params(lines)
    lines = generate_ids(lines)
    lines.extend(add_proxy_kernels())

    output_f_name = sys.argv[1][:sys.argv[1].rfind(".")] + ".ptropt.cu"

    f = open(output_f_name, "w")
    f.writelines(lines)
    f.close()
    