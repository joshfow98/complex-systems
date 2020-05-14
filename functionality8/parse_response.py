#For parsing JSON data from cURL
import json
#for receiving arguments
import sys

#Loads the inputted cURL  JSON response as a JSON object
parsedResponse = json.loads(sys.argv[1])
#Removes uneeded data from the JSON response
reviewIds = parsedResponse["hits"]["hits"]
#Used Python output from previous script output
print("+--------------------------------------------------------------+")
#Prints the users inputted value back to the mbefore showing the response
print(sys.argv[2])
#Loops through all the different records recieved from cURL
for item in reviewIds:
    #Creates an output string that contains the records gplusplaceid and gplusuerid
    output = item["_source"]["gplusplaceid"] + "_" + item["_source"]["gplususerid"]
    #Outputs the gplusplaceid and gplususerid to the user
    print(output)