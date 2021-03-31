-- Use Item_Sales Database --
use Item_Sales;

-- Staff Queries -- 
select * from Staff;

select fName as "First name", lName as "Last name", department from Staff;

select fName as "First name", lName as "Last name" from Staff where department = 'Pc Components';

select distinct department from Staff;

select staffNumber as "Staff Id", concat(fName, ' ', lName) as "Staff Name" from Staff;

select staffNumber from Staff where lName like "Casey%";

select * from Staff where staffNumber between '1' and '5';

select concat (fName, ' ', lName) as "Staff Names" from Staff where department in ('Software', 'Monitors', 'Computer Accessories');

select concat(fName, ' ', lName) as "Staff Names" from Staff where department like 'Software' and staffNumber >= 5; 

select count(staffNumber) as "Number of Staff" from Staff;

select count(department) as "Number of departments" from Staff;

select max(salary) as "Highest salary" from Staff;

select min(salary) as "Lowest salary" from Staff;

select round(avg(salary),2) as "Average salary" from Staff;

select count(staffNumber) as "Number of staff per department", department from Staff group by department;

select concat(fName, ' ', lName) as "Staff Who make more than twenty thousand" from Staff group by salary having max(salary) >= 20000;

select orderNumber, orderDate, concat(fName, ' ', lName) as "Handled by"
from Staff natural join Orders;

-- Returns concat staff name that handles ordernumber and customerNumber
select concat(fName, ' ', lName) as "Staff Name", orderNumber, customerNumber
from Staff join Orders
on Staff.staffNumber = Orders.staffNumber;

-- Return helper name and staff number from Helps table
select helper, staffNumber
from Staff natural join Helps;

-- Returns the customer name concatenated and the order made by customer
select concat(custfName, ' ', custlName) as "Customer Name", orderNumber
from Staff join Orders
on Staff.staffNumber = Orders.staffNumber
join Customer
on Customer.customerNumber = Orders.customerNumber;

-- Returns the staff name who attended to a customer and the time they attended to the customer at
select concat(fName, ' ', lName) as "Attending Staff", concat(custfName, ' ', custlName) as "Customer", attendTime as "Time attended to"
from Staff join Attends
on Staff.staffNumber = Attends.staffNumber
join Customer
on Customer.customerNumber = Attends.customerNumber
order by attendTime asc;

-- Returns all details about a customer and the name of the staff that handled them if they made an order else null if they did not make an order
select concat(fName, ' ', lName) as "Staff Name", concat(custfName, ' ', custlName) as "Customer", street, town, county, email
from Staff right join Orders
on Staff.staffNumber = Orders.staffNumber
right join Customer
on Customer.customerNumber = Orders.customerNumber
order by fName, lName asc;

-- Returns all staff that handled a customer which also returns all details about the customer handled and returns null if a staff has not handled a customer
select concat(fName, ' ', lName) as "Staff Name", concat(custfName, ' ', custlName) as "Customer", street, town, county, email
from Staff left join Orders
on Staff.staffNumber = Orders.staffNumber
left join Customer
on Customer.customerNumber = Orders.customerNumber
order by custfName, custlName desc;

-- Customer --
select * from Customer;

-- Customer Queries --
select concat(custfName, ' ', custlName) as "Customer Names", town, street, county from Customer order by county asc;

select concat(custfName, ' ', custlName) as "Customer Name", street, town, county from Customer where county like 'Waterford' or county = 'Kilkenny' order by county desc;

select distinct town from Customer;

select concat(custfName, ' ', custlName) as "Customer Name" from Customer where customerNumber between '200' and '300';

select concat(custfName, ' ', custlName) as "Customer Name" from Customer where custfName like 'M%';

select customerNumber, email as "Customer email" from Customer where county like 'Kilkenny' or county like 'Tipperary' order by customerNumber desc;

select count(customerNumber) as "Amount of Customers" from Customer;

-- Returns customer name and all of that customers phone numbers
select concat(custfName, ' ', custlName) as "Customer Name", phoneNumber, customerNumber
from Customer natural left join customerPhones
order by customerNumber desc;

-- Returns the lowest priced order
select min(productPrice * quantity) as "Lowest Priced Order"
from Customer join Orders
on Customer.customerNumber = Orders.customerNumber
join Item
on Item.productCode = Orders.productCode
join Requests
on Requests.orderNumber = Orders.orderNumber;

-- Returns the highest priced order
select max(productPrice * quantity) as "Highest Priced Order"
from Customer join Orders
on Customer.customerNumber = Orders.customerNumber
join Item
on Item.productCode = Orders.productCode
join Requests
on Requests.orderNumber = Orders.orderNumber;

select round(avg(productPrice * quantity),2) as "Average Order Price"
from Customer join Orders
on Customer.customerNumber = Orders.customerNumber
join Item
on Item.productCode = Orders.productCode
join Requests
on Requests.orderNumber = Orders.orderNumber;

-- Returns all customers that made an order with their name, order number and the date the order was place and returns null for customers that have not made an order
select concat(custfName, ' ', custlName) as "Customer Name", orderNumber, orderDate
from Customer natural left join Orders
order by orderDate desc;

-- Returns the name, total price of a customers order and the order date
select concat(custfName, ' ', custlName) as "Customer Name", productPrice * quantity as "Total Price of Order", orderDate
from Customer join Orders
on Customer.customerNumber = Orders.customerNumber
join Item
on Item.productCode = Orders.productCode
join Requests
on Requests.orderNumber = Orders.orderNumber;

-- Supplier Queries --
select * from Supplier;

select count(supplierCode) as "Number of Suppliers" from Supplier;

select name, contactNumber, emailAddress from Supplier;

select name, town, street, county from Supplier;

-- Returns the supplier code and name as well as the product that each supplier has and its details
select supplierCode, name as "Supplier Name", productType as "Type", productColour as "Colour", productWeight as "Weight", productPrice as "Price"
from Supplier natural join Item
order by supplierCode asc;

-- Orders Queries -- 
select * from Orders;

select count(orderNumber) as "Amount of Orders" from Orders;

select orderDate, orderNumber from Orders;

-- Returns customer number, name and their order if the order occurred in 2020
select customerNumber, concat(custfName, ' ', custlName) as "Customer Name",orderNumber, orderDate
from Orders natural join Customer
where orderDate like '2020%';

-- Item Queries --
select * from Item;

select productType as "Products", productWeight as "Weight", productColour as "Colour", productPrice as "Price" from Item order by productPrice desc;

select count(productCode) as "Amount of Products" from Item;

-- Returns the amount of products in each category
select count(productCode) as "Amount of Products per Category", categoryName as "Category"
from Item natural join Category
group by categoryName
order by categoryName;

select productType as "All products" from Item ;

select round(avg(productPrice),2) as "Average Price of Items" from Item;

select productType, productColour from Item group by productType;

select productType as "Products", categoryName as "Category" from Item natural join Category order by categoryName;

select round(avg(productWeight),2) as "Average Weight of all products" from Item;

-- Requests Queries --
select * from Requests;

-- Attends Queries --
select * from Attends;

select staffNumber as "Staff number", customerNumber as "Customer number", attendTime as "Time attended" from Attends order by attendTime desc;


