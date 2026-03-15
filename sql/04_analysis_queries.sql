USE portfolio_retail;

-- 1. Initial data quality checks
SELECT 
  COUNT(*) AS rows_total,
  SUM(CustomerID IS NULL OR CustomerID = '') AS missing_customerid,
  SUM(Description IS NULL OR Description = '') AS missing_description
FROM online_retail_raw;

SELECT
  SUM(InvoiceNo LIKE 'C%') AS cancellations,
  SUM(CAST(Quantity AS SIGNED) <= 0) AS non_positive_qty
FROM online_retail_raw;

-- 2. Clean table validation
SELECT
  COUNT(*) AS rows_clean,
  SUM(IsCancelled = 1) AS cancelled_rows,
  SUM(Quantity <= 0) AS non_positive_qty,
  SUM(UnitPrice <= 0) AS non_positive_price,
  SUM(CustomerID IS NULL) AS missing_customerid
FROM online_retail_clean;

-- 3. Main KPI summary
SELECT
  ROUND(SUM(Revenue), 2) AS total_revenue,
  COUNT(DISTINCT InvoiceNo) AS total_orders,
  SUM(Quantity) AS total_items,
  ROUND(SUM(Revenue) / COUNT(DISTINCT InvoiceNo), 2) AS avg_order_value
FROM v_online_retail_sales;

-- 4. Monthly revenue trend
SELECT
  SUBSTRING(InvoiceDate, 1, 7) AS ym,
  ROUND(SUM(Revenue), 2) AS rev,
  COUNT(DISTINCT InvoiceNo) AS orders
FROM v_online_retail_sales
GROUP BY 1
ORDER BY 1;

-- 5. Top 6 months by revenue
SELECT
  SUBSTRING(InvoiceDate, 1, 7) AS ym,
  ROUND(SUM(Revenue), 2) AS rev,
  COUNT(DISTINCT InvoiceNo) AS orders
FROM v_online_retail_sales
GROUP BY 1
ORDER BY rev DESC
LIMIT 6;

-- 6. Top 10 countries by revenue
SELECT
  Country,
  ROUND(SUM(Revenue), 2) AS rev
FROM v_online_retail_sales
GROUP BY Country
ORDER BY rev DESC
LIMIT 10;

-- 7. Top 10 products by revenue
SELECT
  StockCode,
  MAX(Description) AS description,
  ROUND(SUM(Revenue), 2) AS rev,
  SUM(Quantity) AS qty
FROM v_online_retail_sales
GROUP BY StockCode
ORDER BY rev DESC
LIMIT 10;

-- 8. Top 10 customers by revenue
SELECT
  CustomerID,
  ROUND(SUM(Revenue), 2) AS rev,
  COUNT(DISTINCT InvoiceNo) AS orders,
  SUM(Quantity) AS items
FROM v_online_retail_customers
GROUP BY CustomerID
ORDER BY rev DESC
LIMIT 10;