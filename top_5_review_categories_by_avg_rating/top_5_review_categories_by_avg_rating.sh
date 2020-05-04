#!/bin/sh
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo "This script will compute the top 5 review categories based on average ratings"
echo "Press enter to see the results" 
echo "Enter \"q\" at any time to quit."
separator

continueExecuting=true
while [ $continueExecuting == true ]
do
    read -s -n 1 key "Press enter to compute results or 'q' to quit: "
    if [[ $key = "" ]]; then
        separator
	echo "booooo"
        impala-shell -f ./top_5_review_categories_by_avg_rating/top_5_review_categories_by_avg_rating.sql
	echo "Press enter to compute results or 'q' to quit: "
    elif [ $key = "q" ]; then
	continueExecuting=false
    else
        separator
        echo "Entered value is not valid"
    fi
    separator
done
