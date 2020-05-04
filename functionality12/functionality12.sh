#!/bin/bash
#Wrote by Kieron
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo -e "This script computes the average rating for each price range \nin the Places and Reviews dataset."
separator

rating1=$(impala-shell -B --quiet -q "SELECT AVG(r.rating) from coursework.places AS p LEFT JOIN coursework.reviews AS r ON p.gplusplaceid = r.gplusplaceid WHERE p.price = '\$'")
rating2=$(impala-shell -B --quiet -q "SELECT AVG(r.rating) FROM coursework.places AS p LEFT JOIN coursework.reviews AS r ON p.gplusplaceid = r.gplusplaceid WHERE p.price = '\$\$'")
rating3=$(impala-shell -B --quiet -q "SELECT AVG(r.rating) FROM coursework.places AS p LEFT JOIN coursework.reviews AS r ON p.gplusplaceid = r.gplusplaceid WHERE p.price = '\$\$\$'")

echo -e "\nAverage price for \$ is $rating1."
echo "Average price for \$\$ is $rating2."
echo "Average price for \$\$\$ is $rating3."
