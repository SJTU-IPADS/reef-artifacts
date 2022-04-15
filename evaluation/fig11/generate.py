import os, sys, json
import subprocess

## A script to generate Fig.11
## Fig.11 includes two subplot
## (1) preemption latency under DISB
## (b) preemption latency of each model

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
    config_dir = os.getenv("REEF_EVAL_DIR") + "/fig10/"
    configs = ["A.json", "B.json", "C.json", "D.json", "E.json"]
    methods = ["WAIT", "REEF"]
    def run_evaluation():
        res = []
        for conf in configs:
            subres = []
            for method in methods:
                cmd = ["benchmark", method, config_dir+conf]
                if quick_eval:
                    cmd.append("10")
                else:
                    cmd.append("60")
                subres.append(run_shell_cmd(cmd))
            res.append(subres)
        return res

    ## 2. format evaluation results
    def format_results(res):
        latency = []
        for i in range(len(configs)):
            latency_row = []
            for j in range(len(methods)):
                log = res[i][j]
                lat = 0
                for l in log:
                    if l.find("Preemption avg latency") != -1:
                        lat = l.strip().split(" ")[-2]
                latency_row.append(lat)
            latency.append(latency_row)
        return latency

    ## 3. generate plot
    def generate_plot(lat):
        header = "workload wait reset\n-\n"
        col_header = ["A", "B", "C", "D", "E"]
        lat_file = open("fig11a.dat", "w")
        lat_file.write(header)
        for i in range(len(lat)):
            lat_file.write(col_header[i] + " ")
            for l in lat[i]:
                lat_file.write(str(l) + " ")
            lat_file.write("\n")
        lat_file.close()
        subprocess.getoutput("make -f ../Makefile fig11a.pdf")
    res = run_evaluation()
    lat = format_results(res)
    generate_plot(lat)

def SubplotB():
    models = ["resnet", "densenet", "vgg", "inception", "bert"]
    methods = ["reset", "wait"]
    def run_evaluation():
        res = []
        for model in models:
            subres = []
            for method in methods:
                cmd = ["DNN-preempt", model, "1", method]
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
        for i in range(len(models)):
            latency_row = []
            for j in range(len(methods)):
                log = res[i][j]
                lat_list = []
                for l in log:
                    if l.find("preempt latency: ") != -1:
                        lat = l.strip().split(" ")[-2]
                        lat_list.append(int(lat))
                lat_list = sorted(lat_list)
                latency_row.append(lat_list[int(len(lat_list)*0.9)])
            latency.append(latency_row)
        return latency

    ## 3. generate plot
    def generate_plot(lat):
        header = "model reset wait\n-\n"
        col_header = ["RNET", "DNET", "VGG", "IN3", "BERT"]
        lat_file = open("fig11b.dat", "w")
        lat_file.write(header)
        for i in range(len(lat)):
            lat_file.write(col_header[i] + " ")
            for l in lat[i]:
                lat_file.write(str(l) + " ")
            lat_file.write("\n")
        lat_file.close()
        subprocess.getoutput("make -f ../Makefile fig11b.pdf")
    res = run_evaluation()
    lat = format_results(res)
    generate_plot(lat)

SubplotA()
SubplotB()
