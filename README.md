# 🏏 **IPL Dashboard Analysis (2008–2019)**
> An end-to-end data analytics project covering **756 IPL matches** across **14 teams** and **12 seasons** — from raw data cleaning to an interactive **Power BI dashboard**.

**Pipeline:** Microsoft Excel (Data Cleaning) → Python (Transformation & EDA) → MySQL (Storage & Querying) → Power BI (Interactive Visualization)

**Key Statistics**
- 🏏 **756 Matches**
- 👥 **14 Teams**
- 📅 **12 Seasons (2008–2019)**

## 🎥 Dashboard Preview

<p align="center">
  <img src="IPL_PowerBI_Dashboard_Demo.gif" alt="IPL Dashboard Demo" width="900">
</p>


## 🔧 Tech Stack

| Stage | Tool / Library | Details |
|-------|----------------|---------|
| Data Cleaning | Microsoft Excel | Duplicate removal, null handling, formatting, pivot tables |
| Data Processing & EDA | Python (`pandas`, `numpy`) | Data wrangling, feature engineering, aggregations |
| Exploratory Data Analysis | `matplotlib`, `seaborn` | Distribution checks, trend exploration, correlation visuals |
| Excel I/O | `openpyxl` | Reading multi-sheet `.xlsx` files into pandas |
| Database | MySQL | Relational storage for cleaned match data |
| DB Connectivity | `sqlalchemy`, `mysql-connector-python` | Loading pandas DataFrames into MySQL tables |
| Query Layer | SQL | Aggregations, `GROUP BY` analysis, `VIEW`s for season-wise champions |
| Visualization | Power BI | Interactive report with DAX measures, slicers, cross-filtering, and drill-through |

## 🔄 Project Workflow

```
updated_matches.xlsx (Raw Dataset)
        │
        ▼
Microsoft Excel
├── Data Cleaning
├── Duplicate Removal
├── Null Handling
└── Formatting
        │
        ▼
Python (handle-ipl-dataset.ipynb)
├── Data Processing
├── Exploratory Data Analysis (EDA)
└── Feature Engineering
        │
        ▼
MySQL (ipl_db)
├── Store Cleaned Data
└── SQLAlchemy Integration
        │
        ▼
SQL (IPL-db.sql)
├── Aggregations
├── GROUP BY Analysis
├── Views
└── Business Insights
        │
        ▼
Power BI (IPL-Dashboard_Analysis.pbix)
├── DAX Measures
├── KPI Cards
├── Interactive Visualizations
├── Slicers & Cross-filtering
└── Dashboard Insights
```

## 📁 Project Structure

```
IPL-Dashboard-Analysis/
│
├── data/
│   └── updated_matches.xlsx            # Cleaned IPL dataset (matches & pivot_table sheets)
│
├── notebooks/
│   └── handle-ipl-dataset.ipynb        # Data cleaning, EDA & MySQL upload
│
├── sql/
│   └── IPL-db.sql                      # SQL queries for analysis and insights
│
├── dashboard/
│   └── IPL-Dashboard_Analysis.pbix     # Interactive Power BI dashboard
│
├── screenshots/
│   └── Snapshot_of_IPL_Dashboard.png   # Dashboard screenshot
│
├── demo/
│   └── IPL_PowerBI_Dashboard_Demo.mp4  # Dashboard walkthrough video
│
└── README.md                           # Project documentation
```

## 🧹 1. Data Cleaning (Microsoft Excel)

**Objective:** Prepare the raw IPL dataset for analysis by improving data quality and consistency.

- Eliminated duplicate match records to maintain dataset integrity.
- Standardized team names, venue names, and date formats across all seasons.
- Handled missing values in critical columns, including **Umpire**, **City**, and **Winner**.
- Structured the dataset into separate **matches** and **pivot_table** worksheets for efficient analysis.
- Applied data validation and formatting to ensure compatibility with Python, MySQL, and Power BI.

## 🐍 2. Data Processing & Exploratory Data Analysis (Python)

**Notebook:** `handle-ipl-dataset.ipynb`

**Objective:** Process the cleaned IPL dataset, perform exploratory data analysis (EDA), engineer meaningful features, and prepare the data for SQL analysis and Power BI visualization.

### Dataset Columns

`id`, `season`, `city`, `date`, `team1`, `team2`, `toss_winner`, `toss_decision`, `result`, `winner`, `win_by_runs`, `win_by_wickets`, `player_of_match`, `venue`, `umpire1`, `umpire2`

### Key Activities

- Imported the cleaned dataset (`updated_matches.xlsx`) using **pandas** with the **openpyxl** engine.
- Performed data quality assessment by identifying missing values using `df.isnull().sum()`.
- Conducted exploratory data analysis (EDA) to examine season-wise, team-wise, and venue-wise performance trends.
- Engineered new analytical features to support advanced dashboard insights:
  - `bat_first`
  - `bowl_first`
  - `bat_first_win`
  - `bowl_first_win`
  - `draw_match`
- Calculated team performance metrics, including:
  - Total Matches Played
  - Total Wins
  - Batting First Win Percentage
  - Chasing (Bowling First) Win Percentage
- Generated venue-wise statistics to compare **Bat First** and **Bowl First** winning percentages across different stadiums.
- Prepared the transformed dataset for database storage and downstream business intelligence reporting.
- Uploaded the cleaned **matches** dataset into **MySQL** using **SQLAlchemy** and **mysql-connector-python** for SQL analysis and Power BI integration.

