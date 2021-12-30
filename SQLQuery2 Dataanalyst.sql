


--The dataset was gotten from kaggle which shows the dataanalyst jobs, salary, and company name  posted by glassdoor 

--We will explore this datasets by:
-- Clean the datasets
-- Analyze 
-- Visualize


-- We will concentrate on getting:
--Job title,Salary,Description,Rating,Company name,industry,sector 

--Now Let start by Return everything from our table

SELECT * FROM dbo.dataanalyst;

--Next step is Data cleaning, we will drop some column that we do not need from the table

ALTER TABLE dbo.dataanalyst
DROP COLUMN revenue,competitors,easy_apply,size,headquarters;

SELECT job_title,salary_estimate,rating
FROM dbo.dataanalyst
WHERE job_title IS NULL

---Looking at Job Title
SELECT job_title FROM dbo.dataanalyst

---Total number of Job_title - All count
SELECT COUNT(job_title) FROM dbo.dataanalyst

--To know the number of times each job title was mentioned from highest to lowest

SELECT (job_title), COUNT(Job_title) AS No_of_time 
FROM dbo.DataAnalyst
GROUP BY job_title 
ORDER BY  No_of_time DESC



---Salary_Estimate is the next we will analyze

SELECT Salary_estimate FROM dbo.DataAnalyst

---Let check if we have any missing values, it returns empty values

SELECT salary_estimate,rating, Job_Title FROM dbo.DataAnalyst
WHERE Salary_estimate IS NULL

---We have some strings that we do not need here so we will have to remove it i.e. $, k, and  Glassdoor
UPDATE dbo.DataAnalyst
SET salary_estimate = REPLACE(salary_estimate,'$', '') 

UPDATE dbo.DataAnalyst
SET salary_estimate = REPLACE(salary_estimate,'K', '') 

UPDATE dbo.DataAnalyst
SET salary_estimate = REPLACE(salary_estimate,'(glassdoor est.)', '') 

---finding of salary range
SELECT Salary_estimate, count(salary_estimate) AS no_of_time FROM dbo.DataAnalyst 
group by Salary_estimate
ORDER BY salary_estimate DESC




---Job description
SELECT [Job Description] FROM dbo.dataanalyst;

---None of the jobs have same job description 
SELECT COUNT(DISTINCT [Job Description]) FROM dbo.dataanalyst
SELECT COUNT(DISTINCT [Job Description]) FROM dbo.dataanalyst  
SELECT * FROM dbo.DataAnalyst

---Let us check how many times these tools are part of the requirement
SELECT Count ([Job Description]) AS Excel_required FROM dbo.DataAnalyst
WHERE [Job Description] like '%excel%';

SELECT Count([Job Description])AS Googlesheets_required FROM dbo.DataAnalyst
WHERE [Job Description] like '%GOOGLE SHEETS%';

SELECT Count([Job Description]) AS Python_required FROM dbo.DataAnalyst
WHERE [Job Description] like '%python%'

SELECT Count([Job Description]) AS SQL_required FROM dbo.DataAnalyst
WHERE [Job Description] like '%SQL%';

SELECT Count([Job Description])AS Tableau_required FROM dbo.DataAnalyst
WHERE [Job Description] like '%TABLEAU%';

SELECT Count([Job Description]) AS PowerBI_required FROM dbo.DataAnalyst
WHERE [Job Description] like '%POWERBI%';


SELECT  Count([Job Description]) AS Excel_required FROM dbo.DataAnalyst
WHERE [Job Description] like '%excel%'
GROUP BY Sector

SELECT job_title, Count([Job Description]) AS Excel_required FROM dbo.DataAnalyst
WHERE [Job Description] like '%excel%'
GROUP BY Job_Title
ORDER BY  excel_required desc

--We want to check the number of times each job_description require all of the jobs listed 'excel','sql','python' and tableau

SELECT job_title, Count([Job Description]) Alltheskills FROM dbo.DataAnalyst
WHERE [Job Description] like '%Python%' and  [Job Description] LIKE '%excel%' AND [Job Description] LIKE '%Tableau%' AND 
[Job Description] LIKE '%SQL%'
GROUP BY Job_Title
ORDER BY  Alltheskills desc

--We want to check the number of times each job_description require any of the job listed 'excel','sql','python' and tableau

SELECT job_title, Count([Job Description]) AS Anyoftheskill FROM dbo.DataAnalyst
WHERE [Job Description] LIKE '%Python%' OR  [Job Description] LIKE '%excel%' OR [Job Description] LIKE '%Tableau%' AND 
[Job Description] LIKE '%SQL%'
GROUP BY Job_Title
ORDER BY  Anyoftheskill desc



---Now to Rating


SELECT rating FROM dbo.DataAnalyst

--We can also check how many time each rating appears from table

SELECT rating, COUNT(rating) AS Nooftimeforeachrating FROM dbo.DataAnalyst
GROUP BY Rating
ORDER BY Rating DESC
--We want to check the job_title, job description with a rating of -1
SELECT rating, job_title, [Job Description] FROM dbo.DataAnalyst
WHERE Rating = -1



---Now to Company Name

SELECT Company_name FROM dbo.DataAnalyst

---Now to sector
SELECT sector, COUNT(sector)AS No_of_job_bysectors FROM dbo.DataAnalyst
GROUP BY sector
ORDER BY No_of_job_bysectors DESC


SELECT  Count([Job Description]) AS Excel_required FROM dbo.DataAnalyst
WHERE [Job Description] like '%excel%'
GROUP BY Sector

SELECT job_title, Count([Job Description]) AS Excel_required FROM dbo.DataAnalyst
WHERE [Job Description] like '%excel%'
GROUP BY Job_Title
ORDER BY  excel_required desc

--We want to check the number of times each job_description require all of the jobs listed 'excel','sql','python' and tableau

SELECT job_title, Count([Job Description]) Alltheskills FROM dbo.DataAnalyst
WHERE [Job Description] like '%Python%' and  [Job Description] LIKE '%excel%' AND [Job Description] LIKE '%Tableau%' AND 
[Job Description] LIKE '%SQL%'
GROUP BY Job_Title
ORDER BY  Alltheskills desc

--We want to check the number of times each job_description require any of the job listed 'excel','sql','python' and tableau

SELECT job_title, Count([Job Description]) AS Anyoftheskill FROM dbo.DataAnalyst
WHERE [Job Description] LIKE '%Python%' OR  [Job Description] LIKE '%excel%' OR [Job Description] LIKE '%Tableau%' AND 
[Job Description] LIKE '%SQL%'
GROUP BY Job_Title
ORDER BY  Anyoftheskill desc