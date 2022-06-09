create database car_manament;

create table car_manament.customers (
	customerNumber int not null primary key,
    customerName varchar(50) not null,
    contactLastName varchar(50) not null,
	contactFirstName varchar(50) not null,
	phone varchar(50) not null,
    addressLine1 varchar(50) not null,
	addressLine2 varchar(50),
	city varchar(50) not null,
    state varchar(50) not null,
    postalCode varchar(15) not null,
    country varchar(50) not null,
    creditLimit float
);

create table car_manament.orders (
	orderNumber int not null primary key,
    orderDate date not null,
    requiredDate date not null,
	shippedDate date,
	status varchar(15) not null,
    comments text,
	addressLine2 varchar(50),
	quantityOrdered int not null,
    priceEach float not null
);

create table car_manament.payments (
	customerNumber int not null,
    checkNumber varchar(50) not null,
    paymentDate date not null,
	amount float not null
);

create table car_manament.products (
	productCode varchar(15) not null primary key,
    productName varchar(70) not null,
    productScale varchar(10) not null,
	productVendor varchar(50) not null,
	productDescription text not null,
    quantityInStock int not null,
    buyPrice float not null,
    MSRP float not null
);

create table car_manament.productlines (
	productLine varchar(50) not null primary key,
    textDescription char,
    image char
);

create table car_manament.employees (
	employeeNumber int not null primary key,
    lastName varchar(50) not null,
    firstName varchar(50) not null,
	email varchar(100) not null,
	jobTitle varchar(50) not null
);

create table car_manament.offices (
	officeCode varchar(10) not null primary key,
    city varchar(50) not null,
    phone varchar(50) not null,
	addressLine1 varchar(50) not null,
	addressLine2 varchar(50),
    state varchar(50),
    country varchar(50) not null,
    postalCode varchar(15) not null
);

alter table car_manament.orders
	add customerNumber int,
    add foreign key (customerNumber) references car_manament.customers(customerNumber);

alter table car_manament.payments
    add foreign key (customerNumber) references car_manament.customers(customerNumber);
    
create table car_manament.orderDetails  (
	productCode varchar(15),
    orderNumber int,
	foreign key (productCode) references car_manament.products(productCode),
    foreign key (orderNumber) references car_manament.orders(orderNumber)
);

alter table car_manament.products
	add productLine varchar(50),
    add foreign key (productLine) references car_manament.productlines(productLine);
    
alter table car_manament.customers
	add salesRepEmployeeNumber int,
    add foreign key (salesRepEmployeeNumber) references car_manament.employees(employeeNumber);
    
alter table car_manament.employees
	add reportTo int,
    add foreign key (reportTo) references car_manament.employees(employeeNumber),
    add officeCode varchar(10),
	add foreign key (officeCode) references car_manament.offices(officeCode);