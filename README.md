# Zepto-Data-Analysis-SQL

## 📌 Project Overview

This project focuses on analyzing an e-commerce dataset (Zepto) using SQL to extract meaningful business insights. It includes data cleaning, exploratory analysis, and advanced analytical queries.

The goal of this project is to simulate real-world data analyst tasks such as revenue analysis, pricing strategy, inventory management, and customer behavior insights.

---

## 📂 Dataset Description

The dataset contains product-level information:

* `sku_id` – Unique product ID
* `category` – Product category
* `name` – Product name
* `mrp` – Maximum Retail Price
* `discountPercent` – Discount percentage
* `availableQuantity` – Available stock
* `discountedSellingPrice` – Selling price after discount
* `weightInGms` – Product weight
* `outOfStock` – Stock status
* `quantity` – Units sold

---

## 🧹 Data Cleaning Steps

* Removed products with invalid pricing (MRP = 0)
* Converted price values from paise to rupees
* Checked for duplicate products
* Identified missing or inconsistent values

---

## 📊 Key Business Questions Solved

### 🔹 Basic Analysis

* Unique product categories
* Stock availability (in-stock vs out-of-stock)
* Duplicate product detection

### 🔹 Intermediate Analysis

* Top discounted products
* High MRP but out-of-stock products
* Category-wise average discount
* Price per gram (value for money)

### 🔹 Advanced Analysis

* Top 3 most expensive products per category (Window Function)
* Revenue calculation by category
* Category contribution to total revenue
* Product ranking by discount
* High revenue but low stock risk products (CTE)
* Pricing segmentation using CASE statements

---

## 🧠 SQL Concepts Used

* ✅ SELECT, WHERE, GROUP BY, HAVING
* ✅ Aggregate Functions (SUM, AVG, COUNT)
* ✅ Window Functions (RANK, DENSE_RANK)
* ✅ Common Table Expressions (CTE)
* ✅ CASE Statements
* ✅ Data Cleaning (DELETE, UPDATE)
* ✅ Subqueries

---

## 📈 Sample Insights

* Identified top revenue-generating categories
* Found products with highest discounts and savings
* Detected inventory risks (low stock, high demand)
* Segmented products into pricing categories

---

## 🛠️ Tools Used

* PostgreSQL
* SQL

---

## 🚀 How to Run This Project

1. Create table using the provided SQL script
2. Import dataset into PostgreSQL
3. Run queries step-by-step
4. Analyze outputs for insights

---

## 📌 Future Improvements

* Build dashboard using Power BI / Tableau
* Perform analysis using Python (Pandas)
* Convert queries to PySpark (Databricks)
* Add KPIs like profit margin & customer segmentation

---

## 🙌 Author

**Suprit Tapase**
**Email: suprittapase3@gmail.com**
Aspiring Data Analyst | SQL | Power BI | Python

---

## ⭐ If you like this project, give it a star!
