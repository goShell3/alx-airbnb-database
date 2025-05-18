-- Create partitioned structure using inherited tables
-- Parent table
CREATE TABLE Bookings_template (
    booking_id BINARY(16) PRIMARY KEY,
    property_id BINARY(16) NOT NULL,
    user_id BINARY(16) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Year-specific tables with check constraints
CREATE TABLE Bookings_2020 (CHECK (YEAR(start_date) = 2020)) INHERITS (Bookings_template);
CREATE TABLE Bookings_2021 (CHECK (YEAR(start_date) = 2021)) INHERITS (Bookings_template);
CREATE TABLE Bookings_2022 (CHECK (YEAR(start_date) = 2022)) INHERITS (Bookings_template);
CREATE TABLE Bookings_2023 (CHECK (YEAR(start_date) = 2023)) INHERITS (Bookings_template);
CREATE TABLE Bookings_2024 (CHECK (YEAR(start_date) = 2024)) INHERITS (Bookings_template);
CREATE TABLE Bookings_future (CHECK (YEAR(start_date) > 2024)) INHERITS (Bookings_template);

-- Function to route inserts
CREATE OR REPLACE FUNCTION bookings_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF (YEAR(NEW.start_date) = 2020) THEN
        INSERT INTO Bookings_2020 VALUES (NEW.*);
    ELSIF (YEAR(NEW.start_date) = 2021) THEN
        INSERT INTO Bookings_2021 VALUES (NEW.*);
    ELSIF (YEAR(NEW.start_date) = 2022) THEN
        INSERT INTO Bookings_2022 VALUES (NEW.*);
    ELSIF (YEAR(NEW.start_date) = 2023) THEN
        INSERT INTO Bookings_2023 VALUES (NEW.*);
    ELSIF (YEAR(NEW.start_date) = 2024) THEN
        INSERT INTO Bookings_2024 VALUES (NEW.*);
    ELSE
        INSERT INTO Bookings_future VALUES (NEW.*);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Attach trigger
CREATE TRIGGER bookings_partition_trigger
BEFORE INSERT ON Bookings_template
FOR EACH ROW EXECUTE FUNCTION bookings_insert_trigger();

-- Migrate data
INSERT INTO Bookings_template
SELECT * FROM Bookings;

-- Test query (will only scan relevant tables)
EXPLAIN ANALYZE
SELECT * FROM Bookings_template
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

PARTITION BY