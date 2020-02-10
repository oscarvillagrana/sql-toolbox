cmds-query-primer.md
Oscar Villagrana

# the SELECT clause;

### Selecting records: 
SELECT * FROM [table];

### Explain records: 
EXPLAIN SELECT * FROM [table];

### Selecting parts of records: 
SELECT [column], [another-column] FROM [table];

# removing dublicates

### using distinct keyword
SELECT DISTINCT [column]
FROM [table];

# the FROM clause

### subquiry-generated tables
- here the subquery returns 4 columns and the containing query references 3 of them
- the subquery is referenced by the containing query via its alias
SELECT [table2alias].[column1], [table2alias].[column2], [table2alias].[column3]
FROM (SELECT [column1], [column2], [column3], [column4] FROM [table1]) [table2alias]

# the WHERE clause

### Counting records: 
SELECT COUNT([column]) FROM [table];

### Counting and selecting grouped records: 
SELECT *, (SELECT COUNT([column]) FROM [table]) AS count FROM [table] GROUP BY [column];

### Selecting specific records: 
- Selectors: <, >, !=; combine multiple selectors with AND, OR
SELECT * FROM [table] WHERE [column] = [value]; 

### Select records containing [value]: 
SELECT * FROM [table] WHERE [column] LIKE '%[value]%';

### Select records starting with [value]: 
SELECT * FROM [table] WHERE [column] LIKE '[value]%';

### Select records starting with val and ending with ue: 
SELECT * FROM [table] WHERE [column] LIKE '[val_ue]';

### Select a range: 
SELECT * FROM [table] WHERE [column] BETWEEN [value1] and [value2];

# the GROUP BY and HAVING clause

SELECT [alias1].[column1], count([alias2].[column1]) [column1]
FROM [table1] [alias1] INNER JOIN [table2] [alias2]
  ON [alias1].[column2] = [alias2].[column2]
GROUP BY [alias1].[column1]
HAVING count([alias2].[column1]) > 2;

# the ORDER BY clause

SELECT [column1], [column2]
FROM [table]
ORDER BY [column1];

### column one gets priority
SELECT [column1], [column2]
FROM [table]
ORDER BY [column1], [column2];

### ascending versus descending sort order
- ascending is default
 
 ### descending sort order
SELECT [column1], [column2], [column3], [column4]
FROM [table]
ORDER BY [column4] DESC;

### Sorting via Expressions
- sorts by column 5 starting with 3 ints from the right
SELECT [column1], [column2], [column3], [column4], [column5]
FROM [table]
ORDER BY RIGHT ([column5], 3);

### Sorting via Numeric Placeholders
- first orders by column 2 then by column 5
SELECT [column1], [column2], [column3], [column4], [column5]
FROM [table]
ORDER BY 2, 5;

### Select with custom order and only limit: 
SELECT * FROM [table] WHERE [column] ORDER BY [column] ASC LIMIT [value]; (Order: DESC, ASC)


### Additional Statements

-- 1
SELECT DISTINCT category_id
FROM books;

-- 2
SELECT title,  'pub_date' AS 'Publication Date'
FROM books;

-- 3
SELECT title
FROM books
WHERE publisher_id = 9561;

-- 4
SELECT isbn, title 
FROM books
WHERE title LIKE '_N__R%'
ORDER BY title DESC;

-- 5
SELECT isbn
FROM books;

-- 6
SELECT title, pud_dateFROM books
WHERE pud_date LIKE '2009%';FROM books;
