/*
Purpose:
Calculate number of customers acquired per month.
*/

SELECT
    DATE_TRUNC('month', signup_date) AS month,
    COUNT(account_id) AS customers_acquired
FROM accounts
GROUP BY month
ORDER BY month;
