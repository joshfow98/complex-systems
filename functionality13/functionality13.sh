#!/bin/bash
#Wrote by Kieron
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo -e "This script computes the number of reviews for each price range \nin the Places and Reviews dataset."
separator

rating1=$(impala-shell -B --quiet -q "SELECT COUNT(*) from coursework.places AS p LEFT JOIN coursework.reviews AS r ON p.gplusplaceid = r.gplusplaceid WHERE p.price = '\$'")
rating2=$(impala-shell -B --quiet -q "SELECT COUNT(*) FROM coursework.places AS p LEFT JOIN coursework.reviews AS r ON p.gplusplaceid = r.gplusplaceid WHERE p.price = '\$\$'")
rating3=$(impala-shell -B --quiet -q "SELECT COUNT(*) FROM coursework.places AS p LEFT JOIN coursework.reviews AS r ON p.gplusplaceid = r.gplusplaceid WHERE p.price = '\$\$\$'")

echo -e "\nTotal number of reviews for \$ is $rating1."
echo "Total number of reviews for \$\$ is $rating2."
echo "Total number of reviews for \$\$\$ is $rating3."
