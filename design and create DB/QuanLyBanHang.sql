CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE Customer (
	cID int NOT NULL PRIMARY KEY,
    cName varchar(50) NOT NULL,
    cAge int
);

CREATE TABLE `Order` (
	oID int NOT NULL PRIMARY KEY,
    cID int NOT NULL,
    oDate datetime,
    oTotalPrice int NOT NULL,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

CREATE TABLE Product (
	pID int NOT NULL PRIMARY KEY,
    pName varchar(30) NOT NULL,
    pPrice int NOT NULL
);

CREATE TABLE OrderDetail (
	oID int NOT NULL,
	pID int NOT NULL,customer
    odQTY varchar(30),
    PRIMARY KEY (oID,pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);