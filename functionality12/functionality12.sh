#!/bin/bash
#Wrote by Kieron
function separator() {
    echo "+-----------------------------------------------------------+"
}
#Prints out the inital comments to show script is running
separator
echo -e "This script computes the average rating for each price range \nin the Places and Reviews dataset."
separator

#runs the sql query rating 1 to select the average rating for price $
impala-shell -f ./functionality12/rating1.sql
separator

#runs the sql query rating 2 to select the average rating for price $$
impala-shell -f ./functionality12/rating2.sql
separator

#runs the sql query rating 2 to select the average rating for price $$$
impala-shell -f ./functionality12/rating3.sql
separator
