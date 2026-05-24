# 🇮🇳 Delhi Road Accident Hotspot & Safety Analysis

## 🎯 Project Overview

This project analyzes road accident data in Delhi to identify high-risk areas (hotspots), discern patterns related to time and environmental factors, and provide data-driven recommendations for improving public safety. It serves as a practical demonstration of a complete analysis workflow, from data modeling and SQL querying to creating an interactive Power BI dashboard for stakeholders.

**The key objectives are to answer:**
* Where are the most dangerous accident hotspots?
* When are accidents most likely to occur (hour, day, month)?
* What are the primary contributing factors (weather, road conditions, vehicle types)?

---

## 🛠️ Tools & Technologies

* **Database:** MYSQL (or any standard SQL database)
* **Data Analysis:** SQL
* **Data Visualization:** Power BI
* **Version Control:** Git & GitHub

---

## 📊 The Data

The dataset is synthetically generated to mimic real-world public data. It is structured into a clean star schema with one fact table (`accidents`) and three dimension tables.

* `accidents.csv`: The primary table containing details of each accident.
* `weather_conditions.csv`: Dimension table for weather information.
* `road_conditions.csv`: Dimension table for road type and surface conditions.
* `vehicle_types.csv`: Dimension table for the primary vehicle involved.

---

## 🔍 SQL Analysis

The core analysis was performed using SQL queries located in the `sql_analysis/` folder. Key insights derived from the SQL analysis include:

* **Peak Accident Hours:** Accidents spike during evening rush hour **(18:00 - 20:00)**.
* **Identified Hotspots:** Specific latitude/longitude coordinates show a high concentration of incidents, identifying them as "blackspots".
* **Factor Correlation:** A high percentage of accidents in rainy conditions involve two-wheelers, indicating a specific risk group.

---

## 📈 Power BI Dashboard

An interactive dashboard was built in Power BI to visualize the findings from the SQL analysis and allow for dynamic exploration of the data.

**Key Features:**
* **KPIs:** High-level metrics like Total Accidents and Total Fatalities.
* **Hotspot Map:** A geospatial map showing accident clusters.
* **Trend Charts:** Line charts showing accident trends over time.
* **Breakdown Analysis:** Donut charts filtering data by weather, light conditions, and vehicle types.



---

## 🚀 How to Use This Project

1.  **Set up Database:** Use the `sql_analysis/1_schema_creation.sql` script to create tables in your SQL database.
2.  **Load Data:** Import the `.csv` files from the `/data` folder into your database.
3.  **Run Analysis:** Execute the queries in `sql_analysis/2_analysis_queries.sql` to see the analysis.
4.  **Visualize:** Follow the guide in the `power_bi_guide/` folder to build the dashboard yourself.


