# Olympic Games Analysis
<h2>About Dataset:</h2>
<p>This is a historical dataset on the modern Olympic Games, including all the Games from Athens 1896 to Rio 2016. Basic bio data on athletes and medal results were collected.&nbsp;This dataset provides an opportunity to ask questions about how the Olympics have evolved over time, including questions about the participation and performance of women, different nations, and different sports and events.</p>
<p>The file athlete_events.csv contains 271116 rows and 15 columns. Each row corresponds to an individual athlete competing in an individual Olympic event (athlete-events). The columns are:</p>
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
<p>insert SQL&nbsp;</p>
<h3>2. SQL connection to Power BI</h3>
<h3>3.&nbsp;Calculations&nbsp;</h3>
<p>The following calculations were created and used in Power BI using DAX in order to conduct analysis.&nbsp;</p>
<ul>
<li>
<div># of Athletes = DISTINCTCOUNT(Olympics[ID])</div>
</li>
<li>
<div>Avg Age = AVERAGE(Olympics[Age])</div>
</li>
<li>
<div>Female Count = calculate([# of Athletes],Olympics[Gender] = "Female")</div>
</li>
<li>
<div>Male Count = calculate([# of Athletes],Olympics[Gender] = "Male")</div>
</li>
<li>
<div>Gender Disparity * =</div>
<div>IF(</div>
<div>ISBLANK([Male Count]) || [Male Count] = 0 || ISBLANK([Female Count]),</div>
<div>0,</div>
<div>DIVIDE([Female Count], [Male Count])</div>
<div>)</div>
</li>
<li>
<div>Medals Awarded =</div>
<div>
<div>VAR SelectedMedal = SELECTEDVALUE(Olympics[Medal])</div>
<div>RETURN</div>
<div>IF(</div>
<div>ISBLANK(SelectedMedal),</div>
<div>CALCULATE(</div>
<div>COUNTA(Olympics[Medal]),</div>
<div>Olympics[Medal] &lt;&gt; "No Medal"</div>
<div>),</div>
<div>CALCULATE(</div>
<div>COUNTA(Olympics[Medal]),</div>
<div>Olympics[Medal] = SelectedMedal &amp;&amp; Olympics[Medal] &lt;&gt; "No Medal"</div>
<div>)</div>
<div>)</div>
</div>
</li>
</ul>
<h3>4.&nbsp;Dashboard&nbsp;</h3>
<p>The final product provides users with filters and visuals to easily navigate through the history of the Olympics.&nbsp;</p>
<p>Click on the image to interact with the visual!&nbsp;</p>
<h2>SQL Code:</h2>
<p>The SQL code for this project can be found on&nbsp;</p>
