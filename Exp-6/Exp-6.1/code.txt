CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Laptop', 'Electronics', 60000),
(2, 'Mobile Phone', 'Electronics', 25000),
(3, 'Headphones', 'Electronics', 3000),
(4, 'Office Chair', 'Furniture', 8000),
(5, 'Keyboard', 'Electronics', 1500),
(6, 'Study Table', 'Furniture', 7000),
(7, 'Backpack', 'Accessories', 2000);

CREATE TABLE Order_Details (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Order_Details 
(OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
(101, 1001, 1, 1, 60000),
(102, 1001, 3, 2, 3000),
(103, 1002, 2, 1, 25000),
(104, 1003, 4, 1, 8000),
(105, 1004, 1, 1, 60000);

CREATE VIEW Unsold_Items AS
SELECT p.ProductName, p.Category
FROM Products p
WHERE NOT EXISTS (
    SELECT 1
    FROM Order_Details od
    WHERE od.ProductID = p.ProductID
);

SELECT * FROM Unsold_Items;