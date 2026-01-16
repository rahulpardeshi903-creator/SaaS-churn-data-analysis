USE saas_analytics;

-- EDA

-- 1. How many are in accounts and subscriptions?

SELECT COUNT(*) FROM accounts;
SELECT COUNT(*) FROM subscriptions;

-- 2. Distribution of plan tiers

SELECT plan_tier, COUNT(*)
FROM subscriptions
GROUP BY plan_tier;

-- 3. Average price by distribution of plan tiers

SELECT plan_tier, ROUND(AVG(mrr_amount),2)
FROM subscriptions
GROUP BY plan_tier;