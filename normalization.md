# Airbnb Database Normalization – 3NF

## Objective
Ensure the database design adheres to the Third Normal Form (3NF) to eliminate redundancy and improve data integrity.

---

## Normalization Summary

### ✅ 1NF: First Normal Form
- All values are atomic.
- No repeating groups or arrays.
- Each table has a primary key.

### ✅ 2NF: Second Normal Form
- All non-key attributes are fully functionally dependent on the entire primary key.
- Since all tables use UUIDs as single-column primary keys, 2NF is satisfied.

### ✅ 3NF: Third Normal Form
- No transitive dependencies.
- All non-key attributes depend only on the primary key.

---

## Notes on Key Entities

### 🔸 Booking Table
- `total_price` could be derived from other data but is stored for performance optimization (denormalized intentionally).

### 🔸 Message Table
- Self-referencing foreign keys (sender and recipient) are 3NF-compliant.

---

## Conclusion

All tables in the Airbnb database schema are fully normalized up to 3NF. The design supports scalability, data integrity, and efficient querying.
