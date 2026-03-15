CREATE DATABASE IF NOT EXISTS portfolio_retail;

USE portfolio_retail;

DROP TABLE IF EXISTS online_retail_raw;

CREATE TABLE online_retail_raw (
  InvoiceNo    VARCHAR(20),
  StockCode    VARCHAR(20),
  Description  VARCHAR(255),
  Quantity     VARCHAR(20),
  InvoiceDate  VARCHAR(30),
  UnitPrice    VARCHAR(30),
  CustomerID   VARCHAR(30),
  Country      VARCHAR(60)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;