#!/bin/sh
#Used to separator different section of functionality on the screen for the user
function separator() {
    echo "+-----------------------------------------------------------+"
}

#Used to display the users options
#This is a function because it is used each time the user exits one of the options
function user_options() { 
    separator
    echo "The options are as follows: "
    echo "1) Review Rating Count"
    echo "2) Number of places for every price range"
    echo "3) Not availible"
    echo "4) Common collocations for reviews"
    echo "5) Not availible"
    echo "6) Not availible"
    echo "7) Open/Closed Places Count"
    echo "8) Full-text search"
    echo "9) Average Review Rating Per Category"
    echo "10) Top 5 review categories by average rating"
    echo "11) Open/Closed Places grouped by price range"
    echo "12) Average Review rating for each price"
    echo "13) Total number of reviews for each price"
    echo "14) Average character length for reviews for each rating"
    echo "15) Locate the place with highest number of reviews"	
    separator
}

#All the starting scripts for each functionality are added to the 'options' array
options[1]="./functionality1/functionality1.sh"
options[2]="./functionality2/functionality2.sh"
options[3]="./unavailible.sh"
options[4]="./functionality4/functionality4.sh"
options[5]="./unavailible.sh"
options[6]="./unavailible.sh"
options[7]="./open-closed_places_count/open-closed_places_count.sh"
options[8]="./functionality8/functionality8.sh"
options[9]="./avg_review_rating_per_category/avg_review_rating_per_category.sh"
options[10]="./top_5_review_categories_by_avg_rating/top_5_review_categories_by_avg_rating.sh"
options[11]="./open-closed_places_by_price-range_count/open-closed_places_by_price-range_count.sh"
options[12]="./functionality12/functionality12.sh"
options[13]="./functionality13/functionality13.sh"
options[14]="./functionality14/functionality14.sh"
options[15]="./functionality15/functionality15.sh"
optionsLen=${#options[*]}

#Introduces the user to the program
separator
echo "Welcome to Coursework 2 CLI!"
separator
echo "This CLI allows you to choose any of the 12 options"
echo "that will be presented. Choose your option by entering"
echo "the number corresponding with that option."
echo "To exit this program enter q."
user_options

#This Regex ensures that the user only enters numeric values for the options
numericRegex='^[0-9]+$'
#This variable will be used to terminate the program when the users enters 'q'
continueExecuting=true
#This loop will use the variable above to keep asking the user to enter
#an option until the user enters 'q' to exit the program
while [ $continueExecuting == true ]
do
    #Asks user what option they wish to choose
    read -p "Enter your option or 'q' to exit: " option
    #This checks the users input against the previously declared regex
    #If the input is invalid it will move to the 'elif' statement
    if [[  $option =~ $numericRegex ]]; then
        #This checks that the inputted number is within the bounds of the 'options' array
        #i.e. it is a valid option
        if [ $option -ne 0 ] | [ $option -le $optionsLen ]; then
            #Should allow script to run ifit is not executable on the current system
            chmod +x ${options[$option]}
            #Executes the chosen functionality script
            sh ${options[$option]}
            #Presents the user with the availables options once the previous functionality has ended 
            user_options
        else
            #If the user has entered a non-valid option it outputs this below
            echo $option "is not a valid option"
        fi
    #Checks if the user has entered the 'q' exit command
    elif [ $option == "q" ]; then
        #Sets this variable to false so that the loop is terminated
        continueExecuting=false
    else
        #This is outputed if the option the user enters is not a number
        echo $option "is not a number"
    fi
done
