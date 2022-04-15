import sys
import json

j = json.loads(open(sys.argv[1]).read())

l = j.items()

l = sorted(l, key=lambda x: x[1]['latency'][0], reverse=True)
for i in l:
    print(i)
