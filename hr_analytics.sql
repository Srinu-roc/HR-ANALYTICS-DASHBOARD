 1. Total Number of Employees */
SELECT COUNT(*) AS total_employees
FROM hr_data;


/* 2. Active Employees */
SELECT COUNT(*) AS active_employees
FROM hr_data
WHERE attrition = 'No';


/* 3. Attrition Count */
SELECT COUNT(*) AS attrition_count
FROM hr_data
WHERE attrition = 'Yes';


/* 4. Attrition Rate (%) */
SELECT 
ROUND(
    (SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) 
    / COUNT(*), 2
) AS attrition_rate_percentage
FROM hr_data;


/* 5. Department-wise Attrition */
SELECT department,
COUNT(*) AS attrition_count
FROM hr_data
WHERE attrition = 'Yes'
GROUP BY department
ORDER BY attrition_count DESC;


/* 6. Education Field-wise Attrition */
SELECT education_field,
COUNT(*) AS attrition_count
FROM hr_data
WHERE attrition = 'Yes'
GROUP BY education_field
ORDER BY attrition_count DESC;


/* 7. Age Group-wise Attrition */
SELECT 
CASE
    WHEN age < 25 THEN 'Under 25'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
    ELSE 'Over 55'
END AS age_group,
COUNT(*) AS attrition_count
FROM hr_data
WHERE attrition = 'Yes'
GROUP BY age_group
ORDER BY age_group;


/* 8. Gender-wise Attrition */
SELECT gender,
COUNT(*) AS attrition_count
FROM hr_data
WHERE attrition = 'Yes'
GROUP BY gender;


/* 9. Job Role-wise Attrition */
SELECT job_role,
COUNT(*) AS attrition_count
FROM hr_data
WHERE attrition = 'Yes'
GROUP BY job_role
ORDER BY attrition_count DESC;


/* 10. Average Age of Employees */
SELECT ROUND(AVG(age), 0) AS average_age
FROM hr_data;


/* 11. Job Satisfaction by Job Role */
SELECT job_role,
ROUND(AVG(job_satisfaction), 2) AS avg_job_satisfaction
FROM hr_data
GROUP BY job_role
ORDER BY avg_job_satisfaction DESC;


/* 12. Attrition by Marital Status */
SELECT marital_status,
COUNT(*) AS attrition_count
FROM hr_data
WHERE attrition = 'Yes'
GROUP BY marital_status;


/* 13. Attrition by Business Travel */
SELECT business_travel,
COUNT(*) AS attrition_count
FROM hr_data
WHERE attrition = 'Yes'
GROUP BY business_travel;
