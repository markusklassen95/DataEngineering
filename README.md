# DataEngineering Batch Processing
Code to build and set up a batch-processing-based data architecture. The used data architecture is `Hadoop 2.7.4` and `Apache Pig 0.17.0`.  
This project is containerize with Docker and works on Linux OS.  
The goal is to process large data or files efficiently and store them securely and redundant.
# Requirements
1. Linux OS (eg Ubuntu)
2. `Docker` and `Docker-compose` installed on the host. Check it with
```
docker -version
docker-compose -version
```
3. A file directory `~/Data` on the host. **Important: the data that you want to process must be located in this directory**
# Set up and run 
Download and unzip the code from `https://github.com/markusklassen95/DataEngineering.git`.  
There you can find, among other things, two files: `Batch_ExecuteSingleFile.sh` and `Batch_ExecuteFolder.sh`.  
`Batch_ExecuteSingleFile.sh` is to process a single file.  
`Batch_ExecuteFolder.sh` is to process all files in the folder.  
Running one of these two files will trigger the batch process.  
Running this for the first time will download the required Docker images, create and start Docker containers. This may take some time.
## Process single file  
When you want to batch procssing a single file, run
```
./Batch_ExecuteSingleFile.sh
```
You will then be prompted to enter the file name of the file to be processed. *Pay attention, that the file is located in `~/Data`*
```
Which file du you want to process?

```
After entering the file name, the Docker containers are started and the batch process is executed.  
The Data is stored in the Hadoop Distributed File System (HDFS) in the directory `hdfs://Output/filename`
## Process all files in a folder  
When you want to batch procssing all files in `~/Data`, run
```
./Batch_ExecuteFolder.sh
```
You will then be prompted to enter the folder of the target directory in HDFS.
```
Please enter the foldername of the target directory in HDFS:

```
After entering the folder name, the Docker containers are started and the batch process is executed.  
The Data is stored in the Hadoop Distributed File System (HDFS) in the directory `hdfs://Output/foldername`

# Pre-processing data
It is possibil to pre-processing data like filter or sort the data. For this open an d modify the `Batch.pig` file.
