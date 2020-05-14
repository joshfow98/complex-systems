#!/bin/bash
#Wrote by Kieron
function separator() {
    echo "+-----------------------------------------------------------+"
}
# prints out the inital messsage to show the script is running
separator
echo -e "This script computes the number of reviews for each price range \nin the Places and Reviews dataset."
separator
#run the sql query to select count of all places joining the reviews table on gplusplaceid where price = $
impala-shell -f ./functionality13/count1.sql
separator

#run the sql query to select count of all places joining the reviews table on gplusplacesid where price = $$
impala-shell -f ./functionality13/count2.sql
separator

#run the sql query to select count of all places joing he reviews table on gplusplacesid where price == $$$
impala-shell -f ./functionality13/count3.sql

