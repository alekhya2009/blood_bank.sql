-- Create database
CREATE DATABASE IF NOT EXISTS blood_bank;
USE blood_bank;

-- Donors table
CREATE TABLE donors (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    blood_group VARCHAR(5) NOT NULL,
    contact VARCHAR(15),
    city VARCHAR(100)
);

-- Blood inventory table
CREATE TABLE blood_inventory (
    blood_group VARCHAR(5) PRIMARY KEY,
    units_available INT DEFAULT 0
);

-- Insert initial blood groups with zero units
INSERT INTO blood_inventory (blood_group, units_available) VALUES
('A+', 0), ('A-', 0),
('B+', 0), ('B-', 0),
('AB+', 0), ('AB-', 0),
('O+', 0), ('O-', 0);

-- Sample donor insert (add new donor and update inventory)
INSERT INTO donors (name, age, gender, blood_group, contact, city)
VALUES ('John Doe', 30, 'Male', 'A+', '1234567890', 'Hyderabad');

-- Update blood_inventory units_available when donor added
UPDATE blood_inventory SET units_available = units_available + 1 WHERE blood_group = 'A+';

-- Search donors by blood group example
SELECT * FROM donors WHERE blood_group = 'A+';

-- Request blood: check availability
SELECT units_available FROM blood_inventory WHERE blood_group = 'A+';

-- If available, reduce units by 1 (simulate blood issued)
UPDATE blood_inventory SET units_available = units_available - 1 WHERE blood_group = 'A+' AND units_available > 0;

-- View all donors
SELECT * FROM donors;

-- View blood inventory
SELECT * FROM blood_inventory;
