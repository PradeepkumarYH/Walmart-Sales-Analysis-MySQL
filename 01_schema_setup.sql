-- =============================================================
-- WALMART SALES DATA ANALYSIS
-- Script 1: Database Schema & Table Creation
-- =============================================================

-- Create and select the database
CREATE DATABASE IF NOT EXISTS salesDataWalmart;
USE salesDataWalmart;

-- =============================================================
-- Create the `sales` table with NOT NULL constraints
-- This handles basic data wrangling by preventing null values
-- at the schema level during data import.
-- =============================================================
CREATE TABLE IF NOT EXISTS sales (
    invoice_id              VARCHAR(30)     NOT NULL PRIMARY KEY,
    branch                  VARCHAR(5)      NOT NULL,
    city                    VARCHAR(30)     NOT NULL,
    customer_type           VARCHAR(30)     NOT NULL,
    gender                  VARCHAR(10)     NOT NULL,
    product_line            VARCHAR(100)    NOT NULL,
    unit_price              DECIMAL(10, 2)  NOT NULL,
    quantity                INT             NOT NULL,
    VAT                     FLOAT(6, 4)     NOT NULL,
    total                   DECIMAL(12, 4)  NOT NULL,
    date                    DATETIME        NOT NULL,
    time                    TIME            NOT NULL,
    payment_method          VARCHAR(15)     NOT NULL,
    cogs                    DECIMAL(10, 2)  NOT NULL,
    gross_margin_percentage FLOAT(11, 9)    NOT NULL,
    gross_income            DECIMAL(12, 4)  NOT NULL,
    rating                  FLOAT(2, 1)     NOT NULL
);

-- =============================================================
-- HOW TO IMPORT DATA USING MYSQL WORKBENCH WIZARD
-- =============================================================
-- 1. Ensure your CSV file (e.g., WalmartSalesData.csv) is saved
--    locally on your machine.
--
-- 2. In MySQL Workbench, expand your `salesDataWalmart` database
--    in the Navigator panel on the left.
--
-- 3. Right-click on the `sales` table and select:
--    "Table Data Import Wizard"
--
-- 4. Click "Browse" and navigate to your CSV file. Click [Next].
--
-- 5. Select "Use existing table" and ensure `salesDataWalmart`.`sales`
--    is selected. Click [Next].
--
-- 6. On the column mapping screen, verify that each CSV column
--    maps correctly to its corresponding table column.
--    Click [Next].
--
-- 7. Click [Next] to begin the import, then [Finish] once complete.
--
-- 8. Verify the import with:
--    SELECT COUNT(*) FROM sales;
-- =============================================================
