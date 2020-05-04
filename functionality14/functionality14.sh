#!/bin/bash
#Wrote by Kieron
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo -e "This script computes the average length of each review based on the rating \nin the Places and Reviews dataset."
separator

rating1=$(impala-shell -B --quiet -q "SELECT AVG(char_length(r.reviewtext)) from coursework.reviews AS r WHERE r.rating = 1.0")
rating2=$(impala-shell -B --quiet -q "SELECT AVG(char_length(r.reviewtext)) FROM coursework.reviews AS r WHERE r.rating = 2.0")
rating3=$(impala-shell -B --quiet -q "SELECT AVG(char_length(r.reviewtext)) FROM coursework.reviews AS r WHERE r.rating = 3.0")
rating4=$(impala-shell -B --quiet -q "SELECT AVG(char_length(r.reviewtext)) FROM coursework.reviews AS r WHERE r.rating = 4.0")
rating5=$(impala-shell -B --quiet -q "SELECT AVG(char_length(r.reviewtext)) FROM coursework.reviews AS r WHERE r.rating = 5.0")
echo -e "\nAverage character count for 1.0 is $rating1."
echo "Average character count for 2.0 is $rating2."
echo "Average character count for 3.0 is $rating3."
echo "Average character count for 4.0 rating is $rating4 "
echo "Average character count for 5.0 rating is $rating5"
