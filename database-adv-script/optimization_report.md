# Query Optimization Report – Airbnb Database

## File
`perfomance.sql`

---

## 1. Objective

Retrieve all booking records along with the relevant user, property, and payment information.

---

## 2. Initial Query (Unoptimized)

The original query:
- Performed `LEFT JOIN`s on all tables regardless of actual constraints.
- Returned a large number of NULLs for missing data.
- Didn’t filter by status (e.g., pending, canceled).

### Performance (from EXPLAIN):
- Multiple `Seq Scan` operations on `users`, `properties`, and `payments`.
- Cost: High due to lack of filtering and joins on large tables.

---

## 3. Optimizations Applied

✅ Replaced unnecessary `LEFT JOIN`s with `INNER JOIN`s:
- Bookings must have associated users and properties.
- Only `payments` can be optional.

✅ Filtered by `status = 'confirmed'` to reduce rows scanned.

✅ Assumed the following indexes were added in `database_index.sql`:
- `bookings.user_id`
- `bookings.property_id`
- `payments.booking_id`

---

## 4. Refactored Query Benefits

- Reduced I/O with indexed lookups
- Reduced number of rows scanned using WHERE clause
- Improved query plan:
  - From `Seq Scan` to `Index Scan`
  - Reduced total execution cost
  - Shorter planning + execution time

---

## 5. EXPLAIN Output Summary

### Before Optimization:
