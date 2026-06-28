-- ============================================================
-- Executive Sales Dashboard — PostgreSQL Queries
-- Portfolio 1 · Superstore Sales Analysis
-- Source table: superstore (load from data/superstore_clean.csv)
-- ============================================================

-- ------------------------------------------------------------
-- 0. SCHEMA & DATA LOAD
-- ------------------------------------------------------------
DROP TABLE IF EXISTS superstore;
CREATE TABLE superstore (
    row_id         INTEGER,
    order_id       VARCHAR(20),
    order_date     DATE,
    ship_date      DATE,
    ship_mode      VARCHAR(30),
    customer_id    VARCHAR(20),
    customer_name  VARCHAR(100),
    segment        VARCHAR(30),
    country        VARCHAR(50),
    city           VARCHAR(60),
    state          VARCHAR(50),
    postal_code    VARCHAR(10),
    region         VARCHAR(20),
    product_id     VARCHAR(30),
    category       VARCHAR(30),
    sub_category   VARCHAR(40),
    product_name   VARCHAR(200),
    sales          NUMERIC(12,2),
    quantity       INTEGER,
    discount       NUMERIC(5,2),
    profit         NUMERIC(12,2),
    order_month    VARCHAR(7),
    order_year     INTEGER,
    profit_margin  NUMERIC(8,4)
);

-- Load cleaned CSV (adjust the absolute path on your machine):
-- \copy superstore FROM 'superstore_clean.csv' WITH (FORMAT csv, HEADER true);


-- ------------------------------------------------------------
-- 1. KPI — TOTAL SALES, PROFIT, ORDERS, MARGIN
-- ------------------------------------------------------------
SELECT
    ROUND(SUM(sales), 2)                              AS total_sales,
    ROUND(SUM(profit), 2)                             AS total_profit,
    COUNT(DISTINCT order_id)                          AS total_orders,
    SUM(quantity)                                     AS total_quantity,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct,
    ROUND(SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS avg_order_value
FROM superstore;


-- ------------------------------------------------------------
-- 2. SALES PER REGION (+ margin)
-- ------------------------------------------------------------
SELECT
    region,
    ROUND(SUM(sales), 2)  AS sales,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS margin_pct
FROM superstore
GROUP BY region
ORDER BY sales DESC;


-- ------------------------------------------------------------
-- 3. SALES PER CATEGORY (+ margin)
-- ------------------------------------------------------------
SELECT
    category,
    ROUND(SUM(sales), 2)  AS sales,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS margin_pct
FROM superstore
GROUP BY category
ORDER BY sales DESC;


-- ------------------------------------------------------------
-- 4. SALES PER MONTH (trend)
-- ------------------------------------------------------------
SELECT
    order_month,
    ROUND(SUM(sales), 2)  AS sales,
    ROUND(SUM(profit), 2) AS profit
FROM superstore
GROUP BY order_month
ORDER BY order_month;


-- ------------------------------------------------------------
-- 5. TOP 10 CUSTOMERS BY SALES
-- ------------------------------------------------------------
SELECT
    customer_name,
    ROUND(SUM(sales), 2)  AS sales,
    ROUND(SUM(profit), 2) AS profit,
    COUNT(DISTINCT order_id) AS orders
FROM superstore
GROUP BY customer_name
ORDER BY sales DESC
LIMIT 10;


-- ------------------------------------------------------------
-- 6. TOP 10 PRODUCTS BY SALES
-- ------------------------------------------------------------
SELECT
    product_name,
    ROUND(SUM(sales), 2)  AS sales,
    ROUND(SUM(profit), 2) AS profit,
    SUM(quantity)         AS units_sold
FROM superstore
GROUP BY product_name
ORDER BY sales DESC
LIMIT 10;


-- ------------------------------------------------------------
-- 7. BONUS — SUB-CATEGORIES THAT LOSE MONEY (discount vs profit)
--    Backs the core business insight & recommendation.
-- ------------------------------------------------------------
SELECT
    sub_category,
    ROUND(SUM(sales), 2)        AS sales,
    ROUND(SUM(profit), 2)       AS profit,
    ROUND(AVG(discount) * 100, 1) AS avg_discount_pct,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 1) AS margin_pct
FROM superstore
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY profit ASC;


-- ------------------------------------------------------------
-- 8. BONUS — REGION x CATEGORY PROFITABILITY MATRIX
-- ------------------------------------------------------------
SELECT
    region,
    category,
    ROUND(SUM(sales), 2)  AS sales,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(AVG(discount) * 100, 1) AS avg_discount_pct,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 1) AS margin_pct
FROM superstore
GROUP BY region, category
ORDER BY region, profit ASC;
