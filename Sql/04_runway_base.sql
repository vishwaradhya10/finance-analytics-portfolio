/*
Purpose:
Prepare dataset for runway calculation.
*/

SELECT
    month,
    net_burn
FROM finance_summary
WHERE net_burn > 0;
