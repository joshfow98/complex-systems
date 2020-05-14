#!/bin/bash
#Wrote by Kieron
function separator() {
    echo "+-----------------------------------------------------------+"
}
#prints out to show the script is running
separator
echo -e "This script computes the average length of each review based on the rating \nin the Places and Reviews dataset."
separator
#runs the query to select the average length of review for rating 1
impala-shell -f  ./functionality14/rating1.sql
separator
#runs the query to select the average length of review for rating 2
impala-shell -f ./functionality14/rating2.sql
separator
#runs the query to select the average length of review for rating 3
impala-shell -f ./functionality14/rating3.sql
separator
#runs the query to select the average length of review for rating 4
impala-shell -f ./functionality14/rating4.sql 
separator
#runs the query to select the average length of review for rating 5
impala-shell -f ./functionality14/rating5.sql
