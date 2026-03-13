-- =============================================================
-- WALMART SALES DATA ANALYSIS
-- Script 2: Feature Engineering
-- =============================================================
-- This script adds three derived columns to enrich the dataset
-- and enable time-based analysis.
-- =============================================================

USE salesDataWalmart;

-- -------------------------------------------------------------
-- FEATURE 1: time_of_day
-- Categorizes each transaction into Morning, Afternoon, or Evening
-- based on the transaction's time value.
-- -------------------------------------------------------------
ALTER TABLE sales
ADD COLUMN time_of_day VARCHAR(20) NOT NULL;

UPDATE sales
SET time_of_day = (
    CASE
        WHEN time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END
);

-- -------------------------------------------------------------
-- FEATURE 2: day_name
-- Extracts the full name of the weekday from the date column
-- (e.g., Monday, Tuesday) to identify the busiest days.
-- -------------------------------------------------------------
ALTER TABLE sales
ADD COLUMN day_name VARCHAR(10) NOT NULL;

UPDATE sales
SET day_name = DAYNAME(date);

-- -------------------------------------------------------------
-- FEATURE 3: month_name
-- Extracts the full month name from the date column
-- (e.g., January, February) to identify peak sales months.
-- -------------------------------------------------------------
ALTER TABLE sales
ADD COLUMN month_name VARCHAR(10) NOT NULL;

UPDATE sales
SET month_name = MONTHNAME(date);

-- Quick verification of the new columns
SELECT
    invoice_id,
    time,
    time_of_day,
    date,
    day_name,
    month_name
FROM sales
LIMIT 10;
