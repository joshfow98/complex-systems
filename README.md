# complex-systems
This repository contains all the code for our group work for CW2 for the Complex Systems module

#Build Instructions
Create Tables:
Open Hue in browser:
http://quickstart.cloudera:8888/hue/editor/?type=impala

Create table called coursework

Within the coursework table, create the tables places, reviews and users from the csv files. They must first be uploaded to the HDFS folder /user/Hive/warehouse to allow the data to be stored in the table from the csv.
This should create the tables for both Hive and Impala.

Elasticsearch:
download rpm:
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.4.2.rpm

Install rpm:
rpm -i elasticsearch-6.4.2.rpm

Download JAR files:
https://www.elastic.co/downloads/past-releases/elasticsearch-apache-hadoop-6-4-2
Unzip the downloaded zip file.

start Hive through the console with the command 'hive'

add the JAR elasticsearch-hadoop-hive-6.4.2.jar file found in this location /home/cloudera/Downloads/elasticsearch-hadoop-6.4.2/dist/ using the Hive command ADD JAR.

Create external table:
CREATE EXTERNAL TABLE coursework.es_reviews (gplusplaceid bigint,
gplususerid bigint
reviewtext string) 
STORED BY 'org.elasticsearch.hadoop.hive.EsStorageHandler'
TBLPROPERTIES('es.resource' = 'google/reviews')

Insert data into table:
INSERT OVERWRITE TABLE coursework.es_reviews SELECT r.gplususerid r,reviewtext FROM coursework.reviews

Elasticsearch is ready to be used