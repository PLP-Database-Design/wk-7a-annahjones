-- Question 1: Achieving 1NF (First Normal Form)
-- Creating the normalized version of ProductDetail
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Inserting rows, each with a single product per order
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- Create Orders table (OrderID -> CustomerName)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert unique orders
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

--OUTPUT--
OrderID | CustomerName | Product
101 | John Doe | Laptop
101 | John Doe | Mouse
102 | Jane Smith | Tablet
102 | Jane Smith | Keyboard
102 | Jane Smith | Mouse
103 | Emily Clark | Phone
    
OrderID | CustomerName
101 | John Doe
102 | Jane Smith
103 | Emily Clark

-- Question 2: Achieving 2NF (Second Normal Form)
-- Create OrderItems table (OrderID + Product -> Quantity)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert items
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

--OUTPUT--
OrderID | Product | Quantity
101 | Laptop | 2
101 | Mouse | 1
102 | Tablet | 3
102 | Keyboard | 1
102 | Mouse | 2
103 | Phone | 1
