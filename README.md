# Executive Sales Dashboard

An end-to-end sales analytics project that a CEO or Sales Director can use to monitor
the performance of **Superstore** US retail sales (2015–2018).

## Key Results
| Metric | Value |
|---|---|
| Total Sales | **$2,297,201** |
| Total Profit | **$286,397** |
| Total Orders | **5,009** |
| Profit Margin | **12.47%** |
| Avg Order Value | **$458.61** |

**Core insight:** sales are healthy, but **profitability is thin**. The main driver is the
**Furniture** category — the *Tables, Bookcases, and Supplies* sub-categories sell at a loss
due to **aggressive discounting**. The **Central** region carries the lowest margin (7.9%).

## Contents
| File | Description |
|---|---|
| `data/superstore_raw.csv` | Raw dataset (10,800 rows, intentionally uncleaned) |
| `data/superstore_clean.csv` | Cleaned, analysis-ready dataset (9,994 rows) |
| `Superstore_Analysis.ipynb` | Notebook: data cleaning + EDA + visualizations (pre-executed) |
| `queries.sql` | PostgreSQL queries: KPIs, region, category, monthly, top customers/products |
| `Executive_Sales_Dashboard.html` | Interactive dashboard (open in a browser; Region & Year filters) |
| `Sales_Summary.xlsx` | Multi-sheet Excel summary |
| `Executive_Summary.pdf` | Project narrative + business insights + recommendations |
| `requirements.txt` | Python dependencies |

## Data Cleaning Process
`10,800` → remove **504 duplicates** → `10,296` → remove **302 junk rows** → **9,994 clean rows**.
Steps also include date-format conversion, currency rounding, product-name standardization,
and filling the missing Vermont postal code.

## Tools
Python (pandas, numpy, matplotlib, seaborn) · SQL (PostgreSQL) · Excel · HTML / Chart.js

## How to Use
```bash
pip install -r requirements.txt
jupyter notebook Superstore_Analysis.ipynb     # run the analysis
# Open Executive_Sales_Dashboard.html directly in a browser
```

> Note: the dashboard is delivered as an interactive HTML file (a substitute for the
> proprietary Power BI .pbix format). Its layout and functionality match an executive
> dashboard: KPIs, trend, region/category breakdowns, top products/customers, and a
> Region × Category profitability matrix. To reproduce it in Power BI, run `queries.sql`
> against PostgreSQL or import `superstore_clean.csv` into Power BI Desktop and rebuild the
> visuals using this dashboard as the reference.
