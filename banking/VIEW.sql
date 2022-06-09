USE banking;

CREATE VIEW transfers_views AS
SELECT
	id,
    created_at,
    sender_id,
    (SELECT full_name FROM customers WHERE customers.id = sender_id) AS 'Sender Fullname',
    fees,
    fees_amount,
    recipient_id,
    (SELECT full_name FROM customers WHERE customers.id = recipient_id) AS 'Recipient Fullname',
    transfer_amount
FROM transfers;
    
    