-- Create database Item_Sales --
CREATE DATABASE IF NOT EXISTS Item_Sales;

-- Create Staff table --
Create table if not exists Staff
(
staffNumber int auto_increment,
fName varchar (20),
lName varchar (20),
salary int,
department ENUM ('Pc Components', 'Peripherals', 'Monitors', 'Software', 'Computer Accessories', 'Pre-built Computers')NOT NULL,
Primary key(staffNumber) 
);

-- Insert values into Staff table --
Insert into Staff (fName, lName, salary, department) values
('Evan', 'Casey', '22390', 'Software'),
('Conor', 'Casey', '15160', 'Peripherals'),
('Kevin', 'Doherty', '16530', 'Computer Accessories'),
('Morgan', 'McKnight', '21780', 'Pc Components'),
('James', 'Phelan', '25120', 'Monitors'),
('Luke', 'Walsh', '31890', 'Pre-built Computers'),
('James', 'Donovan', '10540', 'Peripherals'),
('Emma', 'Casey', '12230', 'Computer Accessories'),
('Stevan', 'Lazic', '27532', 'Pc Components'),
('Killian', 'Fitzgerald', '32456', 'Software');

-- Create Helps table --
Create table if not exists Helps
(
helper varchar(40),
staffNumber int,
Primary key (staffNumber, helper),
constraint fk_staffHelp Foreign key (staffNumber) references Staff(staffNumber)
on update cascade
on delete no action
);

-- Insert values into Helps --
Insert into Helps values
('Evan casey', '1'),
('Killian Fitzgerald', '10'),
('James Phelan', '5');

-- Create Customer table --
Create table if not exists Customer
(
customerNumber int,
custfName varchar (20),
custlName varchar (20),
street varchar (30),
town varchar (40), 
county varchar (40),
email varchar (40),
Primary key(customerNumber)
);

-- Insert values into Customer table -- 
Insert into Customer values
('245', 'Fiona', 'Donovan', '12 Queen Street', 'Piltown', 'Kilkenny', 'fionadonovan@hotmail.com'),
('270', 'Xaver', 'Urban', '13 Ard Mhuire', 'Carrick-on-Suir', 'Tipperary', 'xurban2000@gmail.com'),
('220', 'Mark', 'Murphy', '30 Oak View', 'Carrick-on-Suir', 'Tipperary', 'mmurphy1971@gmail.com'),
('263', 'Robert', 'Briscoe', '22 Lower Street', 'Dunmore East', 'Waterford', 'robertbris1999@hotmail.com'),
('289', 'Seamus', 'O Dwyer', '37 Ard Mhuire', 'Ardmore', 'Waterford', 'sod@gmail.com'),
('310', 'John', 'Casey', '27 Upper Street', 'Portlaw', 'Waterford', 'jcasey@gmail.com'),
('199', 'Liam', 'Kelly', '13 O Connell Street', 'Waterford City', 'Waterford', 'lk@outlook.com'),
('172', 'Mark', 'Twain', '12 Ard Mhuire', 'Piltown', 'Kilkenny', 'markt@gmail.com'),
('326', 'Eric', 'Blair', '19 Parnell Street', 'Carrick-on-Suir', 'Tipperary', 'eblair@gmail.com'),
('217', 'Arthur', 'Doyle', '10 Oak View', 'Carrick-on-Suir', 'Tipperary', 'arthurdoyle1901@gmail.com');

-- Create table customerPhones --
Create table if not exists customerPhones
(
phoneNumber bigint not null,
customerNumber int,
Primary key (phoneNumber, customerNumber),
constraint fk_customerPhone Foreign key (customerNumber) references Customer(customerNumber)
on update cascade
on delete no action
);

-- Inserting values into customerPhones --
Insert into customerPhones values 
('0890342314', '172'),
('0893241236', '172'),
('0892315234', '217'),
('0891263487', '310'),
('0897629832', '310'),
('0894527852', '326'),
('0894376293', '263'),
('0897563915', '199'),
('0893427613', '289'),
('0893246834', '289');

-- Create Supplier table --
Create table if not exists Supplier 
(
supplierCode int auto_increment,
name varchar (50),
street varchar (50),
town varchar (60),
county varchar (60),
contactNumber int,
emailAddress varchar (45),
Primary key (supplierCode)
);

-- Insert values into Supplier table --
Insert into Supplier(name, street, town, county, contactNumber, emailAddress) values 
('Newegg', '17 Upper Queen Street', 'Cork City', 'Cork', '0833576212', 'neweggireland@gmail.com'),
('Komplette', '15 ringveien', 'Sandefjord', 'Vestfold og Telemark', '0833456321', 'kompletteie@gmail.com'),
('Overclockers', '5 Lymedale Cross Industrial Estate', 'Newcastle-under-Lyme', 'Staffordshire', '0511234652', 'oclockersuk@gmail.com');

