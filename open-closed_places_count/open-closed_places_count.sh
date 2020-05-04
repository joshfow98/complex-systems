#!/bin/sh
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo "This script will find the total number of open or closed places"
echo "Please enter \"open\" or \"closed\" to see the results" 
echo "Enter \"q\" at any time to quit."
separator

continueExecuting=true
while [ $continueExecuting == true ]
do
    read -p "Input your choice or 'q' to quit: " state
    if [[ $state =~ "open" ]]; then
        separator
        impala-shell --var=state=false -f ./open-closed_places_count/open-closed_places_count.sql
    elif [[ $state =~ "closed" ]]; then
        separator
	impala-shell --var=state=true -f ./open-closed_places_count/open-closed_places_count.sql
    elif [ $state == "q" ]; then
	continueExecuting=false
    else
        separator
        echo "Entered value is not valid"
    fi
    separator
done
