/*
Purpose:
Calculate total monthly operating spend.

Marketing spend is used as a proxy for burn
in early-stage SaaS startups.
*/

SELECT
    month,
    SUM(spend) AS total_spend
FROM marketing_campaigns
GROUP BY month
ORDER BY month;

--Explanation--

* Aggregates monthly marketing expenses

* Represents cash outflow

* This helps estimate how much cash the company spends to grow.
