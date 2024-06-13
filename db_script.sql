
CREATE DATABASE IF NOT EXISTS CarDealershipDatabase;

USE CarDealershipDatabase;

DROP TABLE IF EXISTS lease_contracts;
DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS dealerships;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);


CREATE TABLE vehicles (
    VIN INT PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    color VARCHAR(20),
    price DECIMAL(10, 2),
    sold BOOLEAN DEFAULT FALSE
);

-- Create the inventory table
CREATE TABLE inventory (
    dealership_id INT,
    VIN INT,
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);


CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN INT,
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    sale_price DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Create the lease_contracts table
CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN INT,
    lessee_name VARCHAR(100),
    lessee_address VARCHAR(255),
    lease_start_date DATE,
    lease_end_date DATE,
    monthly_payment DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Insert records into the dealerships table
INSERT INTO dealerships (name, address, phone) VALUES 
('FastCars Dealership', '123 Speed St, CityA', '123-456-7890'),
('Luxury Autos', '456 Prestige Blvd, CityB', '234-567-8901'),
('Eco Vehicles', '789 Green Ave, CityC', '345-678-9012'),
('Family Motors', '321 Family St, TownD', '456-789-0123'),
('Budget Cars', '654 Savings Rd, CityE', '567-890-1234');

-- Insert records into the vehicles table
INSERT INTO vehicles (VIN, make, model, year, color, price, sold) VALUES 
(1, 'Honda', 'Accord', 2020, 'Black', 25000.00, FALSE),
(2, 'Tesla', 'Model S', 2021, 'Red', 75000.00, FALSE),
(3, 'Toyota', 'Prius', 2019, 'White', 22000.00, FALSE),
(4, 'Ford', 'Focus', 2018, 'Blue', 15000.00, TRUE),
(5, 'Chevrolet', 'Malibu', 2022, 'Silver', 28000.00, FALSE);


INSERT INTO inventory (dealership_id, VIN) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO sales_contracts (VIN, customer_name, customer_address, sale_price, sale_date) VALUES 
(1, 'John Doe', '101 Main St, TownA', 24500.00, '2024-01-15'),
(2, 'Jane Smith', '202 Oak St, TownB', 73000.00, '2024-02-20'),
(4, 'Emily Davis', '404 Pine St, CityD', 14800.00, '2023-12-10'),
(5, 'Michael Brown', '505 Elm St, CityE', 27500.00, '2024-05-05');

INSERT INTO lease_contracts (VIN, lessee_name, lessee_address, lease_start_date, lease_end_date, monthly_payment) VALUES 
(3, 'Alice Johnson', '303 Pine St, TownC', '2024-03-01', '2027-03-01', 300.00),
(2, 'David Wilson', '606 Birch St, CityB', '2024-02-15', '2026-02-15', 650.00),
(5, 'Sarah Lee', '707 Maple St, CityE', '2024-06-01', '2026-06-01', 500.00);




