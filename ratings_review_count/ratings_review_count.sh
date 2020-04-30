#!/bin/sh
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo "This script will find the total number of reviews for the"
echo "rating number you have entered."
echo "For example, if you enter 5.0, the count for the number of"
echo "reviews with a 5.0 rating will be shown"
separator

#Regex will allow doubles as well as integers between 0.0 and 5.0
regex='^[0-4]+(\.?[0-9]+)?|^5(\.0)?$'
continueExecuting=true
while [ $continueExecuting == true ]
do
    read -p "Input your the rating or 'q' to exit: " rating
    if [[ $rating =~ $regex ]]; then
        separator
        impala-shell --var=rating=$rating -f ./ratings_review_count/ratings_review_count.sql
    elif [ $rating == "q" ]; then
        continueExecuting=false
    else
        separator
        echo "Entered value is not valid"
    fi
    separator
done