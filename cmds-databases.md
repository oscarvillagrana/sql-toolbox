# Working With Databases
# Oscar Villagrana

# sign in using terminal

### Access mysql termial: 
mysql -u [username] -p; (will prompt for password)

### Access specific database: 
mysql -u [username] -p [database]; (will prompt for password)

### start a log of workflow
tee ovillagrana_assignment3.txt

### stop logging workflow
notee

### bash command to zip files
$ zip ovillagrana_assignment.zip ovillagrana_assignment.sql ovillagrana_assignment.txt 


# Databases

### list all databases that exist on server:
SHOW DATABASES;

- The output will look something like this:

+--------------------+
| Database           |
+--------------------+
| information_schema |
| database_name      |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

- The information_schema, mysql, performance_schema, and sys databases are created at installation time and they are storing information about all other databases, system configuration, users, permission and other important data. These databases are necessary for the proper functionality of the MySQL installation.
Delete a MySQL database

### Create new database: 
create database [database];

### Select database: 
use [database];

### Determine what database is currently in use: 
select database();

### To delete database:
DROP DATABASE database_name;

- To avoid error you can use the following command:
DROP DATABASE IF EXISTS database_name;

# Tables 

### Show all tables: 
show tables;

### Show table structure: 
describe [table];

### List all indexes on a table: 
show index from [table];

### Create new table with columns: 
CREATE TABLE [table] ([column] VARCHAR(120), [another-column] DATETIME);

### Adding a column: 
ALTER TABLE [table] ADD COLUMN [column] VARCHAR(120);

### Adding a column with an unique, auto-incrementing ID: 
ALTER TABLE [table] ADD COLUMN [column] int NOT NULL AUTO_INCREMENT PRIMARY KEY;

### Inserting a record: 
INSERT INTO [table] ([column], [column]) VALUES ('[value]', [value]');

### MySQL function for datetime input: 
NOW()

### Rename table:
RENAME TABLE old_table1 TO new_table1,
             old_table2 TO new_table2,
             old_table3 TO new_table3;

### copy table with indexes and triggers:
CREATE TABLE [newtable] LIKE [oldtable]; 
INSERT INTO [newtable] SELECT * FROM [oldtable];

### copy just table structure and data:
CREATE TABLE [tbl_new] AS SELECT * FROM [tbl_old];

### does dot notation work to use different database?
CREATE TABLE [recipes_new] LIKE production.recipes;
INSERT [recipes_new] SELECT * FROM production.recipes;

# UPDATE and DELETE statements

### Updating all rows of records: 
UPDATE [table] SET [column] = '[updated-value]';

### Updating some record(s) with conditional:
UPDATE [table] SET [column] = '[updated-value]' WHERE [column] = [value];

### Deleting a specific record: 
DELETE FROM [table] WHERE [column] = [value];

### Delete all records from a table (without dropping the table itself): 
- (This also resets the incrementing counter for auto generated columns like an id column.)
DELETE FROM [table]; 

### Delete all records in a table: 
truncate table [table];

### Removing table columns: 
ALTER TABLE [table] DROP COLUMN [column];

### Rename column:
[table].Columns["[column_name]"].ColumnName = [new_column_name];

### Rename column:
alter table Table_name rename column oldName to newName;
Update Table_name set oldName= newName;

### Deleting tables: 
DROP TABLE [table];

### Deleting databases: 
DROP DATABASE [database];

# additional functions

### Custom column output names: 
SELECT [column] AS [custom-column] FROM [table];

### Export a database dump (more info here): 
mysqldump -u [username] -p [database] > db_backup.sql

### option for locked tables:
--lock-tables=false 

Import a database dump (more info here): mysql -u [username] -p -h localhost [database] < db_backup.sql

### Logout: 
exit;

# Aggregate functions

### Select but without duplicates: 
SELECT distinct name, email, acception FROM owners WHERE acception = 1 AND date >= 2015-01-01 00:00:00

### Calculate total number of records: 
SELECT SUM([column]) FROM [table];

### Count total number of [column] and group by [category-column]: 
SELECT [category-column], SUM([column]) FROM [table] GROUP BY [category-column];

### Get largest value in [column]: 
SELECT MAX([column]) FROM [table];

### Get smallest value: 
SELECT MIN([column]) FROM [table];

### Get average value: 
SELECT AVG([column]) FROM [table];

### Get rounded average value and group by [category-column]: 
SELECT [category-column], ROUND(AVG([column]), 2) FROM [table] GROUP BY [category-column];
Multiple tables

### Select from multiple tables: 
SELECT [table1].[column], [table1].[another-column], [table2].[column] FROM [table1], [table2];

### Combine rows from different tables: 
SELECT * FROM [table1] INNER JOIN [table2] ON [table1].[column] = [table2].[column];

### Combine rows from different tables but do not require the join condition: 
- (The left table is the first table that appears in the statement.)
SELECT * FROM [table1] LEFT OUTER JOIN [table2] ON [table1].[column] = [table2].[column]; 

### Rename column or table using an alias: 
SELECT [table1].[column] AS '[value]', [table2].[column] AS '[value]' FROM [table1], [table2];
Users functions

### show tables and data types
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = [db_name]
AND TABLE_NAME = [table_name];

### show tables and data types
SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
WHERE table_name = [tbl_name] AND COLUMN_NAME = [col_name];