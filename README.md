# Supply Chain Operations Analysis

## Business Problem
As a supply chain analyst at a manufacturing company, the objective is to identify 
operational inefficiencies across suppliers, shipping, and production to reduce costs 
and improve delivery performance.

## Dataset
- **Source:** Supply Chain Analysis by harshsingh2269 on Kaggle
- **Records:** 100 rows, 24 columns
- **Domain:** Fashion and Beauty manufacturing — Skincare, Haircare, Cosmetics

## Tools Used
- **Power BI** — Interactive dashboard with DAX measures
- **SQL** — Pandasql queries in Kaggle notebook
- **GitHub** — Version control and portfolio publishing

## Dashboard Overview
Built in Power BI with 5 visuals and a product type slicer:
- Defect Rate by Supplier
- Revenue by Product Type
- Shipping Time by Carrier and Transportation Mode
- Stock Levels vs Order Quantities
- KPI — Average Defect Rate vs Target (2.00 benchmark)

### DAX Measures
- **Defect Rate %** — DIVIDE function calculating average defect rate per SKU
- **High Defect Supplier Cost** — CALCULATE filtering manufacturing costs 
  for suppliers with defect rate above 5%
- **Target Defect** — Benchmark measure set at 2.00 for KPI comparison

## SQL Queries
Four queries in analysis_queries.sql:
1. Top 5 suppliers by defect rate with manufacturing cost
2. Average shipping time and cost by transportation mode
3. Revenue and defect rate by product type with CASE WHEN performance category
4. Window function — DENSE_RANK with PARTITION BY to rank suppliers 
   within each product type

## Key Findings
- **Supplier 5** has the highest average defect rate at 2.67
- **Supplier 4** has the highest manufacturing cost at 62.71 despite 
  not being the worst defect performer — highest cost with poor quality
- **Road transport** is fastest at 4.72 days average shipping time
- **Sea transport** is cheapest at 4.97 average cost but slowest at 7.12 days
- **Skincare** drives the highest revenue at 241,628 — highest business impact
- **Cosmetics** is the only High Performance product type with defect rate 
  below 2.0 at 1.92
- Overall average defect rate is 2.33 — 16.7% above the 2.00 benchmark target

## Recommendations
1. Prioritise quality audits for Supplier 5 and Supplier 3 — highest defect rates
2. Review Supplier 4 contract — highest cost combined with above-average defects 
   is an inefficiency that should be renegotiated
3. Shift more shipments to Road transport where delivery speed is priority
4. Address skincare stockout risk — order quantities exceed stock levels, 
   risking lost revenue on the highest value product line
5. Investigate cosmetics overstock — excess inventory ties up working capital

## Repository Structure
- analysis_queries.sql — All SQL queries
- screenshots/ — Dashboard screenshot
- README.md — Project documentation

## Kaggle Notebook
[View SQL queries and analysis on Kaggle](https://kaggle.com/code/git1souravpbi/notebook8e303c8600)
