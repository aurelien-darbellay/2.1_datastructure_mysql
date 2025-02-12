-- Insert data into `provinces`
INSERT INTO `Pizzeria`.`provinces` (`provinces_name`)
VALUES
('Barcelona'),
('Girona'),
('Tarragona'),
('Lleida');

-- Insert data into `localities`
INSERT INTO `Pizzeria`.`localities` (`localities_name`, `provinces_provinces_id`)
VALUES
('Barcelona City', 1),
('Girona City', 2),
('Tarragona City', 3),
('Lleida City', 4);

-- Insert data into `stores`
INSERT INTO `Pizzeria`.`stores` (`stores_address`, `stores_zipcode`, `localities_localities_id`)
VALUES
('123 Main St, Barcelona', '08001', 1),
('456 Elm St, Girona', '17001', 2),
('789 Oak St, Tarragona', '43001', 3);

-- Insert data into `employees`
INSERT INTO `Pizzeria`.`employees` (`employees_name`, `employees_lastname`, `employees_nif`, `employees_tel`, `employees_role`, `stores_stores_id`)
VALUES
('John', 'Doe', '12345678A', 555123456, 'Delivery', 1),
('Jane', 'Smith', '87654321B', 555234567, 'Kitchen', 1),
('Alice', 'Johnson', '56781234C', 555345678, 'Delivery', 2),
('Bob', 'Brown', '43218765D', 555456789, 'Kitchen', 3);

-- Insert data into `costumers`
INSERT INTO `Pizzeria`.`costumers` (`costumers_name`, `costumers_lastname`, `costumers_address`, `costumers_zipcode`, `localities_localities_id`)
VALUES
('Michael', 'Scott', '123 Paper St, Barcelona', '08001', 1),
('Dwight', 'Schrute', '456 Beet Farm Rd, Girona', '17001', 2),
('Pam', 'Beesly', '789 Art St, Tarragona', '43001', 3);

-- Insert data into `pizza_categories`
INSERT INTO `Pizzeria`.`pizza_categories` (`pizza_categories_name`, `pizza_categories_lastupdate`)
VALUES
('Margherita', '2025-02-11 12:00:00'),
('Pepperoni', '2025-02-11 12:15:00'),
('Vegetarian', '2025-02-11 12:30:00');

-- Insert data into `products`
INSERT INTO `Pizzeria`.`products` (`products_name`, `products_type`, `products_price`, `pizza_categories_pizza_categories_id`)
VALUES
('Margherita Pizza', 'Pizza', 10.99, 1),
('Pepperoni Pizza', 'Pizza', 12.99, 2),
('Vegetarian Pizza', 'Pizza', 11.99, 3),
('Cheeseburger', 'Burger', 8.99, NULL),
('Coca-Cola', 'Drink', 2.99, NULL);

-- Insert data into `orders`
INSERT INTO `Pizzeria`.`orders` (`orders_timestamp`, `orders_totalPrice`, `orders_type`, `employees_employees_id`, `costumers_costumers_id`)
VALUES
('2025-02-11 13:00:00', 23.98, 'Delivery', 1, 1),
('2025-02-11 13:15:00', 12.99, 'Pick up', NULL, 2),
('2025-02-11 13:30:00', 14.98, 'Delivery', 3, 3);

-- Insert data into `orders_has_productType`
INSERT INTO `Pizzeria`.`orders_has_productType` (`orders_orders_id`, `orders_productType`, `orders_has_productType_num`)
VALUES
(1, 'Pizza', 2),
(1, 'Drink', 1),
(2, 'Pizza', 1),
(3, 'Burger', 1),
(3, 'Drink', 1);