--Create Database Ecommerce_Case_Study;

Use Ecommerce_Case_Study;

-----------------------------
Select * from Sales;
Select * From Returns;
----------------------------

-- What is my Category wise Sales for the year (Month wise breakup)?

Select Product_Category,
	   Datepart(Month, Order_Date) as Month,
	   sum(Sales) as Total_Sales
From Sales
Where Datepart(Year, Order_Date) = 2022
Group By Product_Category, Datepart(Month, Order_Date)
Order by 2;



-- What is my Geography (Region) wise Sales for the year?

Select Region, sum(sales) as Total_Sales
From Sales
Where Datepart(Year, Order_Date) = 2022
Group BY Region
Order by 2 desc;


-- Which are my top 5 products w.r.t Sales?

Select Top 5 Product, sum(Sales) as Total_Sales
From Sales
Group by Product
Order by 2 desc;



-- Which are my bottom 5 products w.r.t Sales?

Select Top 5 Product, sum(Sales) as Total_Sales
From Sales
Group by Product
Order by 2;



-- Is company Profitable and what is month wise trend?

Select  
    Datepart(Month, order_date) AS month, 
    sum(sales) AS monthly_sales, 
    sum(profit) AS monthly_profit, 
    sum(sales - profit) AS monthly_loss
FROM Sales
WHERE Datepart(Year, order_date) = 2022
GROUP BY Datepart(Month, order_date)
Order by 1;


-- How many customers & orders are received from each state? Is there any pattern you can see?

Select State, count(Distinct Customer_ID) as Customer_Count,
	   Count(*) as Order_Count
From Sales
Group by State;



-- What IS my Average Order Value for each customer?

Select Customer_ID, avg(sales) as Avg_Order_Value
From Sales
Group by Customer_ID;



--What are my top 3 countries w.r.t Sales ?

Select top 3 Country, sum(Sales)
From Sales
Group by Country;


--What is the average shipping cost for each state in the given year?

Select  
    state, 
    AVG(shipping_cost) AS average_shipping_cost
From Sales
Where DATEPART(Year, order_date) = 2022
Group by state
Order by 1;


-- Which customer segments contributed the most to the sales in the given year?

SELECT 
    segment, 
    SUM(sales) AS total_sales
From Sales
Where DATEPART(Year, order_date) = 2022
Group by segment
Order by total_sales DESC;


-- What is the average order processing time for each product category in the given year?

SELECT 
    product_category,
    AVG(DATEDIFF(day, order_date, Shipping_Date)) AS average_processing_time
From Sales
Where DATEPART(YEAR, order_date) = 2022
Group by product_category;


-- How do my sales and profits compare between weekdays and weekends?

SELECT 
    Case 
        When DATEPART(Weekday, order_date) IN (1, 7) Then 'Weekend'
        Else 'Weekday'
    End as day_type, 
    Format(SUM(sales)/1000000, 'N') + 'Millions' AS total_sales, 
    Format(SUM(profit)/1000000, 'N') + 'Millions' AS total_profit
From Sales
Where DATEPART(YEAR, order_date) = 2022
Group by 
    Case 
        When DATEPART(Weekday, order_date) IN (1, 7) Then 'Weekend'
        Else 'Weekday'
    End


-- 















