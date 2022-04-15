import json
import sys

if len(sys.argv) != 8:
    print("Usage: python3 find_op_log.py oplog.log blkidx.x blkidx.y blkidx.z threadidx.x threadidx.y threadidx.z")

f = open(sys.argv[1], "r")
lines = f.readlines()
f.close()


logs = []
for l in lines:
    logs.append(json.loads(l))


input_dims = []
for i in range(6):
    input_dims.append(int(sys.argv[2+i]))

for log in logs:
    conf = log["config"]
    entity = conf["entity"]
    entity_dims = [0, 0, 0, 0, 0, 0]
    for e in entity:
        if e[0] == "tile_f":
            entity_dims[2] = e[2][0]
            entity_dims[5] = e[2][2]
        if e[0] == "tile_y":
            entity_dims[1] = e[2][0]
            entity_dims[4] = e[2][2]
        if e[0] == "tile_x":
            entity_dims[0] = e[2][0]
            entity_dims[3] = e[2][2]
    # print(entity_dims)
    eq = True
    for i in range(6):
        if entity_dims[i] != input_dims[i]:
            eq = False
    if eq == True:
        print(log)




        
        
