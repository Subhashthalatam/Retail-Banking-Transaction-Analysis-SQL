CREATE DATABASE Retail_Banking;
USE Retail_Banking;
CREATE TABLE CUSTOMERS (customer_id VARCHAR(20) PRIMARY KEY,
						first_name VARCHAR(50) NOT NULL,
                        last_name VARCHAR(50) NOT NULL,
                        date_of_birth DATE NOT NULL,
                        gender VARCHAR(20) NOT NULL,
                        city VARCHAR(50) NOT NULL,
                        state VARCHAR(30) NOT NULL,
                        customer_since DATE NOT NULL,
                        kyc_status VARCHAR(20) NOT NULL,
                        segment VARCHAR(30) NOT NULL,
                        annual_income DECIMAL(12,2) NOT NULL,
                        credit_score INT NOT NULL,
                        is_active VARCHAR(3) NOT NULL
						);
CREATE TABLE branches ( branch_id VARCHAR(10) PRIMARY KEY,
					   branch_name VARCHAR(100) NOT NULL,
                       city VARCHAR(50) NOT NULL,
                       state VARCHAR(30) NOT NULL,
                       region VARCHAR(30)NOT NULL,
                       opening_date DATE NOT NULL,
                       employee_count INT NOT NULL 
                       );
CREATE TABLE accounts (account_id VARCHAR(20) PRIMARY KEY,
					   customer_id VARCHAR (20),
                       FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
                       branch_id VARCHAR(10),
                       FOREIGN KEY (branch_id) REFERENCES branches(branch_id),
                       account_type VARCHAR(30) ,
                       open_date DATE ,
                       close_date DATE,
                       current_balance DECIMAL(15,2) ,
                       interest_rate DECIMAL(5,2) ,
                       overdraft_limit DECIMAL (12,2) ,
                       status_ VARCHAR (20) 
					  );

CREATE TABLE loans (loan_id VARCHAR(20) PRIMARY KEY,
					customer_id VARCHAR(20),
                    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
                    branch_id VARCHAR(20),
                    FOREIGN KEY (branch_id) REFERENCES branches(branch_id),
                    loan_type VARCHAR(30) NOT NULL,
                    principal_amount DECIMAL (15,2) NOT NULL,
                    interest_rate DECIMAL(5,2) NOT NULL,
                    tenure_months INT NOT NULL,
                    disbursement_date DATE NOT NULL,
                    maturity_date DATE NOT NULL,
                    emi_amount DECIMAL (12,2) NOT NULL,
                    outstanding_balance DECIMAL(12,2) NOT NULL,
                    loan_status VARCHAR(30) NOT NULL,
                    purpose VARCHAR(30) NOT NULL
				   );

CREATE TABLE loan_payments(payment_id VARCHAR(20) PRIMARY KEY ,
						  loan_id VARCHAR(20) ,
                          FOREIGN KEY (loan_id) REFERENCES loans(loan_id),
                          payment_date DATE NOT NULL,
                          scheduled_amount DECIMAL(12,2) NOT NULL,
                          paid_amount DECIMAL (12,2) NOT NULL,
                          pricipal_paid DECIMAL(12,2) NOT NULL,
                          interest_paid DECIMAL(12,2) NOT NULL,
                          penalty DECIMAL(12,2) NOT NULL,
                          days_late INT NOT NULL,
                          payment_method VARCHAR(30) NOT NULL,
                          status_ VARCHAR(20) NOT NULL
                          );

                          
CREATE TABLE transactions(transaction_id VARCHAR(20) PRIMARY KEY,
						 account_id VARCHAR(20),
                         FOREIGN KEY (account_id) REFERENCES accounts(account_id),
                         transaction_date DATE NOT NULL,
                         transaction_time TIME NOT NULL,
                         transaction_type VARCHAR(30) NOT NULL,
                         amount DECIMAL(15,2) NOT NULL,
                         channel_ VARCHAR(30) NOT NULL,
                         description_ VARCHAR(50) NOT NULL,
                         balance_after DECIMAL(15,2) NOT NULL,
                         status_ VARCHAR(20) NOT NULL
                         );


CREATE TABLE cards( card_id VARCHAR(20) PRIMARY KEY,
                    account_id VARCHAR(20),
                    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
                    card_type VARCHAR(20) NOT NULL,
                    issuse_date DATE NOT NULL,
                    expiry_date DATE NOT NULL,
                    credit_limit DECIMAL NOT NULL,
                    outstanding_balance DECIMAL(12,2) NOT NULL,
                    reward_points INT NOT NULL,
                    is_active VARCHAR(3) NOT NULL,
                    network VARCHAR(20) NOT NULL
					);
                    
DELETE FROM ACCOUNTS;	
select * from accounts;
select * from loans;
select * from loan_payments;
select * from transactions;
ALTER TABLE accounts MODIFY close_date VARCHAR(20);
UPDATE accounts SET close_date = NULL WHERE close_date = '';
ALTER TABLE accounts MODIFY close_date DATE;

-- What is the total number of customers?- 500
select count(customer_id) as total_customers from customers;

-- What is the total number of accounts? - 700
select count(account_id) as total_customers from accounts; 

