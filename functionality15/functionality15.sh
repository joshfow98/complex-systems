#!/bin/bash
#Wrote by Kieron
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo -e "This script computes the average length of each review based on the rating \nin the Places and Reviews dataset."
separator
echo -e "\n This might take a while...\n"

rating=$(impala-shell -B --quiet -q "SELECT count(r.gplusplaceid) AS total_reviews, r.gplusplaceid, p.name FROM coursework.reviews AS r LEFT JOIN coursework.places AS p ON r.gplusplaceid = p.gplusplaceid GROUP BY p.name, r.gplusplaceid ORDER BY total_reviews DESC LIMIT 1")

echo -e "\nPLace that has received the largest number of reviews"
echo -e "\ncount	place id	    name"
echo -e $rating.

