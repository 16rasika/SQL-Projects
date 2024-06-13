SELECT * FROM walmart_sales;
--------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------- ADDING NEW COLUMN -----------------------------------------------------------------------------
SELECT 
   time,
   (CASE
   WHEN 'time'BETWEEN "00:00:00" AND "12:00:00" THEN "MORNING"
   WHEN 'time' BETWEEN "12:01:00" AND "16:00:00" THEN "AFTERNOON"
   ELSE "EVENING"
   END
   ) AS time_of_the_date
   FROM walmart_sales;
   
   ALTER TABLE walmart_sales ADD COLUMN time_of_day VARCHAR(20);
   
   UPDATE walmart_sales
   SET time_of_day =(
   CASE
		WHEN 'time'BETWEEN "00:00:00" AND "12:00:00" THEN "MORNING"
		WHEN 'time' BETWEEN "12:01:00" AND "16:00:00" THEN "AFTERNOON"
		ELSE "EVENING"
    END
   );
   ----------------------------------------------------------------------------------------------------------------------------------------------------------
   ---------------------------------------------------- DAY NAME    ------------------------------------------------------------------------------------
   SELECT 
   date,
   DAYNAME(date)
   FROM walmart_sales;
   
   ALTER TABLE walmart_sales ADD COLUMN day_name VARCHAR(10);
   
   UPDATE walmart_sales
   SET day_name = DAYNAME(date);
   --------------------------------------------------------------------------------------------------------------------------------------------------
   ------------------------------------------------- month name -------------------------------------------------------------------------------
   SELECT 
     date, 
     MONTHNAME(date)
     FROM walmart_sales;
     
     ALTER TABLE walmart_sales ADD COLUMN month_name VARCHAR(10);
     
     UPDATE walmart_sales
     SET month_name = MONTHNAME(date);