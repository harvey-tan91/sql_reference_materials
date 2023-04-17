/*
Materials: 
- https://learn.microsoft.com/en-us/azure/synapse-analytics/sql/develop-openrowset
- https://learn.microsoft.com/en-us/training/modules/query-data-lake-using-azure-synapse-serverless-sql-pools/3-query-files

The output from OPENROWSET is a rowset to which an alias must be assigned. 
The alias rows is used to name the resulting rowset.
You can also specify multiple file paths in the BULK parameter, separating each path with a comma.

https://mydatalake.blob.core.windows.net/data/files/**: All files in the files folder, and recursively its subfolders.

*/

SELECT TOP 100 *
FROM OPENROWSET(
    BULK 'https://mydatalake.blob.core.windows.net/data/files/*.csv',
    FORMAT = 'csv',
    PARSER_VERSION = '2.0', -- determine how the query interprets the text encoding used in the files. 1.0 is default and offer wider range of file encoding while 2.0 support fewer encoding but better performance
    FIRSTROW = 2 , -- number of rows to skip
    HEADER_ROW = TRUE -- to define the schema, this is only available when PARSER_VERSION = 2.0
    ) AS rows
WITH ( -- to specify explicit column names and data types, you can override the default column names and inferred data types 
    product_id INT,
    product_name VARCHAR(20) COLLATE Latin1_General_100_BIN2_UTF8,
    list_price DECIMAL(5,2)
)

