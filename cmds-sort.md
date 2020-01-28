cmds-sort.md

# group by

### show how many people have the same last name
SELECT COUNT(*) FROM peiple GROUP BY last_name;

### show how many people have the same last name
SELECT last_name, MIN(birthday) FROM people GROUP BY last_name;

# Group Concat

### concat and seperate with commas 
SELECT last_name, GROUP_CONCAT(mobil) FROM people GROUP BY last_name;

### group where the group is not member

### mobil numbers for the couple with same last name
SELECT last_name, GROUP_CONCAT(mobil SEPARATOR ' and ') FROM people GROUP BY last_name HAVING COUNT(*)>1;

# Filters

### all the couples except 
SELECT last_name, GROUP_CONCAT(mobil SEPARATOR ' and ') FROM people WHERE last_name != 'cabral' GROUP BY last_name HAVING COUNT(*)>1;

Learning MySQL Development

# Ordering Results

# working with string data

### concat function
SELECT CONCAT('string1', 'string2', 'string3');

### format
SELECT CONCAT (last_name, ', ', first_name)
FROM employee
