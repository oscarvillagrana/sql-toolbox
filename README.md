# mysql-toolbox
fundamental tools for working with sql

This toolbox is meant to be used at the command line provided by the sql-server used. Most of this at the moment is for mysql-server command line interface. The md files included have a list of commands and are catgorized by subject.

# Description of files included:

# cmds-databases.md - Working With Databases

### sign in using terminal
- Access mysql termial: 
- Access specific database: 
### Databases
- list all databases that exist on server:
- Create new database: 
- Select database: 
- Determine what database is currently in use: 
- To delete database:
### Tables 
- Show all tables: 
- Show table structure: 
- List all indexes on a table: 
- Create new table with columns: 
- Adding a column: 
- Adding a column with an unique, auto-incrementing ID: 
- Inserting a record: 
- MySQL function for datetime input: 
### SELECT statement;
- Selecting records: 
- Explain records: 
- Selecting parts of records: 
- Counting records: 
- Counting and selecting grouped records: 
- Selecting specific records: 
- Select records containing [value]: 
- Select records starting with [value]: 
- Select records starting with val and ending with ue: 
- Select a range: 
- Select with custom order and only limit: 
### UPDATE and DELETE statements
- Updating records: 
- Deleting records: 
- Delete all records from a table (without dropping the table itself): 
- Delete all records in a table: 
- Removing table columns: 
- Deleting tables: 
- Deleting databases: 
### additional functions
- Custom column output names: 
- Export a database dump (more info here): 
- option for locked tables:
- Logout: 
### Aggregate functions
- Select but without duplicates: 
- Calculate total number of records: 
- Count total number of [column] and group by [category-column]: 
- Get largest value in [column]: 
- Get smallest value: 
- Get average value: 
- Get rounded average value and group by [category-column]: 
- Select from multiple tables: 
- Combine rows from different tables: 
- Combine rows from different tables but do not require the join condition: 
- Rename column or table using an alias: 



# cmds-users.md - Working With Users

### Users
- List all users: 
- Create new user: 
- Grant ALL access to user for * tables: 
- Find out the IP Address of the Mysql Host
- Create a new MySQL user account
### Change a MySQL user account password
- find your server version:
### TODO:
- change the password use the following command:
### List all MySQL user accounts
- list by querying the mysql.users table:
### Delete MySQL user account
- To delete a user account:
### Grant permissions
- Display user account privileges:
- To grand all privileges to a user account over a specific database:
- To grand all privileges to a user account over all databases:
- To grand all privileges to a user account over a specific table from a database:
- to grant only specific privileges to a user account over a specific database type:
### Revoke permissions from a MySQL user account
- to revoke all privileges from a user account over a specific database:
- reload all the privileges
### Backups
- making a backup of an entire database:
- You can load the dump file back into the server like this:
- For importing multiple SQL files at one time, use this:
- For simple importing:
- if you have a text file named mysqlscript.txt containing MySQL commands, one per line, you could use 
### other notable commands:
- Backup the database "hope_SMF" to the smf.sql file after the username and password were verified:
- MySQL status results:


# cmds-files.md - Working With Files
- location where history log is saved


# create-users.sql - Creating Users in MySQL

### Description for:
- Privileges for working with data:
- Privileges for modifying the database:
- Privilege levels:
- local vs. remote access:
- creates a new user bob with the password of 123456:

### Grant Privileges

- user with privileges to an entire database:

### View Grants

- show grants for current user:
- show grants for a particular user:
- show list of users and privileges

# MyFirstDb/ 
- recreating sql statements with python

# PostgrSQL/
- installing postgresql on linux ubuntu

# notes-mysql.md - additional notes