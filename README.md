# Retail Sales Analysis SQL

## Project Overview

**Project Title**: Retail Sales Analysis  
**Database**: `retail_sales_db`

This project is to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Answer specific business questions and retrieve insights from the sales data.

## Project implementation

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `retail_sales_db`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

### 3. Data Analysis & Findings

Answer specific business questions

1. **Retrieve all columns for sales made on '2022-11-05**:

2. **Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:

3. **Calculate the total sales (total_sale) for each category.**:

4. **Find the average age of customers who purchased items from the 'Beauty' category.**:

5. **Find all transactions where the total_sale is greater than 1000.**:

6. **Find the total number of transactions (transaction_id) made by each gender in each category.**:

7. **Calculate the average sale for each month. Find out best selling month in each year**:

8. **Find the top 5 customers based on the highest total sales**:

9. **Find the number of unique customers who purchased items from each category.**:

10. **Create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.
