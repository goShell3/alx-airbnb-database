# Database Performance Monitoring Report

## Monitored Queries

### 1. Booking Search Query
```sql
EXPLAIN ANALYZE
SELECT b.*, p.name, u.first_name 
FROM Bookings b
JOIN Properties p ON b.property_id = p.property_id
JOIN Users u ON b.user_id = u.user_id
WHERE b.start_date BETWEEN '2023-01-01' AND '2023-12-31'
AND b.status = 'confirmed';


```sql 
EXPLAIN ANALYZE
SELECT u.user_id, COUNT(b.booking_id), SUM(py.amount)
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
LEFT JOIN Payments py ON b.booking_id = py.booking_id
GROUP BY u.user_id;

CREATE INDEX idx_bookings_date_status ON Bookings(start_date, status);
CREATE INDEX idx_bookings_user_property ON Bookings(user_id, property_id);

CREATE MATERIALIZED VIEW user_booking_stats AS
SELECT 
    u.user_id,
    COUNT(b.booking_id) AS total_bookings,
    SUM(COALESCE(py.amount, 0)) AS total_spent
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
LEFT JOIN Payments py ON b.booking_id = py.booking_id
GROUP BY u.user_id;

CREATE INDEX idx_user_stats ON user_booking_stats(user_id);

-- Weekly performance check
SELECT query, calls, total_time, rows
FROM pg_stat_statements
ORDER BY total_time DESC
LIMIT 10;