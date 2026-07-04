# Netflix Content Analysis

## Overview
This project analyzes Netflix's content library using R and the tidyverse to uncover trends in content type, country of origin, ratings distribution, and growth over time. The analysis combines data wrangling, visualization, descriptive statistics, and linear regression to deliver actionable insights for content strategy decisions.

## Dataset
- **Source:** [Netflix Movies and TV Shows — Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)
- **Coverage:** 8,807 Netflix titles including movies and TV shows
- **Tool:** R (tidyverse, ggplot2) · Posit Cloud

## Skills Demonstrated
- Data loading and cleaning with readr and dplyr
- Data manipulation using the pipe operator `%>%`
- GroupBy aggregations with `group_by()` and `summarise()`
- Data visualization with ggplot2 (bar charts, line charts, regression plots)
- Descriptive statistics with `summary()`, `sd()`, `prop.table()`
- Linear regression with `lm()` and `geom_smooth()`

## Analysis Summary

### Section 1 — Content Overview
Netflix's catalog consists of 69.6% Movies and 30.4% TV Shows. This significant gap suggests Netflix should invest more in original TV series to increase variety and improve subscriber retention through episodic content.

### Section 2 — Content Growth Over Time
Netflix content grew rapidly from 2010 through 2017-2018, peaking at nearly 800 movie titles in a single year. A post-2019 decline in volume suggests a strategic shift toward quality over quantity, which aligns with Netflix's push for high-profile original productions.

### Section 3 — Top Countries by Content
The United States dominates Netflix's catalog by a wide margin, followed by India and the United Kingdom. Netflix should increase investment in Indian content given the size of that market, and expand Korean and Japanese content to capitalize on the global popularity of K-dramas and anime among younger audiences.

### Section 4 — Ratings Distribution
TV-MA content leads all ratings at 36.4%, confirming Netflix primarily targets adult audiences. With TV-14 content at 24.5%, there is an opportunity to develop more age-appropriate content for teenagers while also expanding family-friendly offerings for adult subscribers with children.

### Section 5 — Descriptive Statistics
Over 60% of Netflix content is rated TV-MA or R, with children and family content representing less than 10% of the catalog. The median release year is 2017, reflecting the platform's rapid content expansion in the mid-2010s.

### Section 6 — Regression Analysis
A linear regression of content volume by release year (R-squared = 0.36) confirms a statistically significant upward trend in Netflix content from 2010 onward, with approximately 7 new titles added per year on average. The post-2019 dip suggests Netflix is now prioritizing fewer, higher-quality productions over volume — a sustainable long-term strategy.

## Files
- `netflix_analysis.R` — Full R script with all analysis and visualizations

