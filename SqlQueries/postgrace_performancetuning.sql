---Performanance tuning.

/*
for example, are widely used to store indexes. 
Databases differ on the kind of indexes they employ. 
Some commonly used index types are 


balanced trees, or B-trees: which are used for equality and range queries. 
    Used when a large number of possible values in a column (higher cardinality).
    Rebalances as needed.
    Time to access is based on depth of tree.

           Noede 25 <-----Node 50 ---> node 75
Node 13<---     ---> Node 30. 

Syntax : Create index <index name> on <table name>(<column name>);

Bitmap indexes: efficient ways of performing set operations, like intersection and union. 
    Used when smaller number of possible values (Low cardinality)
    Filter by bitwise operations, such as AND, OR and NOT.
    Time to access is based on is to time to perform bitwise operations.
    In oracle you have to define bitmap index in postgrace sql it automatically selects index when you create index.

State type ='PIAD' and State type = 'Churned'


Hash indexes: are used for equality operations. 
    Hash functions generate unique fixed values for different values.
    is used for '=' but not for range of values.


Syntax : create index <Index name> on <table name> using HASH(<column name>);

Postgrace has more indexes as gist, brin (Block range indexing).

And, in addition, some databases, like Postgres, provide specialized index for particular data types, like geo-spatial data.

Three types of joins : 

set enable_nestedloops = true
set enable_hashjoin = false
set enable_mergejoin = false

Nested loop join : Compare all rows in both tables to each other.
    Loop through one table.
    For each row, loop through the other table.
    At each step, compare keys.
    Simple to implement.
    Can be expensive.

    For row in table 1
        for row in table 2

    Outer loop runs once
        Inner loop runs for each row in join table.

    Select larger table as driver table and smaller table as inner table.

    works well with smaller tables.
    Work well with small driver tables, joined column is indexed.

    Cons : Can be slow
           if table don't fit into memory, event slower perfromance.
           Indexes can improve the performance of nested loop joins, especially covered indexes.

Hash join : Calculate hash value of key and join based on matching has values.
    Compute has values of key values in smaller table.
    Store in hash table, which has value and row attributes.
    Scan larger table; find rows from smaller hash table.


Sort Merge Join : Sort both tables and then join rows while taking advantage of order.
    Sort both tables.
    Compare rows like nested loop join, but..
    Stop when it is not possible to find a match later in the table because of the sort order.
    Scan the driving table only once.

    Merge is used for '=' oprations and it stops scanning after it finds larger number than the join key value.
    Works well when table don't fit in memory.
    Time based : on Time to sort and time to scan.

Joins vs subqueries : 
    Conventional wisdom -Joins are more efficient.
    Improved query plan : Query plan builders are more effective at optimizing queries.
    Maxmize clarity : Both will work well in many cases, opt for what makes intenstions clear.

Partitioning :
    Storing table data in multiple sub-tables, known as partitions.
    Used to improve query, load and delete operations.
    Used for large tables.
    When subset of data is accessed or changed.
    Can be expensive.

        Horizontal partitioning : 
            Large tables can be difficult to query effeciently eventho indexes are created.
            Split tables by rows into partitons.
            Treate each partition as a table.
            Limit scan to subset of partitions.
            Local indexes for each partition.

            Use cases: 
                Data warehouse : Partiton on time, Query on time, Delete by Time.
                TimeSeries : Most likely query latest data, Summarize data in older partitions.
                Naturally partition data: Retailer by Geography, Data Science by product category.
        Vertical partitioning : 
            Seperate columns into multiple tables.
            Keep frequently queried columns together.
            Use same primary key in all tables.

            Benifits : 
                Increases number of rows in data block
                Global indexes for each partition.
                Can reduce i/o as we fetch few columns of data rather full set of columns data.

            Use cases: 
                Data warehouse : Partition on groups of attribues.
                Many attributes : Wide variety of products, each with different attributes.
                Data Analytics : Statistics on subset of attributes, after factor analysis.

    Partition by range : 
            Determines which partition is used for data.
            minimum and maximum values allowed in the partition.
            Each partiton has its own indexes, constraints, and defaults.
            partition tables can have local constraints and indexes

            Syntax : table creation 
                     create table test (c1 int not null,
                        c2 varchar(20),
                        start_dt date)
                     partition by ranve(start_dt)

                     Partiton table creation
                     create table test_month partition of test
                        for values ('2021-04-01') to ('2021-05-01')
    partition by list : creation of table for list of products.
                        
                        partition by list(product_category)

                        for values (1,2,3)
    partitoin by hash : Determines which partition is used for data.
                        Modulus number of partitions.
                        even distribution.

                        partition by hash(customer_id)

                        for values with (module 5, remainder 0)



            Use : query latest data,
                  Comparative queries, for example, same time last year.
                  Report within range, for example, numeric identifier range.
                  Drop data after period of time.


Materialized views : 
        Precomuted queries
        Join and store results
        Apply other opaerations.
        Duplicity of data: takes space to store data (alread data exists in indivudual tables)
        Updates : Updates to source requires updates to materialized views.
        potential inconsistancy : Refresh materialized view command.
        u can create indexes on materialzed views.

        use case : Time more important than storage space.
                   Can tolerate some inconsistance or refresh after each update to source.
        Refresh materialized view < view name> to refresh data in views.


        Table 1 + join + table 2 ---> results stored into view.           


Statstics :  
        Size of data : Number of rows and amount of storage used.
        Frequency of data : Fraction of nulls, number of distinct values , frequent values.
        Distribution : Histogram describing spread of data.
        distribution of data more before mean then it is postively skewed and viceversa is -ve skewed
        Data distribution should be equally skewed.

        VACUUM(FULL, ANALYZE) [Table name] perform full vacuum and collect statistics.

parallel query execution : -

Tips : 
    Create index on join columns and columns in where clause
    use covering indexes
    Don't filter a column using equality to NULL, use isnull.
        ( col1 = NULL use ISNULL)
    Don't use functions in where clause unless you have a functional index.
    if plan to range scan then keep the range as small as possible.
    use equality with conditions.
    LIKE 'ABC%' can use and index; LIKE '%ABC' cannot.
    Use indexes to aviod sorts with order by.
    when filtering range condtion, especially dates, use continous conditions such as trunc(sysdate) and trunc(sysdate+1)
    Don't seperate date and time into separate column use datetimestamp datatype
    Don't stoare numeric data in char, varchar or text; use a numeric data type.



Large tables --> full scan using B index and depth of index grow 

large tables take a long time to scan. 
We can improve upon full table scans by creating an index. 
Large tables though can lead to large indexes. 
Now if we can use a hash index then we will have constant time access to the index. 
If we use a balance tree index, or B-tree index, then the depth of the index will grow at a logarithmic rate. 
Now neither of these is bad and in fact, they're both much better than a full table scan in most cases. 
But can we do better? In some cases, yes. We can break the large tables down into smaller partitions. 
Now imagine we have to do a scan. 
If we know the data we are looking for is located in just one of the partitions, then we can scan just that partition table. 
This means operations that require scans can be done more efficiently. 
To know if the data you are looking for is in a particular partition, we have to use a partition key. 
This is a column in a table that is used to determine which partition will store the data of that particular row. 
It's common for partition keys to be based on time. 
For example, we could create one partition for each month and store data generated in a month in its corresponding partition. 
We can use indexes with partitions. Local indexes are used to improve the access time to rows in a particular partition. 
We can also have global indexes, which can provide faster look-ups to any data in the table across all partitions. 
This kind of index is helpful if you need to filter data on something other than the partition key and when the data is spread across multiple partitions. 


in another table. In our example, status level in the customer table is a foreign key into the status table. There are three ways to join tables. Nested loop joins, hash joins, and sort merge joins. Let's take a look at each of these. Nested loop joins compare each row in a table to all the other rows in the other table. At each step in the process, it compares keys. Two advantages of nested loop joins are that they can be used to perform any type of join, and they're fairly simple to implement. Now a disadvantage is they can have higher cost than other join methods. Hash joins calculate hash value for a current key and use that to look up the corresponding row. Hash values for one table are calculated and stored in a hash table. And then the other table is scanned, calculating the hash value of each key as it goes. Hash joins could be used for joins that have an equality comparison. Sort merge joins start by actually sorting both tables. It then compares rows like nested loop joins, but it can stop scanning when it's no longer possible to find a match later in the table, because of the sort order. Unlike nested loop joins, the driving table is processed only once.

*/