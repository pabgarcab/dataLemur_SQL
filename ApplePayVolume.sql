-- Visa is analysing its partnership with ApplyPay. Calculate the total transaction volume for each merchant where the transaction was performed via ApplePay.
-- Output the merchant ID and the total transactions. For merchants with no ApplePay transactions, output their total transaction volume as 0. Display the result in descending order of the transaction volume.

SELECT merchant_id, sum(CASE 
                            WHEN LOWER(payment_method) = 'apple pay' THEN  transaction_amount
                            ELSE 0
                            END) as total_transaction
FROM transactions
GROUP BY merchant_id
ORDER BY total_transaction DESC;
