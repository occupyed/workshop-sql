CREATE DATABASE OnlineShop;
USE OnlineShop;

-- Create Customers Table
CREATE TABLE Customers(
 UserId INT NOT NULL PRIMARY KEY,
 Name VARCHAR(80) NOT NULL,
 Phone VARCHAR(15),
 Address VARCHAR(150)
);

-- Populate the Customers Table with test data
INSERT INTO Customers VALUES (1, 'Jimmy','4567891230','Mumbai');
INSERT INTO Customers VALUES (2, 'Henry','1234567890','Delhi');
INSERT INTO Customers VALUES (3, 'Ruby','7539514682','BBSR');
INSERT INTO Customers VALUES (4, 'Julia','3571592486','Mumbai');
INSERT INTO Customers VALUES (5, 'Anna','0231456785','Delhi');

-- Create ITEMS Table
CREATE TABLE Items(
 ItemId INT NOT NULL PRIMARY KEY,
 CategoryId INT,
 Name VARCHAR(100) NOT NULL,
 Price FLOAT
);

-- Populate the Items Table with test data
INSERT INTO items VALUES (1, 1, 'Androud Mobile Phone', 250.00);
INSERT INTO items VALUES (2, 1, 'i7 processor, 8GB RAM Laptop', 1000.00);
INSERT INTO items VALUES (3, 2, 'How to train your cat', 25.00);
INSERT INTO items VALUES (4, 2, 'Healthy dog food recipes', 19.00);
INSERT INTO items VALUES (5, 2, 'Learn how to meditate for mental health', 30.00);
INSERT INTO items VALUES (6, 3, 'Beautiful Black T-Shirts', 99.00);
INSERT INTO items VALUES (7, 3, 'Blue Colored Jeans', 150.00);

-- Create OrderHistory Table
CREATE TABLE OrderHistory (
     OrderHistoryId INT PRIMARY KEY,
    UserId INT NOT NULL, 
    Itemid INT NOT NULL, 
     OrderDate DATE
);

-- Populate the OrderHistory Table with test data
INSERT INTO OrderHistory VALUES (1, 5, 1, '2016-02-14');
INSERT INTO OrderHistory VALUES (2, 1, 1, '2016-02-14');
INSERT INTO OrderHistory VALUES (3, 5, 3, '2016-02-14');
INSERT INTO OrderHistory VALUES (4, 1, 3, '2016-02-14');


-- Retrieve all orders made by a specific customer (e.g., customer with UserId 1) with details of the items ordered:
SELECT OrderHistory.OrderHistoryId, OrderHistory.OrderDate, Items.Name, Items.Price
FROM OrderHistory
JOIN Items ON OrderHistory.ItemId = Items.ItemId
WHERE OrderHistory.UserId = 1;

-- Retrieve all customers who have ordered a specific item (e.g., item with ItemId 1) along with their order details:
SELECT Customers.Name, OrderHistory.OrderDate
FROM Customers
JOIN OrderHistory ON Customers.UserId = OrderHistory.UserId
WHERE OrderHistory.ItemId = 1;

-- Retrieve the total number of orders made by each customer:
SELECT Customers.UserId, Customers.Name, COUNT(OrderHistory.OrderHistoryId) AS TotalOrders
FROM Customers
LEFT JOIN OrderHistory ON Customers.UserId = OrderHistory.UserId
GROUP BY Customers.UserId;

-- Retrieve the total revenue generated from each item:
SELECT Items.ItemId, Items.Name, SUM(Items.Price) AS TotalRevenue
FROM Items
JOIN OrderHistory ON Items.ItemId = OrderHistory.ItemId
GROUP BY Items.ItemId;

-- Retrieve the top-selling items along with the number of times each item has been ordered:
SELECT Items.ItemId, Items.Name, COUNT(OrderHistory.OrderHistoryId) AS TotalOrders
FROM Items
JOIN OrderHistory ON Items.ItemId = OrderHistory.ItemId
GROUP BY Items.ItemId
ORDER BY TotalOrders DESC;
