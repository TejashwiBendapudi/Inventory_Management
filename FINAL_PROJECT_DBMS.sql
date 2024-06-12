-- Create Database
CREATE DATABASE IF NOT EXISTS Inventory_Management;
USE Inventory_Management;

-- Create Products Table
CREATE TABLE IF NOT EXISTS Products (
    product_ID VARCHAR(20) PRIMARY KEY,
    category VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    inventory_count INT
);

-- Create Suppliers Table
CREATE TABLE IF NOT EXISTS Suppliers (
    supplier_ID INT PRIMARY KEY AUTO_INCREMENT,
    product_ID VARCHAR(20),
    category VARCHAR(255),
    price DECIMAL(10, 2),
    shipping_method VARCHAR(255),
    contact_email VARCHAR(255),
    contact_phone VARCHAR(20),
    FOREIGN KEY (product_ID) REFERENCES Products(product_ID)
);

-- Create Inventory Table
CREATE TABLE IF NOT EXISTS Inventory (
    product_ID VARCHAR(20) PRIMARY KEY,
    quantity INT,
    price DECIMAL(10, 2),
    category VARCHAR(255),
    last_updated_date DATE,
    FOREIGN KEY (product_ID) REFERENCES Products(product_ID)
);

-- Create Transactions Table
CREATE TABLE IF NOT EXISTS transactions (
    transaction_ID INT PRIMARY KEY AUTO_INCREMENT,
    customer_ID INT,
    product_ID VARCHAR(20),
    quantity INT,
    transaction_date DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (product_ID) REFERENCES Products(product_ID)
);

-- Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255),
    contact_email VARCHAR(255),
    contact_phone VARCHAR(20),
    address TEXT,
    registration_date DATE
);




-- INSERTING DATA INTO THE TABLES IN A DATABASE

-- Insert Data into Products Table
INSERT INTO Products (product_ID, category, description, price, inventory_count) VALUES
-- Wellness Category
('WL1001', 'wellness', 'Calcium Complex', 52.00, 100),
('WL1002', 'wellness', 'Multivitamins', 44.00, 150),
('WL1003', 'wellness', 'D-Tox', 55.00, 200),
('WL1004', 'wellness', 'Flax Seed Oil', 65.30, 120),
('WL1005', 'wellness', 'Vitamin D-3', 49.99, 110),
('WL1006', 'wellness', 'Vitamin-C', 49.99, 130),
('WL1007', 'wellness', 'Iron & Folic Acid', 32.50, 140),
('WL1008', 'wellness', 'Vitamin B-Complex', 49.99, 160),
('WL1009', 'wellness', 'Amla Capsules', 24.50, 180),
('WL1010', 'wellness', 'Turmeric', 40.80, 190),
('WL1011', 'wellness', 'Spirulina', 48.50, 200),
('WL1012', 'wellness', 'Cardio Activ', 54.00, 210),
('WL1013', 'wellness', 'Giloy', 23.00, 220),
('WL1014', 'wellness', 'Brainactiv', 23.35, 230),
('WL1015', 'wellness', 'Omega 3', 55.10, 240),

-- Cosmetic Category
('UC1110', 'Cosmetic', 'Matte Lipstick', 375.00, 150),
('UC1000', 'Cosmetic', 'Gold collection kajal', 799.00, 80),
('UC1001', 'Cosmetic', 'Gold collection matte lipstick', 799.00, 110),
('UC1002', 'Cosmetic', 'Gold collection creme lipstick', 799.00, 90),
('UC2305', 'Cosmetic', 'Pro Eyeshadow Brush', 799.00, 70),
('UC2307', 'Cosmetic', 'Pro-contour Brush', 1599.00, 140),
('UC1901', 'Cosmetic', 'Matte liquid lipstick', 499.00, 100),
('UC6101', 'Cosmetic', 'Matte Foundation', 599.00, 100),
('UC7101', 'Cosmetic', 'Ultimate Radiance Compact', 700.00, 120),
('UC1801', 'Cosmetic', 'Eyeliner', 345.00, 50),
('UC3101', 'Cosmetic', 'Lip Balm (Tinted)', 199.00, 40),

