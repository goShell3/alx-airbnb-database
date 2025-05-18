-- Initial inefficient query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    py.payment_id,
    py.amount,
    py.payment_method,
    py.payment_date
FROM 
    Bookings b
JOIN 
    Users u ON b.user_id = u.user_id
JOIN 
    Properties p ON b.property_id = p.property_id
LEFT JOIN 
    Payments py ON b.booking_id = py.booking_id
ORDER BY 
    b.start_date DESC;



-- Analyze the query performance
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    py.payment_id,
    py.amount,
    py.payment_method,
    py.payment_date
FROM 
    Bookings b
JOIN 
    Users u ON b.user_id = u.user_id
JOIN 
    Properties p ON b.property_id = p.property_id
LEFT JOIN 
    Payments py ON b.booking_id = py.booking_id
ORDER BY 
    b.start_date DESC;


-- Optimized query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    py.amount,
    py.payment_method
FROM 
    Bookings b
JOIN 
    Users u USING (user_id)
JOIN 
    Properties p USING (property_id)
LEFT JOIN 
    (SELECT 
        payment_id, 
        booking_id, 
        amount, 
        payment_method 
     FROM 
        Payments
    ) py USING (booking_id)
WHERE 
    b.start_date >= CURRENT_DATE - INTERVAL '6 months'
ORDER BY 
    b.start_date DESC
LIMIT 1000;