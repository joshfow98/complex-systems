#!/bin/sh
echo "This script will find the total number of reviews for the rating number you have entered."
echo "For example, if you enter 5.0, the count for the number of reviews with a 5.0 rating will be shown"

#Regex will allow doubles as well as integers
regex='^[0-5]+(\.?[0-9]+)?$'
continueExecuting=true
while [ $continueExecuting == true ]
do
 read -p "Input your the rating you would like to count or 'q' to exit script: " rating
 if [[ $rating =~ $regex ]]; then
  impala-shell --var=rating=$rating -f ratings_review_count.sql
 elif [ $rating == "q" ]; then
  continueExecuting=false
 else
  echo "Entered value is not valid"
 fi
done