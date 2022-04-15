
import os, sys, json
import subprocess


## 1. run evaluation

models = ["resnet152", "densenet", "vgg", "inception", "bert"]
methods = ["raw", "under", "over", "dyn"]

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

def run_evaluation():
    res = []
    for model in models:
        subres = []
        for method in methods:
            cmd = ["pointer", model, method]
            if quick_eval:
                cmd.append("1000")
            else:
                cmd.append("5000")    
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
            lat = 0
            for l in log:
                if l.find("latency:") != -1:
                    lat = l.strip().split(" ")[-2]
            latency_row.append(lat)
        latency.append(latency_row)
    return latency

## 3. generate plot
def generate_plot(lat):
    header = "model raw under-alloc over-alloc dyn-alloc\n-\n"
    col_header = ['RNET', 'DNET', 'VGG', 'IN3', 'BERT']
    lat_file = open("fig16a.dat", "w")
    lat_file.write(header)
    for i in range(len(lat)):
        lat_file.write(col_header[i] + " ")
        for l in lat[i]:
            lat_file.write(str(l) + " ")
        lat_file.write("\n")
    lat_file.close()
    subprocess.getoutput("make -f ../Makefile fig16a.pdf")

res = run_evaluation()
lat = format_results(res)
generate_plot(lat)