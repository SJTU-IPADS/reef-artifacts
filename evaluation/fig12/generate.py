import os, sys, json
import subprocess

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
    model = "resnet"
    concurrency = ["1", "2", "4", "6", "8"]
    methods = ["wait", "reset-raw", "reset"]
    def run_evaluation():
        res = []
        for concur in concurrency:
            subres = []
            for method in methods:
                cmd = ["DNN-preempt", model, concur, method]
                if quick_eval:
                    cmd.append("10")
                else:
                    cmd.append("30")
                subres.append(run_shell_cmd(cmd))
            res.append(subres)
        return res

    ## 2. format evaluation results
    def format_results(res):
        latency = []
        for i in range(len(concurrency)):
            latency_row = []
            for j in range(len(methods)):
                log = res[i][j]
                lat_list = []
                for l in log:
                    if l.find("preempt latency: ") != -1:
                        lat = l.strip().split(" ")[-2]
                        lat_list.append(int(lat))
                lat_list = sorted(lat_list)
                latency_row.append(lat_list[int(len(lat_list)*0.95)])
            latency.append(latency_row)
        return latency

    ## 3. generate plot
    def generate_plot(lat):
        header = "concurrency wait reset resnet-opt\n-\n"
        col_header = ["1", "2", "4", "6", "8"]
        lat_file = open("fig12a.dat", "w")
        lat_file.write(header)
        for i in range(len(lat)):
            lat_file.write(col_header[i] + " ")
            for l in lat[i]:
                lat_file.write(str(l) + " ")
            lat_file.write("\n")
        lat_file.close()
        subprocess.getoutput("make -f ../Makefile fig12a.pdf")
    res = run_evaluation()
    lat = format_results(res)
    generate_plot(lat)

SubplotA()

