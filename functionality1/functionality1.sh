#!/bin/sh
#Written by Josh
#Used to separate the different outputs to make it easier for the user to digest
function separator() {
    echo "+-----------------------------------------------------------+"
}

#Outputs adescription of the functionality to the user
separator
echo "This script will find the total number of reviews for the"
echo "rating number you have entered."
echo "For example, if you enter 5.0, the count for the number of"
echo "reviews with a 5.0 rating will be shown"
separator

#Regex will allow doubles as well as integers between 0.0 and 5.0
regex='^[0-4]+(\.?[0-9]+)?|^5(\.0)?$'
#Variable used to keep the functionality working until the user enters the 'q' exit command
continueExecuting=true
#This loop keeps executing until the user enters the 'q' exit command
while [ $continueExecuting == true ]
do
    #Prompts the user for input
    read -p "Input your the rating or 'q' to exit: " rating
    #Checks the user input against the regex to see if it matches
    if [[ $rating =~ $regex ]]; then
        #separates the user previous output from the the output about to occur
        separator
        #Runs the functionality 1 SQL command using impala, passing the input as a parameter
        impala-shell --quiet --var=rating=$rating -f ./functionality1/functionality1.sql
    #Checks if the user entered the 'q' exit command
    elif [ $rating == "q" ]; then
        #Changed to terminate the loop to exit the functionality
        continueExecuting=false
    else
        #Separates the previous output from the next output
        separator
        #Prompts the user that their input was invalid
        echo "Entered value is not valid"
    fi
    #Separates the next output from the previous output
    separator
done