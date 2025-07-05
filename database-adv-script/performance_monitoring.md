# 📊 Database Performance Monitoring and Refinement

## 🎯 Objective

Use PostgreSQL tools like `EXPLAIN ANALYZE` to:
- Monitor query performance
- Identify inefficiencies (bottlenecks)
- Apply schema/index changes
- Measure performance improvements

---

## ⚙️ Tool Used

- `EXPLAIN ANALYZE` – Displays the actual execution plan and timing
- `CREATE INDEX` – Adds indexes to speed up joins or filters

---

## 🔍 Query 1: Fetch Bookings by User Email

### Query
```sql
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
WHERE u.email = 'alice@example.com';
