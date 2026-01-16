USE saas_analytics;

-- 	Churan anaysis

-- Q1. How many subscriptions churned?

SELECT COUNT(*) 
FROM subscriptions
WHERE churn_flag = 'TRUE';

-- Q2. What is the subscription churn rate?

SELECT ROUND(100.0 * SUM(CASE WHEN churn_flag = 'TRUE' THEN 1 ELSE 0
						 END) / COUNT(account_id),2) AS subscription_churn_rate
FROM subscriptions;


-- Q3. What is the account churn rate?

SELECT ROUND(100.0 * COUNT(CASE WHEN churn_flag = 'TRUE' THEN 1
					       END) / COUNT(account_id),2) AS account_churn_rate
FROM subscriptions;


-- Q4. How many customers churned each month?

SELECT  DATE_FORMAT(churn_date, '%Y-%m') AS churn_month,
		COUNT(DISTINCT account_id) AS churned_accounts
FROM churn_events
GROUP BY churn_month
ORDER BY churn_month;


-- Q5. What are the top churn reasons?

SELECT  reason_code,
		COUNT(*) AS churn_count
FROM churn_events
GROUP BY reason_code
ORDER BY churn_count DESC;


-- Q6. Which churn reasons lead to higher refunds?

SELECT  reason_code,
		ROUND(AVG(refund_amount_usd), 2) AS avg_refund
FROM churn_events
GROUP BY reason_code
ORDER BY avg_refund DESC;


-- Q7. Do churned customers use features less?

SELECT  s.churn_flag,
		ROUND(AVG(f.usage_count), 2) AS avg_feature_usage
FROM subscriptions s
JOIN feature_usage f
ON s.subscription_id = f.subscription_id
GROUP BY s.churn_flag;


-- Q8. Does support resolution time impact churn?

SELECT  a.churn_flag,
		ROUND(AVG(t.resolution_time_hours), 2) AS avg_resolution_time
FROM accounts a
JOIN support_tickets t
ON a.account_id = t.account_id
GROUP BY a.churn_flag;


-- Q9. How many customers churn within 90 days?

SELECT  COUNT(DISTINCT a.account_id) AS early_churn_accounts
FROM accounts a
JOIN churn_events c
ON a.account_id = c.account_id
WHERE DATEDIFF(c.churn_date, a.signup_date) <= 90;


-- Q10. Churn rate by signup cohort

SELECT  DATE_FORMAT(a.signup_date, '%Y-%m') AS signup_month,
		COUNT(DISTINCT a.account_id) AS total_accounts,
		COUNT(DISTINCT c.account_id) AS churned_accounts,
		ROUND(
				100.0 * COUNT(DISTINCT c.account_id) / COUNT(DISTINCT a.account_id),
				2) AS churn_rate
FROM accounts a
LEFT JOIN churn_events c
ON a.account_id = c.account_id
GROUP BY signup_month
ORDER BY signup_month;


-- Q11. Which accounts are at high churn risk?

SELECT  a.account_id,
		SUM(CASE WHEN f.usage_count < 5 THEN 1 ELSE 0 END) +
		SUM(CASE WHEN t.resolution_time_hours > 24 THEN 1 ELSE 0 END) +
		MAX(CASE WHEN s.downgrade_flag = 'TRUE' THEN 1 ELSE 0 END) +
		MAX(CASE WHEN s.auto_renew_flag = 'FALSE' THEN 1 ELSE 0 END)
AS churn_risk_score
FROM accounts a
LEFT JOIN subscriptions s
ON a.account_id = s.account_id
LEFT JOIN feature_usage f
ON s.subscription_id = f.subscription_id
LEFT JOIN support_tickets t
ON a.account_id = t.account_id
GROUP BY a.account_id
ORDER BY churn_risk_score DESC;