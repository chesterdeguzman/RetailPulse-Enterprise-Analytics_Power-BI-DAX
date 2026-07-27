-- Monthly performance with prior-month comparison
WITH Monthly AS (
 SELECT DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) AS MonthStart, SUM(NetRevenue) Revenue, SUM(Profit) Profit
 FROM Sales GROUP BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1)
)
SELECT MonthStart, Revenue, Profit, LAG(Revenue) OVER (ORDER BY MonthStart) AS PriorMonthRevenue,
       Revenue-LAG(Revenue) OVER (ORDER BY MonthStart) AS RevenueChange
FROM Monthly ORDER BY MonthStart;

-- Top products within each category
WITH ProductSales AS (
 SELECT p.Category,p.ProductName,SUM(s.NetRevenue) Revenue,
 ROW_NUMBER() OVER(PARTITION BY p.Category ORDER BY SUM(s.NetRevenue) DESC) AS RankInCategory
 FROM Sales s JOIN Products p ON p.ProductID=s.ProductID GROUP BY p.Category,p.ProductName
)
SELECT * FROM ProductSales WHERE RankInCategory<=5;

-- Customer value segmentation
SELECT c.CustomerID,c.CustomerName,COUNT(DISTINCT s.OrderID) Orders,SUM(s.NetRevenue) Revenue,SUM(s.Profit) Profit,
 CASE WHEN SUM(s.NetRevenue)>=10000 THEN 'Platinum' WHEN SUM(s.NetRevenue)>=5000 THEN 'Gold' WHEN SUM(s.NetRevenue)>=2000 THEN 'Silver' ELSE 'Bronze' END ValueTier
FROM Customers c JOIN Sales s ON s.CustomerID=c.CustomerID
GROUP BY c.CustomerID,c.CustomerName ORDER BY Revenue DESC;