-- Personal Care Category
('PC0078', 'Personal Care', 'Deep Nourish cold cream', 199.00, 90),
('PC2000', 'Personal Care', 'Fluoride Toothpaste', 85.00, 200),
('PC5229', 'Personal Care', 'White pearl soap', 230.00, 150),
('PC0003', 'Personal Care', 'Instante Tea Tree Oil', 355.00, 80),
('PC0073', 'Personal Care', 'Sanitary Napkin', 265.00, 250),
('PC2002', 'Personal Care', 'Tooth Brush', 196.00, 70),

-- Food & Beverages Category
('FP0006', 'Food & Beverages', 'Coconut oil', 267.00, 100),
('FP0016', 'Food & Beverages', 'Cow Ghee', 765.00, 60),
('FP3140', 'Food & Beverages', 'Instant Coffee', 259.00, 90),
('FP3121', 'Food & Beverages', 'Basmati Rice', 230.00, 80),
('FP0033', 'Food & Beverages', 'Tea powder', 139.00, 110),

-- Others Category
('MM0009', 'Others', 'Parker pen', 500.00, 150),
('MM0011', 'Others', 'Collar T-shirt', 900.00, 140),
('MM0008', 'Others', 'Cap', 450.00, 160),
('MM0001', 'Others', 'Laptop Bag', 2499.00, 40),
('MM0029', 'Others', 'Wall Clock', 750.00, 80),

-- Home Care Category
('HC0006', 'Home Care', 'Dish washing liquid', 230.00, 60),
('HC3028', 'Home Care', 'Scale and bathroom cleaner', 199.00, 50),
('HC3030', 'Home Care', 'Multipurpose cleaner', 165.00, 70),
('HC2024', 'Home Care', 'Glass cleaner', 195.00, 90),
('HC2021', 'Home Care', 'Heavy duty floor cleaner', 175.00, 110),
('HC5005', 'Home Care', 'Stain steel scrubber', 150.00, 100),
('HC0027', 'Home Care', 'Liquid toilet cleaner', 189.00, 200),
('HC3031', 'Home Care', 'Shine & protect spray', 545.00, 40),

-- Skin Care Category
('SC2001', 'Skin Care', 'Moroccan Argan oil cleanser', 480.00, 80),
('SC2002', 'Skin Care', 'Fairness cream', 290.00, 50),
('SC2003', 'Skin Care', 'Moroccan AO Facial kit', 260.00, 120),
('SC2004', 'Skin Care', 'Gold Facial kit', 260.00, 90),
('SC2005', 'Skin Care', 'Avocado Face scrub', 305.00, 150),
('SC2006', 'Skin Care', 'Body Butter', 348.00, 70),
('SC2007', 'Skin Care', 'Sunscreen 50 PA+++', 360.00, 110),
('SC2008', 'Skin Care', 'Sunscreen 30 PA+++', 290.00, 130),
('SC2009', 'Skin Care', 'Mud Mask (Charcoal)', 340.00, 100),
('SC2010', 'Skin Care', 'Mud Facial Bar', 375.00, 50),
('SC2011', 'Skin Care', 'Day Cream', 288.00, 140),
('SC2012', 'Skin Care', 'Facial Cream', 342.00, 160),
('SC2013', 'Skin Care', 'Glow Face Pack', 240.00, 60),
('SC2014', 'Skin Care', 'Under Eye cream', 180.00, 40),
('SC2015', 'Skin Care', 'MAD scrub', 240.00, 200),
('SC2016', 'Skin Care', 'D-Tan Face pack', 215.00, 90),
('SC2017', 'Skin Care', 'Neem Face Wash', 215.00, 80),
('SC2018', 'Skin Care', '3 in 1 cleanse, toner & makeup remover', 340.00, 100),

-- Laundry Care Category
('LC1018', 'Laundry Care', 'Detergent powder', 176.00, 40),
('LC2017', 'Laundry Care', 'Delicate Liquid Detergent', 375.00, 70),
('LC3021', 'Laundry Care', 'Pre-wash Dirt & Stain Remover', 190.00, 50),
('LC4004', 'Laundry Care', 'Detergent Bar', 114.00, 60),

-- Agriculture Category
('AG0009', 'Agriculture', 'Activmax', 765.00, 15),
('AG0004', 'Agriculture', 'Active-80 Gold', 735.00, 20),
('AG0006', 'Agriculture', 'ActVzyme', 655.00, 10),
('AG0002', 'Agriculture', 'Active 80', 600.00, 25),

