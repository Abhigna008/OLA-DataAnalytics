# Urban Mobility Analytics Dashboard (SQL & Power BI)

## 📌 Project Overview
A comprehensive end-to-end data analysis project focusing on OLA ride-booking data for July 2024. This project transitions from raw data handling in **PostgreSQL** to interactive storytelling in **Power BI**, extracting key insights on operational efficiency, revenue, and customer behavior.

---

## 🛠️ Tech Stack
* **Database:** PostgreSQL (SQL)
* **Visualization:** Power BI Desktop
* **Data Source:** OLA Booking Dataset

---

## ⚙️ Project Workflow

### 1. Data Processing & SQL Analysis
The raw data was first imported into PostgreSQL, where I performed data cleaning and modular analysis to ensure a "Single Source of Truth."

* **Data Scrubbing:** Cleansed the dataset by converting text-based 'null' strings into actual Database NULLs and casting columns into appropriate formats (Dates, Times, Numerics).
* **Modular Reporting (SQL Views):** Instead of simple queries, I created **10 specialized SQL Views**. This approach allows for dynamic reporting and reusable data logic. Key views include:
    * **Success Metrics:** Isolated successful bookings to calculate total realized revenue.
    * **Cancellation Deep-Dive:** Segmented cancellations by Driver vs. Customer to identify friction points.
    * **Customer Profiling:** Identified the Top 5 high-value customers based on booking frequency.
    * **Performance Benchmarking:** Calculated average ratings and ride distances across different vehicle segments (Prime, Mini, Bike, etc.).

### 2. Power BI Dashboard Development
I designed a multi-page interactive dashboard focused on user experience (UX) and quick decision-making.

* **Overall Dashboard:** High-level executive summary showing Total Bookings (20K+), Revenue (7M), and daily volume trends.
* **Vehicle Performance:** A specialized view comparing booking values and average distances across all vehicle types using custom icons.
* **Revenue Analysis:** A breakdown of cash vs. digital payments (UPI, Credit Cards) and a customer leaderboard.
* **Cancellation Analytics:** Detailed pie charts visualizing the *why* behind 5,735 cancelled rides, split by driver and customer reasons.
* **Rating Analysis:** Comparative view of Driver vs. Customer ratings to monitor service quality across the fleet.

---

## 📊 Key Insights
* **Success Rate:** 62% of all bookings were completed successfully.
* **Preferred Payments:** Cash remains the leader, but UPI shows significant adoption as the primary digital method.
* **Operational Pain Point:** The "Driver not moving towards pickup" reason accounts for a large portion of customer cancellations, suggesting a need for better real-time tracking or driver engagement.
* **Consistency:** Average ratings remain stable at ~4.0 across all vehicle categories, showing uniform service standards.

---

## 📂 How to Access
* **SQL Folder:** Contains the `.sql` script with table schemas and view creations.
* **Power BI File:** Open `Urban_Mobility_Analytics.pbix` to view the interactive dashboard.
* **Screenshots:** Refer to the `/Dashboard_Screenshots` folder for a quick preview of the dashboard views.
