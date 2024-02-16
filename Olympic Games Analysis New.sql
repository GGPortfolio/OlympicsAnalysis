SELECT 
  ID, 
  Name AS 'Athlete Name', 
  -- Updated the column name to clarify
  CASE WHEN SEX = 'M' THEN 'MALE' ELSE 'FEMALE' END AS SEX, 
  --Updated the column data to clarify visualizations header/axis names
  Age, 
  CASE WHEN Age > 65 THEN '65+' WHEN Age BETWEEN 50 
  AND 65 THEN '50-65' WHEN Age BETWEEN 40 
  AND 49 THEN '40-49' WHEN Age BETWEEN 30 
  AND 39 THEN '30-39' WHEN Age BETWEEN 20 
  AND 29 THEN '20-29' ELSE 'Under 19' END AS 'Age Groups', 
  -- Added Age Groups for summarization
  Height AS 'Height (cm)', 
  --Added title descriptors for clarity
  Weight AS 'Weight (kg)', 
  --Added title descriptors for clarity
  NOC AS 'Team Country Code', 
  --Added title for clarity 
  --Games (removed this column)
  LEFT(Games, 4) AS 'Year', 
  --Isolated Year from the Games Column
  SUBSTRING(
    Games, 
    CHARINDEX(' ', Games) + 1, 
    LEN(Games)
  ) AS Season, 
  City AS 'Host City', 
  --renamed for clarity
  Sport, 
  Event, 
  CASE WHEN Medal = 'NA' THEN 'No Medal' ELSE Medal END AS Medal 
FROM 
  dbo.athletes_event_results  
