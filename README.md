# SaaS Churn Analysis using SQL

## Overview

This repository contains an end-to-end churn analysis project built using SQL on a SaaS-style dataset. The objective of this project is to understand customer churn in a practical, business-focused way rather than just writing isolated SQL queries.

The project walks through the complete analytics process starting from database and table creation, importing raw data, performing data quality checks and cleaning, conducting exploratory data analysis (EDA), and finally analyzing churn patterns, drivers, and risk signals.

---

## Business Context

Customer churn is a critical problem for SaaS companies because it directly affects revenue and long-term growth. The purpose of this analysis is to answer common real-world questions such as:

* How much churn is happening?
* When do customers churn?
* Why do customers churn?
* Are there early warning signs of churn?

---

## Data & Schema

The analysis is based on multiple related tables that represent a typical SaaS product environment:

* Accounts: customer-level information
* Subscriptions: plan, revenue, and lifecycle details
* Churn events: churn dates and reasons
* Feature usage: product engagement data
* Support tickets: customer support experience

The raw data is stored as CSV files and imported into MySQL for analysis.

---

## Project Workflow

The project follows a structured workflow similar to real analytics projects:

* Database and table creation
* Data import from CSV files
* Data quality checks for missing and invalid values
* Data cleaning and standardization
* Exploratory Data Analysis (EDA)
* Churn metrics and trends
* Early churn analysis (first 90 days)
* Churn over time
* Cohort analysis
* Churn driver analysis
* Rule-based churn risk identification

---

## Key Questions Answered

This project answers the following business questions:

* What is the overall churn rate?
* How does churn differ at account level vs subscription level?
* How does churn change over time?
* How many customers churn within the first 90 days?
* Which signup cohorts show higher churn?
* Does low feature usage lead to higher churn?
* Does poor support experience increase churn?
* Do downgrades or plan changes impact churn?
* What are the most common churn reasons?
* Can high-risk customers be identified using simple rules?

Each question is answered using SQL queries along with clear explanations of the results.

---

## SQL Files in This Repository

* schema.sql: database and table creation
* data_quality_checks.sql: NULL and data validation checks
* data_cleaning.sql: data cleaning and standardization logic
* eda.sql: exploratory data analysis queries
* churn_metrics.sql: churn KPIs and trends
* cohort_analysis.sql: cohort-based churn analysis
* churn_drivers.sql: feature usage and support analysis
* risk_model.sql: rule-based churn risk logic

---

## Tools and Skills Used

* MySQL
* SQL joins, aggregations, and CTEs
* Data cleaning and validation
* Exploratory data analysis
* Churn and cohort analysis
* Business insight generation

---

## Key Takeaways

This project demonstrates the ability to work with relational data, clean and analyze real-world datasets, and translate SQL results into meaningful business insights related to customer churn.

---

## Resume Summary

Built an end-to-end SaaS churn analysis project using SQL, covering data ingestion, cleaning, exploratory analysis, churn metrics, cohort analysis, churn drivers, and rule-based churn risk identification.

---

## Author

Rahul Pardeshi
