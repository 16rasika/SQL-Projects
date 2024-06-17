-- QUESTIONS ----------------------------
SELECT * FROM HR;

------ Q:1. What is the gender breakdown of employees in company?
SELECT gender,count(*) As count
FROM HR
WHERE termdate IS NULL
GROUP BY gender;

-------Q.2. What is the race breakdown of employee in the company
SELECT race ,COUNT(*) AS Count
FROM HR
WHERE termdate IS NULL
GROUP BY race;

--------Q.3-What is the age distribution of employees in the comppany?
SELECT 
   CASE
      WHEN AGE >= 18 AND age <= 24 THEN '18-24'
      WHEN AGE >= 25 AND age <= 34 THEN '25-34'
      WHEN AGE >= 35 AND age <= 44 THEN '35-44'
      WHEN AGE >= 45 AND age <= 54 THEN '45-54'
      WHEN AGE >= 55 AND age <= 64 THEN '55-64'
      ELSE '65+'
END AS age_group,
COUNT(*) AS Count
FROM HR
WHERE termdate IS NULL
GROUP BY age_group
ORDER BY age_group;

---- Q,4. How many employees work at HQ vs remote?

SELECT location,COUNT(*) AS count
FROM HR
WHERE termdate IS NULL
GROUP BY location;

----- Q.5. What is average lenght of the employment who ahve been terminated?

SELECT ROUND(AVG(year(termdate)-year(hire_date)),0) AS lenght_of_emp
FROM HR
WHERE termdate IS NOT NULL AND termdate <= curdate();
      
------Q.6. How does the gender distribution vary across dept.and job titles
SELECT * FROM HR;     

SELECT department,jobtitile,gender,COUNT(*) AS COUNT
FROm HR
WHERE termdate IS NULL
GROUP BY department,jobtitle,gender
ORDER BY department,jobtitle,gender;

---- Q.7.What is the distribution of jobtile across the company?
SELECT jobtitle,COUNT(*)AS Count
FROM HR
WHERE termdate is NULL
GROUP BY jobtitle;

---- Q.8 Which deparment has the higher turnover/termination rate?

SELECT department,
       COUNT(*) AS total_count,
       COUNT(CASE
                 WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1
                 END) AS terminated_count,
       ROUND((COUNT( CASE
                  WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1
                  END)/COUNT(*))*100,2) AS termination_rate
FROM HR
GROUP BY department
ORDER BY termination_rate DESC;

----- Q.9 What is the distribution of employees across location state & location city
SELECT location_state,COUNT(*) AS Count
FROM HR
WHERE termdate IS NULL
GROUP BY location_state;


SELECT location_city,COUNT(*) AS Count
FROM HR
WHERE termdate IS NULL
GROUP BY location_city;

------ Q.10 .How has company's employee count changed over time based on hire and termination date?----

SELECT year,
	   hires,
       terminations,
       hires-terminations AS net_change,
      (terminations/hires)*100 AS change_percent
	FROM(
			SELECT YEAR(hire_date) AS year,
            COUNT(*) AS hires,
            SUM(CASE
					WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1
				END) AS terminations
			FROM HR
            GROUP BY YEAR(hire_date)) AS subquery
GROUP BY year
ORDER BY year;

------ Q.11. What is the tenture distribution for each department?----

SELECT department, ROUND(avg(datediff(termdate,hire_date)/365),0) AS avg_tenure
FROM HR
WHERE termdate IS NOT NULL AND termdate<= curdate()
GROUP BY department;
            