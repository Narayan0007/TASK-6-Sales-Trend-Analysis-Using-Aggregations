SELECT * FROM cleaned_superstore;

-- Analyze monthly sales trends
Select
    YEAR(`Order Date`) as year,
    MONTH(`Order Date`) as month,
    ROUND(SUM(Sales), 2) as monthly_revenue,
    COUNT(DISTINCT `Order ID`) as order_volume
From cleaned_superstore
Where `Order Date` is NOT NULL
group by YEAR(`Order Date`), MONTH(`Order Date`)
Order by year, month;



