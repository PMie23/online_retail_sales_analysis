-- 1. Create clean table:

USE portfolio_retail;

DROP TABLE IF EXISTS online_retail_clean;

CREATE TABLE online_retail_clean (
  row_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  InvoiceNo VARCHAR(20) NOT NULL,
  StockCode VARCHAR(20) NOT NULL,
  Description VARCHAR(255),
  Quantity INT NOT NULL,
  InvoiceDate DATETIME NOT NULL,
  UnitPrice DECIMAL(10,2) NOT NULL,
  CustomerID INT NULL,
  Country VARCHAR(60) NOT NULL,
  Revenue DECIMAL(12,2) NOT NULL,
  IsCancelled TINYINT(1) NOT NULL,
  INDEX idx_customer (CustomerID),
  INDEX idx_date (InvoiceDate),
  INDEX idx_country (Country),
  INDEX idx_invoice_stock_date (InvoiceNo, StockCode, InvoiceDate)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- 2. Insert clean data:

SELECT
  TRIM(InvoiceNo) AS InvoiceNo,
  TRIM(StockCode) AS StockCode,
  NULLIF(TRIM(Description), '') AS Description,
  CAST(Quantity AS SIGNED) AS Quantity,
  CAST(InvoiceDate AS DATETIME) AS InvoiceDate,
  CAST(UnitPrice AS DECIMAL(10,2)) AS UnitPrice,
  NULLIF(CustomerID, '') + 0 AS CustomerID,
  TRIM(Country) AS Country,
  CAST(Quantity AS SIGNED) * CAST(UnitPrice AS DECIMAL(10,2)) AS Revenue,
  CASE
    WHEN InvoiceNo LIKE 'C%' THEN 1
    ELSE 0
  END AS IsCancelled
FROM online_retail_raw;
