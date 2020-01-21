# mysql-toolbox
fundamental tools for sql by Oscar Villagrana

# MYSQL

# Managing Users and Privileges

- Privileges for working with data:
    select, insert, update, delete, execute

- Privileges for modifying the database:
    create, alter, drop, index
    create routine, alter routine, trigger, event

- Privilege levels:
    global, database, table, column

- local vs. remote access:
    localhost: can only connect if physicaly on same machine:
    username@localhost; username@127.0.0.1
    remote: can connect from any other machine on the network

- from any computer:
    username

- from a particular domain:
    username@'%.domainname.com'

# first time log in and setup
### inside the bash termial:
```
sudo mysql
```
### within mysql server:
```
mysql> select user, host from mysql.user;
```
### creates a new user bob with the password of 123456:
```
mysql> create user 'bob'@'localhost' identified by '123456';
```
### showing the privileges for user bob:
```
SHOW GRANTS FOR bob@localhost;
```
### assign privileges:
- basics are: select, insert, update, alter
```
SHOW GRANTS FOR bob@localhost;
```


# Grant Privileges

### user with no privileges:
```
GRANT USAGE
ON *.*
TO username@localhost IDENTIFIED BY 'password';
```

### user with global privileges:
```
GRANT ALL
ON *.*
TO username@localhost IDENTIFIED BY 'password';
```

### user with privileges to an entire database:
```
GRANT SELECT, INSERT, UPDATE, DELETE
ON database name.*
TO username@localhost IDENTIFIED BY 'password';
```

# View Grants

### show grants for current user:
```
SHOW GRANTS;
```

### show grants for a particular user:
```
FOR %username%;
```

### show list of users and privileges
```
SELECT * FROM mysql.useer;
```

# Revoke Privileges

### revoke privileges from one user:
```
REVOKE [%privilege%]
ON *.*
FROM %username%;
```

### revoke privileges from multiple users:
```
REVOKE [%privileges%]
ON *.*
FROM %username1%, %username2%, ...;
```

# Granting to classic models db
- classic models is a database

### user with all administrator privileges:
```
GRANT ALL
ON classicmodels.*
TO my_admin_user;	-- dont need to identify because user is already created
```

### user cannot assign security permissions to other accounts for this and is only able to do databse functions:
```
GRANT SELECT, INSERT, UPDATE, DELETE
ON database name.*
TO username@localhost IDENTIFIED BY 'password';
```

# passwords

- plain text (never use!)
- sha256 
- mysql native: salted, hashed and possibly encrypted

- first time, we need to identify with passwd becuase it has not been created
- afterwards, dont need to identify because user is already created
- admin name: make a simple name like Bob so people cant see admin role
- View: looks and acts like a table but only exists in memory

# Creating Views

- source=https://www.youtube.com/watch?v=i_RgtRfCkKU
- stoped at 28:50
- tables and views have to be different names
- classicmodels; is a database

### show that user is only allowed to log in:
```
show grants for my_user; 
```

### set user to only be able to see info in this particular view (customer_phone):
```
GRANT SELECT
ON classicmodels.customer_phone
to my_user;
```
```
show databases;
use classic_models;
```
### setting password for my_user, stores hash for password:
```
set password for my_user = password('mynewpassword')
```
### erases user:
```
drop user my_user;
```

