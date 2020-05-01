#!/bin/bash
#Wrote by Jack
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo -e "This script computes the number of places \nin the Places dataset for every price range."
separator

places1=$(impala-shell -B --quiet -q "SELECT COUNT(*) FROM coursework.places WHERE price = '\$'")
places2=$(impala-shell -B --quiet -q "SELECT COUNT(*) FROM coursework.places WHERE price = '\$\$'")
places3=$(impala-shell -B --quiet -q "SELECT COUNT(*) FROM coursework.places WHERE price = '\$\$\$'")

echo -e "\nPrice range \$ contains $places1 places."
echo "Price range \$\$ contains $places2 places."
echo "Price range \$\$\$ contains $places3 places."