-- 1. Main view:

USE portfolio_retail;

CREATE OR REPLACE VIEW v_online_retail_sales AS
SELECT *
FROM online_retail_clean
WHERE IsCancelled = 0
  AND Quantity > 0
  AND UnitPrice > 0;

-- 2. ID Customers view:

CREATE OR REPLACE VIEW v_online_retail_customers AS
SELECT *
FROM v_online_retail_sales
WHERE CustomerID IS NOT NULL;