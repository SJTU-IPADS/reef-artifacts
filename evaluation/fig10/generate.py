
import os, sys, json
import subprocess

## A script to generate Fig.10
## Fig.10 includes two metrics: (1) real-time task latency, and (b) overall throughput

configs = ["A.json", "B.json", "C.json", "D.json", "E.json"]
methods = ["RT", "SEQ", "STREAM", "REEF"]

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
    for conf in configs:
        subres = []
        for method in methods:
            cmd = ["benchmark", method, conf]
            if (quick_eval):
                cmd.append("10")
            else:
                cmd.append("60")
            subres.append(run_shell_cmd(cmd))
        res.append(subres)
    return res

## 2. format evaluation results
def format_results(res):
    latency = []
    throughput = []
    for i in range(len(configs)):
        latency_row = []
        throughput_row = []
        for j in range(len(methods)):
            log = res[i][j]
            lat = 0
            tpt = 0
            for l in log:
                if l.find("RT avg latency") != -1:
                    lat = l.strip().split(" ")[-2]
                if l.find("overall throughput") != -1:
                    tpt = l.strip().split(" ")[-2]
            latency_row.append(lat)
            throughput_row.append(tpt)
        latency.append(latency_row)
        throughput.append(throughput_row)
    return (latency, throughput)

## 3. generate plot
def generate_plot(lat, tpt):
    header = "Workload RT +Seq +Stream REEF\n-\n"
    col_header = ["DISB-A", "DISB-B", "DISB-C", "DISB-D", "DISB-E"]
    lat_file = open("fig10a.dat", "w")
    tpt_file = open("fig10b.dat", "w")
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
    subprocess.getoutput("make fig10a.pdf")
    subprocess.getoutput("make fig10b.pdf")

res = run_evaluation()
lat, tpt = format_results(res)
generate_plot(lat, tpt)