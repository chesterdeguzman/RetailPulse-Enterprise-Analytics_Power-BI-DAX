-- RetailPulse Enterprise Analytics
-- SQL Server compatible schema
CREATE TABLE Regions (RegionID INT PRIMARY KEY, RegionName VARCHAR(50), City VARCHAR(50), StateCode CHAR(2), Territory VARCHAR(20));
CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(100), Category VARCHAR(50), Subcategory VARCHAR(50), Brand VARCHAR(50), ListPrice DECIMAL(12,2), UnitCost DECIMAL(12,2), Status VARCHAR(20));
CREATE TABLE Customers (CustomerID INT PRIMARY KEY, CustomerName VARCHAR(100), Email VARCHAR(150), Segment VARCHAR(30), Age INT, RegionID INT REFERENCES Regions(RegionID), SignupDate DATE);
CREATE TABLE Employees (EmployeeID INT PRIMARY KEY, EmployeeName VARCHAR(100), Role VARCHAR(50), RegionID INT REFERENCES Regions(RegionID), HireDate DATE);
CREATE TABLE Sales (OrderID INT PRIMARY KEY, OrderDate DATE, CustomerID INT REFERENCES Customers(CustomerID), ProductID INT REFERENCES Products(ProductID), RegionID INT REFERENCES Regions(RegionID), EmployeeID INT REFERENCES Employees(EmployeeID), Channel VARCHAR(30), ShipMode VARCHAR(30), Quantity INT, UnitPrice DECIMAL(12,2), DiscountPct DECIMAL(6,4), GrossSales DECIMAL(14,2), NetRevenue DECIMAL(14,2), Cost DECIMAL(14,2), Profit DECIMAL(14,2), TargetRevenue DECIMAL(14,2));
CREATE TABLE Returns (ReturnID INT PRIMARY KEY, OrderID INT REFERENCES Sales(OrderID), ReturnDate DATE, ProductID INT REFERENCES Products(ProductID), CustomerID INT REFERENCES Customers(CustomerID), ReturnReason VARCHAR(50), RefundAmount DECIMAL(14,2), Resolution VARCHAR(20));
CREATE TABLE Budget (BudgetMonth DATE, RegionID INT REFERENCES Regions(RegionID), RevenueBudget DECIMAL(14,2), ProfitBudget DECIMAL(14,2), PRIMARY KEY (BudgetMonth,RegionID));
