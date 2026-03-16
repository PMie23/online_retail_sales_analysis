# Online Retail Sales Analysis

<img width="949" height="535" alt="dashboard_overview" src="https://github.com/user-attachments/assets/50e71b0d-fdd3-4292-9a6b-1dd7467e4abd" />

## Project Overview

This project analyses an online retail dataset using SQL and Power BI to identify sales trends, product performance, and geographic revenue concentration. The project includes data cleaning, transformation, business analysis, and dashboard development.

## Objectives

- Clean and prepare raw retail transaction data using SQL

- Create analytical views for business reporting

- Identify seasonal sales patterns

- Analyse revenue by country and product

- Build a Power BI dashboard to communicate insights


## Dataset

- Source: Online Retail dataset

- Period: December 2010 to December 2011

- Total raw rows imported: 541,909

- Key fields: InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country


## Data Cleaning

The raw dataset was imported into MySQL and transformed into a clean analytical table. Key cleaning steps included:

- Converting text fields into appropriate data types

- Creating a revenue field based on quantity and unit price

- Identifying cancelled transactions using the invoice prefix

- Preserving the raw table while creating a cleaned analytical table

- Creating filtered analytical views to exclude cancelled or invalid transactions



## Initial data quality checks identified:



- 9,288 cancellation records

- 10,624 transactions with non-positive quantities


## Key KPIs



The following key metrics were calculated from the cleaned sales dataset:
 
- Total Revenue: £10.67M

- Total Orders: 19,960

- Total Items Sold: 5.59M

- Average Order Value: £534

## Business Questions

This analysis was designed to answer the following business questions:

- What is the total revenue and order volume?
- Which months generate the highest sales?
- Which countries contribute most to revenue?
- Which products generate the largest share of sales?
- Are there signs of seasonal purchasing behaviour?


## Key Insights

 1\. Revenue shows strong seasonality, with November 2011 being the highest revenue month (£1.51M).

2\. The United Kingdom accounts for the majority of total revenue, indicating a strong dependence on the domestic market.

3\. International markets such as the Netherlands, EIRE, Germany, and France contribute additional revenue but remain significantly smaller than the UK.

4\. The average order value of £534 suggests that many orders contain multiple items or bulk purchases.

5\. A relatively small number of products contribute a large share of total revenue.
 

## Dashboard Preview

!\[Dashboard Overview](images/dashboard\_overview.png)


## Tools Used

- MySQL

- DBeaver

- Power BI

- CSV exports for analytical dataset

## How to Reproduce the Analysis

1. Import the Online Retail dataset into MySQL.
2. Run the SQL scripts in the `sql` folder in the following order:
   - 01_create_raw_table.sql
   - 02_create_clean_table.sql
   - 03_create_views.sql
   - 04_analysis_queries.sql
3. Export analytical datasets to CSV.
4. Load the CSV files into Power BI.
5. Open `dashboard/online_retail_dashboard.pbix`.

## Project Structure


```text
online-retail-sales-analysis
│
├── data
│   ├── kpi_summary.csv
│   ├── monthly_revenue.csv
│   ├── top_countries.csv
│   └── top_products.csv
│
├── sql
│   ├── 01_create_raw_table.sql
│   ├── 02_create_clean_table.sql
│   ├── 03_create_views.sql
│   └── 04_analysis_queries.sql
│
├── dashboard
│   └── online_retail_dashboard.pbix
│
├── images
│   └── dashboard_overview.png
│
└── README.md
```

## Author

Isaac Pablo Morais Cavalcante Tavares

This project was developed as part of my Data Analytics learning journey, focusing on SQL data preparation and Power BI dashboard development.


