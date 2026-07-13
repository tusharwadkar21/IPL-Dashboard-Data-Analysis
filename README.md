#🏏 IPL Dashboard Analysis (2008–2019)

An end-to-end data analytics project covering 756 IPL matches across 14 teams and 12 seasons — from raw data cleaning to an interactive Power BI dashboard.

The pipeline: Excel (cleaning) → Python (transformation & EDA) → MySQL (storage & querying) → Power BI (visualization).

Key stats at a glance: 756 matches · 14 teams · 12 seasons (2008–2019)

## 🎥 Dashboard Preview

<p align="center">
  <img src="IPL_PowerBI_Dashboard_Demo.gif" alt="IPL Dashboard Demo" width="900">
</p>


🔧 Tech Stack
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

🔄 Project Workflow
updated_matches.xlsx (Raw Dataset)
            │
            ▼
Microsoft Excel
• Data Cleaning
• Duplicate Removal
• Null Handling
• Formatting
            │
            ▼
Python (handle-ipl-dataset.ipynb)
• Data Processing
• Exploratory Data Analysis (EDA)
• Feature Engineering
            │
            ▼
MySQL (ipl_db)
• Store Cleaned Data
• SQLAlchemy Integration
            │
            ▼
SQL (IPL-db.sql)
• Aggregations
• GROUP BY Analysis
• Views
• Business Insights
            │
            ▼
Power BI (IPL-Dashboard_Analysis.pbix)
• DAX Measures
• KPI Cards
• Interactive Visualizations
• Slicers & Cross-filtering
• Dashboard Insights

📁 Project Structure
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
├── screenshot/
│   ├── Snapshot of ipl dashboard.png
│  
├── demo/
│   └── IPL_PowerBI_Dashboard_Demo.mp4  # Dashboard walkthrough video
│
└── README.md                           # Project documentation

🧹 1. Data Cleaning (Excel)
Removed duplicate match records from the raw IPL dataset
Standardized team names, dates, and venue names
Organized data into two sheets: matches (raw match-level data) and pivot_table
Checked and handled null values (umpire, city, winner fields) before export

🐍 2. Data Processing & EDA (Python)
Notebook: handle-ipl-dataset.ipynb
Key steps:
Loaded updated_matches.xlsx with pandas.read_excel (via openpyxl engine)
Checked missing values with df.isnull().sum()
Engineered features: bat_first_win, bowl_first_win, draw_match, bat_first, bowl_first
Computed team-level stats: matches played, wins, chasing win %, defending win %
Aggregated venue-level stats: bat-first vs bowl-first win percentage per stadium
Uploaded the cleaned matches sheet into MySQL using SQLAlchemy + mysql-connector-python

Dataset columns: id, season, city, date, team1, team2, toss_winner, toss_decision, result, winner, win_by_runs, win_by_wickets, player_of_match, venue, umpire1, umpire2

🗄️ 3. Database (MySQL)
Database: ipl_db | Table: matches
Queries in IPL-db.sql answer:
Which teams have played the most matches?
Which teams have won the most matches, and what's their win percentage?
Top 10 Player of the Match winners
Which stadium hosted the most matches?
Toss decision trends & toss winner vs match winner impact
Season-wise match counts and season-wise champions (via SQL VIEW)
Biggest wins by runs and by wickets
Win rates batting first vs chasing

📊 4. Visualization (Power BI)

File: IPL-Dashboard_Analysis.pbit

Developed a fully interactive Power BI dashboard where all KPIs, charts, and visuals dynamically update based on slicer selections and cross-filtering, enabling users to analyze team and match performance from multiple perspectives (season-wise, venue-wise, toss-wise).

Key Power BI techniques used:
DAX measures for KPIs (total matches, total teams, total seasons) and calculated win percentages
Slicers (season selector) driving dynamic filtering across all visuals on the page
Cross-filtering between charts — selecting a bar, slice, or point on one visual filters the rest of the dashboard
Conditional/dynamic titles — the "Champions on Selected Season" card updates based on the active slicer selection

Dashboard highlights:
Season filter — view stats for all seasons or drill into one, with the season champion shown dynamically
Top-line KPIs — total matches (756), total teams (14), total seasons (12)
Most Player of the Match winners — CH Gayle leads with 21 awards
Win % batting vs fielding first — teams won 55.42% of matches after choosing to field first
Most wins by team — Mumbai Indians (109) leads, followed by Chennai Super Kings (100)
Matches per season — trend line showing match count growth from 2008 to 2019
Toss result vs match result — toss winners went on to win 51.98% of matches

📈 Key Insights
Mumbai Indians are the most successful franchise by total wins (109), followed by Chennai Super Kings (100)
Chennai Super Kings won the most recent selected-season championship shown in the dashboard
Teams that won the toss went on to win the match 51.98% of the time — a modest but real toss advantage
CH Gayle holds the record for most Player of the Match awards (21), ahead of AB de Villiers (20)
Teams choosing to field first won 55.42% of matches, slightly more often than those batting first (44.58%)
