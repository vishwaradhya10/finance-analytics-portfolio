/*
Purpose:
Calculate net burn by combining revenue and spend.
*/

WITH mrr AS (
    SELECT
        DATE_TRUNC('month', start_date) AS month,
        SUM(monthly_revenue) AS total_mrr
    FROM subscriptions
    GROUP BY month
),
spend AS (
    SELECT
        month,
        SUM(spend) AS total_spend
    FROM marketing_campaigns
    GROUP BY month
)
SELECT
    m.month,
    total_mrr,
    total_spend,
    (total_spend - total_mrr) AS net_burn
FROM mrr m
JOIN spend s USING (month)
ORDER BY m.month;

--Explanation--

* Combines revenue and expenses

* Calculates net cash loss or gain

* Net burn shows whether the startup is losing or generating cash.
