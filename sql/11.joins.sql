
-- school db
-- INNER JOIN
SELECT Students.Name, Addresses.Address
FROM Students
INNER JOIN Addresses ON Students.Id = Addresses.StudentId;

-- LEFT JOIN
SELECT Students.Name, Addresses.Address
FROM Students
LEFT JOIN Addresses ON Students.Id = Addresses.StudentId;

-- RIGHT JOIN
SELECT Students.Name, Addresses.Address
FROM Students
RIGHT JOIN Addresses ON Students.Id = Addresses.StudentId;

-- FULL OUTER JOIN
SELECT Students.Name, Addresses.Address
FROM Students
FULL OUTER JOIN Addresses ON Students.Id = Addresses.StudentId;


-- company db

-- INNER JOIN
SELECT Employee.Name, Projects.Title
FROM Employee
INNER JOIN Projects ON Employee.Id = Projects.EmployeeId;

-- LEFT JOIN
SELECT Employee.Name, Projects.Title
FROM Employee
LEFT JOIN Projects ON Employee.Id = Projects.EmployeeId;

-- RIGHT JOIN
SELECT Employee.Name, Projects.Title
FROM Employee
RIGHT JOIN Projects ON Employee.Id = Projects.EmployeeId;

-- FULL OUTER JOIN
SELECT Employee.Name, Projects.Title
FROM Employee
FULL OUTER JOIN Projects ON Employee.Id = Projects.EmployeeId;


-- onlineshop db

-- INNER JOIN
SELECT Customers.Name, Items.Name AS ItemName, OrderHistory.OrderDate
FROM Customers
INNER JOIN OrderHistory ON Customers.UserId = OrderHistory.UserId
INNER JOIN Items ON OrderHistory.Itemid = Items.ItemId;

-- LEFT JOIN
SELECT Customers.Name, Items.Name AS ItemName, OrderHistory.OrderDate
FROM Customers
LEFT JOIN OrderHistory ON Customers.UserId = OrderHistory.UserId
LEFT JOIN Items ON OrderHistory.Itemid = Items.ItemId;

-- RIGHT JOIN
SELECT Customers.Name, Items.Name AS ItemName, OrderHistory.OrderDate
FROM Customers
RIGHT JOIN OrderHistory ON Customers.UserId = OrderHistory.UserId
RIGHT JOIN Items ON OrderHistory.Itemid = Items.ItemId;

-- FULL OUTER JOIN
SELECT Customers.Name, Items.Name AS ItemName, OrderHistory.OrderDate
FROM Customers
FULL OUTER JOIN OrderHistory ON Customers.UserId = OrderHistory.UserId
FULL OUTER JOIN Items ON OrderHistory.Itemid = Items.ItemId;
