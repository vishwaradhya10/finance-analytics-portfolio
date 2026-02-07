/*
Purpose:
Create churn label for each customer.
*/

SELECT
    a.account_id,
    CASE
        WHEN c.account_id IS NOT NULL THEN 1
        ELSE 0
    END AS churned
FROM accounts a
LEFT JOIN churn_events c ON a.account_id = c.account_id;
