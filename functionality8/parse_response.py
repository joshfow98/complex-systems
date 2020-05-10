import json
#for receiving arguments
import sys

parsedResponse = json.loads(sys.argv[1])
reviewIds = parsedResponse["hits"]["hits"]
outputs = []
print("+--------------------------------------------------------------+")
print(sys.argv[2])
for item in reviewIds:
    output = item["_source"]["gplusplaceid"] + "_" + item["_source"]["gplususerid"]
    print(output)