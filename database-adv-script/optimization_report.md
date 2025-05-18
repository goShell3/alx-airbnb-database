# Query Optimization Report

## Initial Findings
1. **Full table scans** detected on multiple tables
2. **Missing indexes** on join columns and sort fields
3. **Unnecessary columns** being retrieved
4. **Inefficient sorting** of large result sets

## Recommended Optimizations

### 1. Index Improvements
```sql
CREATE INDEX idx_bookings_dates ON Bookings(start_date, end_date);
CREATE INDEX idx_bookings_user_property ON Bookings(user_id, property_id);
CREATE INDEX idx_payments_booking ON Payments(booking_id);



## Optimized Query (performance.sql)

```sql
-- Optimized booking details query
WITH recent_bookings AS (
    SELECT *
    FROM Bookings
    WHERE start_date >= CURRENT_DATE - INTERVAL '6 months'
)
SELECT 
    rb.booking_id,
    rb.start_date,
    rb.end_date,
    rb.status,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    COALESCE(py.amount, 0) AS amount_paid,
    py.payment_method
FROM 
    recent_bookings rb
JOIN 
    Users u ON rb.user_id = u.user_id
JOIN 
    Properties p ON rb.property_id = p.property_id
LEFT JOIN 
    Payments py ON rb.booking_id = py.booking_id
ORDER BY 
    rb.start_date DESC
LIMIT 1000;