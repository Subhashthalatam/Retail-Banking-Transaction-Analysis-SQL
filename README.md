# 🏦 Retail Banking Transaction Analysis SQL

## 📌 PROJECT OVERVIEW

This project focuses on analyzing **retail banking data using MySQL** to uncover meaningful business insights related to customers, accounts, branches, loans, loan payments, cards, and transactions.

The project was developed as part of my **Data Analytics learning journey**, with a focus on applying SQL concepts to a real-world banking business scenario.

The analysis explores customer demographics, income, credit scores, account activity, interest rates, transaction patterns, loan types, repayment methods, and card activity to understand banking operations and customer behavior.

---

## 🎯 PROJECT OBJECTIVE

The main objective of this project is to analyze retail banking data and answer business questions that can help organizations:

* Understand customer segments and demographics.
* Analyze annual income and credit score differences.
* Examine account types, balances, and interest rates.
* Understand branch-level account activity.
* Explore transaction types, channels, and peak transaction hours.
* Analyze loan distribution across customer segments.
* Examine loan repayment methods.
* Understand credit and debit card activity.

The project aims to demonstrate how SQL can be used to transform relational banking data into meaningful business insights.

---

## 💼 BUSINESS PROBLEM

Retail banks manage large volumes of customer, account, transaction, loan, and card data. Analyzing this information helps organizations understand customer behavior and banking product usage.

This project explores the following business questions:

* Which customer segment has the highest and lowest total annual income?
* Which customer segments have the most pending KYC statuses?
* How do average income and credit scores vary across customer segments?
* Which account types have higher interest rates and average balances?
* Which branches have higher average account balances?
* How do interest rates vary across branches and account types?
* What are the major differences between active and inactive accounts?
* What transaction types and channels are available?
* Which hour has the highest transaction activity?
* How are loan types distributed across customer segments?
* Which payment methods are commonly used for loan repayments?
* How do credit and debit cards differ in activity and credit limits?

SQL queries were used to explore these questions and generate analytical findings.

---

## 🗂️ DATABASE OVERVIEW

The project uses a relational database named **Retail_Banking**, containing multiple interconnected banking entities.

### Main Entities

* Customers
* Branches
* Accounts
* Loans
* Loan Payments
* Transactions
* Cards

The relationships between these entities are defined using **primary keys and foreign keys**.

### Database Relationships

* Customers are connected to Accounts.
* Branches are connected to Accounts and Loans.
* Customers are connected to Loans.
* Loans are connected to Loan Payments.
* Accounts are connected to Transactions.
* Accounts are connected to Cards.

The database structure was designed to support analysis across customers, banking products, and financial activities.

---

## 🔄 PROJECT WORKFLOW

```
Business Understanding
        ↓
Database & ER Diagram Understanding
        ↓
Table Creation & Relationships
        ↓
Data Exploration
        ↓
SQL Query Development
        ↓
Business Analysis
        ↓
Insights & Findings
        ↓
Recommendations
```

---

## 🛠️ TOOLS & TECHNOLOGIES

* **MySQL**
* **SQL**
* **MySQL Workbench**
* **Relational Database**
* **ER Diagram**
* **Data Analysis**
* **Aggregate Functions**
* **SQL Joins**

---

## 🔍 SQL CONCEPTS USED

This project provided practical experience with:

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* DISTINCT
* Aggregate Functions

  * COUNT()
  * SUM()
  * AVG()
  * MIN()
  * MAX()
* INNER JOIN
* Foreign Keys
* Primary Keys
* Date Functions

  * HOUR()
  * TIMESTAMPDIFF()
* LIMIT
* ALTER TABLE
* UPDATE
* Database and Table Creation

These SQL concepts were applied to explore banking data and answer business-related questions.

---

## 📊 KEY AREAS ANALYZED

### 👥 Customer Analysis

* Customer segments
* Annual income across segments
* Pending KYC status by segment
* Customer distribution across cities and states
* Average income and credit score
* Customer tenure with the bank

