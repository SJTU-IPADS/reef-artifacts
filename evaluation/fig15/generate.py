
import os, sys, json
import subprocess

quick_eval = False
if os.getenv("REEF_QUICK_EVAL") != None:
    quick_eval = True

models = ["resnet152", "densenet", "vgg", "inception", "bert"]
methods = ["rt", "stream", "dkp"]

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
            cmd = ["dkp", model, method]
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
    throughput = []
    for i in range(len(models)):
        latency_row = []
        throughput_row = []
        for j in range(len(methods)):
            log = res[i][j]
            lat = 0
            tpt = 0
            lat_list = []
            for l in log:
                if l.find("RT execution latency") != -1:
                    lat = l.strip().split(" ")[-2]
                    lat_list.append(int(lat))
                if l.find("Throughput") != -1:
                    tpt = l.strip().split(" ")[-2]
            lat_list = sorted(lat_list)
            # latency_row.append(lat_list[int(len(lat_list)*0.95)])
            latency_row.append(lat_list[-1])
            throughput_row.append(tpt)
        latency.append(latency_row)
        throughput.append(throughput_row)
    return (latency, throughput)

## 3. generate plot
def generate_plot(lat, tpt):
    header = "model RT STREAM DKP(%)\n-\n"
    col_header = ['RNET', 'DNET', 'VGG', 'IN3', 'BERT']
    lat_file = open("fig15a.dat", "w")
    tpt_file = open("fig15b.dat", "w")
    lat_file.write(header)
    tpt_file.write(header)
    for i in range(len(lat)):
        lat_file.write(col_header[i] + " ")
        tpt_file.write(col_header[i] + " ")
        for l in lat[i]:
            lat_file.write(str(l) + " ")
        for t in tpt[i]:
            tpt_file.write(str(t) + " ")
        lat_file.write("\n")
        tpt_file.write("\n")
    lat_file.close()
    tpt_file.close()
    subprocess.getoutput("make -f ../Makefile fig15a.pdf")
    subprocess.getoutput("make -f ../Makefile fig15b.pdf")

res = run_evaluation()
lat, tpt = format_results(res)
generate_plot(lat, tpt)