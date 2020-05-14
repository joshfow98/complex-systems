#!/bin/sh
#Used to separate the output on the screen to make it easier for the user to digest
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo "This script will find the total number of reviews for the"
separator

#Regex will allow doubles as well as integers between 0.0 and 5.0
regex='\s'
#Python script is called twice so put into variable to save repetition
pythonScript='./functionality8/parse_response.py'
#Variable used for continuing script until user enters 'q' to quit
continueExecuting=true
#Loop used to allow users to keep entering search terms until they quite using 'q'
while [ $continueExecuting == true ]
do
    #Prompts user for input
    read -p "Input your word or 'q' to exit: " word
    #Checks users input against the regex previously declared
    if [[ $word =~ $regex ]]; then
        #Tells user their input is invalid if it is invalidated by the regex
        echo $word " not valid, only single words and no spaces allowed"
    #Checks if the user has entered the 'q' exit command
    elif [ $word != "q" ]; then
        #Makes a HTTP request to elasticsearch for the users inputted value 
        response=$(curl -s -X GET "http://localhost:9200/hivereviews/_search?q=$word&filter_path=hits.hits._source&_source=gplususerid,gplusplaceid")
        #Ensures that the python script is executable
        chmod +x $pythonScript
        #Executes the python script to parse the cURL response and output it to the user
        python $pythonScript $response $word
    else
        #Stops the loop from continuing to execute
        continueExecuting=false
    fi
done