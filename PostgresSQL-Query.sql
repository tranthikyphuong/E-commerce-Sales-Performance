-- Establish relationships between tables
ALTER TABLE salesdata ADD CONSTRAINT  fk_customer
FOREIGN KEY userid 
REFERENCES customerdetails(customerid);
ALTER TABLE salesdata ADD CONSTRAINT  fk_product
FOREIGN KEY productid 
REFERENCES productdetails(uniqeid);
-- Retrieve the list of top-selling products
WITH ProductSales AS (
    SELECT s.productID, p.productName, COUNT(*) AS TotalSales
    FROM SalesData s
    JOIN ProductDetails p ON s.productID = p.UniqeID
    GROUP BY s.productID, p.productName
)
SELECT * FROM ProductSales
ORDER BY TotalSales DESC
LIMIT 10;
-- Calculate the total revenue by product category
WITH CategoryRevenue AS (
    SELECT c.Category, SUM(c.PurchaseAmount) AS TotalRevenue
    FROM CustomerDetails c
    GROUP BY c.Category
)
SELECT * FROM CategoryRevenue
ORDER BY TotalRevenue DESC;
-- Identify loyal customers (frequent buyers)
WITH LoyalCustomers AS (
    SELECT CustomerID, COUNT(*) AS PurchaseFrequency
    FROM CustomerDetails
    GROUP BY CustomerID
)
SELECT * FROM LoyalCustomers
ORDER BY PurchaseFrequency DESC
LIMIT 10;
-- Calculate the average review rating for each product
WITH ProductReviews AS (
    SELECT itempurchased AS Product, ROUND(AVG(reviewrating),1) AS Rating
    FROM customerdetails
    WHERE reviewrating IS NOT NULL
    GROUP BY itempurchased
    )
SELECT * FROM ProductReviews
ORDER BY Rating DESC;
-- Determine peak purchasing periods by season
WITH SeasonalPurchases AS (
    SELECT Season, COUNT(*) AS TotalPurchases
    FROM CustomerDetails
    GROUP BY Season
)
SELECT * FROM SeasonalPurchases
ORDER BY TotalPurchases DESC;
Create Table Overview
CREATE TABLE Overview AS ( 
SELECT  c.customerid, c.category, c.location,
         p.uniqeid, p.subcategory,c.purchaseamount, s.timestamp
FROM SalesData s
RIGHT JOIN CustomerDetails c ON s.userID = c.CustomerID
RIGHT JOIN ProductDetails p ON s.productid = p.uniqeid
);
Create table Customer
CREATE TABLE Customer AS (
    SELECT c.customerid, c.age,c.gender,c.frequencyofpurchases,
            c.season, c.shippingtype, s.interactiontype, s.timestamp

    FROM SalesData s
    RIGHT JOIN CustomerDetails c ON s.userID = c.CustomerID
)
-- Create table Product
CREATE TABLE Product AS (
    SELECT p.uniqeid, p.subcategory, c.shippingtype, 
    s.timestamp, p.isamazonseller, c.paymentmethod
    FROM SalesData s
    RIGHT JOIN CustomerDetails c ON s.userID = c.CustomerID
    RIGHT JOIN ProductDetails p ON s.productid = p.uniqeid
)