-- What are the different account types available? --
SELECT distinct account_type from accounts;
/* ANSWER:
IRA,MONEY MARKET,CERTIFICATE of DEPOSIT , 
SAVINGS ,BUSINESS CHECKING , CHECKING -- these are the different account types available
*/
-- How many customers are currently active?
select count(customer_id) from accounts where status_ = 'active';
-- ANSWER:- 497
-- What are the different transaction types available?
select distinct transaction_type from transactions;
/*
FEE,ATM WITHDRAWAL,TRANSFER,INTEREST,CREDIT,DEBIT
*/

-- What is the total amount of completed transactions?
select sum(amount) as TOTAL_AMOUNT from transactions;
-- ANSWER: 35891207.29

-- What are the different loan types available? 
SELECT DISTINCT loan_type from loans;
/*
ANSWER:
Business,Credit Bulider ,PERSONAL,EDUCATIONAL,HOME,AUTO
*/
-- What is the total number of loans?
SELECT COUNT(*) FROM LOANS;
-- ANSWER  300

-- What are the different card types available?
SELECT distinct CARD_TYPE FROM CARDS;
-- ANSWER : CREDIT,DEBIT

-- What is the total outstanding loan balance?
select count(outstanding_balance) from loans;
-- ANSWER: 300




;/*Business Objective: The bank wants to understand its customer base and identify differences between customer groups.
Things to Consider While Analyzing:
Compare customers across different segments.
Look at customer demographics.
Compare customers across cities and states.
Examine income and credit-score differences.
Look at customer activity and KYC status.
Understand customer tenure with the bank.
Formulate the analytical questions required to address the objective and support your analysis with multiple meaningful SQL queries. The points above are starting points, not predefined SQL questions.
*/
-- 1.WHAT IS THE ANNUAL INCOME FOR THE CUSTOMERS FOR EACH SEGMENT AND WHICH SEGMENT HAS HIGHEST AND LOWEST ANNUAL INCOME?
select sum(annual_income) as annual_income  ,
segment from customers
group by segment
order by annual_income DESC;
/*
SO BY ANALYZING THIS RECORDS the student segment has the highest annual income and retail segment has the lowest annual income
by using sum aggregate function we get the sum of total income
and by using group by function we combine and separate all the data into groups,
 and by using we can sort the records
*/



-- WHICH SEGMENT PEOPLE HAS THE MOST KYC STATUS IS STILL PENDING?
SELECT segment, COUNT(customer_id) AS pending_kyc_count
FROM customers
where kyc_status='Pending'
group by segment
order by pending_kyc_count DESC;

/*
So by analysing this data/records what i can understand is the student segment has the highest annaual income
BUT, Students also have the most pending KYC_STATUS so it restrict student customers
 from fully utilizing their account features.
HERE:-
THE WHERE CLAUSE FILTERS THE DATASET ROWS WHERE THE Kyc Ststus is still pending 
BY USing Group by We combine and categories the Segments
Sorting is Done by using Order by .
*/

-- Compare customers across cities and states.
select count(customer_id) as total_customers,
avg(annual_income) as avg_annualincome ,state,city from customers
group by state,city
order by avg_annualincome DESC;
/*
So We Had Highest Number  (15)of customers From NE state ,Omaha CIty And 
their Average Annual income was 119170.26 
And We Had Lowest Number (3) of customers From WASHINGTON,DC And Their Average
annual income was 133950.33
And The Top 2 Cities with HIGHEST annual income are JACKsonville,FL State And Colorado Springs ,CO state
And the city with Lowest Annual income is Columbus from OH state
*/

-- What are the average income and credit score levels across customer segments
select segment,avg(annual_income) as avg_ai,avg(credit_score ) as avg_cs from customers
group by segment
order by avg_cs desc;
/*
the Average credit score for the all the segments lies between
683-688
The avg Heighest credit Score is 687 which is maintained by 
Retail segment
Here we Observe even though student has highest annual income they maintain 
least avg credit score
*/


-- customer tenure with bank
select customer_since ,timestampdiff(year,customer_since ,current_date()) as totalyears
 from customers
 order by totalyears desc ;
 
/* 
 16 years  is the highest customer tenure with bank
 2 years is the lowest customer tenure with bank
 so the avg tenure is 8.4 years
*/





-- Comparing Different Account types
-- select * from accounts;
select  account_type,round(avg(interest_rate),2) as avg_ir,
round(avg(current_balance),2) as average_cb from accounts 
group by account_type
order by average_cb desc;
/*
After analysing the records there are 6 types of accounts
Out of 6 , two account types have very low interest rate
1. Checking account type -  0.24 is the avg interest rate 
2.Business Checking acc type - 0.51
And Certificate of Deposit (CD) accounts hold the highest interest rate at 4.62%, 
followed by IRA at 3.78% and Money Market at 3.27%
One thing i've noticed that savings account has the high interest rate
but their avg cuurent balance was not that high
*/





-- Understanding Account usage And Branch activity

/*
Compare different account types.
Compare account activity across customers.
Examine account balances.
Compare account activity across branches.
Look at interest rates across account types.
Identify differences between active and closed accounts.
*/

