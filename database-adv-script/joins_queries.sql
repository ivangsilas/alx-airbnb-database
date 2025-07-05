-- INNER JOIN: Retrieve all bookings and the respective users who made them
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.user_id;

-- LEFT JOIN: Retrieve all properties and their reviews, including those with no reviews
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.user_id AS reviewer_id
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.property_id = r.property_id;

-- FULL OUTER JOIN: Retrieve all users and bookings (even if user has no booking or booking is not linked to a user)
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.status
FROM 
    users u
FULL OUTER JOIN 
    bookings b ON u.user_id = b.user_id;
