SELECT *
FROM SupermarketProject..SupermarketData

-- Fashion accessories, Food and beverages, Electronic accessories, Sports and travel, Home and lifestyle, Health and beauty --
SELECT Product_line, COUNT(Product_line)
FROM SupermarketProject..SupermarketData
GROUP BY Product_line
ORDER BY COUNT(Product_line) DESC

-- Yangon had the most male buyers and least female buyers and Naypitaw had the most female buyers and the least male buyers -- 
SELECT City, COUNT(City) AS CountCity, Gender, COUNT(Gender) AS CountGender
FROM SupermarketProject..SupermarketData
GROUP BY City, Gender
ORDER BY COUNT(City) DESC

-- Gross income highest with cash and lowest with Ewallet --
SELECT Payment, COUNT(Payment) AS CountPayment, AVG(gross_income) AS GrossIncome, AVG(Rating) AS AvgRating
FROM SupermarketProject..SupermarketData
GROUP BY Payment
ORDER BY AVG(gross_income) DESC

-- Avg rating highest with credit card and lowest with Ewallet --
SELECT Payment, COUNT(Payment) AS CountPayment, AVG(gross_income) AS GrossIncome, AVG(Rating) AS AvgRating
FROM SupermarketProject..SupermarketData
GROUP BY Payment
ORDER BY AVG(Rating) DESC


-- Analyzing data by month, year, hour
-- Correlation analysis --
--Regression analysis--
--hypothesis testing or anova--
--clearly define everything-- 
--provide recommendations-- 



