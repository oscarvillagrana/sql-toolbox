-- Not Quite A Base SQL

-- create table:

CREATE TABLE users (
	user_id INT NOT NULL,
	name VARCHAR(200),
	num_friends INT);


-- Insert statement

INSERT INTO users (user_id, name, num_friends)
VALUES (0, 'User1', 0);

-- UPDATE

UPDATE users
SET num_friends = 3
WHERE user_id = 1;

-- DELETE

-- the less dangerous way add a WHERE clause

DELETE FROM users WHERE user_id = 1;

-- SELECT 

SELECT * FROM users;							-- get the entire contents
SELECT * FROM users LIMIT 2;					-- get first two rows
SELECT user_id FROM users;						-- only get specific columns
SELECT user_id FROM users WHERE name = 'User1';	-- only get specific rows

-- GROUP BY

