USE banking;

DELIMITER //
CREATE PROCEDURE sp_deposits(
	IN customer_id BIGINT,
    IN amount DECIMAL(12,0),
    OUT message VARCHAR(125)
)
BEGIN
	DECLARE exists_id INT;
    DECLARE current_balance DECIMAL(12,0);
    SET exists_id = (
		SELECT COUNT(*) 
        FROM customers c
        WHERE c.id = customer_id
	);
	SET current_balance = (
		SELECT balance 
        FROM customers c
        WHERE c.id = customer_id
	);
    
    IF (exists_id = 0)
    THEN
		SET message = 'Error: Customer id NOT available';
	ELSE IF (amount < 100)
		THEN
			SET message = 'Error: Amount min is 100';
		ELSE IF (current_balance + amount >= 1000000000000)
			THEN
				SET message = 'Error: Balance OVER 1000000000000! Transaction failed';
			ELSE
				UPDATE customers c
				SET c.balance = c.balance + amount
				WHERE c.id = customer_id;
				
				INSERT INTO deposits (
					created_at,
					customer_id,
					transaction_amount
				)
				VALUES (NOW(),customer_id,amount);
				SET message = 'Deposit succeed!';
			END IF;
		END IF;
	END IF;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_withdraws(
	IN customer_id BIGINT,
    IN amount DECIMAL(12,0),
    OUT message VARCHAR(125)
)
BEGIN
	DECLARE exists_id INT;
    DECLARE balance_id DECIMAL(12,0);

    SET exists_id = (
		SELECT COUNT(*) 
        FROM customers c
        WHERE c.id = customer_id
	);
    
    IF (exists_id = 0)
    THEN
		SET message = 'Error: Customer id NOT available';
	ELSE
		SET balance_id = (
			SELECT c.balance
			FROM customers c
			WHERE c.id = customer_id
		);

		IF (amount > balance_id)
		THEN
			SET message = 'Error: Amount over balance';
		ELSE IF (amount < 50)
			THEN
				SET message = 'Error: Amount withdraw min: 50';
			ELSE IF (amount > 1000000)
				THEN
					SET message = 'Error: Amount withdraw max: 1000000';
				ELSE
					UPDATE customers c
					SET c.balance = c.balance - amount
					WHERE c.id = customer_id;
					
					INSERT INTO withdraws (
						created_at,
						customer_id,
						transaction_amount
					)
					VALUES (NOW(),customer_id,amount);
					SET message = 'Withdraw succeed!';
				END IF;
			END IF;
		END IF;
	END IF;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_transfers(
	IN sender_id BIGINT,
    IN recipient_id BIGINT,
    IN transfer_amount DECIMAL(12,0),
    OUT message VARCHAR(125)
)
BEGIN
	DECLARE exists_sender_id INT;
    DECLARE exists_recipient_id INT;
    DECLARE balance_sender_id DECIMAL(12,0);
    DECLARE balance_recipient_id DECIMAL(12,0);
    DECLARE fees INT;
	DECLARE fees_amount DECIMAL(12,0);
	DECLARE transaction_amount DECIMAL(12,0);
    
    SET fees = 10;
    SET fees_amount = transfer_amount * 0.1;
	SET transaction_amount = transfer_amount + fees_amount + fees;
    SET exists_sender_id = (
		SELECT COUNT(*) 
        FROM customers c
        WHERE c.id = sender_id
	);
	SET exists_recipient_id = (
		SELECT COUNT(*) 
        FROM customers c
        WHERE c.id = recipient_id
	);
    
    IF (exists_sender_id = 0)
    THEN
		SET message = 'Error: Id customer send NOT available';
	ELSE IF (exists_recipient_id = 0)
		THEN
			SET message = 'Error: Id customer receive NOT available';
		ELSE
			SET balance_sender_id = (
				SELECT c.balance
				FROM customers c
				WHERE c.id = sender_id
			);
            SET balance_recipient_id = (
				SELECT c.balance
				FROM customers c
				WHERE c.id = recipient_id
			);

			IF (transaction_amount > balance_sender_id)
			THEN
				SET message = 'Error: Sender balance NOT enough money';
			ELSE IF (transfer_amount < 50)
				THEN
					SET message = 'Error: Amount transfers min: 50';
				ELSE IF (transfer_amount > 1000000)
					THEN
						SET message = 'Error: Amount transfers max: 1000000';
					ELSE IF (balance_recipient_id + transfer_amount >= 1000000000000)
						THEN
							SET message = 'Error: Balance recipient OVER 1000000000000! Transaction failed';
						ELSE
							UPDATE customers c
								SET c.balance = c.balance - transaction_amount
								WHERE c.id = sender_id;
							UPDATE customers c
								SET c.balance = c.balance + transfer_amount
								WHERE c.id = recipient_id;
							
							INSERT INTO transfers (
								created_at,
								fees,
								fees_amount,
								transaction_amount,
								transfer_amount,
								recipient_id,
								sender_id
							)
							VALUES (NOW(),10,fees_amount,transaction_amount,transfer_amount,recipient_id,sender_id);
							SET message = 'Transfers succeed!';
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
	END IF;
END //

DELIMITER ;
