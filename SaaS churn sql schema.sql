CREATE DATABASE saas_analytics;
USE saas_analytics;

-- ALL TABLES CREATION AND DATA IMPORT FROM CVS FILE USING MYSQL WORKBENCH
CREATE TABLE accounts (
account_id VARCHAR(50) PRIMARY KEY,
account_name TEXT,
industry TEXT,
country TEXT,
signup_date DATE,
referral_source TEXT,
plan_tier TEXT,
seats INT,
is_trial BOOLEAN,
churn_flag BOOLEAN
);

CREATE TABLE subscriptions (
subscription_id VARCHAR(50) PRIMARY KEY,
account_id VARCHAR(50),
start_date DATE,
end_date DATE,
plan_tier TEXT,
seats INT,
mrr_amount INT,
arr_amount INT,
is_trial BOOLEAN,
upgrade_flag BOOLEAN,
downgrade_flag BOOLEAN,
churn_flag BOOLEAN,
billing_frequency TEXT,
auto_renew_flag BOOLEAN,
FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE churn_events (
churn_event_id TEXT PRIMARY KEY,
account_id VARCHAR(50),
churn_date DATE,
reason_code TEXT,
refund_amount_usd DOUBLE,
preceding_upgrade_flag BOOLEAN,
preceding_downgrade_flag BOOLEAN,
is_reactivation BOOLEAN,
feedback_text TEXT,
FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE feature_usage (
usage_id TEXT PRIMARY KEY,
subscription_id VARCHAR(50),
usage_date DATE,
feature_name TEXT,
usage_count INT,
usage_duration_secs INT,
error_count INT,
is_beta_feature BOOLEAN,
FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);

CREATE TABLE support_tickets (
ticket_id TEXT PRIMARY KEY,
account_id VARCHAR(50),
submitted_at DATETIME,
closed_at DATETIME,
resolution_time_hours DOUBLE,
priority TEXT,
first_response_time_minutes INT,
satisfaction_score INT,
escalation_flag BOOLEAN,
FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);