## 🗄️ 3. Database (MySQL)

**Database:** `ipl_db`  
**Table:** `matches`

**Objective:** Store the cleaned IPL dataset in a relational database and perform SQL-based analysis to generate business insights for the Power BI dashboard.

### Database Operations

- Imported the cleaned IPL dataset into the **MySQL** database using **SQLAlchemy** and **mysql-connector-python**.
- Designed a structured relational table (`matches`) to support efficient querying and analysis.
- Wrote optimized SQL queries to extract season-wise, team-wise, player-wise, venue-wise, and match-level insights.
- Created reusable SQL **VIEWs** to simplify analytical queries and improve reporting efficiency.

### SQL Analysis Performed

- 📊 Team-wise match participation (Most Matches Played)
- 🏆 Team-wise total wins and overall win percentage
- 🌟 Top 10 **Player of the Match** award winners
- 🏟️ Stadiums hosting the highest number of IPL matches
- 🪙 Toss decision analysis and the impact of winning the toss on match outcomes
- 📅 Season-wise match counts and **Season Champions** using SQL VIEWs
- 🚀 Biggest victories by **Runs** and **Wickets**
- 🏏 Comparative win analysis for **Batting First** vs **Chasing**
- 📈 Venue-wise batting-first and bowling-first winning percentages

### SQL Concepts Used

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `COUNT()`
- `SUM()`
- `AVG()`
- `CASE`
- `ROUND()`
- `VIEW`
- Aggregate Functions

## 📊 4. Interactive Dashboard Development (Power BI)

**Dashboard File:** `IPL-Dashboard_Analysis.pbix`

**Objective:** Build a fully interactive Power BI dashboard that enables users to explore IPL match and team performance through dynamic visualizations, DAX measures, slicers, and cross-filtering.

### Dashboard Features

- Developed an end-to-end interactive dashboard where all **KPIs**, **charts**, and **visuals** dynamically respond to user selections.
- Implemented **season-wise filtering** using slicers, allowing users to analyze individual IPL seasons or the complete dataset.
- Enabled **cross-filtering and cross-highlighting**, where selecting any visual automatically updates all related charts and KPI cards.
- Created dynamic DAX measures to calculate key performance indicators and cricket-specific metrics.
- Designed responsive KPI cards that update instantly based on the selected season and filters.
- Applied conditional formatting and dynamic titles to improve dashboard readability and user experience.
- Optimized report layout using bookmarks, navigation, and intuitive visual design principles.

### Power BI Techniques Used

- **DAX Measures**
  - Total Matches
  - Total Teams
  - Total Seasons
  - Win Percentage
  - Bat First Wins
  - Bowl First Wins
  - Toss Win Percentage

- **Interactive Features**
  - Season Slicer
  - Cross-filtering
  - Cross-highlighting
  - Dynamic KPI Cards
  - Dynamic Titles
  - Conditional Formatting
  - Responsive Visual Interactions

### Dashboard Highlights

- 🏆 **Season Champion** card dynamically updates based on the selected IPL season.
- 📈 **Top KPI Cards** displaying:
  - Total Matches (**756**)
  - Total Teams (**14**)
  - Total Seasons (**12**)
- 🌟 **Most Player of the Match Awards**
  - **CH Gayle** leads with **21 awards**.
- 🏏 **Bat First vs Bowl First Analysis**
  - Teams choosing to **field first** won **55.42%** of matches.
- 🥇 **Most Successful Teams**
  - **Mumbai Indians** – **109 Wins**
  - **Chennai Super Kings** – **100 Wins**
- 📅 **Season-wise Match Trend**
  - Interactive line chart showing the growth in IPL matches from **2008–2019**.
- 🎯 **Toss Impact Analysis**
  - Toss winners went on to win **51.98%** of matches.
- 📊 Interactive visualizations allow users to analyze team performance, venue statistics, toss decisions, batting-first vs chasing success, and season-wise trends through dynamic filtering.

### Dashboard Capabilities

✔ Fully Interactive Dashboard  
✔ Dynamic DAX Measures  
✔ Cross-filtering & Cross-highlighting  
✔ Season-wise Analysis  
✔ Team-wise Performance Analysis  
✔ Venue-wise Insights  
✔ Toss Decision Analysis  
✔ Responsive KPI Cards  
✔ Business Intelligence Reporting

## 📈 Key Insights

- 🏆 **Mumbai Indians** emerged as the most successful franchise with **109 victories**, followed by **Chennai Super Kings** with **100 wins**.
- 👑 The **Season Champion** card dynamically displays the champion for the selected IPL season, enabling season-wise championship analysis.
- 🎯 Teams winning the **toss** also won the match **51.98%** of the time, indicating a slight competitive advantage.
- 🌟 **Chris Gayle (CH Gayle)** holds the record for the **most Player of the Match awards (21)**, narrowly ahead of **AB de Villiers (20)**.
- 🏏 Teams choosing to **field first** achieved a **55.42% win rate**, outperforming teams batting first (**44.58%**), suggesting a higher success rate while chasing.
- 📈 The number of IPL matches increased over the years, reflecting the tournament's growth and expansion from **2008 to 2019**.
- 🏟️ Venue-wise analysis highlights that match outcomes vary across stadiums, emphasizing the influence of playing conditions and home venues.
- 📊 Interactive filters allow users to explore season-wise, team-wise, venue-wise, and toss-based performance, enabling deeper insights into IPL trends and team strategies.
