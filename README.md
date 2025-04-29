# TASK-6-Sales-Trend-Analysis-Using-Aggregations

Certainly! Here's a concise **README.md** explaining what you did with your SQL query and dataset:

---

# Sales Trend Analysis - README

## Objective
Analyze monthly sales revenue and order volume trends using the `cleaned_superstore` dataset.

## Dataset Overview
- The dataset contains sales transactions with columns including:
  - `Order ID`
  - `Order Date`
  - `Sales`
  - `Order Year`
  - `Order Month`
- Some rows have missing `Order Date` values.

## Approach
- Extracted **year** and **month** from the `Order Date` column using MySQL's `YEAR()` and `MONTH()` functions.
- Filtered out rows with NULL `Order Date` to avoid grouping NULL values.
- Aggregated data by year and month:
  - Calculated total monthly revenue using `SUM(Sales)`.
  - Counted distinct orders per month using `COUNT(DISTINCT Order ID)`.
- Sorted results chronologically by year and month.

## SQL Query Used

```sql
Select
    YEAR(`Order Date`) as year,
    MONTH(`Order Date`) as month,
    ROUND(SUM(Sales), 2) as monthly_revenue,
    COUNT(DISTINCT `Order ID`) as order_volume
From cleaned_superstore
Where `Order Date` is NOT NULL
group by YEAR(`Order Date`), MONTH(`Order Date`)
Order by year, month;
```

## Observations
- The query returns aggregated monthly revenue and order counts for all orders with valid `Order Date`.
- Rows with missing `Order Date` are excluded, which avoids the issue of NULL year/month grouping.
- The top row in your result showing `NULL` for year and month likely occurred when the `WHERE` clause was missing or incorrectly applied, causing all NULL dates to be grouped together.
