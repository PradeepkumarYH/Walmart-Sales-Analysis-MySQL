# Walmart Sales Data Analysis

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?logo=mysql&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio_Project-black?logo=github)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

## 📋 Project Overview

This project performs an end-to-end analysis of Walmart sales data using **MySQL**. The goal is to explore transactional data to identify top-performing branches and product lines, uncover sales trends across time, and understand customer behaviour — insights that can inform strategic business decisions.

---

## 🎯 Project Aims

- Identify the **top-performing branches and product lines** by revenue and quantity sold.
- Analyse **sales trends** across different times of day, days of the week, and months of the year.
- Understand **customer behaviour** by gender and payment preference.
- Apply **feature engineering** to derive meaningful time-based variables directly in SQL.

---

## 📂 Repository Structure

```
walmart-sales-analysis/
│
├── 01_schema_setup.sql        # Database creation, table schema & import instructions
├── 02_feature_engineering.sql # Derived columns: time_of_day, day_name, month_name
├── 03_eda_queries.sql         # All EDA queries answering business questions
└── README.md                  # Project documentation (this file)
```

---

## 💾 Data Source

The dataset used in this project is sourced from the **[Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting)**. It contains historical sales data from 45 Walmart stores across different regions, covering three branches (A, B, C) with **1,000 transaction records** and **17 columns**.

| Column | Description | Data Type |
|---|---|---|
| `invoice_id` | Unique transaction identifier | VARCHAR (PK) |
| `branch` | Store branch (A, B, or C) | VARCHAR |
| `city` | City where the branch is located | VARCHAR |
| `customer_type` | Member or Normal customer | VARCHAR |
| `gender` | Customer gender | VARCHAR |
| `product_line` | Category of product sold | VARCHAR |
| `unit_price` | Price per unit | DECIMAL |
| `quantity` | Number of units sold | INT |
| `VAT` | 5% tax added to the COGS | FLOAT |
| `total` | Total cost including VAT | DECIMAL |
| `date` | Date of the transaction | DATETIME |
| `time` | Time of the transaction | TIME |
| `payment_method` | Cash, Credit card, or Ewallet | VARCHAR |
| `cogs` | Cost of Goods Sold | DECIMAL |
| `gross_margin_percentage` | Gross margin percentage | FLOAT |
| `gross_income` | Gross income from the transaction | DECIMAL |
| `rating` | Customer satisfaction rating (1–10) | FLOAT |

---

## 🔧 Methodology

The project follows a three-phase analytical pipeline:

### 1. Data Wrangling (Schema-Level Cleaning)
Rather than running `UPDATE` statements to find and replace `NULL` values after import, this project applies **`NOT NULL` constraints** to all columns at the schema creation stage. This means any row in the CSV containing a null value will be rejected at import, ensuring the dataset is clean by design.

### 2. Feature Engineering
Three new columns are derived from existing data to enable richer time-based analysis:

| New Column | Source Column | Logic |
|---|---|---|
| `time_of_day` | `time` | `CASE` statement → Morning / Afternoon / Evening |
| `day_name` | `date` | `DAYNAME()` function → e.g., Monday, Tuesday |
| `month_name` | `date` | `MONTHNAME()` function → e.g., January, February |

### 3. Exploratory Data Analysis (EDA)
SQL queries are written to answer specific business questions, using aggregation functions (`SUM`, `AVG`, `COUNT`), grouping (`GROUP BY`), filtering (`HAVING`), and sorting (`ORDER BY`).

---

## ❓ Business Questions Answered

### Generic
- How many distinct cities and branches does the data contain?
- In which city is each branch located?

### Products & Sales
- How many unique product lines does the data have?
- What is the most common payment method?
- What is the most selling product line?
- What is the total revenue by month?
- Which month had the largest COGS (Cost of Goods Sold)?
- Which product line had the largest total revenue?
- Which city had the largest revenue?
- Which product line has the largest VAT?
- Which branch sold more products than the average products sold?
- What is the most common product line by gender?
- What is the average rating of each product line?

---

## 🚀 How to Run This Project

1. **Install MySQL** (version 8.0+) and **MySQL Workbench**.
2. **Clone this repository:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/walmart-sales-analysis.git
   ```
3. Open **MySQL Workbench** and connect to your local server.
4. Open and execute `01_schema_setup.sql` to create the database and table.
5. Use the **Table Data Import Wizard** (right-click the `sales` table → *Table Data Import Wizard*) to load your CSV file.
6. Open and execute `02_feature_engineering.sql` to add the derived columns.
7. Open and execute `03_eda_queries.sql` to run all EDA queries.

---

## 👤 Author

**Pradeepkumar Hejjegar**
- GitHub: [@PradeepkumarYH](https://github.com/PradeepkumarYH)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
