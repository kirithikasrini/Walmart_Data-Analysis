#  Walmart Data Analysis: End-to-End SQL + Python Project

## Project Overview
This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. It leverages SQL for advanced querying, Python for data manipulation and analysis, and structured problem-solving techniques to answer key business questions.

🔹 Key Skills Covered:

✅ Data Cleaning & Preprocessing

✅ SQL Querying (MySQL & PostgreSQL)

✅ Feature Engineering

✅ Business Problem Solving with SQL

✅ Data Visualization & Reporting

---

## Project Pipeline 

### 1. Enivronment Setup 

🔹 Tools Used:

- **IDE:** Visual Studio Code (VS Code)
- **Databases:** MySQL, PostgreSQL
- **Programming Language:** Python

### 2. Dataset Acquisition
  
Download the Walmart Sales Dataset from Kaggle using the API.Save the dataset in the data/ folder for easy access.

**Dataset Link**  [Walmart Dataset](https://www.kaggle.com/datasets/najir0123/walmart-10k-sales-datasets)

### 3. Data Exploration & Cleaning

- Check for missing values, duplicate records, and incorrect data types.
- Fix currency formatting, date types, and other inconsistencies.
  
🛠 Key Steps:

✅ .info() to check data types and null values

✅ .describe() for statistical summaries

✅ .head()  to preview the dataset

### 4. Feature Engineering  
- Created a **"Total Amount"** column by multiplying unit price with quantity to calculate the total sales per transaction.  
- Converted date columns to **datetime format** for accurate time-based analysis.

### 5. Load Data into MySQL & PostgreSQL  
- Used **SQLAlchemy** to establish connections and load the cleaned data into **MySQL** and **PostgreSQL**.  
- Created a structured table to store sales data, ensuring efficient querying and analysis.  
- Verified data integrity by running initial SQL queries.

### 6. SQL Analysis: Solving Business Problems  
- Analyzed **revenue trends** across different branches and product categories.  
- Identified **best-selling products** and peak sales periods.  
- Evaluated **sales performance** by various payment methods.  
- Conducted a **profit margin analysis** to understand profitability by branch and category.  

📌 **Key Takeaways:**  
- Branches with the highest revenue contribution.  
- Most popular product categories among customers.  
- Peak hours and days for sales activity.  
- Preferred payment methods used by customers.  
- Insights to improve pricing and inventory management.

  ---

  ### Result & Insights

- Key business insights gained from SQL queries.
- Visualizations using **Matplotlib / Seaborn** to present findings.

  
