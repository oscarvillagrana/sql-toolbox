--Basic QSL Tutorial - Modeanalytics.com

/*

	Logical Operators

    LIKE 		allows you to match similar values, instead of exact values.
    IN 			allows you to specify a list of values you’d like to include.
    BETWEEN 	allows you to select only rows within a certain range.
    IS NULL 	allows you to select rows that contain no data in a given column.
    AND 		allows you to select only rows that satisfy two conditions.
    OR 			allows you to select rows that satisfy either of two conditions.
    NOT 		allows you to select rows that do not match a certain condition.

*/

/* IN logical operator */

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank IN (1, 2, 3)

 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IN ('Taylor Swift', 'Usher', 'Ludacris')

SELECT *
 FROM tutorial.billboard_top_100_year_end
 WHERE "group" IN ('Elvis Presley', 'M.C. Hammer', 'Hammer') 
 OR artist IN ('Elvis Presley', 'M.C. Hammer', 'Hammer')


/* BETWEEN logical operator
Seems to be inclusive by nature
 */



SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank BETWEEN 5 AND 10

=

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank >= 5 AND year_rank <= 10



SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist BETWEEN 'A' AND 'M'


/* ISNULL logical operator */

SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ISNULL 

/* AND, LIKE & ILIKE logical operator */

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012
   AND year_rank <= 10
   AND "group" ILIKE '%feat%'

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 1960
   AND song_name ILIKE '%love%'

/* OR logical operator */

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND ("group" ILIKE '%macklemore%' OR "group" ILIKE '%timberlake%')

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%Dr. Dre%'
   AND (year <= 2001 OR year >= 2009)

   
/* NOT logical operator */

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2003
   AND song_name NOT ILIKE '%a%'   

/* Order BY, DESC & ASC logical operator */

SELECT * FROM tutorial.billboard_top_100_year_end
ORDER BY artist DESC

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3
 ORDER BY year_rank, year DESC

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank BETWEEN 10 AND 20 --inclusive
 AND year IN (1993, 2003, 2013) --each list is considered and or value
 ORDER BY year, year_rank --first priority is year order
 
 

