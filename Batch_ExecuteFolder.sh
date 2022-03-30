#!/bin/bash


echo 'Enter the folder name in which the data should be stored.'

read Datafolder

echo '---------------------------------------'
echo '---------Batch Job Start---------------'
echo '---------------------------------------'

cp Batch_folder.pig ~/Data


docker-compose up -d
docker ps

docker exec namenode hdfs dfs -mkdir -p /Datainput
docker exec namenode hdfs dfs -put /Data_input/ /Datainput/
docker exec namenode hdfs dfs -rm /Datainput/Data_input/Batch_file.pig
docker exec namenode hdfs dfs -rm /Datainput/Data_input/Batch_folder.pig

docker exec --workdir /Data_input namenode pig -x mapreduce -param folder=$Datafolder Batch_folder.pig

docker exec namenode hdfs dfs -rm -r /Datainput

echo '---------------------------------------'
echo '---------Batch Job Success-------------'
echo '---------------------------------------'
