SELECT * FROM mental_health_survey;
 -- Gender Breakdown
SET SQL_SAFE_UPDATES = 0;
UPDATE mental_health_survey SET gender = 'Male' WHERE gender IN ('M', 'male');
UPDATE mental_health_survey SET gender = 'Female' WHERE gender IN ('F', 'Woman', 'female', 'woman');
UPDATE mental_health_survey SET gender = 'Other' WHERE gender NOT IN ('Male', 'Female',"m","f","woman");
SELECT gender, COUNT(*) AS count
FROM mental_health_survey
GROUP BY gender
ORDER BY count DESC;
-- percentage of People Who Sought Treatment by Country
SELECT country,
  COUNT(*) AS total_people,
  SUM(treatment = 'Yes') AS treated,
  ROUND(SUM(treatment = 'Yes') * 100.0 / COUNT(*), 2) AS treatment_percentage
FROM mental_health_survey
GROUP BY country
HAVING COUNT(*) >= 10  
ORDER BY treatment_percentage DESC;
-- Top 5 Countries by Percentage of Employees Receiving Mental Health Benefits
SELECT country,
  COUNT(*) AS total_people,
  SUM(benefits = 'Yes') AS with_benefits,
  ROUND(SUM(benefits = 'Yes') * 100.0 / COUNT(*), 2) AS benefits_percentage
FROM mental_health_survey
GROUP BY country
HAVING COUNT(*) >= 10
ORDER BY benefits_percentage DESC
LIMIT 5;
-- Continental Analysis of Mental Health Treatment Across Survey Respondents
SELECT COUNT(*) AS "total people",
SUM(Treatment="YES") AS "Total treatments",
ci.continent
FROM mental_health_survey mhs
JOIN countries_info ci ON mhs.country=ci.country_name
GROUP BY ci.continent;
-- Combined List of Countries with Mental Health Treatment and Benefit Responses
SELECT country, 'Sought Treatment' AS reason
FROM mental_health_survey
WHERE treatment = 'Yes'
UNION
SELECT country, 'Has Benefits' AS reason
FROM mental_health_survey
WHERE benefits = 'Yes'
ORDER BY country
        
        
        
        
       

    
    
    
