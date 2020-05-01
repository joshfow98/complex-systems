#!/bin/bash
function separator() {
    echo "+-----------------------------------------------------------+"
}

function user_options() {
    separator
    echo "The options are as follows: "
    echo "1) Review Rating Count"
    echo "2) Number of places for every price range."
    echo "3) Review Rating Count"
    echo "4) Review Rating Count"
    echo "5) Review Rating Count"
    echo "6) Review Rating Count"
    echo "7) Review Rating Count"
    echo "8) Review Rating Count"
    echo "9) Review Rating Count"
    echo "10) Review Rating Count"
    separator
}

options[1]="./ratings_review_count/ratings_review_count.sh"
options[2]="./functionality2/functionality2.sh"
optionsLen=${#options[*]}

separator
echo "Welcome to Coursework 2 CLI!"
separator
echo "This CLI allows you to choose any of the 10 options"
echo "that will be presented. Choose your option by entering"
echo "the number corresponding with that option."
echo "To exit this program enter q."
user_options

#Input with only digits in will be accepted by this Regex
numericRegex='^[0-9]+$'
continueExecuting=true
while [ $continueExecuting == true ]
do
    read -p "Enter your option or 'q' to exit: " option
    if [[  $option =~ $numericRegex ]]; then
        if [ $option -ne 0 ] | [ $option -le $optionsLen ]; then
            echo "optionsLen is: " $optionsLen
            sh ${options[$option]}
            user_options
        else 
            echo $option "is not a valid option"
        fi
    elif [ $option == "q" ]; then
        continueExecuting=false
    else 
        echo $option "is not a number"
    fi
done