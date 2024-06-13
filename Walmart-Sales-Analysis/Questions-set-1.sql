----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- General questions ------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
----------- -- Q.1.How many unique cities does the data have?  ----------------------------------------------------------

SELECT 
DISTINCT city
FROM walmart_sales;
------------------------- - Q.2. In which city is each branch? -------------------------------------------------
SELECT
DISTINCT city,
 branch
 FROM walmart_sales;
 ----------------------------------------------------------------------------------------------------
 --------------------------------- Product line----------------------------------------------------
 ---------------------------------------------------------------------------------------------------
 --------------------------- Q. 1.How many unique product lines does the data have? -------------------
 SELECT 
   COUNT(DISTINCT product_line)
    FROM walmart_sales;
------------------------------ Q.2. What is the most common payment method? -------------
SELECT 
   payment_method,
   COUNT(payment_method) AS cnt
 FROM walmart_sales
 GROUP BY payment_method
 ORDER BY CNT DESC;
 ------------------------ Q:3.What is the most selling product line?--------------------------
 SELECT 
  product_line,
   COUNT(product_line) AS cnt
 FROM walmart_sales
 GROUP BY product_line
 ORDER BY CNT DESC;
 ------------------------ Q.4. What is the total revenue by month?------------------------------
 SELECT 
   month_name as month,
   SUM(total) as total_revenue
   FROM walmart_sales
   GROUP BY month_name
   ORDER BY total_revenue DESC;
   -------------------------- Q.5.What month had the largest COGS?--------------------------------
SELECT 
      month_name AS month,
      SUM(cogs) AS cogs
 FROM walmart_sales
 GROUP BY month_name
 ORDER BY cogs DESC;
 --------------------------- Q.6.What product line had the largest revenue? -----------------------
 SELECT 
    product_line,
    SUM(total) AS total_revenue
FROM walmart_sales 
GROUP BY product_line
ORDER BY total_revenue DESC;
----------------------------Q.7.What is the city with the largest revenue?---------------------
SELECT 
     branch,
     city,
     SUM(total) AS total_revenue
FROM walmart_sales
GROUP BY city,branch
ORDER BY total_revenue DESC;     
---------------------------- Q.8.What product line had the largest VAT?-----------------------
SELECT 
    product_line,
    AVG(VAT) AS avg_tax
    FROM walmart_sales
    GROUP BY product_line
    ORDER BY avg_tax DESC;
------------------------- Q.9. What is the average rating of each product line? ------------------------------
SELECT 
    AVG(rating) AS avg_rating,
    product_line
 FROM walmart_sales
 GROUP BY product_line
 ORDER BY avg_rating DESC;

------------------------- Q.10. Which branch sold more products than average product sold? ----------------------
SELECT
    branch,
    SUM(quantity) AS qty
    FROM walmart_sales
    GROUP BY branch
    HAVING SUM(quantity) > (sELECT AVG(quantity) FROM walmart_sales);
---------------------------Q.11. What is the most common product line by gender? ------------------  -
SELECT 
     gender,product_line,
     COUNT(gender) AS total_cnt
FROM walmart_sales
GROUP BY gender,product_line
ORDER BY total_cnt DESC;
------------------------------------------------------------------------------------------------------
-------------------------------------- Customers ----------------------------------------------------
------------------------------------------------------------------------------------------------------
----------------------- Q.1. How many unique customer types does the data have? --------------------
SELECT
  DISTINCT customer_type
FROM walmart_sales;
------------------------- Q.2. How many unique payment methods does the data have?------------------
SELECT 
  DISTINCT payment_method
FROM walmart_sales; 
------------------------Q.3 What is the common customer? ------------------------
SELECT 
    customer_type,
    COUNT(*) as cnt
FROM walmart_sales
GROUP BY customer_type
ORDER BY cnt DESC; 
----------------------- Q.4. Which customer type buys the most?----------------------------
SELECT 
     customer_type,
     COUNT(*)
FROM walmart_sales
GROUP BY customer_type;
---------------------  Q.5.What is the gender of most of te customers? --------------------
SELECT
   gender,
   COUNT(*) as gender_cnt
FROM walmart_sales
GROUP BY gender
ORDER BY gender_cnt DESC; 
-------------------- Q.6. What is the gender distribution per branch? -------------------------
SELECT 
    gender,
    COUNT(*) AS gender_cnt
FROM walmart_sales
WHERE branch = 'C'
GROUP BY gender
ORDER BY gender_cnt DESC;
---------------------------- Q.7.Which time of the day do customers give most ratings?
SELECT
   time_of_day,
   AVG(rating) AS avg_rating
FROM walmart_sales
GROUP BY time_of_day
ORDER BY avg_rating ;  
-------------------------- Q.8. Which time of day do customer give most rating per branch?----------
SELECT
   time_of_day,
   AVG(rating) AS avg_rating
FROM walmart_sales
WHERE branch ='A'
GROUP BY time_of_day
ORDER BY avg_rating DESC; 
---------------------------- Q.9.Which day of the week has the best avg ratings?----------------
SELECT
    day_name,
    AVG(rating) AS avg_rating
FROm walmart_sales
GROUP BY day_name
ORDER BY avg_rating DESC;    
---------------------------- Q.10.Which day of the week has the best average ratings per branch?--------------
SELECT
    day_name,
    COUNT(day_name) AS total_sales
FROM walmart_sales
WHERE branch = 'C'
GROUP BY day_name
ORDER BY total_sales DESC;
------------------------------------------------------------------------------------------------------
----------------------------- Sales ---------------------------------------------------
---------------------------------------------------------------------------------------------------
-----------------------Q.1. Number of sales made in each time of the day per weekday
SELECT
  time_of_day,
  COUNT(*) AS total_sales
FROM walmart_sales
WHERE day_name ='Sunday'
GROUP BY time_of_day
ORDER BY total_sales DESC;  
-------------------------Q.2.Which of the customer types brings the most revenue?--------------
SELECT
    customer_type,
    SUM(total) AS total_revenue
FROM walmart_sales
GROUP BY customer_type
ORDER BY total_revenue;    
------------------------ Q.3. Which city has the largest tax/VAT percent?-------------
SELECT 
	city,
    ROUND(AVG(VAT),2) AS avg_VAT
FROM walmart_sales
GROUP BY city
ORDER BY avg_VAT DESC;    
-------------------- Q.4.Which customer type pays the most in VAT?---------------
SELECT 
   customer_type,
   AVG (VAT) AS total_VAT
FROM walmart_sales
GROUP BY customer_type
ORDER BY total_VAT;   
    
    
     