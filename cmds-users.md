# Users

### List all users: 
SELECT User,Host FROM mysql.user;

### Create new user: 
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';

### Grant ALL access to user for * tables: 
GRANT ALL ON database.* TO 'user'@'localhost';

### Find out the IP Address of the Mysql Host
SHOW VARIABLES WHERE Variable_name = 'hostname'; (source)

### Create a new MySQL user account
CREATE USER 'database_user'@'localhost' IDENTIFIED BY 'user_password';

- If you want to grant access from another host(s) just change the localhost with the remote machine IP or use '%' wildcard for the host part, which means that the user account will be able to connect from any host.

CREATE USER IF NOT EXISTS 'database_user'@'localhost' IDENTIFIED BY 'user_password';

# Change a MySQL user account password

- The syntax for changing a user account password depends on the server version you are running on your system.

### find your server version:
mysql --version

# TODO:
- find out how to prompt for a password, not hard code it

### change the password use the following command:
- MySQL version > 5.7.6:
ALTER USER 'database_user'@'localhost' IDENTIFIED BY 'new_password';


- MySQL version < 5.7.5:
SET PASSWORD FOR 'database_user'@'localhost' = PASSWORD('new_password');

# List all MySQL user accounts

### list by querying the mysql.users table:

SELECT user, host FROM mysql.user;

+------------------+-----------+
| user             | host      |
+------------------+-----------+
| database_user    | %         |
| database_user    | localhost |
| debian-sys-maint | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
+------------------+-----------+

# Delete MySQL user account

### To delete a user account:
DROP USER 'database_user@'localhost';

- to avoid the error:
DROP USER IF EXISTS 'database_user'@'localhost';

# Grant permissions

### Display user account privileges:
SHOW GRANTS FOR 'database_user'@'localhost';


### To grand all privileges to a user account over a specific database:
GRANT ALL PRIVILEGES ON database_name.* TO 'database_user'@'localhost';

### To grand all privileges to a user account over all databases:
GRANT ALL PRIVILEGES ON *.* TO 'database_user'@'localhost';

### To grand all privileges to a user account over a specific table from a database:
GRANT ALL PRIVILEGES ON database_name.table_name TO 'database_user'@'localhost';

### to grant only specific privileges to a user account over a specific database type:
GRANT SELECT, INSERT, DELETE ON database_name.* TO database_user@'localhost';

# Revoke permissions from a MySQL user account

### to revoke all privileges from a user account over a specific database:

REVOKE ALL PRIVILEGES ON database_name.* TO 'database_user'@'localhost';

### reload all the privileges
- always be sure to reload all the privileges once you have finalized the permissions that you want to set up for your new users.
FLUSH PRIVILEGES;


# Backups

### making a backup of an entire database:

shell> mysqldump db_name > backup-file.sql

### You can load the dump file back into the server like this:

shell> mysql db_name < backup-file.sql

mysql> use db_name;
mysql> source backup-file.sql;

### For importing multiple SQL files at one time, use this:
for i in *.sql;do mysql -u root -pPassword DataBase < $i;done

### For simple importing:
mysql -u root -p Password DataBase < data.sql


### if you have a text file named mysqlscript.txt containing MySQL commands, one per line, you could use this command:

mysql -u username -p db_name < mysqlscript.txt > output.txt


# other notable commands:

### Backup the database "hope_SMF" to the smf.sql file after the username and password were verified:
mysqldump -u hope -p -h localhost hope_SMF > smf.sql


### MySQL status results:
mysql> status




