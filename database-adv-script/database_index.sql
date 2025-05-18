-- Users table indexes
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_users_role ON Users(role);
CREATE INDEX idx_users_name ON Users(last_name, first_name);

-- Properties table indexes
CREATE INDEX idx_properties_host ON Properties(host_id);
CREATE INDEX idx_properties_location ON Properties(location);
CREATE INDEX idx_properties_price ON Properties(price_per_night);
CREATE INDEX idx_properties_created ON Properties(created_at);

-- Bookings table indexes
CREATE INDEX idx_bookings_user ON Bookings(user_id);
CREATE INDEX idx_bookings_property ON Bookings(property_id);
CREATE INDEX idx_bookings_dates ON Bookings(start_date, end_date);
CREATE INDEX idx_bookings_status ON Bookings(status);
CREATE INDEX idx_bookings_created ON Bookings(created_at);

-- Reviews table indexes
CREATE INDEX idx_reviews_property ON Reviews(property_id);
CREATE INDEX idx_reviews_user ON Reviews(user_id);
CREATE INDEX idx_reviews_rating ON Reviews(rating);

-- Payments table indexes
CREATE INDEX idx_payments_booking ON Payments(booking_id);
CREATE INDEX idx_payments_date ON Payments(payment_date);


-- Run the same EXPLAIN ANALYZE after creating indexes
EXPLAIN ANALYZE
SELECT u.*, COUNT(b.booking_id) AS booking_count
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id;


-- Example: Check query plan for user bookings
EXPLAIN ANALYZE
SELECT u.*, COUNT(b.booking_id) AS booking_count
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id;