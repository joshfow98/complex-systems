#!/bin/bash
#Wrote by Jack
function separator() {
    echo "+-----------------------------------------------------------+"
}

separator
echo -e "This script takes a review score from 1 to 5 and \nreturns the three most common phrases associated with \nthose reviews."
separator

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

echo "Finding the most common collocations for reviews with a rating of $rating (this may take a while)..."
hive -silent -e "INSERT OVERWRITE DIRECTORY '/tmp/mapreduce_hive' SELECT reviewtext FROM coursework.reviews WHERE rating = $rating";

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

#Find the three most common collocations using mapreduce
hadoop jar ./functionality4/CollocationCount.jar uk.ac.edgehill.WordCount /tmp/mapreduce_hive/000000_0 $file_loc
#Sort the result of map reduce by descending values.
hdfs dfs -cat $file_loc/part-r-00000 | sort -nk 4
