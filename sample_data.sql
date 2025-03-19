-- Insert sample data into CUSTOMERS table
INSERT INTO customers (name, email, phone, address) VALUES
('John Doe', 'john.doe@example.com', '1234567890', '123 Main St, Springfield, IL'),
('Jane Smith', 'jane.smith@example.com', '2345678901', '456 Elm St, Shelbyville, IL'),
('Mike Johnson', 'mike.johnson@example.com', '3456789012', '789 Oak St, Springfield, IL'),
('Sara Williams', 'sara.williams@example.com', '4567890123', '101 Pine St, Springfield, IL');

-- Insert sample data into OUTLETS table
INSERT INTO outlets (name, address, phone) VALUES
('Springfield Auto Garage', '123 Main St, Springfield, IL', '123-456-7890'),
('Shelbyville Auto Repair', '456 Elm St, Shelbyville, IL', '234-567-8901'),
('Downtown Auto Services', '789 Oak St, Springfield, IL', '345-678-9012');

-- Insert sample data into SERVICES table
INSERT INTO services (name, description, base_price) VALUES
('Oil Change', 'Basic oil change service', 30.00),
('Tire Replacement', 'Replacing old tires with new ones', 100.00),
('Brake Inspection', 'Inspection of brake pads and fluid', 50.00),
('Car Wash', 'Exterior and interior car cleaning', 20.00);

-- Insert sample data into TRANSACTIONS table
INSERT INTO transactions (customer_id, outlet_id, transaction_date, total_amount, payment_method, payment_status, notes) VALUES
(1, 1, '2023-03-01 10:00:00', 150.00, 'Credit Card', 'Paid', 'Routine maintenance including oil change and car wash'),
(2, 2, '2023-03-02 14:30:00', 250.00, 'Cash', 'Paid', 'Tire replacement and brake inspection'),
(3, 3, '2023-03-03 16:45:00', 80.00, 'Debit Card', 'Pending', 'Oil change and car wash'),
(4, 1, '2023-03-04 11:15:00', 180.00, 'Credit Card', 'Paid', 'Brake inspection and car wash');

-- Insert sample data into TRANSACTIONS_DETAILS table
INSERT INTO transactions_details (transaction_id, service_id, quantity, unit_price, subtotal, notes) VALUES
(1, 1, 1, 30.00, 30.00, 'Oil change service'),
(1, 4, 1, 20.00, 20.00, 'Car wash service'),
(2, 2, 4, 25.00, 100.00, 'Tire replacement service'),
(2, 3, 1, 50.00, 50.00, 'Brake inspection service'),
(3, 1, 1, 30.00, 30.00, 'Oil change service'),
(3, 4, 1, 20.00, 20.00, 'Car wash service'),
(4, 3, 1, 50.00, 50.00, 'Brake inspection service'),
(4, 4, 1, 20.00, 20.00, 'Car wash service');
