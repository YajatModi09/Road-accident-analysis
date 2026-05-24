# Guide: Building the Accident Analysis Dashboard in Power BI

This guide will walk you through creating the interactive dashboard using Power BI Desktop.

### Step 1: Get Data
1.  Open a blank Power BI report.
2.  On the **Home** ribbon, click **Get Data** > **Text/CSV**.
3.  Load `accidents.csv`.
4.  Repeat this process for `weather_conditions.csv`, `road_conditions.csv`, and `vehicle_types.csv`.

### Step 2: Model Your Data
1.  Go to the **Model View** on the left.
2.  Power BI should automatically create the relationships. Verify they are correct:
    * `weather_conditions[weather_id]` is linked to `accidents[weather_id]`.
    * `road_conditions[road_id]` is linked to `accidents[road_id]`.
    * `vehicle_types[vehicle_id]` is linked to `accidents[vehicle_id]`.
    * All relationships should be "many-to-one" (`*..1`), pointing towards the dimension tables.

### Step 3: Build the Visuals
Go to the **Report View** and add the following visuals from the **Visualizations** pane.

#### 1. KPIs (Key Performance Indicators)
* **Visual:** Card
* **Total Accidents:** Drag `accident_id` to the *Fields* well and set its aggregation to **Count**.
* **Total Fatalities:** Add another Card. Drag `fatalities` to the *Fields* well (it will default to Sum).

#### 2. Accident Hotspot Map
* **Visual:** Map
* **Latitude:** Drag `latitude` from the `accidents` table.
* **Longitude:** Drag `longitude` from the `accidents` table.
* **Bubble size:** Drag `accident_id` here and set its aggregation to **Count**. This makes hotspots appear as larger bubbles.

#### 3. Trend Chart (Accidents by Month)
* **Visual:** Line chart
* **X-axis:** Drag `accident_date` here.
* **Y-axis:** Drag `accident_id` here and set its aggregation to **Count**.

#### 4. Factor Breakdown (Donut Charts)
Create three separate Donut charts. For each one, drag `accident_id` (set to Count) to the *Values* well.
* **By Weather:** Drag `weather_condition` to the *Legend*.
* **By Light Condition:** Drag `light_condition` to the *Legend*.
* **By Road Type:** Drag `road_type` to the *Legend*.

### Step 4: Add Interactivity & Save
* **Slicer:** Add a **Slicer** visual. Drag `accident_date` to its field to allow users to filter by date range.
* **Test:** Click on any element (e.g., the "Rainy" part of the weather chart) and watch the entire report filter instantly.
* **Save:** Save your Power BI file as `Delhi_Accident_Analysis.pbix` in the root folder of your project (`delhi_accident_analysis/`). The `.gitignore` file will prevent it from being uploaded to GitHub.