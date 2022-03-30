data = LOAD '/Datainput/Data_input' USING PigStorage (',');

Store data INTO ' /Output/$folder ' USING PigStorage (',');
