import os, sys, json
import subprocess

## A script to generate Fig.13
## Fig.13 includes two subplot
## (a) preemption latency with increased kernel execution time
## (b) preemption latency with increased kernel number

quick_eval = False
if os.getenv("REEF_QUICK_EVAL") != None:
    quick_eval = True

def run_shell_cmd(cmd):
    lines = []
    p = subprocess.Popen(cmd, shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    while p.poll() is None:
        line = p.stdout.readline().strip().decode('utf-8')
        lines.append(line)
        print(line)
    if p.returncode != 0:
        print(f'Subprogram {cmd} failed')
    return lines

def SubplotA():
    kernel_size = [
        "1", "100", "500", "1000", "2000", "3000", "4000", "5000", "6000", "7000", "8000"] 
        # "1600", "2000", "2400", "2800", "3200",
        # "3600", "4000", "5000"]
    methods = ["reset", "wait"]
    def run_evaluation():
        res = []
        for ks in kernel_size:
            subres = []
            for method in methods:
                cmd = ["kernel_size", ks, method]
                if quick_eval:
                    cmd.append("10")
                else:
                    cmd.append("30")    
                subres.append(run_shell_cmd(cmd))
            res.append(subres)
        return res

    ## 2. format evaluation results
    def format_results(res):
        preempt_lat = []
        execution_lat = []
        for i in range(len(kernel_size)):
            preempt_lat_row = []
            execution_lat_row = []
            for j in range(len(methods)):
                log = res[i][j]
                lat_list = []
                for l in log:
                    if l.find("preempt latency: ") != -1:
                        lat = l.strip().split(" ")[-2]
                        lat_list.append(int(lat))
                    if l.find("Execute avg latency: ") != -1:
                        lat = l.strip().split(" ")[-2]
                        execution_lat_row.append(lat)
                lat_list = sorted(lat_list)
                preempt_lat_row.append(lat_list[int(len(lat_list)*0.8)])
            execution_lat.append(execution_lat_row)
            preempt_lat.append(preempt_lat_row)
        return execution_lat, preempt_lat

    ## 3. generate plot
    def generate_plot(exe, preempt):
        header = "exec-lat reset wait\n"
        col_header = exe
        print(col_header)
        lat_file = open("fig13a.dat", "w")
        lat_file.write(header)
        for i in range(len(preempt)):
            lat_file.write(col_header[i][0] + " ")
            for l in preempt[i]:
                lat_file.write(str(l) + " ")
            lat_file.write("\n")
        lat_file.close()
        subprocess.getoutput("make -f ../Makefile fig13a.pdf")
    
    res = run_evaluation()
    exe, lat = format_results(res)
    print(exe)
    print(lat)
    generate_plot(exe, lat)


def SubplotB():
    resource_dir = os.getenv("REEF_RESOURCE_DIR")
    queue_size = [10, 100, 200, 300, 400, 500]
    methods = ["reset", "wait"]
    temp_file_path = "reef_fig13_temp.json.tmp"
    
    jfile = open(resource_dir+"/bench_kernel/bench_kernel.json", "r")
    base_json = json.loads(jfile.read())
    jfile.close()
        
    def prepare_config_file(qs):
        new_conf = {}
        new_conf['storage'] = base_json['storage']
        new_conf['args'] = base_json['args']
        new_conf['shared_memory'] = base_json['shared_memory']
        new_conf['kernels'] = []
        for i in range(qs):
            new_conf['kernels'].append(base_json['kernels'][0])
        temp_file = open(temp_file_path, "w")
        temp_file.write(json.dumps(new_conf))
        temp_file.close()

    def run_evaluation():
        res = []
        for qs in queue_size:
            subres = []
            prepare_config_file(qs)
            for method in methods:
                cmd = ["queue_size", temp_file_path, method]
                if quick_eval:
                    cmd.append("10")
                else:
                    cmd.append("30")
                subres.append(run_shell_cmd(cmd))
            res.append(subres)
        return res

    ## 2. format evaluation results
    def format_results(res):
        preempt_lat = []
        for i in range(len(queue_size)):
            preempt_lat_row = []
            for j in range(len(methods)):
                log = res[i][j]
                lat_list = []
                for l in log:
                    if l.find("preempt latency: ") != -1:
                        lat = l.strip().split(" ")[-2]
                        lat_list.append(int(lat))
                lat_list = sorted(lat_list)
                preempt_lat_row.append(lat_list[int(len(lat_list)*0.5)])
            preempt_lat.append(preempt_lat_row)
        return preempt_lat

    ## 3. generate plot
    def generate_plot(preempt):
        header = "queue_size reset wait\n"
        col_header = queue_size
        lat_file = open("fig13b.dat", "w")
        lat_file.write(header)
        for i in range(len(preempt)):
            lat_file.write(str(col_header[i]) + " ")
            for l in preempt[i]:
                lat_file.write(str(l) + " ")
            lat_file.write("\n")
        lat_file.close()
        subprocess.getoutput("make -f ../Makefile fig13b.pdf")
    
    res = run_evaluation()
    lat = format_results(res)
    generate_plot(lat)

SubplotA()
SubplotB()
