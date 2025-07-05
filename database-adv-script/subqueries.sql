-- 1. Non-correlated subquery:
-- Find all properties where the average rating is greater than 4.0

SELECT 
    p.property_id,
    p.name,
    p.location,
    AVG(r.rating) AS average_rating
FROM 
    properties p
JOIN 
    reviews r ON p.property_id = r.property_id
GROUP BY 
    p.property_id, p.name, p.location
HAVING 
    AVG(r.rating) > 4.0;


-- 2. Correlated subquery:
-- Find users who have made more than 3 bookings

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    (
        SELECT COUNT(*) 
        FROM bookings b 
        WHERE b.user_id = u.user_id
    ) AS total_bookings
FROM 
    users u
WHERE 
    (
        SELECT COUNT(*) 
        FROM bookings b 
        WHERE b.user_id = u.user_id
    ) > 3;
