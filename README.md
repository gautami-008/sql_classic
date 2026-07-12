# sql_classic

# Classic Models SQL Analytics & Database Engineering Sandbox

A comprehensive SQL practice repository demonstrating deep proficiency in data 

manipulation, complex joins, window functions, and database program design (Triggers, Stored 

Procedures, and Functions) utilizing the standard classicmodels relational database.


# Core SQL Concepts Demonstrated


This repository moves systematically from foundational data filtering to advanced analytical 

concepts used by modern data teams.

 # 1. Data Aggregation & Analytical Window FunctionsRank Dynamics:

   * Implemented ROW_NUMBER(), RANK(), and DENSE_RANK() side-by-side to handle identical values

   and resolve complex ranking problems (e.g., finding the $N^{\text{th}}$ highest credit limit).

   * Time-Series Tracking: Utilized LAG() and LEAD() analytical functions alongside positional helpers

   like FIRST_VALUE() to track transactional metrics over chronological periods.

   * Distribution Analysis: Applied NTILE(4) to dynamically split the customer base into quartile buckets based on their

   credit profiles.
   

# 2. Relational Joins & Data Modeling

 
* Multi-Table Joins: Integrated up to four tables simultaneously (customers, orders, orderdetails, products) 
 
 to trace customer transaction back to inventory records.
 
 * Self-Joins: Wrote hierarchical queries comparing corporate structures (mapping employees to their direct managers) 
 
 and uncovering structural correlations like shared office codes or identical product price tiers.
 
 * Full Outer Join Simulation: Bypassed MySQL limits by merging LEFT JOIN and RIGHT JOIN structures via UNION operators 
 
 to generate full, unmatched entity reporting.
 
 
 
 # 3. Database Program Design (Triggers, Procedures, & Functions)
 
 
 
 * Automation Triggers: Built defensive database mechanisms including:
  
    * BEFORE INSERT: Enforcing validation parameters (preventing negative credit values).
  
    * AFTER INSERT/AFTER UPDATE: Logging data modifications directly to dedicated transactional logging/audit tables (customer_audit, credit_limit_changesLogs).
  
    * BEFORE DELETE: Enforcing strict business logic constraint rules (blocking deletion of customers with On Hold orders).
  
* Parametric Procedures & CTEs: Developed highly reusable, encapsulated scripts using IN and OUT parameters for operational reporting alongside 
  
       modular Common Table Expressions (CTEs).
 
  * Deterministic Functions: Built modular string manipulation operations (getEmpFullName) that optimize report-ready presentation formatting.