-- Create Orders table --
Create table if not exists Orders
(
orderNumber int auto_increment,
orderDate date,
orderTime time,
staffNumber int,
customerNumber int,
productCode int,
Primary key (orderNumber),
constraint fk_staff Foreign key (staffNumber) references Staff(staffNumber)
on update cascade
on delete no action,
constraint fk_customer Foreign key (customerNumber) references Customer(customerNumber)
on update cascade
on delete no action,
constraint fk_productcodes Foreign key (productCode) references Item(productCode)
on update cascade
on delete no action
);

-- Insert values into Orders table --
Insert into Orders (orderDate, orderTime, staffNumber, customerNumber, productCode) values
('2020-11-20', '121500', '1', '245', '3'),
('2020-10-13', '121100', '4', '289', '6'),
('2019-04-09', '161900', '7', '172', '1'),
('2019-06-12', '171800', '9', '326', '11'),
('2017-01-01', '201200', '2', '217', '8');

-- Create Category table -- 
Create table if not exists Category 
(
categoryCode int auto_increment,
categoryName varchar (40),
Primary key (categoryCode)
);

-- Insert values into Category table --
Insert into Category (categoryName) values
('RAM'),
('GPU'),
('CPU'),
('HDD'),
('SSD'),
('PSU'),
('Motherboards'),
('Cases'),
('Mouses'),
('Keyboards'),
('mousepads'),
('Monitor');

-- Create Item table -- 
Create table if not exists Item
(
productCode int auto_increment,
productType varchar (150),
productWeight double (7, 2),
productColour varchar (35),
productPrice int,
supplierCode int,
categoryCode int,
Primary key (productCode),
constraint fk_supplier Foreign key (supplierCode) references Supplier(supplierCode)
on update cascade
on delete no action,
constraint fk_category Foreign key (categoryCode) references Category(categoryCode)
on update cascade
on delete no action
);

-- Inserting values into Item table --
Insert into Item (productType, productWeight, productColour, productPrice, supplierCode, categoryCode) values
('MSI Gaming GeForce GTX 1660 192-Bit HDMI/DP 6GB GDRR5', '1.5', 'Silver/Black', '310', '1', '2'),
('EVGA GeForce GTX 1080 Ti Gaming 11GB GDDR5X', '2', 'Black', '200','1', '2'),
('ZOTAC Gaming GeForce RTX 3080 Trinity 10GB GDDR6X', '2.5', 'Black', '550', '3', '2'),
('AMD Ryzen 5 3600', '45.3', 'Silver', '250', '2', '3'),
('Intel i5 9600k', '68', 'Silver', '210', '2', '3'),
('Corsair CMK16GX4M2B3200C16 Vengeance LPX 16 GB (2 x 8 GB) DDR4 3200 MHz', '90.7', 'Black', '100', '1', '1'),
('CORSAIR TX850M Semi-Modular ATX PSU - 850 W', '1.78', 'Black', '70', '1', '6'),
('WD Red 3.5" Internal Hard Drive - 6 TB', '0.710', 'Red', '225', '2', '4'),
('MSI B450 TOMAHAWK AM4 Motherboard', '	1.5', 'Black', '150', '3', '7'),
('CORSAIR Carbide Series 275R Mid-Tower ATX', '8.56', 'Black', '65', '3', '8'),
('CORSAIR Crystal Series 570X RGB Mid-Tower ATX', '10.9', 'Black', '189', '1', '8');

-- Create Requests table --
Create table if not exists Requests
(
quantity int,
productCode int,
orderNumber int,
Primary key (orderNumber, productCode),
constraint fk_ordernumreq Foreign key (orderNumber) references Orders(orderNumber)
on update cascade
on delete no action,
constraint fk_prodcodereq Foreign key (productCode) references Item(productCode)
on update cascade
on delete no action
); 

-- Insert values into requests table -- 
Insert into Requests (quantity, productCode, orderNumber) values 
('4', '1', '1'),
('6', '4', '3'),
('7', '3', '4'),
('3', '11', '5'),
('3', '8', '2');


-- Create Attends table --
Create table if not exists Attends
(
attendTime time, 
staffNumber int,
customerNumber int, 
Primary key (staffNumber, customerNumber),
constraint fk_attendstaff Foreign key (staffNumber) references Staff(staffNumber)
on update cascade
on delete no action,
constraint fk_attendcustomer Foreign key (customerNumber) references Customer(customerNumber)
on update cascade
on delete no action
);

-- Insert values into Attends -- 
Insert into Attends values 
('120000', '1', '172'),
('133000', '1', '245'),
('154500', '5', '263'),
('102400', '1', '199'),
('091200', '2', '326'),
('174800', '5', '220'),
('195100', '9', '310'),
('200000', '9', '289'),
('083200', '2', '217'),
('163500', '3', '270');

commit;

