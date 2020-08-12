-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT *
FROM products
  join categories on products.categoryId = categories.categoryId
-- WORKING --



-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT *
FROM orderDetails
  join orders on orderDetails.orderId = orders.orderId
  join shippers on orders.shipperId = shippers.shipperId
order by orders.orderDate desc
-- NOT SURE IF CORRECT, RETURNING CORRECT COLUMNS BUT WRONG AMOUNT OF RECORDS --



-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
-- OrderID(OrderDetails) | ProductName(products) | Quantity(orderDetails)
select orderDetails.orderId, products.productName, orderDetails.quantity
from orderDetails
  join products on orderDetails.productId = products.productId
where orderDetails.orderId = 10251
-- WORKING --



-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
-- OrderID(OrderDetails) | CustomerID(Customers) | CustomerName(Customers) | EmployeeID(Employees) | LastName(Employees) 
select orderDetails.orderId, orders.customerId, customers.customerName, orders.employeeId, employees.lastName
from orderDetails
  join orders on orderDetails.orderId = orders.orderId
  join customers on orders.customerId = customers.customerId
  join employees on orders.employeeId = employees.employeeId;
  -- NOT SURE IF CORRECT, RETURNING CORRECT COLUMNS BUT WRONG AMOUNT OF RECORDS --