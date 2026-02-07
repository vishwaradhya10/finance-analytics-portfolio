/*
Purpose:
Calculate customer lifetime in days.
*/

SELECT
    a.account_id,
    MIN(s.start_date) AS first_seen,
    COALESCE(MIN(c.churn_date), CURRENT_DATE) AS last_seen,
    (COALESCE(MIN(c.churn_date), CURRENT_DATE) - MIN(s.start_date)) AS lifetime_days
FROM accounts a
JOIN subscriptions s ON a.account_id = s.account_id
LEFT JOIN churn_events c ON a.account_id = c.account_id
GROUP BY a.account_id;