-- Auto Care Category
('AC3005', 'Auto Care', 'Autowash', 138.00, 20),

-- Lifestyle Category
('AP0002', 'Lifestyle', 'Air purifier', 4500.00, 15),
('AP0003', 'Lifestyle', 'Premium water pitcher', 3490.00, 10),

-- Fragrances Category
('FG0001', 'Fragrances', 'Deep Noir Homme EDP', 2400.00, 50),
('FG0002', 'Fragrances', 'Oud Homme EDP', 2400.00, 50),
('FG0003', 'Fragrances', 'Silk Muse Femme EDP', 2400.00, 50);





-- Insert Data into Customers Table
INSERT INTO Customers (customer_name, contact_email, contact_phone, address, registration_date) VALUES
('Paul Johnson', 'pauljohnson@example.com', '9876543212', '789 Oak St, Villagetown', '2024-01-03'),
('John Doe', 'johndoe@example.com', '9876543210', '123 Main St, Cityville', '2024-01-01'),
('Jane Smith', 'janesmith@example.com', '9876543211', '456 Elm St, Townsville', '2024-01-02'),
('Alice Brown', 'alicebrown@example.com', '9876543213', '321 Pine St, Hamletville', '2024-01-04'),
('Bob Martin', 'bobmartin@example.com', '9876543214', '654 Cedar St, Hamletville', '2024-01-05'),
('Carol White', 'carolwhite@example.com', '9876543215', '987 Maple St, Metropolis', '2024-01-06'),
('David Green', 'davidgreen@example.com', '9876543216', '123 Birch St, Smalltown', '2024-01-07'),
('Eve Black', 'eveblack@example.com', '9876543217', '456 Walnut St, Bigcity', '2024-01-08'),
('Frank Gray', 'frankgray@example.com', '9876543218', '789 Chestnut St, Littletown', '2024-01-09'),
('Grace Blue', 'graceblue@example.com', '9876543219', '321 Elm St, Midville', '2024-01-10'),
('Hank Violet', 'hankviolet@example.com', '9876543220', '654 Spruce St, Oldtown', '2024-01-11'),
('Ivy Orange', 'ivyorange@example.com', '9876543221', '987 Pine St, Newville', '2024-01-12'),
('Jack Brown', 'jackbrown@example.com', '9876543222', '123 Oak St, Uptown', '2024-01-13'),
('Kelly Green', 'kellygreen@example.com', '9876543223', '456 Cedar St, Downtown', '2024-01-14'),
('Leo Red', 'leored@example.com', '9876543224', '789 Birch St, Centralcity', '2024-01-15'),
('Mona Pink', 'monapink@example.com', '9876543225', '321 Maple St, Westville', '2024-01-16'),
('Nick Purple', 'nickpurple@example.com', '9876543226', '654 Walnut St, Eastville', '2024-01-17'),
('Olivia Silver', 'oliviasilver@example.com', '9876543227', '987 Chestnut St, Northville', '2024-01-18'),
('Pete Gold', 'petegold@example.com', '9876543228', '123 Elm St, Southville', '2024-01-19'),
('Quincy Blue', 'quincyblue@example.com', '9876543229', '456 Spruce St, Centralville', '2024-01-20'),
('Rachel Black', 'rachelblack@example.com', '9876543230', '789 Pine St, Edgeville', '2024-01-21'),
('Sam White', 'samwhite@example.com', '9876543231', '321 Oak St, Westend', '2024-01-22'),
('Tina Brown', 'tinabrown@example.com', '9876543232', '654 Cedar St, Eastend', '2024-01-23'),
('Uma Gray', 'umagray@example.com', '9876543233', '987 Birch St, Northend', '2024-01-24'),
('Victor Red', 'victorred@example.com', '9876543234', '123 Maple St, Southend', '2024-01-25');


-- Insert Data into Suppliers Table
INSERT INTO Suppliers (supplier_ID, product_ID, category, price, shipping_method, contact_email, contact_phone) VALUES
(26864, 'WL1001', 'wellness', 52.00, 'Road', 'supplier1@hyderabad.com', '9876543210'),
(27234, 'UC1110', 'Cosmetic', 375.00, 'Road', 'supplier2@medak.com', '9876543211'),
(17989, 'PC0078', 'Personal Care', 199.00, 'Road', 'supplier3@rangareddy.com', '9876543212'),
(22193, 'FP0006', 'Food & Beverages', 267.00, 'Road', 'supplier4@nizamabad.com', '9876543213'),
(15074, 'HC0006', 'Home Care', 230.00, 'Road', 'supplier5@rangareddy.com', '9876543214');



