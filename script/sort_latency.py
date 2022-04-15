import pandas as pd
import sys

if len(sys.argv) != 2:
    print("Usage: python3 sort_latency.py trace.csv ")

trace = pd.read_csv(sys.argv[1])

s = trace[['KernelName', 'DurationNs']]
s['latency'] = s['DurationNs'] / 1000.0
res = s.groupby(['KernelName']).agg({'latency': {'mean', 'count'}})

print(res.sort_values(('latency', 'mean'), ascending=False))
print(s['latency'].sum())
