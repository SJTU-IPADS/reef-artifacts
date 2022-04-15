import sys, json
from transform_kernel import replace_global_with_device,replace_blockIdx_with_task_idx, find_all_func_params, replace_shared_memory
from transform_kernel import add_device_function_param,add_global_definition, generate_function_declaration, split_function_declaration


def add_nonline_funcs(lines):
    result = []
    for line in lines:
        if line.find("__device__") != -1:
            new_line = line.replace("__device__", "__device__ __noinline__")
            result.append(new_line)
        else:
            result.append(line)
    return result

def generate_global_calls(kernels):
    address = ""
    address2 = ""
    func_names = set()
    for k in kernels:
        func_names.add(k["name"])
    func_names = sorted(list(func_names))
    for i in range(len(func_names)):
        address += f"    address[{i}] = (unsigned long long int)&{func_names[i]}_device;\n"
        address2 += f"  &{func_names[i]},\n"
    template = f"""
extern "C" __global__ void _get_func_pointers(unsigned long long int *address) {{
{address}
}}

""" 
    return template.splitlines(True)

def generate_global_caller():
    template = """
extern "C" __global__ void caller(int func_offset, float** args) {
    HIP_DYNAMIC_SHARED(char, shared_memory);
    pointers[func_offset](shared_memory, args);
}    
"""
    return template.splitlines(True)

def generate_device_caller(func_params):
    result = []
    for func_name, func_param in func_params.items():
        params_name = ["shared_memory"]
        for i in range(len(func_param)):
            params_name.append("(%s)args[%d]" %(func_param[i]["type"], i))
        func_call = func_name+ "_device(" + ", ".join(params_name) + ")"

        func_template = """
__device__ __noinline__ void %s(char* shared_memory, float** args) {
    %s;
}
""" % (func_name, func_call)
        result.extend(func_template.splitlines(True))
    return result

def add_device_function_param(lines):
    new_lines = []
    for line in lines:
        if line.find("void") != -1:
            # insert new parameter to the function
            header, return_type, func_name, func_params = split_function_declaration(line)
            
            # func_params.insert(0, {"name": "thread_idx", "type": "dim3"})
            # func_params.insert(0, {"name": "task_idx", "type": "dim3"})
            func_params.insert(0, {"name": "shared_memory", "type": "char*"})
            new_line = header + " " + generate_function_declaration(return_type, func_name, func_params)
            if line.find("{") != -1:
                new_line = new_line + "{"
            new_line = new_line + "\n"
            new_lines.append(new_line)
        else:
            new_lines.append(line)
    return new_lines

def generate_global_wrapper(func_params):
    result = []
    for func_name, func_param in func_params.items():
        params_name = []
        for i in range(len(func_param)):
            params_name.append(func_param[i]["name"])
        func_call = func_name+ "_device(" + ", ".join(params_name) + ")"
        func_template = """
extern "C" __global__ __attribute__((amdgpu_num_vgpr(24))) __attribute__((amdgpu_num_sgpr(30)))%s {
    %s;
}
""" % (
    generate_function_declaration("void", func_name, func_param),
    func_call
)   
        result.extend(func_template.splitlines(True))
    return result

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
    lines = replace_global_with_device(lines)
    lines = add_nonline_funcs(lines)
    lines.extend(generate_global_wrapper(func_params))
    # lines = add_device_function_param(lines)
    # lines = replace_shared_memory(lines)
    # lines.extend(generate_device_caller(func_params))
    lines.extend(generate_global_calls(schedule["kernels"]))
    # lines.extend(generate_global_caller())
    lines = add_global_definition(lines)

    output_f_name = sys.argv[1][:sys.argv[1].rfind(".")] + ".pointer.cu"

    f = open(output_f_name, "w")
    f.writelines(lines)
    f.close()
    