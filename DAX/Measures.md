# DAX Measure Catalog

**42 portfolio measures** grouped by business purpose.

## Total Revenue
**Folder:** Core KPIs
```DAX
Total Revenue =
SUM('Sales'[NetRevenue])
```

## Gross Sales
**Folder:** Core KPIs
```DAX
Gross Sales =
SUM('Sales'[GrossSales])
```

## Total Cost
**Folder:** Core KPIs
```DAX
Total Cost =
SUM('Sales'[Cost])
```

## Gross Profit
**Folder:** Core KPIs
```DAX
Gross Profit =
SUM('Sales'[Profit])
```

## Gross Margin %
**Folder:** Core KPIs
```DAX
Gross Margin % =
DIVIDE([Gross Profit], [Total Revenue])
```

## Orders
**Folder:** Core KPIs
```DAX
Orders =
DISTINCTCOUNT('Sales'[OrderID])
```

## Units Sold
**Folder:** Core KPIs
```DAX
Units Sold =
SUM('Sales'[Quantity])
```

## Active Customers
**Folder:** Core KPIs
```DAX
Active Customers =
DISTINCTCOUNT('Sales'[CustomerID])
```

## Average Order Value
**Folder:** Core KPIs
```DAX
Average Order Value =
DIVIDE([Total Revenue], [Orders])
```

## Average Selling Price
**Folder:** Core KPIs
```DAX
Average Selling Price =
DIVIDE([Total Revenue], [Units Sold])
```

## Discount Amount
**Folder:** Sales Efficiency
```DAX
Discount Amount =
[Gross Sales] - [Total Revenue]
```

## Discount Rate %
**Folder:** Sales Efficiency
```DAX
Discount Rate % =
DIVIDE([Discount Amount], [Gross Sales])
```

## Revenue Budget
**Folder:** Targets
```DAX
Revenue Budget =
SUM('Budget'[RevenueBudget])
```

## Profit Budget
**Folder:** Targets
```DAX
Profit Budget =
SUM('Budget'[ProfitBudget])
```

## Revenue Variance
**Folder:** Targets
```DAX
Revenue Variance =
[Total Revenue] - [Revenue Budget]
```

## Revenue Attainment %
**Folder:** Targets
```DAX
Revenue Attainment % =
DIVIDE([Total Revenue], [Revenue Budget])
```

## Profit Variance
**Folder:** Targets
```DAX
Profit Variance =
[Gross Profit] - [Profit Budget]
```

## Profit Attainment %
**Folder:** Targets
```DAX
Profit Attainment % =
DIVIDE([Gross Profit], [Profit Budget])
```

## Revenue YTD
**Folder:** Time Intelligence
```DAX
Revenue YTD =
TOTALYTD([Total Revenue], 'Date'[Date])
```

## Revenue QTD
**Folder:** Time Intelligence
```DAX
Revenue QTD =
TOTALQTD([Total Revenue], 'Date'[Date])
```

## Revenue MTD
**Folder:** Time Intelligence
```DAX
Revenue MTD =
TOTALMTD([Total Revenue], 'Date'[Date])
```

## Revenue Previous Year
**Folder:** Time Intelligence
```DAX
Revenue Previous Year =
CALCULATE([Total Revenue], SAMEPERIODLASTYEAR('Date'[Date]))
```

## Revenue YoY Change
**Folder:** Time Intelligence
```DAX
Revenue YoY Change =
[Total Revenue] - [Revenue Previous Year]
```

## Revenue YoY %
**Folder:** Time Intelligence
```DAX
Revenue YoY % =
DIVIDE([Revenue YoY Change], [Revenue Previous Year])
```

## Revenue Previous Month
**Folder:** Time Intelligence
```DAX
Revenue Previous Month =
CALCULATE([Total Revenue], DATEADD('Date'[Date], -1, MONTH))
```

## Revenue MoM %
**Folder:** Time Intelligence
```DAX
Revenue MoM % =
DIVIDE([Total Revenue] - [Revenue Previous Month], [Revenue Previous Month])
```

## Rolling 3M Revenue
**Folder:** Time Intelligence
```DAX
Rolling 3M Revenue =
CALCULATE([Total Revenue], DATESINPERIOD('Date'[Date], MAX('Date'[Date]), -3, MONTH))
```

## Rolling 12M Revenue
**Folder:** Time Intelligence
```DAX
Rolling 12M Revenue =
CALCULATE([Total Revenue], DATESINPERIOD('Date'[Date], MAX('Date'[Date]), -12, MONTH))
```

## Return Orders
**Folder:** Returns
```DAX
Return Orders =
DISTINCTCOUNT('Returns'[OrderID])
```

## Return Rate %
**Folder:** Returns
```DAX
Return Rate % =
DIVIDE([Return Orders], [Orders])
```

## Refund Amount
**Folder:** Returns
```DAX
Refund Amount =
SUM('Returns'[RefundAmount])
```

## Net Revenue After Returns
**Folder:** Returns
```DAX
Net Revenue After Returns =
[Total Revenue] - [Refund Amount]
```

## Profit After Returns
**Folder:** Returns
```DAX
Profit After Returns =
[Gross Profit] - [Refund Amount]
```

## Revenue per Customer
**Folder:** Customer Analytics
```DAX
Revenue per Customer =
DIVIDE([Total Revenue], [Active Customers])
```

## New Customers
**Folder:** Customer Analytics
```DAX
New Customers =
VAR FirstDates = ADDCOLUMNS(VALUES('Customers'[CustomerID]), "FirstOrder", CALCULATE(MIN('Sales'[OrderDate]), ALL('Date'))) RETURN COUNTROWS(FILTER(FirstDates, [FirstOrder] IN VALUES('Date'[Date])))
```

## Repeat Customers
**Folder:** Customer Analytics
```DAX
Repeat Customers =
COUNTROWS(FILTER(VALUES('Sales'[CustomerID]), CALCULATE([Orders]) > 1))
```

## Repeat Customer Rate %
**Folder:** Customer Analytics
```DAX
Repeat Customer Rate % =
DIVIDE([Repeat Customers], [Active Customers])
```

## Product Rank by Revenue
**Folder:** Product Analytics
```DAX
Product Rank by Revenue =
RANKX(ALL('Products'[ProductName]), [Total Revenue],, DESC, Dense)
```

## Revenue Contribution %
**Folder:** Product Analytics
```DAX
Revenue Contribution % =
DIVIDE([Total Revenue], CALCULATE([Total Revenue], ALL('Products')))
```

## Top 10 Product Revenue
**Folder:** Product Analytics
```DAX
Top 10 Product Revenue =
CALCULATE([Total Revenue], TOPN(10, ALL('Products'[ProductName]), [Total Revenue], DESC))
```

## Selected KPI
**Folder:** Dynamic
```DAX
Selected KPI =
SWITCH(SELECTEDVALUE('KPI Selector'[KPI], "Revenue"), "Revenue", [Total Revenue], "Profit", [Gross Profit], "Orders", [Orders], "Customers", [Active Customers])
```

## Dynamic KPI Title
**Folder:** Dynamic
```DAX
Dynamic KPI Title =
SELECTEDVALUE('KPI Selector'[KPI], "Revenue") & " Performance"
```
