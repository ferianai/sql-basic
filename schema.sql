-- RevoU Auto Garages Database Schema

-- Drop tables if they exist (for clean start)
DROP TABLE IF EXISTS transactions_details;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS outlets;
DROP TABLE IF EXISTS services;

-- Create tables CUSTOMERS
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY, -- SERIAL is a data type that generates unique sequential integer values
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create tables OUTLETS
CREATE TABLE outlets (
    outlet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create tables SERVICES
CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    base_price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create tables TRANSACTIONS
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    outlet_id INT NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (outlet_id) REFERENCES outlets(outlet_id)
);

-- Create tables TRANSACTIONS_DETAILS
CREATE TABLE transactions_details (
    transaction_detail_id SERIAL PRIMARY KEY,
    transaction_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

-- Trigger Function to Update `updated_at` Automatically
CREATE OR REPLACE FUNCTION update_timestamp() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;  -- Set updated_at to the current timestamp
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger for CUSTOMERS table
CREATE TRIGGER trigger_update_customers
BEFORE UPDATE ON customers
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Trigger for OUTLETS table
CREATE TRIGGER trigger_update_outlets
BEFORE UPDATE ON outlets
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Trigger for SERVICES table
CREATE TRIGGER trigger_update_services
BEFORE UPDATE ON services
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Trigger for TRANSACTIONS table
CREATE TRIGGER trigger_update_transactions
BEFORE UPDATE ON transactions
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Trigger for TRANSACTIONS_DETAILS table
CREATE TRIGGER trigger_update_transactions_details
BEFORE UPDATE ON transactions_details
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();
