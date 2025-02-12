-- Insert data into `suppliers`
INSERT INTO `culampolla`.`suppliers` (`suppliers_name`, `suppliers_address`, `suppliers_phone`, `suppliers_fax`, `NIF`)
VALUES
('OptiSupply Inc.', '123 Elm St, Springfield', 123456789, 987654321, 'A12345678B'),
('Visionary Optics', '456 Oak St, Shelbyville', 234567890, 876543210, 'B23456789C'),
('LensCrafters Ltd.', '789 Pine St, Capital City', 345678901, 765432109, 'C34567890D');

-- Insert data into `brands`
INSERT INTO `culampolla`.`brands` (`brands_name`, `suppliers_suppliers_id`)
VALUES
('Ray-Ban', 1),
('Oakley', 2),
('Gucci', 3),
('Prada', 1),
('Versace', 2);

-- Insert data into `costumers`
INSERT INTO `culampolla`.`costumers` (`costumers_name`, `costumers_post_adress`, `costumers_email`, `costumers_tel`, `costumers_timestamp`, `costumers_broughtby_costumers_id`)
VALUES
('John Doe', '123 Main St, Metropolis', 'john.doe@example.com', 555123456, '2025-02-11 12:00:00', NULL),
('Jane Smith', '456 Elm St, Smallville', 'jane.smith@example.com', 555234567, '2025-02-11 12:15:00', 1),
('Alice Johnson', '789 Oak St, Gotham', 'alice.johnson@example.com', 555345678, '2025-02-11 12:30:00', 2),
('Bob Brown', '321 Pine St, Star City', 'bob.brown@example.com', 555456789, '2025-02-11 12:45:00', 1);

-- Insert data into `employees`
INSERT INTO `culampolla`.`employees` (`employees_name`)
VALUES
('Michael Scott'),
('Dwight Schrute'),
('Pam Beesly');

-- Insert data into `glasses`
INSERT INTO `culampolla`.`glasses` (`glasses_prescription_left`, `glasses_prescription_right`, `glasses_frame_type`, `glasses_frame_color`, `glasses_color_left`, `glasses_color_right`, `glasses_price`, `brands_idbrands`, `sales_sales_id`)
VALUES
(-1.25, -1.50, 'Full Rim', 'Black', 'Clear', 'Clear', 150.00, 1, NULL),
(-2.00, -2.25, 'Half Rim', 'Silver', 'Blue', 'Blue', 200.00, 2, NULL),
(-0.75, -1.00, 'Rimless', 'Gold', 'Green', 'Green', 250.00, 3, NULL),
(-3.50, -3.75, 'Full Rim', 'Red', 'Brown', 'Brown', 300.00, 4, NULL);

-- Insert data into `sales`
INSERT INTO `culampolla`.`sales` (`sales_timestamp`, `costumers_costumers_id`, `employees_employees_id`)
VALUES
('2025-02-11 13:00:00', 1, 1),
('2025-02-11 13:15:00', 2, 2),
('2025-02-11 13:30:00', 3, 3);

-- Update `glasses` to associate them with sales
UPDATE `culampolla`.`glasses` SET `sales_sales_id` = 1 WHERE `glasses_id` = 1;
UPDATE `culampolla`.`glasses` SET `sales_sales_id` = 2 WHERE `glasses_id` = 2;
UPDATE `culampolla`.`glasses` SET `sales_sales_id` = 3 WHERE `glasses_id` = 3;