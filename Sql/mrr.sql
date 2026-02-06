/*
Purpose:
Calculate Monthly Recurring Revenue (MRR).

MRR represents predictable monthly revenue generated
from active subscriptions.
*/

SELECT
    DATE_TRUNC('month', start_date) AS month,
    SUM(monthly_revenue) AS total_mrr
FROM subscriptions
GROUP BY month
ORDER BY month;
