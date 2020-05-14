/*
    This script takes input via a parameter and outputs the count of all 
    reviews that have the same rating as the inputted value
    *Written by Josh*
*/
SELECT COUNT(*) FROM coursework.reviews AS r WHERE r.rating = ${var:rating};