-- Business Question:
-- Does churn vary with monthly charges?

SELECT
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low (<35)'
        WHEN MonthlyCharges < 70 THEN 'Medium (35-69.99)'
        ELSE 'High (70+)'
    END AS charge_band,

    COUNT(*) AS total_customers,
    SUM(Churn) AS churned_customers,

    ROUND(
        100.0 * SUM(Churn) / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct,

    ROUND(AVG(MonthlyCharges), 2)
        AS avg_monthly_charge

FROM customers
GROUP BY charge_band
ORDER BY MIN(MonthlyCharges);