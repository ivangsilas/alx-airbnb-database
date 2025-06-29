-- seed.sql: Insert sample data into Airbnb database

-- USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('00000000-0000-0000-0000-000000000001', 'Alice', 'Johnson', 'alice@example.com', 'hash1', '08011111111', 'host'),
('00000000-0000-0000-0000-000000000002', 'Bob', 'Smith', 'bob@example.com', 'hash2', '08022222222', 'guest'),
('00000000-0000-0000-0000-000000000003', 'Carol', 'Ng', 'carol@example.com', 'hash3', '08033333333', 'guest'),
('00000000-0000-0000-0000-000000000004', 'Admin', 'User', 'admin@example.com', 'adminhash', NULL, 'admin');

-- PROPERTIES
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
('11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000001', 'Lakeside Cabin', 'Cozy cabin near the lake', 'Cross River, Nigeria', 30000.00),
('11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000001', 'City Apartment', 'Modern apartment in Calabar city center', 'Calabar, Nigeria', 45000.00);

-- BOOKINGS
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('22222222-2222-2222-2222-222222222221', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000002', '2025-07-01', '2025-07-04', 90000.00, 'confirmed'),
('22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000003', '2025-08-10', '2025-08-12', 90000.00, 'pending');

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('33333333-3333-3333-3333-333333333331', '22222222-2222-2222-2222-222222222221', 90000.00, 'credit_card');

-- REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('44444444-4444-4444-4444-444444444441', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000002', 5, 'Beautiful location and very peaceful.'),
('44444444-4444-4444-4444-444444444442', '11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000003', 4, 'Nice place but noisy at night.');

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('55555555-5555-5555-5555-555555555551', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Hi, I have a question about the Lakeside Cabin.'),
('55555555-5555-5555-5555-555555555552', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Sure! How can I help you?');
