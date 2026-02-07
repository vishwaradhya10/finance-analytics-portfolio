/*
Purpose:
Create final churn feature dataset.
*/

WITH lifetime AS (
    SELECT
        a.account_id,
        (COALESCE(MIN(c.churn_date), CURRENT_DATE) - MIN(s.start_date)) AS lifetime_days
    FROM accounts a
    JOIN subscriptions s ON a.account_id = s.account_id
    LEFT JOIN churn_events c ON a.account_id = c.account_id
    GROUP BY a.account_id
),
revenue AS (
    SELECT
        account_id,
        SUM(monthly_revenue) AS total_revenue
    FROM subscriptions
    GROUP BY account_id
),
label AS (
    SELECT
        a.account_id,
        CASE WHEN c.account_id IS NOT NULL THEN 1 ELSE 0 END AS churned
    FROM accounts a
    LEFT JOIN churn_events c ON a.account_id = c.account_id
)
SELECT
    l.account_id,
    l.lifetime_days,
    r.total_revenue,
    lbl.churned
FROM lifetime l
JOIN revenue r USING (account_id)
JOIN label lbl USING (account_id);
