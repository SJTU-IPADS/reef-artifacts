
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

def SubplotAB():
    configs = ["0.json", "1.json", "2.json", "4.json", "8.json"]

    def run_evaluation():
        res = []
        for conf in configs:
            cmd = ["benchmark", "STREAM", conf]
            if quick_eval:
                cmd.append("5")
            else:
                cmd.append("60")
            res.append(run_shell_cmd(cmd))
        return res

    ## 2. format evaluation results
    def format_results(res):
        latency = []
        rt_throughput = []
        throughput = []
        for i in range(len(res)):
            latency_row = []
            log = res[i]
            for l in log:
                if l.find("model 0 :") != -1:
                    lat = l.strip().split(" ")[-2]
                    latency_row.append(lat)
                if l.find("overall throughput") != -1:
                    tpt = l.strip().split(" ")[-2]
                    throughput.append(tpt)
                if l.find("idx: 0, prio: 0, throughput: ") != -1:
                    tpt = l.strip().split(" ")[-2]
                    rt_throughput.append(tpt)
            latency.append(latency_row)
        return (latency, rt_throughput, throughput)

    ## 3. generate plot
    def generate_latency_plot(lat):
        header = "BE0 BE1 BE2 BE4 BE8\n-\n"
        lat_file = open("fig1b.dat", "w")
        lat_file.write(header)
        min_len = min([len(l) for l in lat])
        for i in range(min_len):
            for j in range(len(lat)):
                lat_file.write(str(float(lat[j][i])/1000) + "\t")
            lat_file.write("\n")
        lat_file.close()
        subprocess.getoutput("make -f ../Makefile fig1b.pdf")

    def generate_throughput_plot(rt_tpt, tpt):
        header = "concurrency (BE)Task (RT)Task\n-\n"
        col_headers = ['0', '1', '2', '4', '8']
        tpt_file = open("fig1a.dat", "w")
        tpt_file.write(header)
        for i in range(len(tpt)):
            tpt_file.write(col_headers[i] + " ")
            be_tpt = float(tpt[i]) - float(rt_tpt[i])
            tpt_file.write(str(be_tpt) + " ")
            tpt_file.write(rt_tpt[i] + "\n")
        tpt_file.close()
        subprocess.getoutput("make -f ../Makefile fig1a.pdf")

    res = run_evaluation()
    lat, rt_tpt, tpt = format_results(res)
    generate_latency_plot(lat)
    generate_throughput_plot(rt_tpt, tpt)

def SubplotC():
    model = "resnet"
    concurrency = ["1", "2", "4", "8"]
    def run_evaluation():
        res = []
        for concur in concurrency:
            cmd = ["DNN-preempt", model, concur, "wait"]
            if quick_eval:
                cmd.append("5")
            else:
                cmd.append("30")
            res.append(run_shell_cmd(cmd))
        exe_res = run_shell_cmd(["benchmark", "REEF", "0.json"])
        return res, exe_res

    def format_exe_res(exe_res):
        for l in exe_res:
            if l.find("RT avg latency:") != -1:
                lat = l.strip().split(" ")[-2]
                return lat

    def format_results(res):
        latency = []
        for i in range(len(concurrency)):
            log = res[i]
            lat_list = []
            for l in log:
                if l.find("preempt latency: ") != -1:
                    lat = l.strip().split(" ")[-2]
                    lat_list.append(int(lat))
            lat_list = sorted(lat_list)
            latency.append(lat_list[int(len(lat_list)*0.95)])
            # latency.append(lat_list[-1])
        return latency

    def generate_plot(exe_lat, preempt_lat):
        header = "concurrency execute preempt\n-\n"
        col_header = ["1", "2", "4", "8"]
        lat_file = open("fig1c.dat", "w")
        lat_file.write(header)
        lat_file.write("0 " + str(exe_lat) + " 0\n")
        for i in range(len(preempt_lat)):
            lat_file.write(col_header[i] + " ")
            lat_file.write(str(exe_lat) + " ")
            lat_file.write(str(float(preempt_lat[i])/1000) + " ")
            lat_file.write("\n")
        lat_file.close()
        subprocess.getoutput("make -f ../Makefile fig1c.pdf")
    res, exe_res = run_evaluation()
    exe_lat = format_exe_res(exe_res)
    preempt_lat = format_results(res)
    generate_plot(exe_lat, preempt_lat)

def SubplotD():
    conf_file_path = "/tmp/fig1d_conf_file.json"
    frequency = [1, 10, 50, 100, 150, 200, 220, 230, 250, 300, 350]
    methods = ["RESET", "STREAM"]
    def prepare_config(freq):
        conf = {
            "time": 2,
            "rt": [
                {
                    "name": "vgg",
                    "frequency": freq
                }
            ],
            "be": [
                {
                    "name": "resnet152",
                    "frequency": 100
                }
            ]
        }
        conf_file = open(conf_file_path, "w")
        conf_file.write(json.dumps(conf, indent=True))
        conf_file.close()
    
    def run_evaluation():
        res = []
        for freq in frequency:
            sub_res = []
            prepare_config(freq)
            for method in methods:
                cmd = ["benchmark", method, conf_file_path]
                if quick_eval:
                    cmd.append("5")
                else:
                    cmd.append("30")
                sub_res.append(run_shell_cmd(cmd))
            res.append(sub_res)
        return res
    
    def format_results(res):
        throughput = []
        for i in range(len(res)):
            tpt_row = []
            for j in range(len(res[i])):
                log = res[i][j]
                for l in log:
                    if l.find("idx: 1, prio: 1, throughput") != -1:
                        tpt = l.strip().split(" ")[-2]
                        if float(tpt) <= 2.0:
                        # Due to the tailing problem, the best-effort task may
                        # execute before rt task start or after all rt task finish.
                            tpt = "0"
                        tpt_row.append(tpt)
            throughput.append(tpt_row)
        return throughput

    def generate_plot(tpt):
        header = "frequency preemptive concurrent\n"
        col_header = frequency
        tpt_file = open("fig1d.dat", "w")
        tpt_file.write(header)
        for i in range(len(col_header)):
            tpt_file.write(str(col_header[i]) + " ")
            for j in range(len(tpt[i])):
                tpt_file.write(tpt[i][j] + " ")
            tpt_file.write("\n")
        tpt_file.close()
        subprocess.getoutput("make -f ../Makefile fig1d.pdf")
    
    res = run_evaluation()
    tpt = format_results(res)
    generate_plot(tpt)


SubplotAB()
SubplotC()
SubplotD()