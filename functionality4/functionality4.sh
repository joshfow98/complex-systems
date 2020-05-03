#!/bin/bash
#Author: Jack

function separator()
{
    echo "+-----------------------------------------------------------+"
}

function getReviewRating()
{
#Any integer between 1-5 only.
regex='^([1-5])$'

inloop=true
while [ $inloop == true ]
do
   read -p "Enter the rating (1, 2, 3, 4, 5) for the review): " rating
   if [[ $rating =~ $regex ]]; then
      inloop=false
   else
      echo "This value is not between 1-5."
   fi
done
}

function getOutputDirectory()
{
inloop=true

while [ $inloop == true ]
do
   read -p "Enter a new directory on HDFS to output results (e.g. /user/cloudera/my_hdfs_directory/collocations): " file_loc
   #Check to see whether the file location on hdfs already exists.
   hadoop fs -test -d $file_loc
   if [ $? = 0 ]; then
      echo "Directory already exists in HDFS."
   else
      inloop=false
   fi
done
}

#Script starts here
separator
echo -e "This script takes a review score from 1 to 5 and \nreturns the three most common phrases associated with \nthose reviews."
separator

#User will input the rating for the review and the directory on hdfs.
getReviewRating
getOutputDirectory
echo -e "\nFinding the most common collocations for reviews with a rating of $rating (this may take a while)..."

#Write the review text to /tmp/mapreduce_hive on the hdfs.
hive -silent -e "INSERT OVERWRITE DIRECTORY '/tmp/mapreduce_hive' SELECT reviewtext FROM coursework.reviews WHERE rating = $rating";

#Find the three most common collocations using mapreduce
hadoop jar ./functionality4/CollocationCount.jar uk.ac.edgehill.WordCount /tmp/mapreduce_hive/000000_0 $file_loc
echo -e "\nCollocation | number of instances\n-------------------------------------"
#Sort the result of map reduce by descending values and display the twenty most frequent collocations.
hdfs dfs -cat $file_loc/part-r-00000 | sort -k 4 -n -r | head -n 20
