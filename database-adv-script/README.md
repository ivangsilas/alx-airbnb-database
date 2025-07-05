# Advanced SQL Join Queries – Airbnb Database

## Directory
`database-adv-script/`

## Files
- `joins_queries.sql`: Contains complex SQL queries using INNER, LEFT, and FULL OUTER JOINs.
- `README.md`: Explanation and usage of each query.

---

## Queries and Purpose

### 🔹 INNER JOIN
**Objective:** Retrieve all bookings along with the users who made them.

```sql
SELECT ...
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;


# Subquery Practice – Airbnb Database

## Directory
`database-adv-script/`

## Files
- `subqueries.sql`: Contains non-correlated and correlated subqueries.
- `README.md`: Description of each query and how to run them.

---

## Queries

### 1️⃣ Non-Correlated Subquery
**Goal:** Find properties with an average rating > 4.0

```sql
SELECT ...
FROM properties p
JOIN reviews r ON ...
GROUP BY ...
HAVING AVG(r.rating) > 4.0;






# Aggregations and Window Functions – Airbnb Database

## Directory
`database-adv-script/`

## Files
- `aggregations_and_window_functions.sql`: SQL queries for aggregate and window function analysis.
- `README.md`: Description of queries and execution instructions.

---

## Queries Included

### 1️⃣ Total Bookings per User
**Purpose:** Count how many bookings each user has made.

```sql
SELECT ...
FROM users
LEFT JOIN bookings ...
GROUP BY ...
