data = LOAD '/Datainput/$file' USING PigStorage (',')
as
(key:chararray, fare_amount:float, pickup_datetime:chararray, pickup_longitude:float, pickup_latitude:float, dropoff_longitude:float, dropoff_latitude:float, passenger_count:int);

data = FOREACH data GENERATE key, fare_amount, pickup_longitude, pickup_latitude, dropoff_longitude, dropoff_latitude, passenger_count;

Store data INTO ' /Output/$file ' USING PigStorage (',');
