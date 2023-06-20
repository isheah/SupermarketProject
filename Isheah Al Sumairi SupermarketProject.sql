-- My Recommendations Based off of Analysis --
-- Promote use of cash than Ewallet because there is higher gross income with cash than Ewallet --
-- Promote home and lifestyle products because it is the highest gross income --
-- Promote more female buyers in Naypitaw because it has the most --
-- Promote more male buyers in Yangon because it has the most --
-- Change location of Mandalay because it has the least amount of sales --
-- Code down below --

SELECT *
FROM SupermarketProject..SupermarketData

-- Fashion accessories, Food and beverages, Electronic accessories, Sports and travel, Home and lifestyle, Health and beauty --
SELECT Product_line, COUNT(Product_line)
FROM SupermarketProject..SupermarketData
GROUP BY Product_line
ORDER BY COUNT(Product_line) DESC

-- Product Line by Gross Income --
  
SELECT Product_line, COUNT(Product_line), AVG(gross_income) AS GrossIncome
FROM SupermarketProject..SupermarketData
GROUP BY Product_line
ORDER BY COUNT(Product_line) DESC
  
-- Max gross_income --
SELECT MAX(gross_income) AS MaxGrossIncome
FROM SupermarketProject..SupermarketData
  
  -- Analysis on Most Sales Per City -- Yangon Most and Mandalay Least --
SELECT City, COUNT(City) AS CountCity
FROM SupermarketProject..SupermarketData
GROUP BY City
ORDER BY City DESC
  
-- Analysis on Branch -- A Most, C Least --
SELECT Branch, COUNT(Branch) AS CountBranch
FROM SupermarketProject..SupermarketData
GROUP BY Branch
ORDER BY Branch ASC
  
-- Analysis on City and Gender -- Yangon had the most male buyers and least female buyers and Naypitaw had the most female buyers and the least male buyers -- 
SELECT City, COUNT(City) AS CountCity, Gender, COUNT(Gender) AS CountGender
FROM SupermarketProject..SupermarketData
GROUP BY City, Gender
ORDER BY COUNT(City) DESC

-- Analysis on Gross income -- Highest with cash and Lowest with Ewallet --
SELECT Payment, COUNT(Payment) AS CountPayment, AVG(gross_income) AS GrossIncome, AVG(Rating) AS AvgRating
FROM SupermarketProject..SupermarketData
GROUP BY Payment
ORDER BY AVG(gross_income) DESC

-- Analysis on Avg Rating -- Highest with credit card and lowest with Ewallet --
SELECT Payment, COUNT(Payment) AS CountPayment, AVG(gross_income) AS GrossIncome, AVG(Rating) AS AvgRating
FROM SupermarketProject..SupermarketData
GROUP BY Payment
ORDER BY AVG(Rating) DESC
  
-- Analysis of Data on Date
SELECT Date, Time
FROM SupermarketProject..SupermarketData
ORDER BY Date ASC

SELECT 
  Date, SUM(Quantity) OVER (PARTITION BY Product_line ORDER BY Date) AS TotalQuantitySoldByDate
FROM SupermarketProject..SupermarketData

SELECT 
  Date, LAG(Quantity) OVER (PARTITION BY Product_line ORDER BY Date) AS TotalQuantitySoldByDate
FROM SupermarketProject..SupermarketData

SELECT Quantity, Date, Time,
  RANK() OVER (PARTITION by Quantity ORDER BY Date ASC) AS Rank
FROM SupermarketProject..SupermarketData

-- Comparison Analysis of Supermarket Costumers in the US --
SELECT *
FROM SupermarketProject..SupermarketCustomerMembers
JOIN SupermarketProject..SupermarketData
ON Genre=gender
ORDER BY Age ASC
  
-- Mean Total and Gross Income Per Day --
SELECT Total, gross_income, AVG(Total) AS MeanTotal, AVG(gross_income) AS AvgGrossIncome
FROM SupermarketProject..SupermarketData
GROUP BY Total, gross_income

--  Analysis of City with Least to Most Gross Income -- 
SELECT City, COUNT(City) AS CountCity, AVG(gross_income) AS GrossIncome
FROM SupermarketProject..SupermarketData
GROUP BY City
ORDER BY AVG(gross_income) ASC









