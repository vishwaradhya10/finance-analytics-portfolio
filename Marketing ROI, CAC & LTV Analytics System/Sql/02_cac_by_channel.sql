/*
Purpose:
Calculate Customer Acquisition Cost (CAC) by channel.
*/

SELECT
    channel,
    SUM(spend) AS total_spend,
    SUM(conversions) AS total_conversions,
    SUM(spend) / NULLIF(SUM(conversions), 0) AS cac
FROM marketing_campaigns
GROUP BY channel
ORDER BY cac;
