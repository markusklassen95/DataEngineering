#!/bin/bash



echo 'Which file do you want to process and store(with file extension)?'

read Datafile

echo '---------------------------------------'
echo '---------Batch Job Start---------------'
echo '---------------------------------------'

cp Batch_file.pig ~/Data


docker-compose up -d
docker ps

docker exec namenode hdfs dfs -mkdir -p /Datainput
docker exec namenode hdfs dfs -put /Data_input/$Datafile /Datainput/

docker exec --workdir /Data_input namenode pig -x mapreduce -param file=$Datafile Batch_file.pig

docker exec namenode hdfs dfs -rm -r /Datainput

echo '---------------------------------------'
echo '---------Batch Job Success-------------'
echo '---------------------------------------'
