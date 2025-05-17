INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '2345678901', 'host', CURRENT_TIMESTAMP),
('33333333-3333-3333-3333-333333333333', 'Carol', 'Davis', 'carol@example.com', 'hashed_pw_3', NULL, 'guest', CURRENT_TIMESTAMP),
('44444444-4444-4444-4444-444444444444', 'Admin', 'User', 'admin@example.com', 'hashed_pw_admin', NULL, 'admin', CURRENT_TIMESTAMP);

INSERT INTO Properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Sunny Villa', 'A beautiful villa near the beach.', 'Miami, FL', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', 'Mountain Retreat', 'Cozy cabin in the mountains.', 'Denver, CO', 85.50, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, status, created_at) VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-06-01', '2025-06-05', 'confirmed', CURRENT_TIMESTAMP),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', '2025-07-10', '2025-07-12', 'pending', CURRENT_TIMESTAMP);

INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('ppppppp1-pppp-pppp-pppp-ppppppppppp1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, CURRENT_TIMESTAMP, 'credit_card');

INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('ppppppp1-pppp-pppp-pppp-ppppppppppp1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, CURRENT_TIMESTAMP, 'credit_card');

INSERT INTO Reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrr1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay! Highly recommend.', CURRENT_TIMESTAMP),
('rrrrrrr2-rrrr-rrrr-rrrr-rrrrrrrrrrr2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 4, 'Nice and quiet place.', CURRENT_TIMESTAMP);


INSERT INTO Messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('mmmmmmm1-mmmm-mmmm-mmmm-mmmmmmmmmmm1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi, is Sunny Villa available next week?', CURRENT_TIMESTAMP),
('mmmmmmm2-mmmm-mmmm-mmmm-mmmmmmmmmmm2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, it is available. You can book now!', CURRENT_TIMESTAMP);
