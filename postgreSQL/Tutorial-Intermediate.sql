
--Aggregate functions in SQL - Modeanalytics.com

/* 

	
    Aggregate Functions (only aggregate vertically)
    
    COUNT 				counts how many non-null rows are in a particular column. Can be used on non-numerical columns.
    SUM 				adds together all the values in a particular column containing numerical values.
    MIN and MAX 		return the lowest and highest values in a particular column, respectively. Can be used on non-numerical columns.
    AVG 				calculates the average of a group of selected numerical values but ignores nulls completely.
    

    GROUP BY            aggregates only part of a table independently.
    HAVING
    DISTINCT
    CASE
    Joins
    INNER JOIN
    Outer Joins
    LEFT JOIN
    RIGHT JOIN
    Joins Using WHERE or ON
    FULL OUTER JOIN
    UNION
    Joins with Comparison Operators
    Joins on Multiple Keys
    Self Joins

Query clause order:

    SELECT
    FROM
    WHERE
    GROUP BY
    HAVING
    ORDER BY



*/
--01 Jan 2019


/* COUNT */


SELECT COUNT(*)
  FROM tutorial.aapl_historical_stock_price


SELECT COUNT(date) AS count_of_date
  FROM tutorial.aapl_historical_stock_price


SELECT COUNT (date) as date,
count (year) as year,
count (month) as month,
count (open) as open,
count (high) as high,
count (low) as low,
count (close) as close,
count (volume) as volume,
count (id) as id
  FROM tutorial.aapl_historical_stock_price

  -- 02 Jan 2019


/* MAX */


SELECT MAX(close - open)
  FROM tutorial.aapl_historical_stock_price


SELECT year,
       month,
       COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month


 SELECT year,
       month,
       SUM(volume) AS sum_volume
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
 Order by year, month asc


 -- 07 Jan 2019


 /* GROUP BY */


SELECT year,
       AVG(close - open) AS avg_daily_change
  FROM tutorial.aapl_historical_stock_price
  GROUP by year
  ORDER BY year


SELECT month,
       year,
       MAX(high) AS highest_price,
       MIN(low) AS lowest_price
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month, year
  ORDER BY year, month


 --You can't mix nonaggregate (row-by-row) and aggregate expressions in a SELECT clause. 
 --You can't use filtering operators such as WHERE on an aggregate column



/* HAVING & DISTINCT */


SELECT COUNT(DISTINCT month) AS unique_months
  FROM tutorial.aapl_historical_stock_price


-- To be able to select year and count distict month you must add a group by opperator?

SELECT year,
       COUNT(DISTINCT month) AS months_count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year
 ORDER BY year  


 SELECT COUNT(DISTINCT year) AS years_count,
       COUNT(DISTINCT month) AS months_count
  FROM tutorial.aapl_historical_stock_price


--08 Jan 2019


/* CASE statement */


SELECT player_name,
       year,
       CASE WHEN year = 'SR' THEN 'yes'
            ELSE NULL END AS is_a_senior
  FROM benn.college_football_players


  SELECT player_name,
       school_name,
       state,
       hometown,
       CASE WHEN hometown ILIKE '%palm_springs%' THEN 'yes'
       ELSE NULL END AS is_from_palm_springs,
       CASE WHEN hometown ILIKE '%CA' THEN 'yes'
       ELSE NULL END AS is_from_california
  FROM benn.college_football_players
  ORDER BY is_from_palm_springs, is_from_california, hometown
  LIMIT 500


SELECT player_name,
       weight,
       CASE WHEN weight > 250 THEN 'over 250'
            WHEN weight > 200 AND weight <= 250 THEN '201-250'
            WHEN weight > 175 AND weight <= 200 THEN '176-200'
            ELSE '175 or under' END AS weight_group
  FROM benn.college_football_players
  ORDER BY weight_group, player_name


SELECT player_name,
       height,
       CASE WHEN height > 77 THEN '78 or over'
            WHEN height > 73 AND height < 78 THEN '74-77'
            WHEN height > 69 AND height < 74 THEN '70-73'
            WHEN height < 70 THEN '69 or under'
            END AS height_group
  FROM benn.college_football_players
  ORDER BY height_group, height
  

  /* 


    The CASE statement always goes in the SELECT clause
    CASE must include the following components: WHEN, THEN, and END. ELSE is an optional component.
    You can make any conditional statement using any conditional operator (like WHERE) between WHEN and THEN. 
    This includes stringing together multiple conditional statements using AND and OR.
    You can include multiple WHEN statements, as well as an ELSE statement to deal with any unaddressed conditions.

    statement
    conditional statement
    conditional operator
    clause

*/


SELECT *,
       CASE WHEN year IN ('JR', 'SR') THEN player_name ELSE NULL END AS upperclass_player_name
  FROM benn.college_football_players

  