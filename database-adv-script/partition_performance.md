# Booking Table Partitioning Performance Report

## Objective
Improve query performance on the large `bookings` table by applying table partitioning based on `start_date`.

---

## Partitioning Strategy

- **Partitioned By:** RANGE on `start_date`
- **Partitions Created:** Quarterly partitions for the year 2025
- Example partitions:
  - `bookings_2025_q1`: Jan–Mar
  - `bookings_2025_q2`: Apr–Jun
  - `bookings_2025_q3`: Jul–Sep
  - `bookings_2025_q4`: Oct–Dec

---

## Query Tested

```sql
-- Fetch bookings in Q3 2025
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date >= '2025-07-01' AND start_date < '2025-10-01';