### 🏦 Account Analysis

* Account types
* Average interest rates
* Average account balances
* Branch-level account balances
* Account activity across branches
* Interest rates across customer segments
* Active and inactive account comparison

### 💳 Transaction Analysis

* Transaction types
* Transaction channels
* Transaction frequency
* Total transaction amount
* Average, minimum, and maximum transaction amounts
* Peak transaction hour

### 🏢 Branch Analysis

* Average account balance by branch
* Total account balance by branch
* Average interest rates by branch and account type
* Branch-level account activity

### 💰 Loan Analysis

* Loan types
* Loan distribution across customer segments
* Average loan interest rates
* Total number of loans
* Customer loan relationships

### 💵 Loan Payment Analysis

* Payment methods
* Loan repayment activity
* Payment methods across customer segments

### 💳 Card Analysis

* Card types
* Total cards by card type
* Average credit limit
* Average outstanding balance
* Active and inactive cards

---

## 📈 KEY BUSINESS INSIGHTS

The analysis generated the following observations:

### Customer Insights

* The Student segment has the highest total annual income in the analyzed data, while the Retail segment has the lowest.
* Average credit scores across customer segments range from approximately 683 to 688 in the analysis.
* The Retail segment has the highest average credit score among the segments examined.
* Customer tenure ranges from 2 to 16 years based on the analysis notes.

### Account Insights

* Six account types are available in the dataset.
* Certificate of Deposit accounts have a high average interest rate in the account-type analysis.
* Checking and Business Checking accounts have relatively low average interest rates in the reported comparison.
* Branch BR025 has the highest average account balance in the analysis.
* Branch BR017 has the lowest average account balance in the analysis.

### Transaction Insights

* Six transaction types are available in the dataset.
* ATM is identified as the most-used transaction channel in the analysis.
* 11 AM is identified as the peak transaction hour in the reported findings.

### Loan Payment Insights

* Cash is identified as a major loan payment method across customer segments in the analysis.

### Card Insights

* The dataset contains credit and debit card types.
* The SQL analysis notes 600 total cards, with 563 inactive cards and 37 active cards.

*Note: These findings reflect the analysis and comments included in the project SQL file. Some business interpretations should be validated against the underlying data and query logic before being treated as definitive conclusions.*

---

## 💡 BUSINESS VALUE

This project demonstrates how SQL can be used to analyze relational banking data and generate insights related to customer activity, account usage, transaction behavior, loan repayment, and card activity.

The analysis helps develop practical understanding of:

* Relational database structures.
* SQL-based business analysis.
* Data aggregation and comparison.
* Connecting multiple tables using joins.
* Translating analytical results into business observations.

> **The goal is to transform banking data into meaningful insights that support data-driven decision-making.**

---

## 📁 PROJECT STRUCTURE

```
RETAIL-BANKING-SQL-ANALYSIS
│
├── README.md
│
├── sql
│   └── retail_banking_analysis.sql
│
├── presentation
│   └── retail_banking_project.pptx
│
└── screenshots
    └── er_diagram.png
```

---

## 🚀 FUTURE IMPROVEMENTS

This SQL analysis project can be extended by:

* Building an interactive **Power BI dashboard**.
* Developing banking KPIs and performance metrics.
* Performing advanced customer segmentation.
* Analyzing customer lifetime value.
* Creating loan repayment risk indicators.
* Performing time-series transaction analysis.
* Automating recurring banking reports.
* Adding more detailed branch-level performance analysis.

---

## 👤 AUTHOR

**Subhash Thalatam**

Aspiring Data Analyst

### Skills & Interests

* SQL
* Python
* Statistics
* Power BI
* Data Analytics

### Connect With Me

* LinkedIn: [Subhash Thalatam](https://www.linkedin.com/in/subhash-thalatam-78b25025a/)
* GitHub: [Subhashthalatam](https://github.com/Subhashthalatam)
