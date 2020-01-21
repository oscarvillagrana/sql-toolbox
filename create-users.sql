/*
    Oscar Villagrana
    Create a user with enough privileges    */

/* Privileges for working with data: */
--  select, insert, update, delete, execute
/* Privileges for modifying the database: */
--  create, alter, drop, index
--  create routine, alter routine, trigger, event
/* Privilege levels: */
--  global, database, table, column
/* local vs. remote access: */
--  username@localhost; username@127.0.0.1


/* creates a new user bob with the password of 123456: */
-- ------------------------------------------------------

-- CREATE USER 'boby'@'localhost' identified by '13243546';

/*  ################
    Grant Privileges 
    ################ */

/* user with privileges to an entire database:
   user cannot assign security permissions to other accounts for this database
   user only able to do databse functions */
-- ------------------------------------------
GRANT SELECT, INSERT, UPDATE, DELETE
ON zoo.*
TO 'boby'@'localhost';

/*  ###########
    View Grants
    ########### */

/* show grants for current user: */
SHOW GRANTS;
/* show grants for a particular user: */
FOR 'boby'@'localhost';
/* show list of users and privileges */
SELECT * FROM mysql.boby;
