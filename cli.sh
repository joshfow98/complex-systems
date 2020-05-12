#!/bin/sh
function separator() {
    echo "+-----------------------------------------------------------+"
}

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
    echo "8) Open/Closed Places Count"
    echo "9) Average Review Rating Per Category"
    echo "10) Top 5 review categories by average rating"
    echo "11) Open/Closed Places grouped by price range"
    echo "12) Average Review rating for each price"
    echo "13) Total number of reviews for each price"
    echo "14) Average character length for reviews for each rating"
    echo "15) Locate the place with highest number of reviews"	
    separator
}

options[1]="./functionality1/functionality1.sh"
options[2]="./functionality2/functionality2.sh"
options[3]="./unavailible.sh"
options[4]="./functionality4/functionality4.sh"
options[5]="./unavailible.sh"
options[6]="./unavailible.sh"
options[7]="./open-closed_places_count/open-closed_places_count.sh"
options[8]="./open-closed_places_count/open-closed_places_count.sh"
options[9]="./avg_review_rating_per_category/avg_review_rating_per_category.sh"
options[10]="./top_5_review_categories_by_avg_rating/top_5_review_categories_by_avg_rating.sh"
options[11]="./open-closed_places_by_price-range_count/open-closed_places_by_price-range_count.sh"
options[12]="./functionality12/functionality12.sh"
options[13]="./functionality13/functionality13.sh"
options[14]="functionality14/functionality14.sh"
options[15]="functionality15/functionality15.sh"
optionsLen=${#options[*]}

separator
echo "Welcome to Coursework 2 CLI!"
separator
echo "This CLI allows you to choose any of the 12 options"
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