-- Insert Data into Inventory Table
INSERT INTO Inventory (product_ID, quantity, price, category, last_updated_date) VALUES
-- Wellness Category
('WL1001', 40, 52.00, 'wellness', '2024-05-17'),
('WL1002', 35, 44.00, 'wellness', '2024-05-17'),
('WL1003', 50, 55.00, 'wellness', '2024-05-17'),
('WL1004', 45, 65.30, 'wellness', '2024-05-17'),
('WL1005', 42, 49.99, 'wellness', '2024-05-17'),
('WL1006', 38, 49.99, 'wellness', '2024-05-17'),
('WL1007', 47, 32.50, 'wellness', '2024-05-17'),
('WL1008', 44, 49.99, 'wellness', '2024-05-17'),
('WL1009', 49, 24.50, 'wellness', '2024-05-17'),
('WL1010', 43, 40.80, 'wellness', '2024-05-17'),
('WL1011', 41, 48.50, 'wellness', '2024-05-17'),
('WL1012', 48, 54.00, 'wellness', '2024-05-17'),
('WL1013', 46, 23.00, 'wellness', '2024-05-17'),
('WL1014', 39, 23.35, 'wellness', '2024-05-17'),
('WL1015', 37, 55.10, 'wellness', '2024-05-17'),

-- Cosmetic Category
('UC1110', 48, 375.00, 'Cosmetic', '2024-05-17'),
('UC1000', 45, 799.00, 'Cosmetic', '2024-05-17'),
('UC1001', 40, 799.00, 'Cosmetic', '2024-05-17'),
('UC1002', 42, 799.00, 'Cosmetic', '2024-05-17'),
('UC2305', 43, 799.00, 'Cosmetic', '2024-05-17'),
('UC2307', 47, 1599.00, 'Cosmetic', '2024-05-17'),
('UC1901', 49, 499.00, 'Cosmetic', '2024-05-17'),
('UC6101', 46, 599.00, 'Cosmetic', '2024-05-17'),
('UC7101', 44, 700.00, 'Cosmetic', '2024-05-17'),
('UC1801', 41, 345.00, 'Cosmetic', '2024-05-17'),
('UC3101', 39, 199.00, 'Cosmetic', '2024-05-17'),

-- Personal Care Category
('PC0078', 48, 199.00, 'Personal Care', '2024-05-17'),
('PC2000', 44, 85.00, 'Personal Care', '2024-05-17'),
('PC5229', 40, 230.00, 'Personal Care', '2024-05-17'),
('PC0003', 49, 355.00, 'Personal Care', '2024-05-17'),
('PC0073', 46, 265.00, 'Personal Care', '2024-05-17'),
('PC2002', 43, 196.00, 'Personal Care', '2024-05-17'),

-- Food & Beverages Category
('FP0006', 47, 267.00, 'Food & Beverages', '2024-05-17'),
('FP0016', 44, 765.00, 'Food & Beverages', '2024-05-17'),
('FP3140', 41, 259.00, 'Food & Beverages', '2024-05-17'),
('FP3121', 48, 230.00, 'Food & Beverages', '2024-05-17'),
('FP0033', 43, 139.00, 'Food & Beverages', '2024-05-17'),

-- Others Category
('MM0009', 46, 500.00, 'Others', '2024-05-17'),
('MM0011', 45, 900.00, 'Others', '2024-05-17'),
('MM0008', 40, 450.00, 'Others', '2024-05-17'),
('MM0001', 49, 2499.00, 'Others', '2024-05-17'),
('MM0029', 42, 750.00, 'Others', '2024-05-17'),

-- Home Care Category
('HC0006', 47, 230.00, 'Home Care', '2024-05-17'),
('HC3028', 43, 199.00, 'Home Care', '2024-05-17'),
('HC3030', 41, 165.00, 'Home Care', '2024-05-17'),
('HC2024', 48, 195.00, 'Home Care', '2024-05-17'),
('HC2021', 44, 175.00, 'Home Care', '2024-05-17'),
('HC5005', 40, 150.00, 'Home Care', '2024-05-17'),
('HC0027', 49, 189.00, 'Home Care', '2024-05-17'),
('HC3031', 46, 545.00, 'Home Care', '2024-05-17'),

