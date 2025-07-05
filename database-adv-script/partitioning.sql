-- Partition the Booking table by RANGE on start_date

-- 1. Rename the original table (backup)
ALTER TABLE bookings RENAME TO bookings_old;

-- 2. Create new partitioned bookings table
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 3. Create partitions (e.g., quarterly for 2025)
CREATE TABLE bookings_2025_q1 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE bookings_2025_q2 PARTITION OF bookings
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

CREATE TABLE bookings_2025_q3 PARTITION OF bookings
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

CREATE TABLE bookings_2025_q4 PARTITION OF bookings
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');

-- 4. Recreate indexes and foreign keys on each partition
-- Note: Constraints must be added manually on each partition as needed
-- You may also use table inheritance or triggers for more complex cases

-- 5. Optionally: Reinsert data from backup
-- INSERT INTO bookings SELECT * FROM bookings_old;

-- 6. Drop the backup table after testing
-- DROP TABLE bookings_old;