-- what are the avg stats of different account type?
-- select * from accounts;
select  account_type,round(avg(interest_rate),2) as avg_ir,
round(avg(current_balance),2) as average_cb from accounts 
group by account_type
order by average_cb desc;
/*
After analysing the records there are 6 types of accounts
Out of 6 , two account types have very low interest rate
1. Checking account type -  0.24 is the avg interest rate 
2.Business Checking acc type - 0.51
And Certificate of Deposit (CD) accounts hold the highest interest rate at 4.62%, 
followed by IRA at 3.78% and Money Market at 3.27%
One thing i've noticed that savings account has the high interest rate
but their avg cuurent balance was not that high
*/


-- Examine Account Balances
select sum(current_balance) as total ,
avg(current_balance) as avgacc_balance ,branch_id
 from accounts
 group by branch_id
 order by avgacc_balance desc;
/*
The Branch BR025  people has the highest avg acc balance  and  highest total balance
The BR017 branch performs not well,it has the least  avg account balance 
*/

-- Compare account activity across branches.
-- Which branch and which account type have highest interest rate ?
select branch_id,avg(interest_rate)as air , account_type  from accounts
group by branch_id,account_type
order by air desc ;

/*
so the BR029 Branch has the Highest avg interest rate and most of the branches has highest
Avg interest rate for Certificate Of Deposite account type
*/


select * from accounts;


-- How do average interest rates for each account type vary across different customer segments?
select segment,avg(interest_rate) as a_ir, account_type from customers
join 
accounts
on customers.customer_id = accounts.customer_id
group by segment,account_type
order by a_ir desc ;
/*
Here the senior segment who has cretificate of deposite account type
has the highest avg interest rate and same senior segment has the least 
avg interest_rate for Checking account type
*/


-- what are the major difference between active and inactive accounts?

SELECT 
    account_type,
    status_,
    COUNT(account_id) AS total_accounts,
    ROUND(AVG(interest_rate), 2) AS avg_interest_rate,
    ROUND(AVG(current_balance), 2) AS avg_balance
FROM accounts
GROUP BY account_type, status_
ORDER BY account_type ASC, status_ ASC;

/*
Generally the accounts which are close they have very low avg interest rates
Checking account type has the very least interest rate for both active and iactive accounts 
*/


-- 4.3 Analyze Transaction Patterns
-- How many types of transactions available and what are the different channels?
select transaction_type,channel_ ,count(transaction_type) as total_transactions from  transactions 
group by transaction_type,channel_ 
order by total_transactions DESC;
SELECT 
    HOUR(transaction_time) AS peak_hour,
    COUNT(transaction_id) AS total_transactions
FROM transactions
GROUP BY HOUR(transaction_time)
ORDER BY total_transactions DESC
LIMIT 1;
select count(distinct transaction_type) from  transactions;
/* There are 6 types of transactions available 
The Most used transaction Channel is ATM
And the PEak Hour for the Transaction is 11A.M*/
select * from transactions;
select * from customers;


-- What are the average, minimum, and maximum 
-- transaction amounts for each transaction type (e.g., Deposit, Withdrawal, Transfer)?"
select transaction_type , avg(amount),min(amount),max(amount)
from transactions
group by transaction_type;

/*
HERE we can observe the average, minimum, and maximum 
 transaction amounts for each transaction type */
 
 
 /*
 How are different loan types (e.g., Mortgage, Personal, Auto)
 distributed across customer segments,
 and what is the average interest rate for each segment?"*/
 select loan_type, segment ,avg(interest_rate) ,
 count(loan_id) as total_loans
 from loans
 join
 customers
 on loans.customer_id =customers.CUSTOMER_ID
 group by segment,loan_type;
 
/*
Now we can observe the Types of loans for each segment and thieir average interest rates
*/
 select * from loans;

/*What are the most common payment methods (e.g., Direct Debit, Mobile App, Cash)
 used for loan repayments across different customer segments?*/
 
 select payment_method,count(payment_method) as total_payments,segment
 from loan_payments
 join loans
 on loan_payments.loan_id = loans.loan_id
 join customers
 on loans.customer_id=customers.customer_id
 group by segment,payment_method
 order by total_payments desc;
 /*
 Here we Can observe the payment methods  for different segments
 Cash is the major primary payment methond among all of them
 */
 
 
 
 -- What is the average credit limit and average outstanding balance for each card type?
 select 
    card_type, 
    count(card_id) as total_cards, 
    avg(credit_limit) as avg_credit_limit, 
    avg(outstanding_balance) as avg_outstanding_balance
from cards
group by card_type
order by total_cards desc;

/*
there are 2 types of cards , for credit card it has  avg credit_limit is 24294
*/
select * from cards;
-- How many active and inactive cards exist across different card types?
select 
card_type, 
is_active , 
count(card_id) as total_cards
from cards
group by card_type, is_active
order by card_type asc, total_cards desc;

/*
This table shows how many credit and debit cards are currently being used versus turned off.
Out of 600 total cards, almost all of them (563 cards) are inactive, leaving only 37 active cards.
*/

