-- =============================================================
-- WALMART SALES DATA ANALYSIS
-- Script 3: Exploratory Data Analysis (EDA)
-- =============================================================

USE salesDataWalmart;

-- =============================================================
-- SECTION A: GENERIC QUESTIONS
-- =============================================================

-- Q1. How many distinct cities does the data contain?
SELECT
    COUNT(DISTINCT city) AS distinct_cities
FROM sales;

-- Q2. In which city is each branch located?
SELECT DISTINCT
    branch,
    city
FROM sales
ORDER BY branch;


-- =============================================================
-- SECTION B: PRODUCT & SALES ANALYSIS
-- =============================================================

-- Q3. How many unique product lines does the data have?
SELECT
    COUNT(DISTINCT product_line) AS unique_product_lines
FROM sales;

-- Q4. What is the most common payment method?
SELECT
    payment_method,
    COUNT(payment_method) AS payment_count
FROM sales
GROUP BY payment_method
ORDER BY payment_count DESC;

-- Q5. What is the most selling product line?
SELECT
    product_line,
    COUNT(product_line) AS product_line_count
FROM sales
GROUP BY product_line
ORDER BY product_line_count DESC;

-- Q6. What is the total revenue by month?
SELECT
    month_name          AS month,
    SUM(total)          AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;

-- Q7. Which month had the largest COGS (Cost of Goods Sold)?
SELECT
    month_name          AS month,
    SUM(cogs)           AS total_cogs
FROM sales
GROUP BY month_name
ORDER BY total_cogs DESC
LIMIT 1;

-- Q8. Which product line had the largest total revenue?
SELECT
    product_line,
    SUM(total)          AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC
LIMIT 1;

-- Q9. Which city had the largest revenue?
SELECT
    city,
    branch,
    SUM(total)          AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue DESC
LIMIT 1;

-- Q10. Which product line has the largest VAT (Value Added Tax)?
SELECT
    product_line,
    AVG(VAT)            AS avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC
LIMIT 1;

-- Q11. Which branch sold more products than the average number of products sold?
SELECT
    branch,
    SUM(quantity)       AS total_quantity
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- Q12. What is the most common product line by gender?
SELECT
    gender,
    product_line,
    COUNT(gender)       AS gender_count
FROM sales
GROUP BY gender, product_line
ORDER BY gender, gender_count DESC;

-- Q13. What is the average rating of each product line?
--      (Rating rounded to 2 decimal places)
SELECT
    product_line,
    ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;
