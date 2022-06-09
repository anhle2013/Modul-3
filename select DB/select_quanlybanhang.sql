USE quanlybanhang;

INSERT INTO customer
VALUES
	(1,'Minh Quan',10),
    (2,'Ngoc Oanh',20),
    (3,'Hong Ha',50);
    
INSERT INTO `order` (oID,cID,oDate)
VALUES
	(1,1,'2006-03-21'),
    (2,2,'2006-03-23'),
    (3,1,'2006-03-16');
    
INSERT INTO product
VALUES
	(1,'May giat',3),
    (2,'Tu lanh',5),
    (3,'Dieu hoa',7),
    (4,'Quat',1),
    (5,'Bep dien',2);
    
INSERT INTO orderdetail
VALUES
	(1,1,3),
    (1,3,7),
    (1,4,2),
    (2,1,1),
    (3,1,8),
    (2,5,4),
    (2,3,3);
    
SELECT oID,oDate,oTotalPrice FROM `order`;

SELECT 
	cus.cID,
    cus.Name,
    o.oDate,
    p.pName,
    p.pPrice,
    od.odQTY
FROM customer cus
JOIN `order` o
ON cus.cID = o.cID
JOIN orderdetail od
ON o.oID = od.oID
JOIN product p
ON od.pID = p.pID
GROUP BY cus.Name,p.pName;

SELECT 
	`order`.cID,
    customer.Name,
    COUNT(`order`.cID) AS SoLanMuaHang
FROM `order`
JOIN customer
ON customer.cID = `order`.cID
GROUP BY `order`.cID;

SELECT 
	cus.cID,
    cus.Name
FROM customer cus
WHERE NOT EXISTS (
	SELECT * FROM `order` o
	WHERE cus.cID = o.cID
);

SELECT 
	o.oID,
    o.oDate,
    o.TotalPrice
FROM `order`; 

UPDATE `order` 
SET o.TotalPrice = od.odQTY * p.pPrice
WHERE (`order`.oID = orderdetail.oID) AND (orderdetail.pID = product.pID);

UPDATE `order`
SET `order`.oTotalPrice = (
    SELECT orderdetail.odQTY
    FROM orderdetail
    WHERE `order`.oID = orderdetail.oID
);
