-- Insert into suppliers
INSERT INTO culampolla.suppliers (suppliers_name, suppliers_address, suppliers_phone, suppliers_fax, NIF) VALUES
('Supplier A', '123 Street', 123456789, NULL, 'NIF123456'),
('Supplier B', '456 Avenue', 987654321, 123456789, 'NIF654321');

-- Insert into brands
INSERT INTO culampolla.brands (brands_name, suppliers_suppliers_id) VALUES
('Brand X', 1),
('Brand Y', 2);

-- Insert into employees
INSERT INTO culampolla.employees (employees_name) VALUES
('Alice Johnson'),
('Bob Smith');

-- Insert into costumers
INSERT INTO culampolla.costumers (costumers_name, costumers_post_adress, costumers_email, costumers_tel, costumers_timestamp, costumers_broughtby_costumers_id) VALUES
('John Doe', '789 Boulevard', 'john.doe@email.com', 111222333, NOW(), NULL),
('Jane Roe', '101 Road', 'jane.roe@email.com', 444555666, NOW(), 1);

-- Insert into sales
INSERT INTO culampolla.sales (sales_timestamp, costumers_costumers_id, employees_employees_id) VALUES
(NOW(), 1, 1),
(NOW(), 2, 2);

-- Insert into glasses
INSERT INTO culampolla.glasses (glasses_prescription_left, glasses_prescription_right, glasses_frame_type, glasses_frame_color, glasses_color_left, glasses_color_right, glasses_price, brands_idbrands, sales_sales_id) VALUES
(-2.5, -2.0, 'Full-Rim', 'Black', 'Blue', 'Blue', 150.00, 1, 1),
(-1.0, -1.5, 'Half-Rim', 'Silver', 'Green', 'Green', 200.00, 2, 2);