-- Skin Care Category
('SC2001', 42, 480.00, 'Skin Care', '2024-05-17'),
('SC2002', 47, 290.00, 'Skin Care', '2024-05-17'),
('SC2003', 44, 260.00, 'Skin Care', '2024-05-17'),
('SC2004', 48, 260.00, 'Skin Care', '2024-05-17'),
('SC2005', 45, 305.00, 'Skin Care', '2024-05-17'),
('SC2006', 41, 348.00, 'Skin Care', '2024-05-17'),
('SC2007', 49, 360.00, 'Skin Care', '2024-05-17'),
('SC2008', 46, 290.00, 'Skin Care', '2024-05-17'),
('SC2009', 40, 340.00, 'Skin Care', '2024-05-17'),
('SC2010', 43, 375.00, 'Skin Care', '2024-05-17'),
('SC2011', 44, 288.00, 'Skin Care', '2024-05-17'),
('SC2012', 45, 342.00, 'Skin Care', '2024-05-17'),
('SC2013', 42, 240.00, 'Skin Care', '2024-05-17'),
('SC2014', 48, 180.00, 'Skin Care', '2024-05-17'),
('SC2015', 41, 240.00, 'Skin Care', '2024-05-17'),
('SC2016', 49, 215.00, 'Skin Care', '2024-05-17'),
('SC2017', 46, 215.00, 'Skin Care', '2024-05-17'),
('SC2018', 44, 340.00, 'Skin Care', '2024-05-17'),

-- Laundry Care Category
('LC1018', 40, 176.00, 'Laundry Care', '2024-05-17'),
('LC2017', 43, 375.00, 'Laundry Care', '2024-05-17'),
('LC3021', 47, 190.00, 'Laundry Care', '2024-05-17'),
('LC4004', 45, 114.00, 'Laundry Care', '2024-05-17'),

-- Agriculture Category
('AG0009', 20, 765.00, 'Agriculture', '2024-05-17'),
('AG0004', 30, 735.00, 'Agriculture', '2024-05-17'),
('AG0006', 25, 655.00, 'Agriculture', '2024-05-17');
 


INSERT INTO Transactions (transaction_ID, customer_ID, product_ID, quantity, transaction_date, total_price) VALUES
('0002', 1002, 'UC1110', 1, '2024-05-10', 375.00), -- (1 * 375.00)
('0003', 1003, 'PC0078', 3, '2024-05-11', 597.00), -- (3 * 199.00)
('0004', 1004, 'FP0006', 4, '2024-05-11', 1068.00), -- (4 * 267.00)
('0005', 1005, 'MM0009', 2, '2024-05-12', 1000.00), -- (2 * 500.00)
('0006', 1006, 'HC0006', 1, '2024-05-12', 230.00), -- (1 * 230.00)
('0007', 1007, 'SC2001', 1, '2024-05-13', 480.00), -- (1 * 480.00)
('0008', 1008, 'LC1018', 2, '2024-05-13', 352.00), -- (2 * 176.00)
('0009', 1009, 'AG0009', 1, '2024-05-14', 765.00), -- (1 * 765.00)
('0010', 1010, 'UC1000', 1, '2024-05-14', 799.00), -- (1 * 799.00)
('0011', 1011, 'WL1002', 3, '2024-05-15', 132.00), -- (3 * 44.00)
('0012', 1012, 'PC0003', 2, '2024-05-15', 710.00), -- (2 * 355.00)
('0013', 1013, 'FP0033', 5, '2024-05-16', 695.00), -- (5 * 139.00)
('0014', 1014, 'MM0029', 1, '2024-05-16', 750.00); -- (1 * 750.00)





-- QUERIES TO FIND INSIGHTS FROM THE DATA

-- query1
SELECT 
    c.customer_ID,
    c.customer_name,
    c.contact_email AS customer_email,
    c.contact_phone AS customer_phone,
    SUM(t.total_price) AS total_sales_amount,
    COUNT(t.transaction_ID) AS total_transactions,
    AVG(t.total_price) AS average_transaction_amount,
    GROUP_CONCAT(DISTINCT p.category ORDER BY p.category) AS purchased_categories,
    GROUP_CONCAT(DISTINCT s.supplier_ID ORDER BY s.supplier_ID) AS suppliers_involved
