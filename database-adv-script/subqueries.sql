-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.

WITH RatedProperties AS (
    SELECT r.property_id
    FROM Reviews r
    GROUP BY r.property_id
    HAVING SUM(r.rating)/COUNT(r.rating) BETWEEN 4.1 AND 5.0
)
SELECT p.*
FROM Properties p
JOIN RatedProperties rp ON p.property_id = rp.property_id;

SELECT p.*
FROM Properties p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM Reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

-- Write a correlated subquery to find users who have made more than 3 bookings.

WITH UserBookingCounts AS (
    SELECT b.user_id
    FROM Bookings b
    GROUP BY b.user_id
    HAVING NOT COUNT(b.booking_id) BETWEEN 0 AND 3
)
SELECT u.*
FROM Users u
JOIN UserBookingCounts ubc ON u.user_id = ubc.user_id;

SELECT u.*
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.user_id
) > 3;