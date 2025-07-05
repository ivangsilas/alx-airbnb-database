-- Index on users.email (frequently used in login, lookups)
CREATE INDEX idx_users_email ON users(email);

-- Index on bookings.user_id (for joins, filters)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id (for joins with properties)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on properties.location (for search/filter)
CREATE INDEX idx_properties_location ON properties(location);

-- Index on reviews.property_id (used in property → review lookup)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Index on properties.pricepernight (used for price-based filtering)
CREATE INDEX idx_properties_price ON properties(pricepernight);

-- Index on bookings.status (used in admin filters)
CREATE INDEX idx_bookings_status ON bookings(status);
