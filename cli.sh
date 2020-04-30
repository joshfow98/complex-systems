#!/bin/bash
declare -a options
options[1]="./ratings_review_count/ratings_review_count.sh"
optionsLen=${#options[*]}

echo "Welcome to Coursework 2 CLI!"
echo "1) Review Rating Count"

continueExecuting=true
while [ $continueExecuting == true ]
do
 read -p "Enter your option: " option
 if [ $option != 0 ] || [ $option > $optionsLen ]; then
  sh ${options[$option]}
 elif [ $option == "q" ]; then
  continueExecuting=false
 else 
  echo $option " is not a valid option"
 fi
done