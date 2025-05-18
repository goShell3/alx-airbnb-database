-- Query 1: INNER JOIN to retrieve all bookings and the respective users who made those bookings
SELECT b.*, u.*
FROM Bookings b 
INNER JOIN Users u ON b.user_id = u.user_id;

-- Query 2: LEFT JOIN to retrieve all properties and their reviews, including properties with no reviews
SELECT p.*, r.*
FROM Properties p
LEFT JOIN Reviews r ON p.property_id = r.property_id;

-- Query 3: MySQL doesn't support FULL OUTER JOIN directly, so we emulate it with UNION of LEFT and RIGHT joins
SELECT u.*, b.*
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
UNION
SELECT u.*, b.*
FROM Users u
RIGHT JOIN Bookings b ON u.user_id = b.user_id
WHERE u.user_id IS NULL;