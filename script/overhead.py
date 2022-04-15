import pandas as pd
import sys

if len(sys.argv) != 3:
    print("Usage: python3 overhead.py raw.csv transform.csv")

raw = pd.read_csv(sys.argv[1])
tran = pd.read_csv(sys.argv[2])

half = len(tran) // 2
# raw = raw[half:]
# tran = tran[half:]
merged = pd.merge(raw,tran, on=['Index', 'Index'])
merged["diff"] = (merged["DurationNs_y"] - merged["DurationNs_x"]) / 1000
# s = merged.groupby(['KernelName_x'])['diff'].sum()
s = merged.groupby(['KernelName_x']).agg({'diff': {'count', 'mean', 'sum'}})
pd.set_option('display.max_rows', None)
pd.set_option('display.float_format', lambda x: '%.3f' % x)
print(s.sort_values(('diff', 'sum'), ascending=False))
# print(s)
print(s.values.sum())
