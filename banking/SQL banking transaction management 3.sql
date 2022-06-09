USE banking;

SELECT 
	sender_id,
    (SELECT full_name FROM customers WHERE customers.id = sender_id) AS 'Sender Name',
    SUM(transfer_amount) AS 'Total',
    MONTH(created_at) AS 'Month',
    YEAR(created_at) AS 'Year',
    (CASE
		WHEN SUM(transfer_amount) >= 1000 THEN 'Good'
        ELSE 'Bad'
	END) AS 'Rate'
FROM transfers
GROUP BY sender_id,Month
ORDER BY Month,total;

SELECT 
	cus.id,
    cus.full_name,
    SUM(trf.transfer_amount) AS 'Total',
    MONTH(trf.created_at) AS 'Month',
    YEAR(trf.created_at) AS 'Year',
    CASE
		WHEN SUM(trf.transfer_amount) >= 1000 THEN 'Good'
        WHEN SUM(trf.transfer_amount) > 0 THEN 'Bad'
	END AS 'Rate'
FROM customers cus
LEFT JOIN transfers trf
ON cus.id = trf.sender_id
GROUP BY cus.id, Month
