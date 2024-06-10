--Total Revenue

SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales

--Average order value

SELECT (SUM(total_price)/COUNT(DISTINCT(order_id))) as AVG_Order_Value
FROM pizza_sales

--Total Pizzas Sold

SELECT SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales

--Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales

--Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2))AS DECIMAL (10,2)) AS Average_Pizza_per_Order
FROM pizza_sales

--Hourly Trend for Total Pizzas Sold

SELECT DATEPART(HOUR, order_time) AS SeparateTIME, SUM(quantity) AS Total_Pizzas
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY SeparateTIME

--DAYNAME Trend for Total Pizzas Sold

SELECT DATENAME(DW, order_date) AS Day_of_the_Week, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--Weekly Trend for Total Orders

SELECT DATEPART(ISO_WEEK, order_date) AS WEEKDATE, COUNT(DISTINCT order_id) AS TotalOrders, YEAR(order_date) AS Year
FROM pizza_sales
GROUP BY DATEPART(ISO_WEEK, order_date), YEAR(order_date)
ORDER BY WEEKDATE, Year

--Daily Trend for Total Orders

SELECT DATEPART(HOUR, order_time) AS HOURDATE, COUNT(DISTINCT order_id) AS TotalOrders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY HOURDATE

--Percentage of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price)/
(SELECT SUM(total_price) FROM pizza_sales)*100 AS DECIMAL(10,2)) AS Precentage_by_Pizza_Category
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Precentage_by_Pizza_Category DESC

--Precentage of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price)/
(SELECT SUM(total_price) FROM pizza_sales)*100 AS DECIMAL(10,2)) AS Precentage_by_Pizza_Category
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Precentage_by_Pizza_Category DESC

--Total Pizzas Sold by Pizza Category

SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold_Category
FROM pizza_sales
--WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Pizzas_Sold_Category DESC

--Total Orders by Pizza Category

SELECT pizza_category, COUNT(DISTINCT order_id) AS Total_Orders_by_Category
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Orders_by_Category DESC

--Top 5 Best Sellers by Revenue 

SELECT TOP 5 pizza_name, CAST(SUM(total_price) AS DECIMAL (10,2)) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC

--Bottom 5 Best Sellers by Revenue

SELECT TOP 5 pizza_name, CAST(SUM(total_price) AS DECIMAL (10,2)) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue

--Top 5 Best Sellers by Total Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity DESC

--Bottom 5 Best Sellers by Total Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity

--Top 5 Best Sellers by Total Orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS OrderT
FROM pizza_sales
GROUP BY pizza_name
ORDER BY OrderT DESC

--Bottom 5 Best Sellers by Total Orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS OrderT
FROM pizza_sales
GROUP BY pizza_name
ORDER BY OrderT
