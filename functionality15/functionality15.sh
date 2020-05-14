#!/bin/bash
#Wrote by Kieron
function separator() {
    echo "+-----------------------------------------------------------+"
}
#prints out the intial message to show the script is running
separator
echo -e "This script computes the average length of each review based on the rating \nin the Places and Reviews dataset."
separator
echo -e "\n This might take a while...\n"
#variable to hold the imapal sql query to be run later
#SELECTs the count of gplusplaceid along with the gplusplaceid, name from reviews table and joins the places table with matching gplusplaceids, orders by counted gplusplceid and limites the select to 1
impala-shell -f ./functionality15/topReview.sql

