CREATE DATABASE SalesDB -- creating a database in the serverless sql pool 
    COLLATE Latin1_General_100_BIN2_UTF8 -- supports conversion of text data in files to appropriate Transact-SQL data types


/* 
You can use the OPENROWSET function with a BULK path to query file data from your own database, just as you can in the master database
But if you plan to query data in the same location frequently, it's more efficient to define an external data source that references that location.
*/
CREATE EXTERNAL DATA SOURCE files
WITH (
    LOCATION = 'https://mydatalake.blob.core.windows.net/data/files/'
)