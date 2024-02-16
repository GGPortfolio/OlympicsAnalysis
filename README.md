# Olympic Games Analysis
<h2>About Dataset:</h2>
<p>This is a historical dataset on the modern Olympic Games, including all the Games from Athens 1896 to Rio 2016. Basic bio data on athletes and medal results were collected.&nbsp;This dataset provides an opportunity to ask questions about how the Olympics have evolved over time, including questions about the participation and performance of women, different nations, and different sports and events.</p>
<p>The file contains 271116 rows and 15 columns. Each row corresponds to an individual athlete competing in an individual Olympic event (athlete-events). The columns are:</p>
<ol>
<li><strong>ID</strong>&nbsp;- Unique number for each athlete</li>
<li><strong>Name</strong>&nbsp;- Athlete's name</li>
<li><strong>Sex</strong>&nbsp;- M or F</li>
<li><strong>Age</strong>&nbsp;- Integer</li>
<li><strong>Height</strong>&nbsp;- In centimeters</li>
<li><strong>Weight</strong>&nbsp;- In kilograms</li>
<li><strong>Team</strong>&nbsp;- Team name</li>
<li><strong>NOC</strong>&nbsp;- National Olympic Committee 3-letter code</li>
<li><strong>Games</strong>&nbsp;- Year and season</li>
<li><strong>Year</strong>&nbsp;- Integer</li>
<li><strong>Season</strong>&nbsp;- Summer or Winter</li>
<li><strong>City</strong>&nbsp;- Host city</li>
<li><strong>Sport</strong>&nbsp;- Sport</li>
<li><strong>Event</strong>&nbsp;- Event</li>
<li><strong>Medal</strong>&nbsp;- Gold, Silver, Bronze, or NA</li>
</ol>
<p><em>Source: <a href="https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results">120 years of Olympic history</a></em></p>
<h2 data-selectable-paragraph="">Purpose:</h2>
<p>I've delved into the extensive historical dataset of the modern Olympic Games, aiming to unveil broader trends, patterns, and insights that go beyond individual countries or teams. My objective was to grasp a deep understanding of how the Olympics have evolved over time and across various sports and events. By taking a holistic approach to the dataset, I sought to pinpoint overarching trends and key factors that have shaped the Olympics' trajectory, including changes in athlete participation and the distribution of medals.</p>
<h2 data-selectable-paragraph="">Approach Used:</h2>
<h3>1. Data Wrangling</h3>
Prior to integrating my SQL database with Power BI for analysis, I recognized the importance of ensuring data quality. Employing various data wrangling and cleaning techniques, I meticulously refined the dataset to enhance its suitability for analysis. This process involved clarifying ambiguous entries, summarizing key information, and strategically removing irrelevant or redundant columns. By proactively addressing data quality concerns, I laid a solid foundation for accurate and insightful analysis within Power BI

```SQL
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
```



<h3>2. SQL connection to Power BI</h3>

![PowerBI Table](https://github.com/GGPortfolio/OlympicsAnalysis/assets/159342547/93ad5e4a-0642-4d87-aa5c-349950f76adc)

![Transform Olympic Data](https://github.com/GGPortfolio/OlympicsAnalysis/assets/159342547/d7745bc5-b015-46d6-bbe0-60fd309c1e09)

<h3>3.&nbsp;Calculations&nbsp;</h3>
<p>The following calculations were created and used in Power BI using DAX in order to conduct analysis.&nbsp;</p>
<ul>
  
  ``` 
# of Athletes = DISTINCTCOUNT(Olympics[ID])
  ```
```
Avg Age = AVERAGE(Olympics[Age])
```
```
Female Count = calculate([# of Athletes],Olympics[Gender] = "Female")
```
```
Male Count = calculate([# of Athletes],Olympics[Gender] = "Male")
```
```
Gender Disparity * = 
IF(
    ISBLANK([Male Count]) || [Male Count] = 0 || ISBLANK([Female Count]),
    0,
    DIVIDE([Female Count], [Male Count])
)
```
```
Medals Awarded = 
VAR SelectedMedal = SELECTEDVALUE(Olympics[Medal])
RETURN
IF(
    ISBLANK(SelectedMedal),
    CALCULATE(
        COUNTA(Olympics[Medal]),
        Olympics[Medal] <> "No Medal"
    ),
    CALCULATE(
        COUNTA(Olympics[Medal]),
        Olympics[Medal] = SelectedMedal && Olympics[Medal] <> "No Medal"
    )
)
```

<h3>4.&nbsp;Dashboard&nbsp;</h3>
<p>The final product provides users with filters and visuals to easily navigate through the history of the Olympics.&nbsp;</p>
<p>Click on the image to interact with the visual!&nbsp;</p>

[![Olympics Power BI](https://github.com/GGPortfolio/OlympicsAnalysis/assets/159342547/f12de0fa-369e-49e1-9771-22bc68248349)](https://app.powerbi.com/view?r=eyJrIjoiN2Y2ZjMyYWMtYzU3ZC00YWI3LWFlM2ItYjczOGU0ZmYwODNmIiwidCI6Ijk5YjY0NTFkLTRmY2QtNDE1Zi1iNGJlLWQ5N2ZhZGJjZGI5ZiJ9)

