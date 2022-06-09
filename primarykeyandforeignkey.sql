create table customers (
	customer_number int not null primary key,
    fullname varchar(30) not null,
    address varchar(255),
    email varchar(255),
    phone varchar(10) not null
);

create table accounts (
	account_number int not null primary key,
    account_type varchar(30) not null,
    date_creat date not null,
    balance int(15)
);

create table transactions (
	tran_number int not null primary key,
    account_number int,
    date_ date not null,
    amounts int(15) not null,
    descriptions varchar(255),
    FOREIGN KEY (account_number) REFERENCES accounts(account_number)
);

alter table accounts
 add customer_number int,
 add FOREIGN KEY (customer_number) REFERENCES customers(customer_number)