/*
Purpose:
Calculate total marketing spend by channel.
*/

SELECT
    channel,
    SUM(spend) AS total_spend
FROM marketing_campaigns
GROUP BY channel
ORDER BY total_spend DESC;
