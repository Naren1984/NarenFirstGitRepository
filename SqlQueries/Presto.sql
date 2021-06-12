--2006 yahoo introduced hadoop
--google implemented map reduce to query and process data in hadoop
--2013 face baook implemented hive to view data using sql like language.
	--hive is batch oriented and  analysts could actually access, process, and analyze huge amounts of data stored in the platform. 
	--Now, the big problem with Hive was that it was still batch-oriented and really just a translator. 
	--So you would write your code in Hive, and then the engine would translate that into MapReduce, which would then process the data. 
	--This was, again, great and very useful. However, it was really, really slow.
--2016 - presto
	--And many of the analytical database vendors out there use an architecture known as MPP, or Massively Parallel Processing. 
	--What this does is to distribute parts of the query across different nodes in a cluster, 
	--and each little tiny query runs very quickly, then pulls all that data back together in memory and returns it to the user.
	--Needs to maining seperate piepeline to load data into mpp system
	--So at Facebook, they saw this problem, and they developed a solution that would allow you to run these MPP-style really fast queries wherever the data lives. 
	--And this is what Presto gives you. Now Presto is licensed under the Apache license. 

--Why presto --
  --speed
  --pluggble - can connect with oracle. my sql and you can run query on both the datasets together.
  --Scalable - you can add more nodes as you need
  --no longer to move data 
  --combine sources
  --

  --Architecture :

  	--client --> cordinator (parse, plan & scheduler to locate the data)--> datastream api --> brings the data --> workers executs.