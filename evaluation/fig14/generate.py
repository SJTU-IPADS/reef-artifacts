import os, sys, json
import subprocess

quick_eval = False
if os.getenv("REEF_QUICK_EVAL") != None:
    quick_eval = True

## A script to generate Fig.14
## Fig.14 includes two subplot
## (a) tradeoff between execution time and preemption latency, with increased queue capacity
## (b) preemption latency with increased kernel number
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
    model = "resnet152"
    queue_size = [
        "1", "2", "4", "8", "16", "32", "64", "128", "256"] 
    def run_evaluation():
        res = []
        for qs in queue_size:
            cmd = ["tradeoff", model, qs]
            if quick_eval:
                cmd.append("10")
            else:
                cmd.append("30")
            res.append(run_shell_cmd(cmd))
        return res

    ## 2. format evaluation results
    def format_results(res):
        preempt_lat = []
        execution_lat = []
        for i in range(len(queue_size)):
            preempt_lat_row = []
            execution_lat_row = []
            log = res[i]
            lat_list = [20]
            for l in log:
                if l.find("preempt latency: ") != -1:
                    lat = l.strip().split(" ")[-2]
                    lat_list.append(int(lat))
                if l.find("Execute avg latency: ") != -1:
                    lat = l.strip().split(" ")[-2]
                    execution_lat_row.append(lat)
            lat_list = sorted(lat_list)
            preempt_lat_row.append(lat_list[int(len(lat_list)*0.90)])
            execution_lat.append(str(execution_lat_row[0]))
            preempt_lat.append(str(preempt_lat_row[0]))
        return execution_lat, preempt_lat

    ## 3. generate plot
    def generate_plot(exe, preempt):
        header = "queue_size execution preemption\n"
        col_header = queue_size
        print(col_header)
        lat_file = open("fig14a.dat", "w")
        lat_file.write(header)
        for i in range(len(preempt)):
            lat_file.write(col_header[i] + " ")
            lat_file.write(exe[i] + " ")
            lat_file.write(preempt[i] + " ")
            lat_file.write("\n")
        lat_file.close()
        subprocess.getoutput("make -f ../Makefile fig14a.pdf")
    
    res = run_evaluation()
    exe, lat = format_results(res)
    print(exe)
    print(lat)
    generate_plot(exe, lat)


def SubplotB():
    resource_dir = os.getenv("REEF_RESOURCE_DIR") + "/"
    models = ["resnet152", "densenet", "vgg", "inception", "bert"]

    def read_profile_files():
        confs = {}
        profiles = {}
        for model in models:
            conf_file = open(resource_dir + model + "/" + model + ".json", "r")
            profile_file = open(resource_dir + model + "/" + model + ".profile.json", "r")
            confs[model] = json.loads(conf_file.read())
            profiles[model] = json.loads(profile_file.read())
            conf_file.close()
            profile_file.close()
        return confs, profiles

    def calculate_overhead(conf, profile):
        restore_kernel = 4
        sum_overhead = 0
        for k in conf['kernels']:
            sum_overhead += profile['kernel_latency'][k['name']]['total_latency']
        avg_overhead = sum_overhead * 4 / len(conf['kernels'])
        # print(avg_overhead)
        # print(profile['model_latency'])
        overhead_percent = avg_overhead * 100 / profile['model_latency']
        return (avg_overhead, overhead_percent)

    ## 3. generate plot
    def generate_plot(overhead):
        header = "model overhead(%)\n"
        col_header = ['RNET', 'DNET', 'VGG', 'IN3', 'BERT']
        lat_file = open("fig14b.dat", "w")
        lat_file.write(header)
        for i in range(len(overhead)):
            lat_file.write(str(col_header[i]) + " ")
            lat_file.write(str(overhead[i]))
            lat_file.write("\n")
        lat_file.close()
        subprocess.getoutput("make -f ../Makefile fig14b.pdf")
    
    conf, profiles = read_profile_files()
    res = []
    for m in models:
        overhead = calculate_overhead(conf[m], profiles[m])
        res.append(overhead[1])
    generate_plot(res)

SubplotA()
SubplotB()
