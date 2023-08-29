-- ------------------------------------------------------------------
-- 0). First, How Many Rows are in the Products Table?
-- ------------------------------------------------------------------
SELECT count(*) FROM northwind.products;

-- ------------------------------------------------------------------
-- 1). Product Name and Unit/Quantity
-- ------------------------------------------------------------------
SELECT product_name
	, 	quantity_per_unit
    FROM northwind.products;

-- ------------------------------------------------------------------
-- 2). Product ID and Name of Current Products
-- ------------------------------------------------------------------
SELECT id as product_ID
	, product_name
    FROM northwind.products
    WHERE discontinued = 0;

-- ------------------------------------------------------------------
-- 3). Product ID and Name of Discontinued Products
-- ------------------------------------------------------------------
SELECT id AS product_ID
	, product_name
    FROM northwind.products
    WHERE discontinued != 0;
    
-- ------------------------------------------------------------------
-- 4). Name & List Price of Most & Least Expensive Products
-- ------------------------------------------------------------------
SELECT product_name, list_price 
	FROM northwind.products
	WHERE list_price = (SELECT MIN(list_price) FROM northwind.products)
    OR list_price = (SELECT MAX(list_price) FROM northwind.products);
    

-- ------------------------------------------------------------------
-- 5). Product ID, Name & List Price Costing Less Than $20
-- ------------------------------------------------------------------
SELECT id as product_ID, product_name, list_price
	FROM northwind.products
    WHERE list_price < 20;

-- ------------------------------------------------------------------
-- 6). Product ID, Name & List Price Costing Between $15 and $20
-- ------------------------------------------------------------------
SELECT id as product_ID, product_name, list_price
	FROM northwind.products
    WHERE list_price < 20
    AND list_price > 15;

-- ------------------------------------------------------------------
-- 7). Product Name & List Price Costing Above Average List Price
-- ------------------------------------------------------------------
SELECT product_name, list_price
	FROM northwind.products
    WHERE list_price > (SELECT(AVG(list_price)) FROM northwind.products);

-- ------------------------------------------------------------------
-- 8). Product Name & List Price of 10 Most Expensive Products 
-- ------------------------------------------------------------------
SELECT product_name, list_price
	FROM northwind.products
    ORDER BY list_price DESC
    LIMIT 10;

-- ------------------------------------------------------------------ 
-- 9). Count of Current and Discontinued Products 
-- ------------------------------------------------------------------
SELECT discontinued, COUNT(*)
	FROM northwind.products
    GROUP BY discontinued;

-- ------------------------------------------------------------------
-- 10). Product Name, Units on Order and Units in Stock
--      Where Quantity In-Stock is Less Than the Quantity On-Order. 
-- ------------------------------------------------------------------
SELECT product_name, target_level as units_on_order, reorder_level as quantity_in_stock
	FROM northwind.products
    WHERE reorder_level < target_level;


-- ------------------------------------------------------------------
-- EXTRA CREDIT -----------------------------------------------------
-- ------------------------------------------------------------------


-- ------------------------------------------------------------------
-- 11). Products with Supplier Company & Address Info
-- ------------------------------------------------------------------
SELECT p.product_name, p.list_price, p.category,
	s.address, s.city, s.company, s.city, s.state_province, s.zip_postal_code
	FROM northwind.suppliers s
    INNER JOIN northwind.products p
    on s.id = p.supplier_ids;


-- ------------------------------------------------------------------
-- 12). Number of Products per Category With Less Than 5 Units
-- ------------------------------------------------------------------
SELECT category, COUNT(*) as units_of_stock
	FROM northwind.products
    GROUP BY category
    HAVING units_of_stock < 5;


-- ------------------------------------------------------------------
-- 13). Number of Products per Category Priced Less Than $20.00
-- ------------------------------------------------------------------
SELECT category, COUNT(list_price < 20) as products_priced_under_20
	FROM northwind.products
    GROUP BY category;
    
