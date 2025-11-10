USE superstore_db;
SHOW TABLES;
SELECT COUNT(*) FROM superstore;
SELECT * FROM samplesuperstore LIMIT 100;
select distinct Category from samplesuperstore;
-- 1. view the structure of your table
DESCRIBE samplesuperstore;
-- 2. Check total number of rows
SELECT COUNT(*) AS total_rows FROM samplesuperstore;

-- 3. Check unique values in key columns
SELECT DISTINCT Category FROM samplesuperstore;
SELECT DISTINCT Sub_Category FROM samplesuperstore;
SELECT DISTINCT Segment FROM samplesuperstore;
SELECT DISTINCT Region FROM samplesuperstore;
-- 4. Total Sales and Profit
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore;

-- 5. Sales and Profit by Segment
SELECT 
    Segment,
    SUM(Sales) AS Sales,
    SUM(Profit) AS Profit
FROM samplesuperstore
GROUP BY Segment
ORDER BY Profit DESC;

-- 6. Top 10 States by Sales
SELECT 
    State,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- 7. Top 10 Sub-Categories by Profit
SELECT 
    Sub_Category,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY Sub_Category
ORDER BY Total_Profit DESC
LIMIT 10;

-- 8. Least profitable Sub-Categories
SELECT 
    Sub_Category,
    SUM(Profit) AS Total_Profit
FROM superstore_data
GROUP BY Sub_Category
ORDER BY Total_Profit ASC
LIMIT 10;

-- 9. Region-wise Profit Margin
SELECT 
    Region,
    SUM(Profit) / SUM(Sales) * 100 AS Profit_Percentage
FROM superstore_data
GROUP BY Region
ORDER BY Profit_Percentage DESC;

-- 10. Discount Impact on Profit
SELECT 
    ROUND(Discount, 2) AS Discount_Level,
    SUM(Profit) AS Total_Profit,
    SUM(Sales) AS Total_Sales
FROM superstore_data
GROUP BY Discount_Level
ORDER BY Discount_Level;