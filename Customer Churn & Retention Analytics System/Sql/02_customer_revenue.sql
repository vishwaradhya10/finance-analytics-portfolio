/*
Purpose:
Calculate total revenue generated per customer.
*/

SELECT
    account_id,
    SUM(monthly_revenue) AS total_revenue
FROM subscriptions
GROUP BY account_id;
