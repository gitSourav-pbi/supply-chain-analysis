-- Supply Chain Analytics - SQL queries
-- Dataset: Supply Chain Analysis by harshsingh2209 (Kaggle)
-- Executed in Kaggle notebook using pandasql with dataframe 'df'
-- Table reference in queries: consumer_complaints -> df (panda dataframe)

-- Query 1: Top 5 Suppliers by Defect Rate with Manufacturing Cost
-- Identifies highest risk suppliers and their associated costs
SELECT
    supplier_name,
    ROUND(AVG(defect_rates),2) as avg_defect_rate,
    COUNT(sku) as total_products,
    ROUND(AVG(manufacturing_costs),2) as avg_manufacturing_cost
FROM supply_chain_data
WHERE supplier_name is NOT NULL
GROUP BY supplier_name
ORDER BY avg_defect_rate desc
LIMIT 5;

-- Query 2: Average Shipping Time and Cost by Transportation Mode
-- Supports decision making on optimal transportation mode selection
SELECT 
    transportation_modes,
    ROUND(avg(shipping_times),2) as avg_shipping_time,
    ROUND(avg(shipping_costs),2) as avg_shipping_cost,
    COUNT(sku) as total_shipments
FROM supply_chain_data
WHERE transportation_modes is NOT NULL
GROUP BY transportation_modes
ORDER BY avg_shipping_time ASC;

-- Query 3: Revenue and Defect Rate by Product Type with Performance Category
-- CASE WHEN used to categorise product lines by quality performance
SELECT 
    product_type,
    ROUND(SUM(revenue_generated),2) as total_revenue,
    ROUND(AVG(defect_rates),2) as avg_defect_rates,
    COUNT(sku) as total_products,
    CASE
        WHEN AVG(defect_rates) < 2.0 THEN 'High Performance'
        WHEN AVG(defect_rates) BETWEEN 2.0 AND 2.5 THEN 'Medium Performance'
        ELSE 'Low Performance'
    END as performance_category
FROM supply_chain_data
WHERE product_type is NOT NULL
GROUP BY product_type
ORDER BY total_revenue desc;

-- Query 4: Rank Suppliers by Defect Rate within each Product Type
-- Window Function: DENSE_RANk() with PARTITION BY product_type
-- Rank resets for each product category 
SELECT 
    product_type,
    supplier_name,
    ROUND(AVG(defect_rates), 2) as avg_defect_rate,
    DENSE_RANK() OVER (
                        PARTITION BY product_type
                        ORDER BY AVG(defect_rates) desc
                        ) as defect_rank
FROM supply_chain_data
WHERE product_type is NOT NULL
AND supplier_name is NOT NULL
GROUP BY product_type, supplier_name
ORDER BY product_type, defect_rank;
