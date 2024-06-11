CREATE DATABASE CarDealershipDatabase;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    color VARCHAR(20),
    price DECIMAL(10, 2),
    sold BOOLEAN DEFAULT FALSE
);
CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    sale_price DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    lessee_name VARCHAR(100),
    lessee_address VARCHAR(255),
    lease_start_date DATE,
    lease_end_date DATE,
    monthly_payment DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

