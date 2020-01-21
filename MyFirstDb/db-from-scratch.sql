-- Not Quite A Base SQL

-- create table:

CREATE TABLE my_table (
	user_id INT NOT NULL,
	name VARCHAR(200),
	num_friends INT);


-- Insert statement

INSERT INTO my_table (user_id, name, num_friends)
VALUES (0, 'User1', 0);

-- UPDATE

UPDATE my_table
SET num_friends = 3
WHERE user_id = 1;

-- DELETE

-- the less dangerous way add a WHERE clause

DELETE FROM my_table WHERE user_id = 1;

-- SELECT 

SELECT * FROM my_table;							-- get the entire contents
SELECT * FROM my_table LIMIT 2;					-- get first two rows
SELECT user_id FROM my_table;						-- only get specific columns
SELECT user_id FROM my_table WHERE name = 'User1';	-- only get specific rows

-- GROUP BY

