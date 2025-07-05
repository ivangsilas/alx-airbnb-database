# Index Performance Optimization – Airbnb Database

## Objective
Improve the performance of frequent queries using appropriate indexes.

---

## Identified High-Usage Columns

### 1. `users.email`
- Used for login or user lookup.
- **Before indexing**: Full table scan.
- **After indexing**: Fast retrieval via `idx_users_email`.

### 2. `bookings.user_id` & `bookings.property_id`
- Used in JOINs with `users` and `properties`.
- **Before indexing**: JOIN operations slow on large datasets.
- **After indexing**: Improved JOIN efficiency.

### 3. `properties.location`
- Often filtered in searches (e.g., "properties in Lagos").
- **Index added**: `idx_properties_location`.

### 4. `properties.pricepernight`
- Used in price filters/sorting (e.g., “under 40,000”).
- **Index added**: `idx_properties_price`.

### 5. `bookings.status`
- Common in admin dashboards to filter bookings.
- **Index added**: `idx_bookings_status`.

---

## Query Performance Measurement

### Query Example (Before Indexing)

```sql
EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'alice@example.com';
