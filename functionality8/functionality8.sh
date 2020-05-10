#!/bin/sh
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo "This script will find the total number of reviews for the"
separator

#Regex will allow doubles as well as integers between 0.0 and 5.0
regex='\s'
continueExecuting=true
while [ $continueExecuting == true ]
do
    read -p "Input your word or 'q' to exit: " word
    if [[ $word =~ $regex ]]; then
        echo $word " not valid, only single words and no spaces allowed"
    elif [ $word != "q" ]; then 
        response=$(curl -s -X GET "http://localhost:9200/hivereviews/_search?q=$word&filter_path=hits.hits._source&_source=gplususerid,gplusplaceid")
        python parse_response.py $response $word
    else
        continueExecuting=false
    fi
done