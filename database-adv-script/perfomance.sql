-- Initial (Unoptimized) Query
-- Retrieves all bookings with user, property, and payment details

-- Original version using multiple joins without filters
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,

    u.user_id,
    u.first_name,
    u.last_name,
    u.email,

    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,

    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method

FROM bookings b
LEFT JOIN users u ON b.user_id = u.user_id
LEFT JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

-- Refactored Version
-- Optimization techniques applied: reduced LEFT JOINs to INNER JOINs where relationships are required,
-- leveraged indexed columns and filtered only active/confirmed bookings.

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,

    u.first_name,
    u.last_name,
    u.email,

    p.name AS property_name,
    p.location,

    pay.amount,
    pay.payment_method

FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed';
