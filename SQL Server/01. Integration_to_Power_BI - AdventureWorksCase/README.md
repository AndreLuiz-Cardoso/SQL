# 🧩 Sales & Customer Analysis View – SQL Server + Power BI

This project demonstrates the creation of a **SQL Server view** to support a Power BI dashboard based on the **AdventureWorks 2014** dataset. The main objective was to centralize business logic and data transformation within SQL, reducing complexity on the Power BI side and improving overall efficiency.

---

## 📌 Objective

The view `RESULTADOS_ADW` was created to join and transform relevant data from multiple tables in order to provide a ready-to-analyze dataset for Power BI. It focuses on key sales and customer indicators between the years **2010 and 2014**.

---

## 🔎 Explanation

### 🧩 Tables used:
- `FactInternetSales`: Sales facts including revenue, quantity, and cost  
- `DimProductCategory`: Product category name (used as filter)  
- `DimCustomer`: Customer info (name and gender)  
- `DimGeography`: Geographic data (country)  
- `DimProduct` + `DimProductSubcategory`: Used to bridge products and categories

### ⚙️ Transformations done:
- Combined `FirstName + LastName` as `CLIENT NAME`
- Translated `Gender` values from `"M"` / `"F"` to `"Male"` / `"Female"` using nested `REPLACE`
- Calculated `SALES PROFIT` directly in the view for better reuse
- Renamed columns to English-friendly business names, ready for visual tools like Power BI

---

## 🚀 Why use a SQL View?

### ✅ Centralized Logic
Having all business logic in SQL ensures consistency across reports and makes maintenance easier.

### ✅ Improved Performance
Pre-processing calculations like profit in SQL reduces Power BI engine workload, especially for DirectQuery scenarios.

### ✅ Reusability
The view can be used by other analysts, reports, or tools — not just Power BI.

---

## 🔁 Could this be done differently?

Yes — there are multiple ways to model and transform data for a Power BI dashboard. Below are some alternative approaches and their trade-offs:

| **Approach**                         | **Pros**                                                                                          | **Cons**                                                                                   |
|--------------------------------------|----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| ✅ **SQL View (current approach)**    | - Centralizes logic near the data source  <br> - Reusable across tools  <br> - Efficient for large datasets | - Less flexible if users want to customize visuals independently                          |
| 🧠 **DAX calculations in Power BI**   | - Easy to build directly in Power BI  <br> - Good for ad-hoc analysis                              | - Harder to reuse logic outside Power BI  <br> - Can slow down performance                |
| 🧩 **Power Query (M language)**       | - Visual interface, user-friendly  <br> - Allows combining many sources                            | - May impact performance with large datasets  <br> - Logic stays inside one `.pbix` file  |
| ⚙️ **Stored Procedures in SQL Server**| - More control (can use variables, loops, etc.)  <br> - Good for advanced automation                | - Not natively supported in DirectQuery mode  <br> - More complex to maintain             |
| 📦 **Materialized Tables or Views**   | - Optimized for read-heavy dashboards  <br> - Improves performance                                 | - Requires scheduled refresh or ETL process  <br> - Adds storage usage                    |

---

## 📊 View the Dashboard

Curious to explore the final result?

📄 [Click here to view the full dashboard (PDF)](https://drive.google.com/file/d/1s3gOR1R01uNXo46_C5v6J9vY6aKqdLkZ/view?usp=sharing)


