#!/bin/sh
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo "This script will compute the average review rating for each category of review"
echo "Press enter to see the results" 
echo "Enter \"q\" at any time to quit."
separator

continueExecuting=true
while [ $continueExecuting == true ]
do
    read -s -n 1 key "Press enter to compute results or 'q' to quit: "
    if [[ $key = "" ]]; then
        separator
        impala-shell -f ./avg_review_rating_per_category/avg_review_rating_per_category.sql
	echo "Press enter to compute results or 'q' to quit: "
    elif [ $key = "q" ]; then
	continueExecuting=false
    else
        separator
        echo "Entered value is not valid"
    fi
    separator
done