FROM 
    Transactions t
JOIN 
    Customers c ON t.customer_ID = c.customer_ID
JOIN 
    Products p ON t.product_ID = p.product_ID
JOIN 
    Suppliers s ON p.product_ID = s.product_ID
GROUP BY 
    c.customer_ID, c.customer_name, c.contact_email, c.contact_phone;
    
    
    
-- query2
SELECT 
    c.customer_ID,
    c.customer_name,
    c.contact_email AS customer_email,
    c.contact_phone AS customer_phone,
    SUM(t.quantity) AS total_products_purchased,
    SUM(t.total_price) AS total_amount_spent,
    GROUP_CONCAT(DISTINCT p.category ORDER BY p.category) AS purchased_categories,
    GROUP_CONCAT(DISTINCT s.supplier_ID ORDER BY s.supplier_ID) AS suppliers_involved
FROM 
    Transactions t
JOIN 
    Customers c ON t.customer_ID = c.customer_ID
JOIN 
    Products p ON t.product_ID = p.product_ID
JOIN 
    Suppliers s ON p.product_ID = s.product_ID
GROUP BY 
    c.customer_ID, c.customer_name, c.contact_email, c.contact_phone
ORDER BY 
    total_products_purchased DESC, total_amount_spent DESC
LIMIT 5;


-- query3
WITH TopProducts AS (
    SELECT 
        t.product_ID,
        SUM(t.quantity) AS total_quantity_sold
    FROM 
        Transactions t
    GROUP BY 
        t.product_ID
    ORDER BY 
        total_quantity_sold DESC
    LIMIT 5
)
SELECT 
    s.supplier_ID,
    s.product_ID,
    s.category,
    s.price,
    s.shipping_method,
    s.contact_email,
    s.contact_phone,
    tp.total_quantity_sold
FROM 
    Suppliers s
JOIN 
    TopProducts tp ON s.product_ID = tp.product_ID;
    
    -- query 4

SELECT 
    s.supplier_ID,
    s.contact_email,
    s.contact_phone,
    AVG(i.quantity * i.price) AS average_inventory_value
FROM 
    Suppliers s
JOIN 
    Products p ON s.product_ID = p.product_ID
JOIN 
    Inventory i ON p.product_ID = i.product_ID
GROUP BY 
    s.supplier_ID, s.contact_email, s.contact_phone;
    
-- query 5
SELECT 
    p.category,
    COUNT(DISTINCT t.product_ID) AS number_of_products_sold
FROM 
    Transactions t
JOIN 
    Products p ON t.product_ID = p.product_ID
GROUP BY 
    p.category;

    
    
    -- Query 6
-- Create the log table for deleted transactions
CREATE TABLE DeletedTransactionsLog (
    log_ID INT AUTO_INCREMENT PRIMARY KEY,
    transaction_ID VARCHAR(10),
    customer_ID INT,
    product_ID VARCHAR(20),
    quantity INT,
    transaction_date DATE,
    total_price DECIMAL(10, 2),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the trigger to log deleted transactions
CREATE TRIGGER LogDeletedTransactions
AFTER DELETE ON Transactions
FOR EACH ROW
INSERT INTO DeletedTransactionsLog (
    transaction_ID, 
    customer_ID, 
    product_ID, 
    quantity, 
    transaction_date, 
    total_price
) VALUES (
    OLD.transaction_ID, 
    OLD.customer_ID, 
    OLD.product_ID, 
    OLD.quantity, 
    OLD.transaction_date, 
    OLD.total_price
);

-- Test the trigger by deleting a transaction (example)
-- DELETE FROM Transactions WHERE transaction_ID = '0001';






-- UPDATING THE CUSTOMER_ID IN CUSTOMER TABLE AS IT WAS RECORDED INCORRECTLY


-- Step 1: Disable safe updates
SET SQL_SAFE_UPDATES = 0;

-- Step 2: Create a variable to hold the starting value
SET @counter = 1000;

-- Step 3: Update the customer_ID column with sequential values starting from 1001
UPDATE Customers
SET customer_ID = (@counter := @counter + 1);

-- Step 4: Re-enable safe updates
SET SQL_SAFE_UPDATES = 1;


-- Select all columns from the Customers table
SELECT * FROM Customers;





