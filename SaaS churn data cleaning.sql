USE saas_analytics;

-- DATA CLEANING

DELETE FROM subscriptions
WHERE start_date > end_date;

UPDATE support_tickets
SET satisfaction_score = 3
WHERE satisfaction_score IS NULL;

DELETE t1
FROM support_tickets t1
JOIN support_tickets t2
ON t1.ticket_id = t2.ticket_id
AND t1.submitted_at > t2.submitted_at;

SELECT *
FROM accounts
WHERE account_id IS NULL
   OR account_name IS NULL
   OR industry IS NULL
   OR country IS NULL
   OR signup_date IS NULL
   OR referral_source IS NULL
   OR plan_tier IS NULL
   OR seats IS NULL
   OR is_trial IS NULL
   OR churn_flag IS NULL;

SELECT *
FROM subscriptions
WHERE subscription_id IS NULL
   OR account_id IS NULL
   OR start_date IS NULL
   OR end_date IS NULL
   OR plan_tier IS NULL
   OR seats IS NULL
   OR mrr_amount IS NULL
   OR arr_amount IS NULL
   OR is_trial IS NULL
   OR upgrade_flag IS NULL
   OR downgrade_flag IS NULL
   OR churn_flag IS NULL
   OR billing_frequency IS NULL
   OR auto_renew_flag IS NULL;

SELECT *
FROM churn_events
WHERE churn_event_id IS NULL
   OR account_id IS NULL
   OR churn_date IS NULL
   OR reason_code IS NULL
   OR refund_amount_usd IS NULL
   OR preceding_upgrade_flag IS NULL
   OR preceding_downgrade_flag IS NULL
   OR is_reactivation IS NULL
   OR feedback_text IS NULL;

SELECT *
FROM feature_usage
WHERE usage_id IS NULL
   OR subscription_id IS NULL
   OR usage_date IS NULL
   OR feature_name IS NULL
   OR usage_count IS NULL
   OR usage_duration_secs IS NULL
   OR error_count IS NULL
   OR is_beta_feature IS NULL;

SELECT *
FROM support_tickets
WHERE ticket_id IS NULL
   OR account_id IS NULL
   OR submitted_at IS NULL
   OR closed_at IS NULL
   OR resolution_time_hours IS NULL
   OR priority IS NULL
   OR first_response_time_minutes IS NULL
   OR satisfaction_score IS NULL
   OR escalation_flag IS NULL;
