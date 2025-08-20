My SQL:
First I created a database:
CREATE DATABASE tunnel_project;
Then selected the database, this line should be always there if I want to do anything with this database:
USE tunnel_project;
Then create all the tables.

1. CREATE TABLE sustainability (
    sustainability_id INT AUTO_INCREMENT PRIMARY KEY,
    carbon_emission DECIMAL(10,2) NOT NULL,
    eco_rating VARCHAR(10) NOT NULL
);


### Populating sustainability table:
INSERT INTO sustainability (carbon_emission, eco_rating) VALUES
    (500, 'A'),
    (750, 'B'),
    (900, 'C'),
    (1200, 'B'),
    (300, 'A'),
    (950, 'C'),
    (400, 'A'),
    (1100, 'B'),
    (1300, 'C'),
    (600, 'A'),
    (700, 'B'),
    (800, 'C'),
    (1500, 'C'),
    (250, 'A'),
    (1000, 'B'),
    (350, 'A'),
    (450, 'A'),
    (1400, 'C'),
    (500, 'A'),
    (200, 'A'),
    (1250, 'B'),
    (1600, 'C'),
    (550, 'A'),
    (1050, 'C'),
    (1350, 'C'),
    (280, 'A');

INSERT INTO sustainability (carbon_emission, eco_rating)
VALUES (420, 'A'),
(740, 'B');

2.  USE tunnel_project;
CREATE TABLE staff (
  staff_id INT AUTO_INCREMENT PRIMARY KEY,
  staff_name VARCHAR(100) NOT NULL,
  role VARCHAR(50),
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  last_login DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);




3. USE tunnel_project;
CREATE TABLE tunnels (
  tunnel_id INT AUTO_INCREMENT PRIMARY KEY,
  tunnel_name VARCHAR(100) NOT NULL,
  location VARCHAR(100),
  length DECIMAL(5,2),
  unit VARCHAR(20),
  operating_authority VARCHAR(100),
  sustainability_id INT,
  staff_id INT,
  user_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

4.  Use tunnel_project;
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  full_name VARCHAR(100),
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20),
  password_hash VARCHAR(255) NOT NULL,
  last_login DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



#### Populate:
INSERT INTO users (username, full_name, email, phone, password_hash, last_login)
VALUES
('jdoe01', 'John Doe', 'jdoe01@example.com', '07123456701', 'hashed_pw_01', NULL),
('asmith', 'Alice Smith', 'asmith@example.com', '07123456702', 'hashed_pw_02', NULL),
('bparker', 'Ben Parker', 'bparker@example.com', '07123456703', 'hashed_pw_03', NULL),
('emalik', 'Elena Malik', 'emalik@example.com', '07123456704', 'hashed_pw_04', NULL),
('tnguyen', 'Tom Nguyen', 'tnguyen@example.com', '07123456705', 'hashed_pw_05', NULL),
('lgomez', 'Lena Gomez', 'lgomez@example.com', '07123456706', 'hashed_pw_06', NULL),
('dvazquez', 'Diego Vazquez', 'dvazquez@example.com', '07123456707', 'hashed_pw_07', NULL),
('ayoung', 'Amy Young', 'ayoung@example.com', '07123456708', 'hashed_pw_08', NULL),
('kpatel', 'Kiran Patel', 'kpatel@example.com', '07123456709', 'hashed_pw_09', NULL),
('zchow', 'Zara Chow', 'zchow@example.com', '07123456710', 'hashed_pw_10', NULL),
('nbrown', 'Nathan Brown', 'nbrown@example.com', '07123456711', 'hashed_pw_11', NULL),
('sali', 'Samira Ali', 'sali@example.com', '07123456712', 'hashed_pw_12', NULL),
('jwright', 'James Wright', 'jwright@example.com', '07123456713', 'hashed_pw_13', NULL),
('okhan', 'Omar Khan', 'okhan@example.com', '07123456714', 'hashed_pw_14', NULL),
('hchen', 'Hua Chen', 'hchen@example.com', '07123456715', 'hashed_pw_15', NULL),
('klee', 'Kim Lee', 'klee@example.com', '07123456716', 'hashed_pw_16', NULL),
('mmorris', 'Maya Morris', 'mmorris@example.com', '07123456717', 'hashed_pw_17', NULL),
('rwood', 'Ryan Wood', 'rwood@example.com', '07123456718', 'hashed_pw_18', NULL),
('smills', 'Sarah Mills', 'smills@example.com', '07123456719', 'hashed_pw_19', NULL),
('dcampbell', 'Dylan Campbell', 'dcampbell@example.com', '07123456720', 'hashed_pw_20', NULL),
('eblack', 'Ella Black', 'eblack@example.com', '07123456721', 'hashed_pw_21', NULL),
('gnguyen', 'George Nguyen', 'gnguyen@example.com', '07123456722', 'hashed_pw_22', NULL),
('vlawson', 'Victoria Lawson', 'vlawson@example.com', '07123456723', 'hashed_pw_23', NULL),
('jmunoz', 'Jose Munoz', 'jmunoz@example.com', '07123456724', 'hashed_pw_24', NULL),
('mroberts', 'Maria Roberts', 'mroberts@example.com', '07123456725', 'hashed_pw_25', NULL),
('eknight', 'Ethan Knight', 'eknight@example.com', '07123456726', 'hashed_pw_26', NULL);
INSERT INTO users (username, full_name, email, phone, password_hash, last_login)
VALUES ('nhossen', 'Neela Hossen', 'nhossen34@example.com', '07243240203', 'hashed_pw_27', NULL),
('akhayer', 'Abul Khayer', 'ak2345@example.com', '07438923759', 'hashed_pw_28', NULL);


##### Staff table population:
INSERT INTO staff (staff_name, role, email, password_hash, last_login)
VALUES
('Grace Thomas', 'Engineer', 'grace.thomas@example.com', 'hashed_staff_01', NULL),
('Liam Harris', 'Admin', 'liam.harris@example.com', 'hashed_staff_02', NULL),
('Nina Brooks', 'Manager', 'nina.brooks@example.com', 'hashed_staff_03', NULL),
('Kyle Evans', 'Engineer', 'kyle.evans@example.com', 'hashed_staff_04', NULL),
('Sophia Diaz', 'Supervisor', 'sophia.diaz@example.com', 'hashed_staff_05', NULL),
('Oscar James', 'Engineer', 'oscar.james@example.com', 'hashed_staff_06', NULL),
('Maya Patel', 'Manager', 'maya.patel@example.com', 'hashed_staff_07', NULL),
('Jacob Scott', 'Admin', 'jacob.scott@example.com', 'hashed_staff_08', NULL),
('Isla Ford', 'Engineer', 'isla.ford@example.com', 'hashed_staff_09', NULL),
('Ethan Bailey', 'Supervisor', 'ethan.bailey@example.com', 'hashed_staff_10', NULL),
('Ruby Clark', 'Admin', 'ruby.clark@example.com', 'hashed_staff_11', NULL),
('Aaron Wilson', 'Engineer', 'aaron.wilson@example.com', 'hashed_staff_12', NULL),
('Freya Lewis', 'Supervisor', 'freya.lewis@example.com', 'hashed_staff_13', NULL),
('Lucas Turner', 'Manager', 'lucas.turner@example.com', 'hashed_staff_14', NULL),
('Zoe Bennett', 'Engineer', 'zoe.bennett@example.com', 'hashed_staff_15', NULL),
('Henry Reid', 'Admin', 'henry.reid@example.com', 'hashed_staff_16', NULL),
('Amelia Moore', 'Engineer', 'amelia.moore@example.com', 'hashed_staff_17', NULL),
('Jayden Price', 'Supervisor', 'jayden.price@example.com', 'hashed_staff_18', NULL),
('Layla Gray', 'Admin', 'layla.gray@example.com', 'hashed_staff_19', NULL),
('Max Hall', 'Engineer', 'max.hall@example.com', 'hashed_staff_20', NULL),
('Lara Adams', 'Supervisor', 'lara.adams@example.com', 'hashed_staff_21', NULL),
('Elliot Chapman', 'Engineer', 'elliot.chapman@example.com', 'hashed_staff_22', NULL),
('Holly West', 'Manager', 'holly.west@example.com', 'hashed_staff_23', NULL),
('Finn Knight', 'Engineer', 'finn.knight@example.com', 'hashed_staff_24', NULL),
('Olivia Richards', 'Admin', 'olivia.richards@example.com', 'hashed_staff_25', NULL),
('Callum Foster', 'Manager', 'callum.foster@example.com', 'hashed_staff_26', NULL);


#### Populate table tunnels:
USE tunnel_project;
INSERT INTO tunnels (
  tunnel_name, location, length, unit,
  operating_authority, sustainability_id,
  staff_id, user_id, created_at, updated_at
) VALUES
('Albion Curve', 'Birmingham, UK', 2.3, 'meters', 'Birmingham Transit Co.', 1, 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Beacon Hollow', 'Leeds, UK', 4.1, 'meters', 'Leeds Infrastructure Board', 2, 2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Crayford Line', 'Kent, UK', 1.8, 'meters', 'Kent Transport Authority', 3, 3, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Dover Drift', 'Dover, UK', 5.2, 'meters', 'National Highways SE', 4, 4, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Edgewater Channel', 'London, UK', 3.7, 'meters', 'Transport for London', 5, 5, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Frostmere Tunnel', 'Sheffield, UK', 2.6, 'meters', 'Sheffield Highways Group', 6, 6, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Greenwich Link', 'London, UK', 1.9, 'meters', 'Greater London Transport', 7, 7, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Hollowgate Pass', 'York, UK', 3.5, 'meters', 'York Road Authority', 8, 8, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Ironwell Passage', 'Newcastle, UK', 4.3, 'meters', 'Newcastle Transport', 9, 9, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Jubilee Arch', 'Manchester, UK', 2.4, 'meters', 'Manchester Transit Office', 10, 10, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Kingsreach Bore', 'London, UK', 6.1, 'meters', 'London Authority Works', 1, 11, 11, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Langport Vault', 'Somerset, UK', 3.9, 'meters', 'Somerset Roads Group', 2, 12, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
("Mariner's Turn", 'Portsmouth, UK', 4.0, 'meters', 'South Coast Roads', 3, 13, 13, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Northmoor Lane', 'Leicester, UK', 1.7, 'meters', 'Leicester Highway Dept.', 4, 14, 14, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Orchard Gateway', 'Cambridge, UK', 2.1, 'meters', 'Cambridge Urban Planning', 5, 15, 15, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Parkside Spine', 'Liverpool, UK', 3.4, 'meters', 'Liverpool Infrastructure', 6, 16, 16, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Queensway Cut', 'Nottingham, UK', 4.7, 'meters', 'Nottingham Transit Unit', 7, 17, 17, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Ravensbrook Tunnel', 'Brighton, UK', 3.0, 'meters', 'Brighton Roads Board', 8, 18, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Stonehaven Route', 'Aberdeen, UK', 5.0, 'meters', 'Aberdeen Municipal Works', 9, 19, 19, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Tidepool Bypass', 'Southampton, UK', 4.2, 'meters', 'Southampton Traffic Board', 10, 20, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Unity Hollow', 'Bristol, UK', 3.3, 'meters', 'Bristol Highways Agency', 1, 21, 21, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(‘Rotherhithe', 'London, UK', 2.8, 'meters', ‘London Transport Authority', 2, 22, 22, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(‘Blackwall', 'London, UK', 2.5, 'meters', ‘London Transport Authority', 3, 23, 23, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Xbridge Spur', 'Exeter, UK', 1.6, 'meters', 'Devon County Transit', 4, 24, 24, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Yardley Tunnel', 'Coventry, UK', 3.2, 'meters', 'Coventry Urban Works', 5, 25, 25, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(‘Silver Town', 'London, UK', 3.0, 'meters', ‘London Transport Authority', 6, 26, 26, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


5. Vehicles table:
CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL,
    registration_number VARCHAR(20) NOT NULL UNIQUE,
    vehicle_type VARCHAR(30) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year YEAR,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);


### Populating Vehicles table:
  
INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(1, 'ALKS123', 'Car', 'Toyota', 'Corola', 2015),
(2, 'XYZ789', 'Truck', 'Ford', 'F-150', 2020),
(3, 'LMN312', 'Motorcycle', 'Honda', 'CB500F', 2018),
(4, 'PRS512', 'Bus', 'Mercedes-Benz', 'Sprinter', 2012),
(5, 'DEF675', 'Other', 'Tesla', 'Cybertruck', 2023),
(6, 'JLH732', 'Car', 'Audi', 'Siren', 2023),
(7, 'GHI123', 'Car', 'Tesla', 'Model X', 2022),
(8, 'VWX987', 'Motorcycle', 'Yamaha', 'MT-07', 2017),
(9, 'YZA012', 'Bus', 'Volvo', 'B9TL', 2014),
(10, 'BCD234', 'Other', 'Rivian', 'RIT', 2021),
(11, 'EJH923', 'Car', 'Audi', 'A6', 2017),
(12, 'HIJ897', 'Truck', 'Ram', '1500', 2023),
(13, 'LPD023', 'Car', 'Toyota', 'Estima', 2019),
(14, 'SZN379', 'Motorcycle', 'Suzuki', 'Hayabusa', 2016),
(15, 'QRS401', 'Other', 'Lucid', 'Air', 2024),
(16, 'TOL890', 'Other', 'Lucid', 'Air', 2024),
(17, 'MNO832', 'Car', 'Hyundai', 'Tucson', 2018),
(18, 'PQRS421', 'Truck', 'Isuzu', 'D-Max', 2024),
(19, 'SLK532', 'Motorcycle', 'Ducati', 'Monster', 2018),
(20, 'HYV18L', 'Car', 'Toyota', 'Yaris', 2024),
(21, 'BUG510', 'Bus', 'Scania', 'Citywide', 2012),
(22, 'LK2GTH', 'Car', 'Audi', 'Toucan', 2018),
(23, 'AKL371', 'Truck', 'Tata', 'Prima', 2015),
(24, 'YSV384', 'Public Transport', 'Kawaski', 'Ninja 400', 2020),
(25, 'LFS452', 'Other', 'Fiat', '500e', 2025),
(26, 'NGT792', 'Car', 'Honda', 'Honda Civic’,2025);


6. USE tunnel_project;
CREATE TABLE tunnel_charges (
    charge_id INT AUTO_INCREMENT PRIMARY KEY,
    tunnel_id INT NOT NULL,
    user_id INT NOT NULL,
    vehicle_type VARCHAR(30) NOT NULL,
    base_rate DECIMAL(6,2) NOT NULL,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (tunnel_id) REFERENCES tunnels(tunnel_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


CREATE VIEW dynamic_tunnel_charges AS
SELECT 
    t.transaction_id,
    u.user_id,
    v.vehicle_id,
    v.vehicle_type,
    tc.tunnel_id,
    tc.base_rate,
    d.discount_percentage,
    -- Apply discount if available, otherwise use base_rate
    COALESCE(tc.base_rate * (1 - d.discount_percentage / 100), tc.base_rate) AS final_charge
FROM 
    transactions t
JOIN vehicles v ON t.vehicle_id = v.vehicle_id
JOIN users u ON v.user_id = u.user_id
JOIN tunnel_charges tc ON t.charge_id = tc.charge_id
LEFT JOIN discounts d 
    ON d.user_id = u.user_id 
   AND d.vehicle_type = v.vehicle_type;



####
7. CREATE TABLE tunnel_charges (
    charge_id INT AUTO_INCREMENT PRIMARY KEY,
    tunnel_id INT,
    user_id INT NOT NULL,
    direction VARCHAR(10) NOT NULL,
    vehicle_type VARCHAR(30),
    peak_fee DECIMAL(10,2) NOT NULL,
    off_peak_fee DECIMAL(10,2) NOT NULL,
    free_charge CHAR(1) DEFAULT 'N',
    discount_applicable CHAR(1) DEFAULT 'Y',
    peak_start TINYINT NOT NULL,
    peak_end TINYINT NOT NULL,
    discount_applied VARCHAR(5),
    final_charge DECIMAL(10,2),
    FOREIGN KEY (tunnel_id) REFERENCES tunnels(tunnel_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


##### Trigger: 

DELIMITER //

CREATE TRIGGER trg_set_free_charge
BEFORE INSERT ON tunnel_charges
FOR EACH ROW
BEGIN
    IF NEW.peak_start >= 22 OR NEW.peak_end <= 6 THEN
        SET NEW.free_charge = 'Y';
    ELSE
        SET NEW.free_charge = 'N';
    END IF;
END;
//

DELIMITER ;


#####

DELIMITER //

CREATE TRIGGER trg_calc_final_charge
BEFORE INSERT ON tunnel_charges
FOR EACH ROW
BEGIN
    DECLARE discount_num DECIMAL(5,2);
    DECLARE base_fee DECIMAL(10,2);

    IF NEW.discount_applicable = 'Y' AND NEW.discount_applied IS NOT NULL THEN
        SET discount_num = CAST(REPLACE(NEW.discount_applied, '%', '') AS DECIMAL(5,2)) / 100;
    ELSE
        SET discount_num = 0;
    END IF;

    IF NEW.peak_start >= 6 AND NEW.peak_end <= 22 THEN
        SET base_fee = NEW.peak_fee;
    ELSE
        SET base_fee = NEW.off_peak_fee;
    END IF;

    SET NEW.final_charge = base_fee * (1 - discount_num);
END;
//

DELIMITER ;


#### dropping the previous trigger and creating new one:

DROP TRIGGER IF EXISTS trg_calc_final_charge;




DELIMITER //

CREATE TRIGGER trg_calc_final_charge
BEFORE INSERT ON tunnel_charges
FOR EACH ROW
BEGIN
    DECLARE discount_num DECIMAL(5,2);
    DECLARE base_fee DECIMAL(10,2);

    IF NEW.discount_applicable = 'Y' AND NEW.discount_applied IS NOT NULL THEN
        SET discount_num = CAST(REPLACE(NEW.discount_applied, '%', '') AS DECIMAL(5,2)) / 100;
    ELSE
        SET discount_num = 0;
    END IF;

    -- Handle peak periods that may wrap around midnight
    IF (NEW.peak_start < NEW.peak_end AND HOUR(NOW()) BETWEEN NEW.peak_start AND NEW.peak_end)
        OR (NEW.peak_start > NEW.peak_end AND (HOUR(NOW()) >= NEW.peak_start OR HOUR(NOW()) <= NEW.peak_end)) THEN
        SET base_fee = NEW.peak_fee;
    ELSE
        SET base_fee = NEW.off_peak_fee;
    END IF;

    SET NEW.final_charge = base_fee * (1 - discount_num);
END;
//

DELIMITER ;


#### Populating:

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(3, 1, 'Southbound', 'Motorcycle', 2.00, 1.25, 'Y', '10%', 4, 9),
(4, 2, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(5, 3, 'Southbound', 'Other', 3.75, 2.00, 'N', '0%', 10, 3),
(6, 4, 'Northbound', 'Truck', 10.00, 8.00, 'N', '0%', 4, 10),
(7, 5, 'Southbound', 'Car', 4.00, 2.00, 'Y', '20%', 4, 10),
(8, 6, 'Southbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(9, 7, 'Northbound', 'Motorcycle', 2.50, 1.50, 'Y', '25%', 6, 10),
(10, 8, 'Southbound', 'Truck', 10.00, 5.00, 'N', '0%', 16, 19),
(23, 9, 'Southbound', 'Car', 4.00, 1.50, 'N', '0%', 6, 10),
(24, 10, 'Northbound', 'Truck', 10.00, 5.00, 'N', '0%', 6, 10),
(25, 11, 'Northbound', 'Car', 4.00, 2.50, 'Y', '10%', 6, 10),
(25, 12, 'Southbound', 'Car', 4.00, 2.50, 'N', '0%', 16, 19),
(24, 13, 'Northbound', 'Other', 6.50, 2.50, 'N', '0%', 6, 10),
(23, 14, 'Southbound', 'Other', 6.50, 2.50, 'N', '0%', 16, 19),
(25, 15, 'Northbound', 'Car', 4.00, 2.50, 'Y', '5%', 6, 10),
(23, 16, 'Southbound', 'Motorcycle', 2.50, 1.50, 'Y', '15%', 16, 19),
(23, 17, 'Northbound', 'Car', 4.00, 2.50, 'Y', '10%', 6, 10),
(22, 18, 'Southbound', 'Car', 4.00, 2.50, 'N', '0%', 6, 10),
(23, 19, 'Northbound', 'Truck', 6.50, 2.50, 'N', '0%', 6, 10),
(22, 20, 'Southbound', 'Other', 10.00, 5.00, 'N', '0%', 16, 19),
(24, 21, 'Northbound', 'Car', 4.00, 2.50, 'Y', '10%', 6, 10),
(25, 22, 'Southbound', 'Motorcycle', 2.50, 1.50, 'Y', '20%', 16, 19),
(24, 23, 'Northbound', 'Other', 10.00, 5.00, 'N', '0%', 6, 10),
(24, 24, 'Northbound', 'Truck', 10.00, 5.00, 'N', '0%', 6, 10),
(4, 25, 'Northbound', 'Truck', 10.00, 5.00, 'N', '0%', 6, 10),
(4, 26, 'Southbound', 'Car', 4.00, 2.50, 'Y', '10%', 16, 19);





*** I have inserted same data twice, so deleting the last 26 rows:
###
DELETE FROM tunnel_charges
ORDER BY charge_id DESC
LIMIT 26;

### Double check:
SELECT * FROM tunnel_charges
ORDER BY charge_id DESC
LIMIT 26;


8. Create view:
CREATE OR REPLACE VIEW v_user_charge_details AS
SELECT 
    u.user_id,
    u.full_name,
    tc.charge_id,
    tc.tunnel_id,
    tc.vehicle_type,
    tc.direction,
    tc.peak_fee,
    tc.off_peak_fee,
    tc.discount_applicable,
    tc.discount_applied,
    tc.free_charge,
    tc.final_charge,
    tc.peak_start,
    tc.peak_end,
    CASE
        WHEN tc.free_charge = 'Y' THEN 'Free'
        WHEN tc.discount_applicable = 'Y' AND tc.discount_applied != '0%' THEN 'Discounted'
        ELSE 'Full Rate'
    END AS charge_label
FROM 
    tunnel_charges tc
JOIN 
    users u ON tc.user_id = u.user_id;


9.
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    charge_id INT NOT NULL,
    final_charge DECIMAL(10,2),
    discount_applied VARCHAR(5),
    transaction_timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (charge_id) REFERENCES tunnel_charges(charge_id)
);

#### Trigger to pull the final charge and discount applied from tunnel_charges table:
DELIMITER //

CREATE TRIGGER trg_populate_transaction_details
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE v_final DECIMAL(10,2);
    DECLARE v_discount VARCHAR(5);

    SELECT 
        final_charge, 
        discount_applied
    INTO 
        v_final, 
        v_discount
    FROM 
        tunnel_charges
    WHERE 
        charge_id = NEW.charge_id;

    SET NEW.final_charge = v_final;
    SET NEW.discount_applied = v_discount;
END;
//

DELIMITER ;

#### Populate the transaction table:
 INSERT INTO transactions (user_id, charge_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26);


10.  Real time data table:
CREATE TABLE realtimedata (
    data_id INT AUTO_INCREMENT PRIMARY KEY,
    recorded_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tunnel_id INT,
    vehicle_id INT,
    traffic_density DECIMAL(10,2),
    avg_speed DECIMAL(5,2),
    congestion_level ENUM('Low', 'Moderate', 'High'),
    CONSTRAINT fk_tunnel FOREIGN KEY (tunnel_id) REFERENCES tunnels(tunnel_id),
    CONSTRAINT fk_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id) ON DELETE SET NULL
);

##### Populating:
INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level) VALUES
(1, 1, 45.2, 68.5, 'Low'),
(22, 2, 62.8, 50.3, 'Moderate'),
(23, 3, 88.9, 34.2, 'High'),
(26, 4, 33.1, 70.0, 'Low'),
(26, 5, 47.5, 66.8, 'Low'),
(22, 6, 70.2, 45.1, 'Moderate'),
(23, 7, 92.4, 30.8, 'High'),
(4, 8, 28.7, 72.4, 'Low'),
(22, 9, 60.6, 51.3, 'Moderate'),
(26, 10, 85.3, 38.0, 'High'),
(23, 11, 40.2, 64.7, 'Low'),
(23, 12, 69.8, 47.5, 'Moderate'),
(26, 13, 89.1, 31.4, 'High'),
(23, 14, 36.5, 71.9, 'Low'),
(23, 15, 55.9, 59.1, 'Moderate'),
(26, 16, 78.6, 42.7, 'High'),
(1, 17, 31.2, 74.3, 'Low'),
(2, 18, 66.7, 49.9, 'Moderate'),
(23, 19, 91.3, 33.5, 'High'),
(26, 20, 29.8, 71.1, 'Low'),
(23, 21, 59.5, 52.6, 'Moderate'),
(2, 22, 87.4, 36.0, 'High'),
(23, 23, 42.0, 67.8, 'Low'),
(23, 24, 73.1, 44.2, 'Moderate'),
(23, 25, 90.7, 32.1, 'High'),
(26, 26, 34.3, 73.3, 'Low');

11. #### Reporting table:
CREATE TABLE average_charges_by_congestion (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    report_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    congestion_level ENUM('Low', 'Moderate', 'High'),
    num_transactions INT,
    avg_charge DECIMAL(10,2)
);

#### Populating:

INSERT INTO average_charges_by_congestion (congestion_level, num_transactions, avg_charge)
SELECT 
    r.congestion_level,
    COUNT(*) AS num_transactions,
    AVG(t.final_charge) AS avg_charge
FROM 
    transactions t
JOIN 
    tunnel_charges c ON t.charge_id = c.charge_id
JOIN 
    realtimedata r ON c.tunnel_id = r.tunnel_id
    AND r.recorded_timestamp BETWEEN t.transaction_timestamp - INTERVAL 5 MINUTE 
                                 AND t.transaction_timestamp + INTERVAL 5 MINUTE
GROUP BY 
    r.congestion_level;


12.  Creating table view:
CREATE VIEW congestion_charge_trend AS
SELECT 
    DATE(report_timestamp) AS report_date,
    congestion_level,
    AVG(avg_charge) AS daily_avg
FROM 
    average_charges_by_congestion
GROUP BY 
    report_date, congestion_level;

13.  Creating table discounts:
CREATE TABLE discounts (
    discount_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    percentage DECIMAL(5,2) CHECK (percentage BETWEEN 0 AND 100),
    active CHAR(1) DEFAULT 'Y'
);

Adding discount_id to the tunnel_charges table:
ALTER TABLE tunnel_charges
ADD COLUMN discount_id INT,
ADD CONSTRAINT fk_discount
    FOREIGN KEY (discount_id) REFERENCES discounts(discount_id);

14. Creating tunnel_events table:

CREATE TABLE tunnel_events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    tunnel_id INT,
    event_type VARCHAR(50),
    event_start TIMESTAMP,
    event_end TIMESTAMP,
    severity ENUM('Low', 'Moderate', 'High'),
    description TEXT,
    FOREIGN KEY (tunnel_id) REFERENCES tunnels(tunnel_id)
);
15.  Creating sensor data table: 
CREATE TABLE sensor_data (
    sensor_id INT AUTO_INCREMENT PRIMARY KEY,
    tunnel_id INT,
    recorded_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sensor_type VARCHAR(50), 
    sensor_value DECIMAL(10,2),
    unit VARCHAR(20),
    FOREIGN KEY (tunnel_id) REFERENCES tunnels(tunnel_id)
);


16.  Creating optimisation table:
CREATE TABLE optimization_logs (
    optimization_id INT AUTO_INCREMENT PRIMARY KEY,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tunnel_id INT,
    strategy_applied VARCHAR(100),
    result_summary TEXT,
    FOREIGN KEY (tunnel_id) REFERENCES tunnels(tunnel_id)
);

  
17.  Creating discount table;
CREATE TABLE discount_exemptions (
    exemption_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT,
    charge_id INT,
    transaction_id INT,
    exemption_reason ENUM(
        'Diplomatic Exemption', 'Low-Income Assistance', 'Public Transport', 
        'Electric Vehicle Discount', 'Medical Emergency Use', 'Veteran Discount', 
        'Local Business Promotion', 'Military Vehicle Exemption', 
        'Government Vehicle', 'Emergency Services', 'Disability', 'Special Permit'
    ) NOT NULL,
    valid_from TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    valid_until TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id) ON DELETE SET NULL,
    FOREIGN KEY (charge_id) REFERENCES tunnel_charges(charge_id) ON DELETE SET NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON DELETE SET NULL
);
  

### Creating view:
CREATE VIEW exempted_transactions_report AS
SELECT 
    t.transaction_id,
    t.user_id,
    t.final_charge,
    e.exemption_reason,
    e.valid_from,
    e.valid_until
FROM 
    transactions t
JOIN 
    discount_exemptions e ON t.transaction_id = e.transaction_id;
18.  &&&&& had to modify Creating exemption_log table:
CREATE TABLE exemption_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    exemption_id INT,
    timestamp_applied TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    note VARCHAR(255),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (exemption_id) REFERENCES discount_exemptions(exemption_id)
);

DROP TRIGGER IF EXISTS apply_transaction_exemption;

DELIMITER //

CREATE TRIGGER apply_transaction_exemption
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE exemption_id_val INT;

    SELECT exemption_id INTO exemption_id_val
    FROM discount_exemptions
    WHERE user_id = NEW.user_id
      AND (transaction_id IS NULL OR transaction_id = NEW.transaction_id)
      AND valid_from <= NOW() AND valid_until >= NOW()
    LIMIT 1;

    IF exemption_id_val IS NOT NULL THEN
        INSERT INTO exemption_log (transaction_id, exemption_id, note)
        VALUES (NEW.transaction_id, exemption_id_val, 'Auto-applied full exemption');
    END IF;
END;
//
DELIMITER ;

  
### The modified trigger above and the one below this worked. Now I can insert more data. The problem was”BEFORE INSERT”, it is now replaced with “AFTER”.
Inserting more data finally:
INSERT INTO transactions (user_id, charge_id) VALUES
(241, 64), (329, 64), (17, 64), (82, 64), (401, 64),
(199, 64), (314, 64), (10, 64), (267, 64), (128, 64),
(53, 64), (438, 64), (76, 64), (321, 64), (95, 64),
(220, 64), (411, 64), (149, 64), (7, 64), (302, 64),
(263, 64), (203, 64), (345, 64), (11, 64), (412, 64),
(158, 64), (69, 64), (93, 64), (476, 64), (332, 64),
(36, 64), (184, 64), (198, 64), (316, 64), (120, 64),
(104, 64), (413, 64), (81, 64), (390, 64), (265, 64),
(51, 64), (277, 64), (142, 64), (175, 64), (226, 64),
(187, 64), (491, 64), (308, 64), (62, 64), (109, 64);
INSERT INTO transactions (user_id, charge_id) VALUES
(112, 78), (309, 79), (27, 80), (198, 81), (401, 82),
(164, 83), (52, 84), (291, 85), (483, 86), (104, 87),
(230, 88), (65, 89), (311, 90), (17, 91), (296, 92),
(207, 93), (38, 94), (409, 95), (222, 96), (125, 97),
(499, 98), (186, 99), (81, 100), (323, 101), (59, 102),
(433, 103), (143, 104), (78, 105), (265, 106), (345, 107),
(173, 108), (93, 109), (318, 110), (7, 111), (476, 112),
(69, 113), (201, 114), (248, 115), (381, 116), (332, 117),
(154, 118), (287, 119), (94, 120), (430, 121), (316, 122),
(109, 123), (264, 124), (384, 125), (11, 126), (299, 127);
INSERT INTO transactions (user_id, charge_id) VALUES
(354, 128), (218, 129), (63, 130), (427, 131), (101, 132),
(346, 133), (292, 134), (9, 135), (166, 136), (477, 137),
(195, 138), (298, 139), (445, 140), (84, 141), (330, 142),
(128, 143), (289, 144), (57, 145), (311, 146), (142, 147),
(469, 148), (36, 149), (256, 150), (6, 151), (490, 152),
(226, 153), (59, 154), (374, 155), (208, 156), (145, 157),
(99, 158), (410, 159), (87, 160), (306, 161), (182, 162),
(379, 163), (115, 164), (254, 165), (474, 166), (323, 167),
(210, 168), (151, 169), (12, 170), (395, 171), (67, 172),
(333, 173), (274, 174), (239, 175), (35, 176), (122, 177);
INSERT INTO transactions (user_id, charge_id) VALUES
(47, 178), (237, 179), (159, 180), (340, 181), (13, 182),
(428, 183), (372, 184), (90, 185), (201, 186), (126, 187),
(285, 188), (33, 189), (446, 190), (365, 191), (116, 192),
(409, 193), (139, 194), (310, 195), (28, 196), (252, 197),
(385, 198), (74, 199), (160, 200), (387, 201), (265, 202),
(215, 203), (23, 204), (450, 205), (179, 206), (91, 207),
(319, 208), (80, 209), (191, 210), (341, 211), (234, 212),
(54, 213), (405, 214), (180, 215), (293, 216), (169, 217),
(300, 218), (108, 219), (361, 220), (278, 221), (40, 222),
(135, 223), (240, 224), (318, 225), (152, 226), (103, 227);

INSERT INTO transactions (user_id, charge_id) VALUES
(223, 228), (194, 229), (66, 230), (427, 231), (268, 232),
(305, 233), (83, 234), (349, 235), (90, 236), (438, 237),
(48, 238), (123, 239), (294, 240), (172, 241), (367, 242),
(275, 243), (325, 244), (34, 245), (312, 246), (436, 247),
(58, 248), (302, 249), (77, 250), (384, 251), (339, 252),
(141, 253), (255, 254), (186, 255), (70, 256), (368, 257),
(438, 258), (105, 259), (213, 260), (25, 261), (356, 262),
(144, 263), (407, 264), (189, 265), (340, 266), (98, 267),
(211, 268), (425, 269), (62, 270), (298, 271), (121, 272),
(278, 273), (335, 274), (139, 275), (10, 276), (371, 277);

INSERT INTO transactions (user_id, charge_id) VALUES
(206, 278), (77, 279), (350, 280), (159, 281), (412, 282),
(4, 283), (287, 284), (95, 285), (225, 286), (455, 287),
(156, 288), (213, 289), (64, 290), (190, 291), (379, 292),
(117, 293), (366, 294), (47, 295), (99, 296), (432, 297),
(138, 298), (246, 299), (298, 300), (37, 301), (170, 302),
(89, 303), (392, 304), (106, 305), (271, 306), (20, 307),
(314, 308), (454, 309), (255, 310), (8, 311), (148, 312),
(229, 313), (319, 314), (257, 315), (75, 316), (388, 317),
(186, 318), (182, 319), (100, 320), (439, 321), (112, 322),
(13, 323), (271, 324), (462, 325), (318, 326), (203, 327);

INSERT INTO transactions (user_id, charge_id) VALUES
(266, 328), (175, 329), (123, 330), (435, 331), (294, 332),
(150, 333), (40, 334), (304, 335), (200, 336), (489, 337),
(211, 338), (72, 339), (318, 340), (153, 341), (477, 342),
(189, 343), (12, 344), (320, 345), (60, 346), (407, 347),
(244, 348), (105, 349), (358, 350), (17, 351), (426, 352),
(206, 353), (148, 354), (376, 355), (276, 356), (84, 357),
(390, 358), (194, 359), (68, 360), (339, 361), (99, 362),
(365, 363), (264, 364), (26, 365), (481, 366), (180, 367),
(329, 368), (108, 369), (355, 370), (245, 371), (125, 372),
(29, 373), (232, 374), (417, 375), (143, 376), (92, 377);

INSERT INTO transactions (user_id, charge_id) VALUES
(384, 378), (24, 379), (283, 380), (97, 381), (356, 382),
(66, 383), (342, 384), (175, 385), (91, 386), (216, 387),
(153, 388), (479, 389), (32, 390), (267, 391), (434, 392),
(211, 393), (148, 394), (306, 395), (70, 396), (194, 397),
(419, 398), (141, 399), (295, 400), (20, 401), (244, 402),
(318, 403), (377, 404), (157, 405), (228, 406), (5, 407),
(275, 408), (388, 409), (136, 410), (86, 411), (402, 412),
(183, 413), (352, 414), (132, 415), (29, 416), (254, 417),
(115, 418), (492, 419), (61, 420), (361, 421), (234, 422),
(101, 423), (196, 424), (287, 425), (167, 426), (392, 427);
INSERT INTO transactions (user_id, charge_id) VALUES
(168, 428), (407, 429), (90, 430), (345, 431), (137, 432),
(384, 433), (298, 434), (227, 435), (73, 436), (366, 437),
(20, 438), (271, 439), (114, 440), (316, 441), (441, 442),
(308, 443), (171, 444), (67, 445), (258, 446), (324, 447),
(236, 448), (99, 449), (248, 450), (3, 451), (293, 452),
(212, 453), (404, 454), (39, 455), (269, 456), (122, 457),
(379, 458), (59, 459), (417, 460), (197, 461), (440, 462),
(143, 463), (321, 464), (29, 465), (489, 466), (15, 467),
(210, 468), (61, 469), (438, 470), (163, 471), (386, 472),
(93, 473), (151, 474), (301, 475), (419, 476), (186, 477);

  
### Now notices that transaction_id is jumped from 27 to 78. So filling the gap:
INSERT INTO transactions (transaction_id, user_id, charge_id) VALUES
(28, 135, 64), (29, 314, 64), (30, 48, 64), (31, 223, 64), (32, 87, 64),
(33, 196, 64), (34, 72, 64), (35, 345, 64), (36, 93, 64), (37, 189, 64),
(38, 270, 64), (39, 158, 64), (40, 266, 64), (41, 204, 64), (42, 177, 64),
(43, 298, 64), (44, 111, 64), (45, 361, 64), (46, 56, 64), (47, 412, 64),
(48, 153, 64), (49, 317, 64), (50, 20, 64), (51, 88, 64), (52, 290, 64),
(53, 126, 64), (54, 453, 64), (55, 74, 64), (56, 401, 64), (57, 252, 64),
(58, 115, 64), (59, 329, 64), (60, 192, 64), (61, 37, 64), (62, 303, 64),
(63, 162, 64), (64, 97, 64), (65, 238, 64), (66, 8, 64), (67, 345, 64),
(68, 105, 64), (69, 179, 64), (70, 271, 64), (71, 60, 64), (72, 186, 64),
(73, 399, 64), (74, 154, 64), (75, 262, 64), (76, 311, 64), (77, 70, 64);

####
Here again, I can’t see final_charge and discount applied as it is reset as “AFTER”. Now I am modifying that trigger again:
DROP TRIGGER IF EXISTS apply_transaction_exemption;

DELIMITER //

CREATE TRIGGER apply_transaction_exemption_calc
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE discount_pct DECIMAL(5,2) DEFAULT 0.00;

    -- Check if the user has a valid exemption
    IF EXISTS (
        SELECT 1
        FROM discount_exemptions
        WHERE user_id = NEW.user_id
          AND (transaction_id IS NULL OR transaction_id = NEW.transaction_id)
          AND valid_from <= NOW() AND valid_until >= NOW()
        LIMIT 1
    ) THEN
        -- Apply full exemption
        SET NEW.final_charge = 0.00;
        SET NEW.discount_applied = '100%';
    ELSE
        -- Fallback logic: basic charge without exemption
        -- (You can replace this with dynamic lookup if needed)
        SELECT COALESCE(dc.discount_applied, '0%'), COALESCE(tc.final_charge, 0.00)
        INTO @applied_discount, @base_charge
        FROM tunnel_charges tc
        LEFT JOIN discount_codes dc ON tc.discount_code_id = dc.discount_code_id
        WHERE tc.charge_id = NEW.charge_id
        LIMIT 1;

        SET discount_pct = CAST(REPLACE(@applied_discount, '%', '') AS DECIMAL(5,2)) / 100.0;
        SET NEW.discount_applied = @applied_discount;
        SET NEW.final_charge = @base_charge * (1 - discount_pct);
    END IF;
END;
//

DELIMITER ;

  
#### Now creating “AFTER” trigger again:
DELIMITER //

CREATE TRIGGER apply_transaction_exemption_log
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE exemption_id_val INT;

    SELECT exemption_id INTO exemption_id_val
    FROM discount_exemptions
    WHERE user_id = NEW.user_id
      AND (transaction_id IS NULL OR transaction_id = NEW.transaction_id)
      AND valid_from <= NOW() AND valid_until >= NOW()
    LIMIT 1;

    IF exemption_id_val IS NOT NULL THEN
        INSERT INTO exemption_log (transaction_id, exemption_id, note)
        VALUES (NEW.transaction_id, exemption_id_val, 'Auto-applied full exemption');
    END IF;
END;
//

DELIMITER ;

  
  ### Now test:
INSERT INTO transactions (user_id, charge_id) VALUES (217, 64);
Now I can’t see the previous final_charge and discount applied, so trying this:
UPDATE transactions t
JOIN tunnel_charges tc ON t.charge_id = tc.charge_id
LEFT JOIN discounts d ON tc.discount_id = d.discount_id
LEFT JOIN discount_exemptions de ON de.user_id = t.user_id
    AND (de.transaction_id IS NULL OR de.transaction_id = t.transaction_id)
    AND de.valid_from <= NOW() AND de.valid_until >= NOW()
SET
    t.final_charge = CASE
        WHEN de.exemption_id IS NOT NULL THEN 0.00
        ELSE tc.final_charge * (1 - IFNULL(d.percentage, 0) / 100.0)
    END,
    t.discount_applied = CASE
        WHEN de.exemption_id IS NOT NULL THEN '100%'
        ELSE CONCAT(IFNULL(d.percentage, 0), '%')
    END
WHERE t.transaction_id BETWEEN 28 AND 527
  AND (t.final_charge IS NULL OR t.discount_applied IS NULL);

  

### Now lets do some queries:
SELECT
  discount_applied,
  COUNT(*) AS num_transactions,
  ROUND(AVG(final_charge), 2) AS avg_final_charge
FROM transactions
WHERE transaction_id BETWEEN 28 AND 527
GROUP BY discount_applied
ORDER BY discount_applied DESC;
-- Assign random discount IDs (e.g. 1, 2, 3) across the table
UPDATE tunnel_charges
SET discount_id = FLOOR(1 + (RAND() * 3));
*****

  
UPDATE transactions t
JOIN tunnel_charges tc ON t.charge_id = tc.charge_id
LEFT JOIN discounts d ON tc.discount_id = d.discount_id
LEFT JOIN discount_exemptions de ON de.user_id = t.user_id
    AND (de.transaction_id IS NULL OR de.transaction_id = t.transaction_id)
    AND de.valid_from <= NOW() AND de.valid_until >= NOW()
SET
    t.final_charge = CASE
        WHEN de.exemption_id IS NOT NULL THEN 0.00
        ELSE tc.final_charge * (1 - IFNULL(d.percentage, 0) / 100.0)
    END,
    t.discount_applied = CASE
        WHEN de.exemption_id IS NOT NULL THEN '100%'
        ELSE CONCAT(IFNULL(d.percentage, 0), '%')
    END
WHERE t.transaction_id BETWEEN 28 AND 527
  AND (t.final_charge IS NULL OR t.discount_applied IS NULL);

  

### Creating trigger for transaction table:This is causing problem to insert new data to transaction:
DELIMITER //

CREATE TRIGGER apply_transaction_exemption
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE exemption_exists INT;
    DECLARE exemption_id_val INT;
 
    SELECT COUNT(*), exemption_id
    INTO exemption_exists, exemption_id_val
    FROM discount_exemptions
    WHERE user_id = NEW.user_id
      AND (transaction_id IS NULL OR transaction_id = NEW.transaction_id)
      AND valid_from <= NOW() AND valid_until >= NOW()
    LIMIT 1;


    IF exemption_exists > 0 THEN
        SET NEW.final_charge = 0.00;

        INSERT INTO exemption_log (transaction_id, exemption_id, note)
        VALUES (NEW.transaction_id, exemption_id_val, 'Auto-applied full exemption');
    END IF;
END;

//
DELIMITER ;


  
DROP TRIGGER apply_transaction_exemption;


  
### Now creating modified trigger:
DELIMITER //

CREATE TRIGGER apply_transaction_exemption
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE exemption_exists INT DEFAULT 0;
    DECLARE exemption_id_val INT;

    -- Check if an exemption exists
    SELECT COUNT(*) INTO exemption_exists
    FROM discount_exemptions
    WHERE user_id = NEW.user_id
      AND (transaction_id IS NULL OR transaction_id = NEW.transaction_id)
      AND valid_from <= NOW() AND valid_until >= NOW();

    -- If one exists, fetch a specific exemption_id (take the first one)
    IF exemption_exists > 0 THEN
        SELECT exemption_id INTO exemption_id_val
        FROM discount_exemptions
        WHERE user_id = NEW.user_id
          AND (transaction_id IS NULL OR transaction_id = NEW.transaction_id)
          AND valid_from <= NOW() AND valid_until >= NOW()
        LIMIT 1;

        -- Apply exemption
        SET NEW.final_charge = 0.00;

        INSERT INTO exemption_log (transaction_id, exemption_id, note)
        VALUES (NEW.transaction_id, exemption_id_val, 'Auto-applied full exemption');
    END IF;
END;
//
DELIMITER ;


### Now inserting data:
INSERT INTO transactions (user_id, charge_id) VALUE (27, 27);
Populating discount table:
USE tunnel_project;
INSERT INTO discount_exemptions (
    user_id, vehicle_id, charge_id, transaction_id, exemption_reason, valid_from, valid_until
) VALUES
(1, 1, 1, 1, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 30 DAY),
(2, 2, 2, 2, 'Veteran Discount', NOW(), NOW() + INTERVAL 1 MONTH),
(3, 3, 3, 3, 'Low-Income Assistance', NOW(), NOW() + INTERVAL 6 MONTH),
(4, 4, 4, 4, 'Public Transport', NOW() + INTERVAL 1 YEAR, NOW() + INTERVAL 1 YEAR),
(5, 5, 5, 5, 'Electric Vehicle Discount', NOW(), NOW() + INTERVAL 3 MONTH),
(6, 6, 6, 6, 'Low-Income Assistance', NOW(), NOW() + INTERVAL 2 MONTH),
(7, 7, 7, 7, 'Electric Vehicle Discount', NOW(), NOW() + INTERVAL 1 MONTH),
(8, 8, 8, 8, 'Low-Income Assistance', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 20 DAY),
(9, 9, 9, 9, 'Public Transport', NOW(), NOW() + INTERVAL 1 YEAR),
(10, 10, 10, 10, 'Special Permit', NOW(), NOW() + INTERVAL 1 MONTH),
(11, 11, 11, 11, 'Low-Income Assistance', NOW(), NOW() + INTERVAL 3 MONTH),
(12, 12, 12, 12, 'Military Vehicle Exemption', NOW(), NOW() + INTERVAL 6 MONTH),
(13, 1, 13, 13, 'Disability', NOW(), NOW() + INTERVAL 2 MONTH),
(14, 2, 14, 14, 'Veteran Discount', NOW(), NOW() + INTERVAL 1 MONTH),
(15, 3, 15, 15, 'Low-Income Assistance', NOW(), NOW() + INTERVAL 1 MONTH),
(16, 4, 16, 16, 'Public Transport', NOW(), NOW() + INTERVAL 1 YEAR),
(17, 5, 17, 17, 'Local Business Promotion', NOW(), NOW() + INTERVAL 90 DAY),
(18, 6, 18, 18, 'Medical Emergency Use', NOW(), NOW() + INTERVAL 2 MONTH),
(19, 7, 19, 19, 'Emergency Services', NOW(), NOW() + INTERVAL 1 YEAR),
(20, 8, 20, 20, 'Low-Income Assistance', NOW(), NOW() + INTERVAL 3 MONTH),
(21, 9, 21, 21, 'Public Transport', NOW(), NOW() + INTERVAL 1 YEAR),
(22, 10, 22, 22, 'Government Vehicle', NOW(), NOW() + INTERVAL 5 MONTH),
(23, 11, 23, 23, 'Disability', NOW(), NOW() + INTERVAL 2 MONTH),
(24, 12, 24, 24, 'Veteran Discount', NOW(), NOW() + INTERVAL 1 MONTH),
(25, 1, 25, 25, 'Low-Income Assistance', NOW(), NOW() + INTERVAL 3 MONTH),
(26, 2, 26, 26, 'Electric Vehicle Discount', NOW(), NOW() + INTERVAL 4 MONTH)
  
INSERT INTO discount_exemptions (
    user_id, vehicle_id, charge_id, transaction_id, exemption_reason, valid_from, valid_until
) VALUES
(101, 12, 45, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 20 DAY),
(132, 24, 53, NULL, 'Veteran Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 15 DAY),
(199, NULL, 67, NULL, 'Government Vehicle', NOW() - INTERVAL 30 DAY, NOW() + INTERVAL 60 DAY),
(210, 51, 49, NULL, 'Disability', NOW() - INTERVAL 1 DAY, NOW() + INTERVAL 90 DAY),
(87, 19, NULL, NULL, 'Public Transport', NOW() - INTERVAL 2 DAY, NOW() + INTERVAL 7 DAY),
(443, 5, 60, NULL, 'Medical Emergency Use', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 21 DAY),
(314, 33, 81, NULL, 'Local Business Promotion', NOW() - INTERVAL 20 DAY, NOW() + INTERVAL 10 DAY),
(278, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 3 DAY, NOW() + INTERVAL 30 DAY),
(147, 11, 73, NULL, 'Special Permit', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 28 DAY),
(226, 45, 92, NULL, 'Low-Income Assistance', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 40 DAY);

INSERT INTO discount_exemptions (user_id, vehicle_id, charge_id, transaction_id, exemption_reason, valid_from, valid_until) VALUES
(101, 12, 45, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 35 DAY),
(132, 24, 53, NULL, 'Veteran Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 60 DAY),
(199, NULL, 67, NULL, 'Government Vehicle', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 42 DAY),
(210, 51, 49, NULL, 'Disability', NOW() - INTERVAL 18 DAY, NOW() + INTERVAL 78 DAY),
(87, 19, NULL, NULL, 'Public Transport', NOW() - INTERVAL 22 DAY, NOW() + INTERVAL 47 DAY),
(443, 5, 60, NULL, 'Medical Emergency Use', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 30 DAY),
(314, 33, 81, NULL, 'Local Business Promotion', NOW() - INTERVAL 25 DAY, NOW() + INTERVAL 56 DAY),
(278, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 3 DAY, NOW() + INTERVAL 90 DAY),
(147, 11, 73, NULL, 'Special Permit', NOW() - INTERVAL 28 DAY, NOW() + INTERVAL 18 DAY),
(226, 45, 92, NULL, 'Low-Income Assistance', NOW() - INTERVAL 20 DAY, NOW() + INTERVAL 70 DAY),
(102, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 20 DAY),
(305, 22, 84, NULL, 'Diplomatic Exemption', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 35 DAY),
(97, NULL, 75, NULL, 'Government Vehicle', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 40 DAY),
(84, 6, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 15 DAY, NOW() + INTERVAL 60 DAY),
(369, 44, 95, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 50 DAY),
(153, 17, 87, NULL, 'Public Transport', NOW() - INTERVAL 20 DAY, NOW() + INTERVAL 45 DAY),
(417, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 2 DAY, NOW() + INTERVAL 40 DAY),
(244, 9, 102, NULL, 'Veteran Discount', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 61 DAY),
(133, 19, 100, NULL, 'Special Permit', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 31 DAY),
(287, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 90 DAY),
(158, 15, 105, NULL, 'Low-Income Assistance', NOW() - INTERVAL 3 DAY, NOW() + INTERVAL 22 DAY),
(172, 30, NULL, NULL, 'Medical Emergency Use', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 49 DAY),
(309, NULL, 92, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 18 DAY, NOW() + INTERVAL 41 DAY),
(168, 16, 68, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 55 DAY),
(423, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 32 DAY),
(229, 39, 93, NULL, 'Public Transport', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 38 DAY),
(142, 48, 73, NULL, 'Veteran Discount', NOW() - INTERVAL 17 DAY, NOW() + INTERVAL 28 DAY),
(263, NULL, 78, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 20 DAY, NOW() + INTERVAL 34 DAY),
(377, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 36 DAY),
(56, 4, 63, NULL, 'Special Permit', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 44 DAY),
(413, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 16 DAY, NOW() + INTERVAL 53 DAY),
(123, 26, 61, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 39 DAY),
(97, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 31 DAY),
(254, 20, 79, NULL, 'Veteran Discount', NOW() - INTERVAL 3 DAY, NOW() + INTERVAL 48 DAY),
(165, NULL, 88, NULL, 'Medical Emergency Use', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 57 DAY),
(201, 29, 99, NULL, 'Public Transport', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 30 DAY),
(309, 7, 71, NULL, 'Special Permit', NOW() - INTERVAL 2 DAY, NOW() + INTERVAL 68 DAY),
(198, 43, 74, NULL, 'Disability', NOW() - INTERVAL 16 DAY, NOW() + INTERVAL 72 DAY),
(370, NULL, NULL, NULL, 'Local Business Promotion', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 60 DAY),
(419, 14, 94, NULL, 'Government Vehicle', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 45 DAY),
(333, 36, 104, NULL, 'Veteran Discount', NOW() - INTERVAL 17 DAY, NOW() + INTERVAL 29 DAY),
(107, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 35 DAY),
(92, 5, 82, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 52 DAY),
(185, 37, 98, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 66 DAY),
(247, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 58 DAY),
(154, 18, 91, NULL, 'Low-Income Assistance', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 40 DAY),
(66, 8, 83, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 36 DAY),
(280, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 63 DAY),
(406, 27, 90, NULL, 'Special Permit', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 50 DAY),
(361, NULL, NULL, NULL, 'Medical Emergency Use', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 34 DAY),
(339, 10, 77, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 61 DAY),
(411, 50, 106, NULL, 'Veteran Discount', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 59 DAY);

INSERT INTO discount_exemptions (user_id, vehicle_id, charge_id, transaction_id, exemption_reason, valid_from, valid_until) VALUES
(119, 23, 73, NULL, 'Low-Income Assistance', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 42 DAY),
(376, NULL, NULL, NULL, 'Veteran Discount', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 29 DAY),
(259, 9, 94, NULL, 'Public Transport', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 56 DAY),
(311, 32, 79, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 30 DAY),
(138, NULL, NULL, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 68 DAY),
(190, 18, 84, NULL, 'Special Permit', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 48 DAY),
(104, 40, 106, NULL, 'Government Vehicle', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 62 DAY),
(267, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 3 DAY, NOW() + INTERVAL 44 DAY),
(88, 6, 92, NULL, 'Diplomatic Exemption', NOW() - INTERVAL 17 DAY, NOW() + INTERVAL 40 DAY),
(157, NULL, 87, NULL, 'Veteran Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 28 DAY),
(421, 12, 88, NULL, 'Special Permit', NOW() - INTERVAL 21 DAY, NOW() + INTERVAL 39 DAY),
(109, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 33 DAY),
(386, 15, 76, NULL, 'Government Vehicle', NOW() - INTERVAL 16 DAY, NOW() + INTERVAL 55 DAY),
(316, NULL, 65, NULL, 'Low-Income Assistance', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 50 DAY),
(182, 20, NULL, NULL, 'Medical Emergency Use', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 58 DAY),
(273, 31, 91, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 47 DAY),
(100, NULL, 77, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 41 DAY),
(357, 38, 100, NULL, 'Public Transport', NOW() - INTERVAL 18 DAY, NOW() + INTERVAL 36 DAY),
(140, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 2 DAY, NOW() + INTERVAL 40 DAY),
(489, 21, 81, NULL, 'Veteran Discount', NOW() - INTERVAL 19 DAY, NOW() + INTERVAL 51 DAY),
(271, 14, 73, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 38 DAY),
(330, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 64 DAY),
(176, 47, 96, NULL, 'Special Permit', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 33 DAY),
(265, 10, 75, NULL, 'Disability', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 42 DAY),
(301, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 53 DAY),
(147, 39, 93, NULL, 'Low-Income Assistance', NOW() - INTERVAL 3 DAY, NOW() + INTERVAL 35 DAY),
(211, NULL, 74, NULL, 'Public Transport', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 49 DAY),
(99, 28, NULL, NULL, 'Medical Emergency Use', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 26 DAY),
(491, NULL, 98, NULL, 'Government Vehicle', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 61 DAY),
(192, 5, 80, NULL, 'Disability', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 32 DAY),
(310, NULL, NULL, NULL, 'Veteran Discount', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 55 DAY),
(203, 25, 99, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 30 DAY),
(283, 7, 72, NULL, 'Public Transport', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 39 DAY),
(93, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 42 DAY),
(262, 19, 86, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 35 DAY),
(111, 44, 95, NULL, 'Special Permit', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 59 DAY),
(438, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 48 DAY),
(166, 2, 90, NULL, 'Emergency Services', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 50 DAY),
(345, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 60 DAY),
(180, 13, 78, NULL, 'Public Transport', NOW() - INTERVAL 16 DAY, NOW() + INTERVAL 29 DAY),
(488, 16, 89, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 58 DAY),
(231, NULL, 67, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 36 DAY),
(105, 36, 85, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 41 DAY),
(195, 3, 83, NULL, 'Special Permit', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 45 DAY),
(394, NULL, NULL, NULL, 'Veteran Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 39 DAY),
(232, 26, 97, NULL, 'Government Vehicle', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 52 DAY),
(308, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 3 DAY, NOW() + INTERVAL 60 DAY),
(336, 34, 104, NULL, 'Low-Income Assistance', NOW() - INTERVAL 15 DAY, NOW() + INTERVAL 46 DAY),
(116, 8, 82, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 31 DAY),
(263, NULL, 100, NULL, 'Public Transport', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 37 DAY),
(189, 29, 102, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 43 DAY);

INSERT INTO discount_exemptions (user_id, vehicle_id, charge_id, transaction_id, exemption_reason, valid_from, valid_until) VALUES
(144, 3, 74, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 42 DAY),
(212, NULL, 66, NULL, 'Veteran Discount', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 35 DAY),
(168, 22, 89, NULL, 'Government Vehicle', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 53 DAY),
(325, 45, 91, NULL, 'Disability', NOW() - INTERVAL 17 DAY, NOW() + INTERVAL 41 DAY),
(196, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 38 DAY),
(477, 19, 100, NULL, 'Medical Emergency Use', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 55 DAY),
(239, 28, NULL, NULL, 'Local Business Promotion', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 45 DAY),
(281, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 59 DAY),
(307, 37, 93, NULL, 'Special Permit', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 29 DAY),
(177, 7, 78, NULL, 'Low-Income Assistance', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 32 DAY),
(98, NULL, 96, NULL, 'Disability', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 38 DAY),
(423, 16, 86, NULL, 'Veteran Discount', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 47 DAY),
(311, 41, 103, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 15 DAY, NOW() + INTERVAL 41 DAY),
(284, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 36 DAY),
(146, 12, 94, NULL, 'Government Vehicle', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 51 DAY),
(114, 5, 81, NULL, 'Special Permit', NOW() - INTERVAL 17 DAY, NOW() + INTERVAL 60 DAY),
(210, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 33 DAY),
(95, 23, 98, NULL, 'Disability', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 42 DAY),
(390, 44, 101, NULL, 'Medical Emergency Use', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 40 DAY),
(273, NULL, 99, NULL, 'Low-Income Assistance', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 50 DAY),
(317, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 54 DAY),
(243, 33, 85, NULL, 'Veteran Discount', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 35 DAY),
(189, 27, 83, NULL, 'Emergency Services', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 60 DAY),
(350, NULL, 92, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 39 DAY),
(166, 13, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 49 DAY),
(419, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 37 DAY),
(135, 39, 87, NULL, 'Special Permit', NOW() - INTERVAL 3 DAY, NOW() + INTERVAL 46 DAY),
(259, 6, 70, NULL, 'Veteran Discount', NOW() - INTERVAL 16 DAY, NOW() + INTERVAL 44 DAY),
(222, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 35 DAY),
(107, 9, 65, NULL, 'Public Transport', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 51 DAY),
(191, 18, 88, NULL, 'Low-Income Assistance', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 33 DAY),
(370, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 50 DAY),
(125, 40, 102, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 60 DAY),
(387, NULL, 90, NULL, 'Government Vehicle', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 36 DAY),
(179, 14, 84, NULL, 'Emergency Services', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 48 DAY),
(157, NULL, 76, NULL, 'Special Permit', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 42 DAY),
(277, 31, 91, NULL, 'Medical Emergency Use', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 39 DAY),
(194, 35, 89, NULL, 'Public Transport', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 38 DAY),
(207, NULL, NULL, NULL, 'Low-Income Assistance', NOW() - INTERVAL 15 DAY, NOW() + INTERVAL 55 DAY),
(288, 11, 95, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 41 DAY),
(241, 2, 68, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 30 DAY),
(133, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 61 DAY),
(363, 25, 79, NULL, 'Veteran Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 32 DAY),
(185, 20, 100, NULL, 'Special Permit', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 34 DAY),
(109, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 51 DAY),
(453, 17, 86, NULL, 'Low-Income Assistance', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 39 DAY),
(248, 42, 97, NULL, 'Government Vehicle', NOW() - INTERVAL 3 DAY, NOW() + INTERVAL 47 DAY),
(306, 8, 74, NULL, 'Disability', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 44 DAY),
(138, NULL, 69, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 41 DAY),
(474, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 2 DAY, NOW() + INTERVAL 36 DAY);

INSERT INTO discount_exemptions (user_id, vehicle_id, charge_id, transaction_id, exemption_reason, valid_from, valid_until) VALUES
(371, 14, 79, NULL, 'Low-Income Assistance', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 40 DAY),
(137, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 55 DAY),
(421, 38, 101, NULL, 'Medical Emergency Use', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 47 DAY),
(285, 15, 92, NULL, 'Government Vehicle', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 35 DAY),
(143, NULL, 82, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 31 DAY),
(308, 5, 86, NULL, 'Public Transport', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 44 DAY),
(270, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 60 DAY),
(333, 20, 93, NULL, 'Veteran Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 50 DAY),
(204, 29, 84, NULL, 'Emergency Services', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 38 DAY),
(159, NULL, NULL, NULL, 'Special Permit', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 59 DAY),
(452, 23, 77, NULL, 'Local Business Promotion', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 42 DAY),
(322, 36, 98, NULL, 'Disability', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 37 DAY),
(109, NULL, 95, NULL, 'Government Vehicle', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 49 DAY),
(372, 11, 69, NULL, 'Veteran Discount', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 53 DAY),
(202, NULL, NULL, NULL, 'Special Permit', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 31 DAY),
(168, 7, 105, NULL, 'Low-Income Assistance', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 40 DAY),
(395, 19, 81, NULL, 'Emergency Services', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 36 DAY),
(216, NULL, 97, NULL, 'Medical Emergency Use', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 45 DAY),
(141, 16, 73, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 39 DAY),
(447, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 50 DAY),
(124, 32, 90, NULL, 'Government Vehicle', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 28 DAY),
(234, 9, 87, NULL, 'Veteran Discount', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 52 DAY),
(192, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 44 DAY),
(97, 44, 96, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 42 DAY),
(306, 13, 88, NULL, 'Special Permit', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 39 DAY),
(263, NULL, NULL, NULL, 'Low-Income Assistance', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 60 DAY),
(111, 35, 100, NULL, 'Medical Emergency Use', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 55 DAY),
(376, 3, 94, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 35 DAY),
(288, NULL, 91, NULL, 'Public Transport', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 45 DAY),
(156, 27, 86, NULL, 'Disability', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 37 DAY),
(410, 6, 67, NULL, 'Veteran Discount', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 50 DAY),
(134, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 43 DAY),
(180, 10, 79, NULL, 'Emergency Services', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 36 DAY),
(327, 18, NULL, NULL, 'Special Permit', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 29 DAY),
(165, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 48 DAY),
(338, 31, 71, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 55 DAY),
(117, 2, 70, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 58 DAY),
(402, NULL, NULL, NULL, 'Special Permit', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 32 DAY),
(175, 8, 99, NULL, 'Low-Income Assistance', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 47 DAY),
(309, NULL, 102, NULL, 'Emergency Services', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 41 DAY),
(196, 30, 76, NULL, 'Public Transport', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 34 DAY),
(473, NULL, NULL, NULL, 'Medical Emergency Use', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 60 DAY),
(243, 17, 75, NULL, 'Government Vehicle', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 59 DAY),
(184, 26, 103, NULL, 'Disability', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 39 DAY),
(99, NULL, 93, NULL, 'Veteran Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 50 DAY),
(365, 4, 78, NULL, 'Low-Income Assistance', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 35 DAY),
(273, 40, NULL, NULL, 'Special Permit', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 38 DAY),
(222, 1, 65, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 55 DAY),
(407, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 41 DAY),
(252, 24, 85, NULL, 'Medical Emergency Use', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 44 DAY),
(315, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 48 DAY);


  
### Here in my discount_exemption table, there is no sequence from 1-25 and 266 to 510, I am fixing it now:
SET sql_mode = '';

INSERT INTO discount_exemptions (
  exemption_id, user_id, vehicle_id, charge_id, transaction_id,
  exemption_reason, valid_from, valid_until
) VALUES
(1, 105, 22, 73, NULL, 'Public Transport', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 45 DAY),
(2, 219, 8, 85, NULL, 'Veteran Discount', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 30 DAY),
(3, 198, NULL, 90, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 15 DAY, NOW() + INTERVAL 40 DAY),
(4, 321, 11, 81, NULL, 'Government Vehicle', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 42 DAY),
(5, 164, 33, 97, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 38 DAY),
(6, 289, NULL, NULL, NULL, 'Medical Emergency Use', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 29 DAY),
(7, 177, 19, 76, NULL, 'Low-Income Assistance', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 36 DAY),
(8, 111, NULL, NULL, NULL, 'Special Permit', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 55 DAY),
(9, 405, 14, 91, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 41 DAY),
(10, 231, NULL, NULL, NULL, 'Local Business Promotion', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 50 DAY),
(11, 382, 27, 84, NULL, 'Emergency Services', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 44 DAY),
(12, 144, 36, 93, NULL, 'Disability', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 47 DAY),
(13, 318, NULL, 74, NULL, 'Veteran Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 39 DAY),
(14, 212, 6, 83, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 33 DAY),
(15, 137, NULL, 95, NULL, 'Government Vehicle', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 60 DAY),
(16, 429, 24, 80, NULL, 'Special Permit', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 51 DAY),
(17, 166, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 40 DAY),
(18, 248, 10, 86, NULL, 'Disability', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 38 DAY),
(19, 284, 21, 88, NULL, 'Emergency Services', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 32 DAY),
(20, 393, NULL, NULL, NULL, 'Veteran Discount', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 36 DAY),
(21, 125, 17, 98, NULL, 'Government Vehicle', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 43 DAY),
(22, 309, 5, 71, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 58 DAY),
(23, 188, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 42 DAY),
(24, 267, 40, 102, NULL, 'Low-Income Assistance', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 49 DAY),
(25, 156, NULL, 89, NULL, 'Disability', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 37 DAY);

  
USE tunnel_project;
SET sql_mode = '';

INSERT INTO discount_exemptions (
  exemption_id, user_id, vehicle_id, charge_id, transaction_id,
  exemption_reason, valid_from, valid_until
) VALUES
(26, 1, 1, 1, NULL, 'Public Transport', NOW() - INTERVAL 1 YEAR, NOW() + INTERVAL 2 YEAR);


SET sql_mode = '';

INSERT INTO discount_exemptions (
  exemption_id, user_id, vehicle_id, charge_id, transaction_id,
  exemption_reason, valid_from, valid_until
) VALUES
(267, 288, 14, 95, NULL, 'Veteran Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 45 DAY),
(268, 149, 10, 83, NULL, 'Disability', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 40 DAY),
(269, 231, NULL, NULL, NULL, 'Special Permit', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 36 DAY),
(270, 375, 17, 101, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 33 DAY),
(271, 166, NULL, 92, NULL, 'Public Transport', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 30 DAY),
(272, 310, 28, 86, NULL, 'Low-Income Assistance', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 41 DAY),
(273, 197, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 60 DAY),
(274, 442, 20, 98, NULL, 'Medical Emergency Use', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 38 DAY),
(275, 122, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 55 DAY),
(276, 384, 7, 70, NULL, 'Disability', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 47 DAY),
(277, 215, 31, 105, NULL, 'Local Business Promotion', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 44 DAY),
(278, 279, NULL, 88, NULL, 'Veteran Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 50 DAY),
(279, 113, 25, NULL, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 33 DAY),
(280, 398, 6, 81, NULL, 'Government Vehicle', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 60 DAY),
(281, 342, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 35 DAY),
(282, 156, 19, 93, NULL, 'Medical Emergency Use', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 39 DAY),
(283, 421, NULL, NULL, NULL, 'Special Permit', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 42 DAY),
(284, 185, 44, 90, NULL, 'Emergency Services', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 38 DAY),
(285, 249, NULL, 76, NULL, 'Low-Income Assistance', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 52 DAY),
(286, 391, 15, 94, NULL, 'Veteran Discount', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 43 DAY),
(287, 338, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 40 DAY),
(288, 102, 5, 67, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 48 DAY),
(289, 275, 33, NULL, NULL, 'Public Transport', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 39 DAY),
(290, 146, NULL, 84, NULL, 'Government Vehicle', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 44 DAY),
(291, 369, 13, 100, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 36 DAY);


  
INSERT INTO discount_exemptions (
  exemption_id, user_id, vehicle_id, charge_id, transaction_id,
  exemption_reason, valid_from, valid_until
) VALUES
(292, 214, 6, 71, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 50 DAY),
(293, 162, NULL, 87, NULL, 'Disability', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 37 DAY),
(294, 339, 14, 84, NULL, 'Veteran Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 44 DAY),
(295, 208, 19, 98, NULL, 'Medical Emergency Use', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 30 DAY),
(296, 310, NULL, 73, NULL, 'Government Vehicle', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 39 DAY),
(297, 134, 21, 90, NULL, 'Special Permit', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 31 DAY),
(298, 453, 33, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 56 DAY),
(299, 179, NULL, 101, NULL, 'Low-Income Assistance', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 41 DAY),
(300, 225, 18, 96, NULL, 'Public Transport', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 45 DAY),
(301, 281, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 33 DAY),
(302, 355, 42, 95, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 39 DAY),
(303, 113, NULL, 82, NULL, 'Special Permit', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 49 DAY),
(304, 407, 31, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 50 DAY),
(305, 269, 10, 91, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 52 DAY),
(306, 315, NULL, 79, NULL, 'Public Transport', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 41 DAY),
(307, 153, 24, NULL, NULL, 'Local Business Promotion', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 37 DAY),
(308, 244, 7, 99, NULL, 'Medical Emergency Use', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 46 DAY),
(309, 399, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 42 DAY),
(310, 190, 26, 103, NULL, 'Low-Income Assistance', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 36 DAY),
(311, 102, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 53 DAY),
(312, 287, 39, 85, NULL, 'Veteran Discount', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 38 DAY),
(313, 416, 9, 88, NULL, 'Public Transport', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 44 DAY),
(314, 243, NULL, 94, NULL, 'Special Permit', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 33 DAY),
(315, 128, 15, NULL, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 47 DAY),
(316, 361, 20, 77, NULL, 'Government Vehicle', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 50 DAY),
(317, 294, NULL, 100, NULL, 'Emergency Services', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 35 DAY),
(318, 145, 17, 89, NULL, 'Low-Income Assistance', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 40 DAY),
(319, 349, NULL, NULL, NULL, 'Veteran Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 59 DAY),
(320, 257, 35, 86, NULL, 'Public Transport', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 36 DAY),
(321, 197, 2, 93, NULL, 'Medical Emergency Use', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 41 DAY),
(322, 422, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 14 DAY, NOW() + INTERVAL 48 DAY),
(323, 268, 23, 78, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 46 DAY),
(324, 317, NULL, 104, NULL, 'Public Transport', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 52 DAY),
(325, 223, 12, 80, NULL, 'Special Permit', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 35 DAY),
(326, 385, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 43 DAY),
(327, 164, 40, 97, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 49 DAY),
(328, 136, 16, 72, NULL, 'Emergency Services', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 44 DAY),
(329, 108, NULL, NULL, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 55 DAY),
(330, 248, 4, 91, NULL, 'Public Transport', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 42 DAY),
(331, 374, NULL, 75, NULL, 'Low-Income Assistance', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 46 DAY),
(332, 347, 30, 70, NULL, 'Veteran Discount', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 34 DAY),
(333, 140, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 39 DAY),
(334, 389, 28, 83, NULL, 'Special Permit', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 38 DAY),
(335, 135, NULL, 85, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 41 DAY),
(336, 278, 13, 76, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 50 DAY),
(337, 121, NULL, 87, NULL, 'Medical Emergency Use', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 40 DAY),
(338, 456, 3, 74, NULL, 'Government Vehicle', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 56 DAY),
(339, 293, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 53 DAY),
(340, 312, 29, 96, NULL, 'Emergency Services', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 35 DAY),
(341, 163, NULL, 93, NULL, 'Public Transport', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 47 DAY);

  
INSERT INTO discount_exemptions (
  exemption_id, user_id, vehicle_id, charge_id, transaction_id,
  exemption_reason, valid_from, valid_until
) VALUES
(342, 278, 13, 96, NULL, 'Low-Income Assistance', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 40 DAY),
(343, 189, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 44 DAY),
(344, 148, 7, 87, NULL, 'Disability', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 52 DAY),
(345, 347, 21, 104, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 35 DAY),
(346, 250, NULL, 99, NULL, 'Government Vehicle', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 47 DAY),
(347, 318, 31, NULL, NULL, 'Special Permit', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 60 DAY),
(348, 133, 3, 86, NULL, 'Medical Emergency Use', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 39 DAY),
(349, 375, NULL, 77, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 34 DAY),
(350, 224, 9, NULL, NULL, 'Public Transport', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 49 DAY),
(351, 411, NULL, 94, NULL, 'Emergency Services', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 41 DAY),
(352, 143, 39, 90, NULL, 'Veteran Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 43 DAY),
(353, 183, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 33 DAY),
(354, 293, 26, 83, NULL, 'Low-Income Assistance', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 46 DAY),
(355, 163, NULL, 80, NULL, 'Special Permit', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 50 DAY),
(356, 235, 11, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 35 DAY),
(357, 295, 22, 93, NULL, 'Disability', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 48 DAY),
(358, 126, NULL, 74, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 39 DAY),
(359, 367, 16, 98, NULL, 'Emergency Services', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 55 DAY),
(360, 206, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 40 DAY),
(361, 455, 4, 91, NULL, 'Veteran Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 37 DAY),
(362, 182, 24, 95, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 41 DAY),
(363, 321, NULL, 102, NULL, 'Special Permit', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 38 DAY),
(364, 204, 30, NULL, NULL, 'Public Transport', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 44 DAY),
(365, 269, 12, 100, NULL, 'Low-Income Assistance', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 52 DAY),
(366, 101, NULL, 75, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 36 DAY),
(367, 388, 40, 97, NULL, 'Medical Emergency Use', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 50 DAY),
(368, 172, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 39 DAY),
(369, 236, 28, 103, NULL, 'Veteran Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 42 DAY),
(370, 261, 17, NULL, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 48 DAY),
(371, 132, NULL, 66, NULL, 'Government Vehicle', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 34 DAY),
(372, 401, 20, 96, NULL, 'Special Permit', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 38 DAY),
(373, 119, NULL, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 60 DAY),
(374, 412, 5, 82, NULL, 'Public Transport', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 43 DAY),
(375, 184, 38, 89, NULL, 'Low-Income Assistance', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 35 DAY),
(376, 351, NULL, 78, NULL, 'Disability', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 41 DAY),
(377, 161, 10, 86, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 37 DAY),
(378, 256, 2, NULL, NULL, 'Public Transport', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 55 DAY),
(379, 104, NULL, 84, NULL, 'Special Permit', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 33 DAY),
(380, 348, 19, 88, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 39 DAY),
(381, 285, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 40 DAY),
(382, 170, 35, 101, NULL, 'Disability', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 47 DAY),
(383, 411, 15, 93, NULL, 'Veteran Discount', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 49 DAY),
(384, 238, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 32 DAY),
(385, 354, 25, 99, NULL, 'Medical Emergency Use', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 50 DAY),
(386, 117, 6, 85, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 38 DAY),
(387, 273, NULL, 102, NULL, 'Emergency Services', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 42 DAY),
(388, 206, 13, 92, NULL, 'Special Permit', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 37 DAY),
(389, 337, NULL, NULL, NULL, 'Local Business Promotion', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 44 DAY),
(390, 359, 18, 80, NULL, 'Government Vehicle', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 36 DAY),
(391, 160, 1, 76, NULL, 'Veteran Discount', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 48 DAY);

  
INSERT INTO discount_exemptions (
  exemption_id, user_id, vehicle_id, charge_id, transaction_id,
  exemption_reason, valid_from, valid_until
) VALUES
(392, 216, NULL, 94, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 38 DAY),
(393, 389, 14, 89, NULL, 'Public Transport', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 50 DAY),
(394, 209, NULL, NULL, NULL, 'Veteran Discount', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 41 DAY),
(395, 154, 9, 93, NULL, 'Special Permit', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 35 DAY),
(396, 307, NULL, 100, NULL, 'Government Vehicle', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 48 DAY),
(397, 252, 23, NULL, NULL, 'Low-Income Assistance', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 39 DAY),
(398, 179, 35, 87, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 42 DAY),
(399, 118, NULL, 75, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 36 DAY),
(400, 432, 16, 95, NULL, 'Emergency Services', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 44 DAY),
(401, 213, NULL, NULL, NULL, 'Special Permit', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 40 DAY),
(402, 294, 19, 92, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 45 DAY),
(403, 166, 10, 76, NULL, 'Public Transport', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 51 DAY),
(404, 301, NULL, 103, NULL, 'Medical Emergency Use', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 38 DAY),
(405, 237, 30, 83, NULL, 'Government Vehicle', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 46 DAY),
(406, 143, NULL, NULL, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 42 DAY),
(407, 428, 22, 88, NULL, 'Low-Income Assistance', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 40 DAY),
(408, 185, NULL, 80, NULL, 'Veteran Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 33 DAY),
(409, 387, 5, NULL, NULL, 'Emergency Services', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 50 DAY),
(410, 321, 38, 96, NULL, 'Public Transport', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 37 DAY),
(411, 205, NULL, 101, NULL, 'Special Permit', NOW() - INTERVAL 13 DAY, NOW() + INTERVAL 48 DAY),
(412, 459, 13, 78, NULL, 'Government Vehicle', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 39 DAY),
(413, 173, NULL, 70, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 45 DAY),
(414, 228, 36, 98, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 41 DAY),
(415, 368, NULL, NULL, NULL, 'Medical Emergency Use', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 38 DAY),
(416, 198, 11, 90, NULL, 'Veteran Discount', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 44 DAY),
(417, 133, NULL, 99, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 36 DAY),
(418, 288, 25, NULL, NULL, 'Public Transport', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 43 DAY),
(419, 326, NULL, 82, NULL, 'Special Permit', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 39 DAY),
(420, 122, 20, 85, NULL, 'Government Vehicle', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 46 DAY),
(421, 276, NULL, 102, NULL, 'Emergency Services', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 35 DAY),
(422, 195, 6, NULL, NULL, 'Medical Emergency Use', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 49 DAY),
(423, 407, 37, 91, NULL, 'Veteran Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 41 DAY),
(424, 142, NULL, 97, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 38 DAY),
(425, 367, 28, 94, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 44 DAY),
(426, 225, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 52 DAY),
(427, 161, 17, 86, NULL, 'Special Permit', NOW() - INTERVAL 4 DAY, NOW() + INTERVAL 36 DAY),
(428, 112, 2, 74, NULL, 'Government Vehicle', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 39 DAY),
(429, 311, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 50 DAY),
(430, 284, 12, 93, NULL, 'Emergency Services', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 37 DAY),
(431, 124, 41, 87, NULL, 'Low-Income Assistance', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 40 DAY),
(432, 203, NULL, 81, NULL, 'Veteran Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 44 DAY),
(433, 152, 8, 77, NULL, 'Medical Emergency Use', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 35 DAY),
(434, 344, NULL, NULL, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 49 DAY),
(435, 105, 27, 96, NULL, 'Special Permit', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 42 DAY),
(436, 178, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 39 DAY),
(437, 240, 33, 100, NULL, 'Public Transport', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 41 DAY),
(438, 262, NULL, 79, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 35 DAY),
(439, 149, 18, 104, NULL, 'Veteran Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 50 DAY),
(440, 203, 43, NULL, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 36 DAY),
(441, 294, NULL, 84, NULL, 'Government Vehicle', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 39 DAY);

  
INSERT INTO discount_exemptions (
  exemption_id, user_id, vehicle_id, charge_id, transaction_id,
  exemption_reason, valid_from, valid_until
) VALUES
(442, 178, 32, 79, NULL, 'Medical Emergency Use', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 39 DAY),
(443, 164, NULL, 94, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 42 DAY),
(444, 344, 6, 83, NULL, 'Veteran Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 36 DAY),
(445, 226, 18, 101, NULL, 'Public Transport', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 50 DAY),
(446, 386, NULL, NULL, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 45 DAY),
(447, 249, 13, 95, NULL, 'Emergency Services', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 33 DAY),
(448, 269, 41, 78, NULL, 'Low-Income Assistance', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 38 DAY),
(449, 313, NULL, NULL, NULL, 'Government Vehicle', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 54 DAY),
(450, 109, 8, 99, NULL, 'Special Permit', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 40 DAY),
(451, 201, NULL, 100, NULL, 'Disability', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 31 DAY),
(452, 412, 23, 76, NULL, 'Medical Emergency Use', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 50 DAY),
(453, 286, NULL, 92, NULL, 'Veteran Discount', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 37 DAY),
(454, 168, 14, 91, NULL, 'Special Permit', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 49 DAY),
(455, 398, NULL, 84, NULL, 'Public Transport', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 35 DAY),
(456, 153, 4, 88, NULL, 'Disability', NOW() - INTERVAL 12 DAY, NOW() + INTERVAL 47 DAY),
(457, 436, 17, 96, NULL, 'Emergency Services', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 43 DAY),
(458, 124, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 39 DAY),
(459, 215, 11, 89, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 48 DAY),
(460, 280, NULL, 102, NULL, 'Government Vehicle', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 44 DAY),
(461, 357, 38, 75, NULL, 'Low-Income Assistance', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 32 DAY),
(462, 142, NULL, 85, NULL, 'Veteran Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 39 DAY),
(463, 370, 19, 91, NULL, 'Special Permit', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 37 DAY),
(464, 264, 36, 103, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 42 DAY),
(465, 176, NULL, NULL, NULL, 'Public Transport', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 41 DAY),
(466, 341, 26, 97, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 38 DAY),
(467, 210, NULL, NULL, NULL, 'Medical Emergency Use', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 33 DAY),
(468, 151, 27, 93, NULL, 'Government Vehicle', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 36 DAY),
(469, 331, NULL, NULL, NULL, 'Veteran Discount', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 43 DAY),
(470, 374, 5, 86, NULL, 'Special Permit', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 40 DAY),
(471, 255, 40, 77, NULL, 'Public Transport', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 48 DAY),
(472, 104, NULL, NULL, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 50 DAY),
(473, 243, 29, 82, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 37 DAY),
(474, 408, NULL, 79, NULL, 'Emergency Services', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 39 DAY),
(475, 187, 20, NULL, NULL, 'Public Transport', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 51 DAY),
(476, 292, NULL, 80, NULL, 'Medical Emergency Use', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 36 DAY),
(477, 346, 2, 90, NULL, 'Veteran Discount', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 42 DAY),
(478, 176, NULL, NULL, NULL, 'Military Vehicle Exemption', NOW() - INTERVAL 11 DAY, NOW() + INTERVAL 38 DAY),
(479, 319, 15, 98, NULL, 'Disability', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 45 DAY),
(480, 232, NULL, 96, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 44 DAY),
(481, 343, 34, NULL, NULL, 'Special Permit', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 41 DAY),
(482, 120, NULL, 88, NULL, 'Public Transport', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 39 DAY),
(483, 382, 1, 101, NULL, 'Veteran Discount', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 36 DAY),
(484, 217, 37, 99, NULL, 'Government Vehicle', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 43 DAY),
(485, 127, NULL, NULL, NULL, 'Medical Emergency Use', NOW() - INTERVAL 5 DAY, NOW() + INTERVAL 40 DAY),
(486, 206, 16, 84, NULL, 'Disability', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 42 DAY),
(487, 329, NULL, 94, NULL, 'Special Permit', NOW() - INTERVAL 8 DAY, NOW() + INTERVAL 39 DAY),
(488, 238, 12, 104, NULL, 'Electric Vehicle Discount', NOW() - INTERVAL 10 DAY, NOW() + INTERVAL 44 DAY),
(489, 315, 43, 85, NULL, 'Low-Income Assistance', NOW() - INTERVAL 6 DAY, NOW() + INTERVAL 38 DAY),
(490, 145, NULL, 80, NULL, 'Public Transport', NOW() - INTERVAL 9 DAY, NOW() + INTERVAL 41 DAY),
(491, 359, 24, NULL, NULL, 'Veteran Discount', NOW() - INTERVAL 7 DAY, NOW() + INTERVAL 50 DAY);


  
### Populating sensordata table:
INSERT INTO sensor_data (tunnel_id, recorded_timestamp, sensor_type, sensor_value, unit) VALUES
(1, NOW() - INTERVAL 1 HOUR, 'Temperature', 21.4, '°C'),
(22, NOW() - INTERVAL 2 HOUR, 'CO2', 412.7, 'ppm'),
(23, NOW() - INTERVAL 3 HOUR, 'Humidity', 54.2, '%'),
(24, NOW() - INTERVAL 4 HOUR, 'Air Pressure', 101.2, 'kPa'),
(1, NOW() - INTERVAL 5 HOUR, 'Visibility', 850.0, 'm'),
(26, NOW() - INTERVAL 6 HOUR, 'Temperature', 19.8, '°C'),
(23, NOW() - INTERVAL 7 HOUR, 'CO2', 428.3, 'ppm'),
(4, NOW() - INTERVAL 8 HOUR, 'Humidity', 49.6, '%'),
(23, NOW() - INTERVAL 9 HOUR, 'Air Pressure', 100.8, 'kPa'),
(26, NOW() - INTERVAL 10 HOUR, 'Visibility', 920.0, 'm'),
(23, NOW() - INTERVAL 11 HOUR, 'Temperature', 23.1, '°C'),
(4, NOW() - INTERVAL 12 HOUR, 'CO2', 435.1, 'ppm'),
(1, NOW() - INTERVAL 13 HOUR, 'Humidity', 57.0, '%'),
(22, NOW() - INTERVAL 14 HOUR, 'Air Pressure', 101.5, 'kPa'),
(23, NOW() - INTERVAL 15 HOUR, 'Visibility', 780.0, 'm'),
(26, NOW() - INTERVAL 16 HOUR, 'Temperature', 22.6, '°C'),
(23, NOW() - INTERVAL 17 HOUR, 'CO2', 417.2, 'ppm'),
(22, NOW() - INTERVAL 18 HOUR, 'Humidity', 53.9, '%'),
(23, NOW() - INTERVAL 19 HOUR, 'Air Pressure', 100.9, 'kPa'),
(23, NOW() - INTERVAL 20 HOUR, 'Visibility', 890.0, 'm'),
(26, NOW() - INTERVAL 21 HOUR, 'Temperature', 20.3, '°C'),
(22, NOW() - INTERVAL 22 HOUR, 'CO2', 410.4, 'ppm'),
(23, NOW() - INTERVAL 23 HOUR, 'Humidity', 52.1, '%'),
(23, NOW() - INTERVAL 24 HOUR, 'Air Pressure', 101.1, 'kPa'),
(26, NOW() - INTERVAL 25 HOUR, 'Visibility', 870.0, 'm'),
(22, NOW() - INTERVAL 26 HOUR, 'Temperature', 18.9, ‘°C');


### Populating tunnel events table now:
INSERT INTO tunnel_events (tunnel_id, event_type, event_start, event_end, severity, description) VALUES
(1, 'Maintenance', NOW() - INTERVAL 2 DAY, NOW() - INTERVAL 2 DAY + INTERVAL 4 HOUR, 'Moderate', 'Routine inspection of ventilation systems'),
(26, 'Accident', NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY + INTERVAL 2 HOUR, 'High', 'Two-vehicle collision causing partial closure'),
(23, 'Fire Drill', NOW() - INTERVAL 6 HOUR, NOW() - INTERVAL 5 HOUR, 'Low', 'Scheduled tunnel fire safety drill'),
(24, 'Flooding', NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 3 DAY + INTERVAL 5 HOUR, 'High', 'Heavy rainfall causing temporary flooding'),
(23, 'Signal Failure', NOW() - INTERVAL 8 HOUR, NOW() - INTERVAL 6 HOUR, 'Moderate', 'Signal system reboot required'),
(22, 'Debris Clearance', NOW() - INTERVAL 12 HOUR, NOW() - INTERVAL 11 HOUR, 'Low', 'Minor debris removal after overnight patrol'),
(23, 'Security Alert', NOW() - INTERVAL 16 HOUR, NOW() - INTERVAL 15 HOUR, 'High', 'Suspicious vehicle investigation'),
(26, 'Power Outage', NOW() - INTERVAL 10 HOUR, NOW() - INTERVAL 9 HOUR, 'Moderate', 'Temporary disruption to lighting'),
(23, 'Routine Cleaning', NOW() - INTERVAL 20 HOUR, NOW() - INTERVAL 19 HOUR, 'Low', 'Drainage and surface cleaning'),
(26, 'Inspection', NOW() - INTERVAL 1 DAY - INTERVAL 5 HOUR, NOW() - INTERVAL 1 DAY - INTERVAL 4 HOUR, 'Moderate', 'Annual tunnel wall integrity check'),
(23, 'Hazmat Spill', NOW() - INTERVAL 30 HOUR, NOW() - INTERVAL 29 HOUR, 'High', 'Chemical spill from cargo transport'),
(4, 'Camera Calibration', NOW() - INTERVAL 22 HOUR, NOW() - INTERVAL 21 HOUR, 'Low', 'CCTV system recalibration'),
(23, 'Paintwork Refresh', NOW() - INTERVAL 40 HOUR, NOW() - INTERVAL 38 HOUR, 'Low', 'Lane markings re-painted'),
(26, 'Sensor Upgrade', NOW() - INTERVAL 36 HOUR, NOW() - INTERVAL 34 HOUR, 'Moderate', 'Environmental sensor array upgrade'),
(23, 'Unauthorized Entry', NOW() - INTERVAL 18 HOUR, NOW() - INTERVAL 17 HOUR, 'High', 'Access breach investigated'),
(22, 'Barrier Fault', NOW() - INTERVAL 12 HOUR, NOW() - INTERVAL 11 HOUR + INTERVAL 30 MINUTE, 'Moderate', 'Entry barrier unresponsive'),
(23, 'Tunnel Closure', NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 5 DAY + INTERVAL 3 HOUR, 'High', 'Full tunnel closure for emergency response'),
(22, 'Road Resurfacing', NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 3 DAY + INTERVAL 6 HOUR, 'Moderate', 'New asphalt layer applied'),
(26, 'Evacuation Drill', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 7 DAY + INTERVAL 2 HOUR, 'Low', 'Planned monthly evacuation test'),
(23, 'Vehicle Fire', NOW() - INTERVAL 14 HOUR, NOW() - INTERVAL 13 HOUR, 'High', 'Fire in heavy goods vehicle'),
(1, 'Lighting Upgrade', NOW() - INTERVAL 48 HOUR, NOW() - INTERVAL 46 HOUR, 'Moderate', 'LED fixtures installed'),
(22, 'Noise Complaint Response', NOW() - INTERVAL 2 DAY - INTERVAL 3 HOUR, NOW() - INTERVAL 2 DAY - INTERVAL 2 HOUR, 'Low', 'Investigation into loud exhaust systems'),
(23, 'Tunnel Walkthrough', NOW() - INTERVAL 25 HOUR, NOW() - INTERVAL 24 HOUR, 'Low', 'Manual on-foot infrastructure survey'),
(4, 'Structural Scanning', NOW() - INTERVAL 18 DAY, NOW() - INTERVAL 18 DAY + INTERVAL 5 HOUR, 'Moderate', 'LIDAR-based tunnel scan'),
(1, 'Hydraulic Failure', NOW() - INTERVAL 15 HOUR, NOW() - INTERVAL 14 HOUR, 'High', 'Lift gate malfunction at exit'),
(2, 'Graffiti Removal', NOW() - INTERVAL 22 HOUR, NOW() - INTERVAL 21 HOUR, 'Low', 'Wall cleaning to remove unauthorized markings');



### Populating discounts table now, not discount_exemption:
INSERT INTO discounts (name, description, percentage) VALUES
('Diplomatic Exemption', 'Full exemption for diplomatic vehicles', 100.00),
('Low-Income Assistance', 'Support for verified low-income users', 25.00),
('Electric Vehicle Discount', 'Standard discount for electric vehicle owners', 15.00),
('Medical Emergency Use', 'Full exemption for medical emergencies', 100.00),
('Veteran Discount', 'Discount for verified military veterans', 20.00),
('Local Business Promotion', 'Support for local businesses near tunnel zones', 18.00),
('Military Vehicle Exemption', 'Full exemption for military vehicles', 100.00),
('Government Vehicle', 'Full exemption for government fleet vehicles', 100.00),
('Emergency Services', 'Full exemption for emergency response vehicles', 100.00),
('Disability', 'Support for users with certified disabilities', 30.00),
('Special Permit', 'Discount for users with approved special permits', 20.00),
('Public Transport', 'Discount for registered public transport operators', 30.00);



#### Populating optimization log table:
INSERT INTO optimization_logs (tunnel_id, strategy_applied, result_summary) VALUES
(1, 'Off-Peak Toll Adjustment', 'Reduced congestion by 12% during midday window'),
(22, 'Congestion-Based Pricing', 'Higher fees during rush hour reduced volume by 18%'),
(23, 'Lane Reallocation', 'Converted HOV lane increased throughput by 9%'),
(24, 'EV Priority Entry', 'Average entry time for electric vehicles cut by 25%'),
(1, 'Sensor-Driven Fee Scaling', 'Dynamic pricing balanced tunnel load across zones'),
(26, 'Frequent User Incentive', 'Loyalty discount led to 6% retention increase'),
(23, 'Nighttime Discount Trial', 'Higher overnight usage observed, +11% volume'),
(26, 'Directional Flow Switch', 'Peak congestion reversed by rerouting entry lanes'),
(23, 'Air Quality Surge Pricing', 'Fee surcharges triggered during high CO₂ events'),
(22, 'Travel Time Forecast Alert', 'Realtime SMS alerts reduced unexpected delays'),
(23, 'Toll Suspension (Event)', 'Traffic rerouted successfully during city marathon'),
(24, 'Smart Signal Coordination', 'Vehicle wait time decreased from avg. 65s to 40s'),
(26, 'Dynamic Congestion Cap', 'Usage throttled via staged entry to prevent backups'),
(22, 'Demand Curve Flattening', 'Balanced entry across 6–9am window reduced queues'),
(23, 'Off-Season Rate Modulation', 'Attracted 8% more off-peak trips in Q3'),
(23, 'Fleet-Based Rate Plan', 'Company fleet toll bundling reduced processing overhead'),
(23, 'Maintenance-Tied Discount', 'Fee drop during resurfacing retained user volume'),
(26, 'Real-Time Diversion Advisory', 'Helped reroute 22% of peak-hour drivers'),
(23, 'Pre-Booked Entry Slots', 'Enabled time-spaced access; lowered load variance'),
(22, 'License Plate Frequency Scan', 'Flagged usage patterns; improved prediction accuracy'),
(1, 'Weather-Responsive Tolling', 'Fog conditions triggered pricing freeze'),
(26, 'Mobile Payment Incentive', 'Adoption of app-based tolling up by 15%'),
(23, 'Entry Limit per Interval', 'Rate-limiting access eased congestion spikes'),
(4, 'Alternate Route Guidance', 'Digital signage reduced tunnel dependency by 9%'),
(1, 'Adaptive Toll Scaling', 'Tunnel 1 fees auto-adjusted with flow speed metrics'),
(22, 'Advanced Booking Discount', 'Users booking ahead received 8% off, higher satisfaction’);


  
### Populating average_charges_by_congestion table:
INSERT INTO average_charges_by_congestion (congestion_level, num_transactions, avg_charge) VALUES
('Low', 12, 3.50),
('Moderate', 18, 4.75),
('High', 25, 6.20),
('Low', 10, 3.40),
('Moderate', 20, 4.90),
('High', 28, 6.50),
('Low', 14, 3.60),
('Moderate', 22, 5.10),
('High', 30, 6.80),
('Low', 11, 3.45),
('Moderate', 19, 4.85),
('High', 27, 6.40),
('Low', 13, 3.55),
('Moderate', 21, 5.00),
('High', 29, 6.70),
('Low', 9, 3.30),
('Moderate', 17, 4.60),
('High', 26, 6.30),
('Low', 15, 3.65),
('Moderate', 23, 5.20),
('High', 31, 6.90),
('Low', 12, 3.50),
('Moderate', 20, 4.95),
('High', 32, 7.00),
('Low', 10, 3.35),
('Moderate', 18, 4.70);

#### Now I am inserting more data in all those 18 tables:
INSERT INTO sustainability (carbon_emission, eco_rating) VALUES
    (500, 'A'),
    (750, 'B'),
    (900, 'C'),
    (1200, 'B'),
    (300, 'A'),
    (950, 'C'),
    (400, 'A'),
    (1100, 'B'),
    (1300, 'C'),
    (600, 'A'),
    (850, 'B'),
    (1000, 'C'),
    (700, 'A'),
    (1150, 'B'),
    (1250, 'C'),
    (350, 'A'),
    (1050, 'B'),
    (1400, 'C'),
    (550, 'A'),
    (800, 'B'),
    (1350, 'C'),
    (450, 'A'),
    (1200, 'B'),
    (1450, 'C'),
    (380, 'A'),
    (980, 'B');

INSERT INTO sustainability (carbon_emission, eco_rating) VALUES
    (680, 'A'),
    (1020, 'B'),
    (1130, 'C'),
    (720, 'A'),
    (890, 'B'),
    (950, 'C'),
    (370, 'A'),
    (1180, 'B'),
    (1330, 'C'),
    (410, 'A'),
    (760, 'B'),
    (970, 'C'),
    (540, 'A'),
    (1080, 'B'),
    (1270, 'C'),
    (460, 'A'),
    (990, 'B'),
    (1390, 'C'),
    (330, 'A'),
    (860, 'B'),
    (1240, 'C'),
    (620, 'A'),
    (1040, 'B'),
    (1210, 'C'),
    (580, 'A'),
    (870, 'B'),
    (1300, 'C'),
    (450, 'A'),
    (900, 'B'),
    (1170, 'C'),
    (390, 'A'),
    (940, 'B'),
    (1360, 'C'),
    (500, 'A'),
    (920, 'B'),
    (1280, 'C'),
    (630, 'A'),
    (1010, 'B'),
    (1340, 'C'),
    (710, 'A'),
    (1120, 'B'),
    (1230, 'C'),
    (380, 'A'),
    (830, 'B'),
    (1410, 'C'),
    (550, 'A'),
    (880, 'B'),
    (1190, 'C'),
    (470, 'A'),
    (980, 'B');


INSERT INTO sustainability (carbon_emission, eco_rating) VALUES
    (690, 'A'),
    (1070, 'B'),
    (1320, 'C'),
    (520, 'A'),
    (880, 'B'),
    (1200, 'C'),
    (430, 'A'),
    (930, 'B'),
    (1370, 'C'),
    (360, 'A'),
    (980, 'B'),
    (1260, 'C'),
    (410, 'A'),
    (950, 'B'),
    (1290, 'C'),
    (640, 'A'),
    (1000, 'B'),
    (1350, 'C'),
    (370, 'A'),
    (890, 'B'),
    (1220, 'C'),
    (590, 'A'),
    (940, 'B'),
    (1280, 'C'),
    (480, 'A'),
    (920, 'B'),
    (1170, 'C'),
    (530, 'A'),
    (910, 'B'),
    (1380, 'C'),
    (560, 'A'),
    (990, 'B'),
    (1250, 'C'),
    (660, 'A'),
    (1050, 'B'),
    (1400, 'C'),
    (470, 'A'),
    (960, 'B'),
    (1310, 'C'),
    (620, 'A'),
    (1030, 'B'),
    (1360, 'C'),
    (340, 'A'),
    (870, 'B'),
    (1150, 'C'),
    (710, 'A'),
    (1080, 'B'),
    (1230, 'C'),
    (420, 'A'),
    (860, 'B');

INSERT INTO sustainability (carbon_emission, eco_rating) VALUES
    (430, 'A'),
    (970, 'B'),
    (1300, 'C'),
    (380, 'A'),
    (940, 'B'),
    (1280, 'C'),
    (550, 'A'),
    (920, 'B'),
    (1240, 'C'),
    (470, 'A'),
    (890, 'B'),
    (1210, 'C'),
    (600, 'A'),
    (910, 'B'),
    (1190, 'C'),
    (490, 'A'),
    (860, 'B'),
    (1170, 'C'),
    (580, 'A'),
    (950, 'B'),
    (1320, 'C'),
    (520, 'A'),
    (900, 'B'),
    (1260, 'C'),
    (560, 'A'),
    (870, 'B'),
    (1220, 'C'),
    (610, 'A'),
    (940, 'B'),
    (1340, 'C'),
    (540, 'A'),
    (910, 'B'),
    (1290, 'C'),
    (430, 'A'),
    (860, 'B'),
    (1250, 'C'),
    (480, 'A'),
    (920, 'B'),
    (1310, 'C'),
    (570, 'A'),
    (890, 'B'),
    (1180, 'C'),
    (620, 'A'),
    (1000, 'B'),
    (1350, 'C'),
    (600, 'A'),
    (950, 'B'),
    (1270, 'C'),
    (490, 'A'),
    (930, 'B');

INSERT INTO sustainability (carbon_emission, eco_rating) VALUES
    (460, 'A'),
    (880, 'B'),
    (1200, 'C'),
    (510, 'A'),
    (930, 'B'),
    (1250, 'C'),
    (570, 'A'),
    (910, 'B'),
    (1320, 'C'),
    (490, 'A'),
    (970, 'B'),
    (1240, 'C'),
    (530, 'A'),
    (990, 'B'),
    (1300, 'C'),
    (550, 'A'),
    (950, 'B'),
    (1270, 'C'),
    (600, 'A'),
    (920, 'B'),
    (1220, 'C'),
    (440, 'A'),
    (890, 'B'),
    (1180, 'C'),
    (580, 'A'),
    (1000, 'B'),
    (1290, 'C'),
    (420, 'A'),
    (860, 'B'),
    (1170, 'C'),
    (540, 'A'),
    (970, 'B'),
    (1260, 'C'),
    (500, 'A'),
    (940, 'B'),
    (1330, 'C'),
    (610, 'A'),
    (980, 'B'),
    (1210, 'C'),
    (470, 'A'),
    (910, 'B'),
    (1360, 'C'),
    (450, 'A'),
    (960, 'B'),
    (1190, 'C'),
    (630, 'A'),
    (890, 'B'),
    (1350, 'C'),
    (520, 'A'),
    (930, 'B');

INSERT INTO sustainability (carbon_emission, eco_rating) VALUES
    (460, 'A'),
    (930, 'B'),
    (1280, 'C'),
    (500, 'A'),
    (880, 'B'),
    (1210, 'C'),
    (540, 'A'),
    (920, 'B'),
    (1260, 'C'),
    (470, 'A'),
    (970, 'B'),
    (1300, 'C'),
    (490, 'A'),
    (940, 'B'),
    (1230, 'C'),
    (520, 'A'),
    (960, 'B'),
    (1270, 'C'),
    (570, 'A'),
    (910, 'B'),
    (1190, 'C'),
    (590, 'A'),
    (890, 'B'),
    (1160, 'C'),
    (610, 'A'),
    (1000, 'B'),
    (1350, 'C'),
    (450, 'A'),
    (950, 'B'),
    (1320, 'C'),
    (640, 'A'),
    (870, 'B'),
    (1180, 'C'),
    (430, 'A'),
    (920, 'B'),
    (1290, 'C'),
    (560, 'A'),
    (910, 'B'),
    (1250, 'C'),
    (480, 'A'),
    (990, 'B'),
    (1380, 'C'),
    (610, 'A'),
    (980, 'B'),
    (1340, 'C'),
    (550, 'A'),
    (960, 'B'),
    (1220, 'C'),
    (600, 'A'),
    (940, 'B');

INSERT INTO sustainability (carbon_emission, eco_rating) VALUES
    (520, 'A'), (940, 'B'), (1240, 'C'),
    (490, 'A'), (910, 'B'), (1190, 'C'),
    (560, 'A'), (980, 'B'), (1320, 'C'),
    (530, 'A'), (960, 'B'), (1270, 'C'),
    (610, 'A'), (930, 'B'), (1350, 'C'),
    (470, 'A'), (990, 'B'), (1200, 'C'),
    (590, 'A'), (900, 'B'), (1260, 'C'),
    (640, 'A'), (970, 'B'), (1310, 'C'),
    (600, 'A'), (950, 'B'), (1290, 'C'),
    (450, 'A'), (880, 'B'), (1230, 'C'),
    (520, 'A'), (920, 'B'), (1250, 'C'),
    (480, 'A'), (910, 'B'), (1170, 'C'),
    (560, 'A'), (1000, 'B'), (1340, 'C'),
    (470, 'A'), (890, 'B'), (1280, 'C'),
    (500, 'A'), (940, 'B'), (1300, 'C'),
    (540, 'A'), (910, 'B'), (1210, 'C'),
    (620, 'A'), (970, 'B'), (1260, 'C'),
    (460, 'A'), (900, 'B'), (1220, 'C'),
    (610, 'A'), (990, 'B'), (1360, 'C'),
    (450, 'A'), (890, 'B'), (1180, 'C'),
    (590, 'A'), (920, 'B'), (1290, 'C'),
    (530, 'A'), (980, 'B'), (1240, 'C'),
    (500, 'A'), (950, 'B'), (1330, 'C'),
    (580, 'A'), (930, 'B'), (1270, 'C'),
    (600, 'A'), (960, 'B'), (1350, 'C'),
    (470, 'A'), (940, 'B'), (1220, 'C'),
    (620, 'A'), (880, 'B'), (1310, 'C'),
    (560, 'A'), (1000, 'B'), (1250, 'C'),
    (450, 'A'), (910, 'B'), (1300, 'C'),
    (590, 'A'), (890, 'B'), (1190, 'C'),
    (480, 'A'), (980, 'B'), (1340, 'C'),
    (610, 'A'), (940, 'B'), (1230, 'C');


INSERT INTO sustainability (carbon_emission, eco_rating) VALUES
    (510, 'A'), (930, 'B'), (1240, 'C'),
    (460, 'A'), (900, 'B'), (1200, 'C'),
    (520, 'A'), (950, 'B'), (1270, 'C'),
    (570, 'A'), (960, 'B'), (1280, 'C'),
    (480, 'A'), (910, 'B'), (1210, 'C'),
    (600, 'A'), (990, 'B'), (1340, 'C'),
    (530, 'A'), (980, 'B'), (1300, 'C'),
    (490, 'A'), (920, 'B'), (1250, 'C'),
    (540, 'A'), (970, 'B'), (1320, 'C'),
    (470, 'A'), (940, 'B'), (1290, 'C'),
    (580, 'A'), (900, 'B'), (1220, 'C'),
    (620, 'A'), (1000, 'B'), (1360, 'C'),
    (500, 'A'), (890, 'B'), (1180, 'C'),
    (590, 'A'), (930, 'B'), (1260, 'C'),
    (450, 'A'), (910, 'B'), (1170, 'C'),
    (610, 'A'), (960, 'B'), (1310, 'C'),
    (560, 'A'), (950, 'B'), (1330, 'C'),
    (490, 'A'), (880, 'B'), (1190, 'C'),
    (630, 'A'), (970, 'B'), (1280, 'C'),
    (460, 'A'), (940, 'B'), (1240, 'C'),
    (520, 'A'), (920, 'B'), (1230, 'C'),
    (600, 'A'), (1000, 'B'), (1350, 'C'),
    (470, 'A'), (890, 'B'), (1200, 'C'),
    (580, 'A'), (910, 'B'), (1270, 'C'),
    (540, 'A'), (980, 'B'), (1320, 'C'),
    (490, 'A'), (950, 'B'), (1300, 'C'),
    (610, 'A'), (930, 'B'), (1260, 'C'),
    (450, 'A'), (960, 'B'), (1340, 'C'),
    (590, 'A'), (900, 'B'), (1220, 'C'),
    (560, 'A'), (940, 'B'), (1290, 'C');

INSERT INTO sustainability (carbon_emission, eco_rating) VALUES
    (520, 'A'),
    (960, 'B'),
    (1280, 'C'),
    (470, 'A'),
    (930, 'B'),
    (1200, 'C'),
    (590, 'A'),
    (990, 'B'),
    (1320, 'C'),
    (610, 'A');

************
INSERT INTO users (user_id, username, full_name, email, phone, password_hash, last_login)
VALUES
(29, 'mkjamil23', 'Michael Jamil', 'mjamil56@example.com', '07213523994', 'hashed_pw_29', NULL),
(30, 'adam98', 'Adam Currise', 'acurries29@example.com', '07495930235', 'hased_pw_30', NULL);
UPDATE users
SET password_hash = 'hashed_pw_30'
WHERE user_id = 30;
INSERT INTO users (user_id, username, full_name, email, phone, password_hash, last_login)
VALUES
(31, 'oloka37', 'Oloka Patel', 'pateloloka21@example.com', '07413529994', 'hashed_pw_29', NULL),
(32, 'benlucas54', 'Ben Lucas', 'blucas480@example.com', '07392930439', 'hashed_pw_30', NULL),
(33, 'freddyknight', 'Freddy Chaunt', 'knight563@example.com', '07399930730', 'hashed_pw_30', NULL),
(34, 'dilafroze3', 'Dil Afroze', 'afroze82@example.com', '077085930230', 'hashed_pw_30', NULL),
(35, 'noni672', 'Noni Gopal', 'gopaln72@example.com', '07274230275', 'hashed_pw_30', NULL),
(36, 'ranashetty', 'Rana Shetty', 'shettyr452@example.com', '07690941793', 'hashed_pw_30', NULL),
(37, 'alikim', 'Ali Kim', 'aliwater89@example.com', '07420930201', 'hashed_pw_30', NULL),
(38, 'mariak37', 'Maria Cruise', 'cmaria29@example.com', '07795130232', 'hashed_pw_30', NULL),
(39, 'shahida23', 'Shahida Malik', 'smalik980@example.com', '07494930288', 'hashed_pw_30', NULL);

INSERT INTO users (username, full_name, email, phone, password_hash, last_login)
VALUES
('rthomas92', 'Ryan Thomas', 'rthomas92@example.com', '07123456705', 'hashed_pw_05', NULL),
('mlopez', 'Maria Lopez', 'mlopez@example.com', '07123456706', 'hashed_pw_06', NULL);
INSERT INTO users (username, full_name, email, phone, password_hash, last_login)
VALUES
('kpatel01', 'Kiran Patel', 'kpatel01@example.com', '07123456707', 'hashed_pw_07', NULL),
('sali22', 'Sara Ali', 'sali22@example.com', '07123456708', 'hashed_pw_08', NULL),
('dgreen3', 'Daniel Green', 'dgreen3@example.com', '07123456709', 'hashed_pw_09', NULL),
('njames4', 'Nicole James', 'njames4@example.com', '07123456710', 'hashed_pw_10', NULL),
('wchan5', 'Wesley Chan', 'wchan5@example.com', '07123456711', 'hashed_pw_11', NULL),

INSERT INTO users (username, full_name, email, phone, password_hash, last_login)
VALUES
('djohnson77', 'Derek Johnson', 'djohnson77@example.com', '07123456777', 'hashed_pw_77', NULL),
('emehta78', 'Esha Mehta', 'emehta78@example.com', '07123456778', 'hashed_pw_78', NULL),
('tnguyen79', 'Thao Nguyen', 'tnguyen79@example.com', '07123456779', 'hashed_pw_79', NULL),
('obrown80', 'Olivia Brown', 'obrown80@example.com', '07123456780', 'hashed_pw_80', NULL),
('jwilson81', 'Jake Wilson', 'jwilson81@example.com', '07123456781', 'hashed_pw_81', NULL);

INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('slong187', 'Sophie Long', 'slong187@example.com', '07123456887', 'hashed_pw_187', '2025-04-19 15:42:10'),
('aroy188', 'Amaan Roy', 'aroy188@example.com', '07123456888', 'hashed_pw_188', '2025-06-01 09:15:28'),
('mgibson189', 'Maya Gibson', 'mgibson189@example.com', '07123456889', 'hashed_pw_189', '2025-05-10 17:09:42'),
('bshah190', 'Bilal Shah', 'bshah190@example.com', '07123456890', 'hashed_pw_190', '2025-06-13 06:33:57'),
('ecarter191', 'Ella Carter', 'ecarter191@example.com', '07123456891', 'hashed_pw_191', '2025-05-25 11:52:19'),
('ojenkins192', 'Oscar Jenkins', 'ojenkins192@example.com', '07123456892', 'hashed_pw_192', '2025-06-16 20:23:11'),
('rpatel193', 'Riya Patel', 'rpatel193@example.com', '07123456893', 'hashed_pw_193', '2025-05-05 07:41:38'),
('tstevens194', 'Theo Stevens', 'tstevens194@example.com', '07123456894', 'hashed_pw_194', '2025-04-29 13:20:00'),
('pkumar195', 'Priya Kumar', 'pkumar195@example.com', '07123456895', 'hashed_pw_195', '2025-06-04 10:45:06'),
('akeane196', 'Aidan Keane', 'akeane196@example.com', '07123456896', 'hashed_pw_196', '2025-05-14 08:56:25'),
('glee236', 'Georgia Lee', 'glee236@example.com', '07123456936', 'hashed_pw_236', '2025-06-19 21:14:03’);


INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('hward237', 'Hassan Ward', 'hward237@example.com', '07123456937', 'hashed_pw_237', '2025-05-23 16:42:11'),
('lrichards238', 'Leah Richards', 'lrichards238@example.com', '07123456938', 'hashed_pw_238', '2025-06-11 13:15:24'),
('znguyen239', 'Zara Nguyen', 'znguyen239@example.com', '07123456939', 'hashed_pw_239', '2025-04-26 08:05:19'),
('eknight240', 'Eli Knight', 'eknight240@example.com', '07123456940', 'hashed_pw_240', '2025-06-17 18:52:01'),
('nvaughn241', 'Nico Vaughn', 'nvaughn241@example.com', '07123456941', 'hashed_pw_241', '2025-05-05 22:33:55'),
('jlyons286', 'Jamie Lyons', 'jlyons286@example.com', '07123456986', 'hashed_pw_286', '2025-04-28 19:20:44’);
INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('ncarter287', 'Naomi Carter', 'ncarter287@example.com', '07123456987', 'hashed_pw_287', '2025-05-30 12:45:32'),
('jsingh288', 'Jasper Singh', 'jsingh288@example.com', '07123456988', 'hashed_pw_288', '2025-04-14 16:33:08'),
('esanders289', 'Eliana Sanders', 'esanders289@example.com', '07123456989', 'hashed_pw_289', '2025-06-18 08:29:14'),
('gparker290', 'Gavin Parker', 'gparker290@example.com', '07123456990', 'hashed_pw_290', '2025-06-06 14:01:55'),
('tali291', 'Tessa Ali', 'tali291@example.com', '07123456991', 'hashed_pw_291', '2025-06-02 09:53:47'),
('mlowe292', 'Marcus Lowe', 'mlowe292@example.com', '07123456992', 'hashed_pw_292', '2025-04-28 18:22:01'),
('kcook293', 'Kaitlyn Cook', 'kcook293@example.com', '07123456993', 'hashed_pw_293', '2025-06-09 21:45:37'),
('ajackson294', 'Ava Jackson', 'ajackson294@example.com', '07123456994', 'hashed_pw_294', '2025-05-14 11:05:13'),
('hdavies295', 'Harvey Davies', 'hdavies295@example.com', '07123456995', 'hashed_pw_295', '2025-05-01 07:49:22'),
('sroberts296', 'Selina Roberts', 'sroberts296@example.com', '07123456996', 'hashed_pw_296', '2025-06-20 12:11:44'),
('nburke297', 'Noah Burke', 'nburke297@example.com', '07123456997', 'hashed_pw_297', '2025-04-23 22:36:10'),
('rgriffin298', 'Reya Griffin', 'rgriffin298@example.com', '07123456998', 'hashed_pw_298', '2025-06-07 17:24:16'),
('lhoward299', 'Leo Howard', 'lhoward299@example.com', '07123456999', 'hashed_pw_299', '2025-05-19 14:12:27'),
('cwright300', 'Cleo Wright', 'cwright300@example.com', '07123457000', 'hashed_pw_300', '2025-06-15 05:56:49'),
('fellis301', 'Finn Ellis', 'fellis301@example.com', '07123457001', 'hashed_pw_301', '2025-05-11 08:03:55'),
('ksharma302', 'Kira Sharma', 'ksharma302@example.com', '07123457002', 'hashed_pw_302', '2025-06-13 20:44:10'),
('bwood303', 'Brandon Wood', 'bwood303@example.com', '07123457003', 'hashed_pw_303', '2025-04-27 15:31:03'),
('tjames304', 'Tiana James', 'tjames304@example.com', '07123457004', 'hashed_pw_304', '2025-06-04 19:02:29'),
('lward305', 'Lukas Ward', 'lward305@example.com', '07123457005', 'hashed_pw_305', '2025-05-07 13:17:44'),
('snguyen306', 'Sasha Nguyen', 'snguyen306@example.com', '07123457006', 'hashed_pw_306', '2025-06-03 16:52:51'),
('czhou307', 'Carmen Zhou', 'czhou307@example.com', '07123457007', 'hashed_pw_307', '2025-04-21 06:39:26'),
('jmartin308', 'Julian Martin', 'jmartin308@example.com', '07123457008', 'hashed_pw_308', '2025-05-31 10:17:55'),
('amehta309', 'Anya Mehta', 'amehta309@example.com', '07123457009', 'hashed_pw_309', '2025-06-10 09:23:34'),
('tgeorge310', 'Tristan George', 'tgeorge310@example.com', '07123457010', 'hashed_pw_310', '2025-06-05 11:36:49'),
('jmurphy311', 'Jade Murphy', 'jmurphy311@example.com', '07123457011', 'hashed_pw_311', '2025-04-19 23:10:18'),
('akhan312', 'Aliyah Khan', 'akhan312@example.com', '07123457012', 'hashed_pw_312', '2025-05-26 12:01:02'),
('jcollins313', 'Jay Collins', 'jcollins313@example.com', '07123457013', 'hashed_pw_313', '2025-06-12 17:25:21'),
('npatel314', 'Nina Patel', 'npatel314@example.com', '07123457014', 'hashed_pw_314', '2025-05-08 10:47:32'),
('mkim315', 'Mason Kim', 'mkim315@example.com', '07123457015', 'hashed_pw_315', '2025-06-08 08:38:57'),
('kscott316', 'Kelsey Scott', 'kscott316@example.com', '07123457016', 'hashed_pw_316', '2025-05-16 14:15:20'),
('avazquez317', 'Aiden Vazquez', 'avazquez317@example.com', '07123457017', 'hashed_pw_317', '2025-05-04 09:59:12'),
('ibennett318', 'Isla Bennett', 'ibennett318@example.com', '07123457018', 'hashed_pw_318', '2025-06-14 06:13:25'),
('erobinson319', 'Ezekiel Robinson', 'erobinson319@example.com', '07123457019', 'hashed_pw_319', '2025-04-30 10:09:01'),
('cmills320', 'Callie Mills', 'cmills320@example.com', '07123457020', 'hashed_pw_320', '2025-06-01 18:11:34'),
('jwatson321', 'Jordan Watson', 'jwatson321@example.com', '07123457021', 'hashed_pw_321', '2025-05-22 07:42:39'),
('psullivan322', 'Piper Sullivan', 'psullivan322@example.com', '07123457022', 'hashed_pw_322', '2025-04-22 14:08:57'),
('jgarcia323', 'Jonas Garcia', 'jgarcia323@example.com', '07123457023', 'hashed_pw_323', '2025-06-18 16:07:41'),
('lthomas324', 'Lila Thomas', 'lthomas324@example.com', '07123457024', 'hashed_pw_324', '2025-06-16 20:48:10'),
('rlee325', 'Ronan Lee', 'rlee325@example.com', '07123457025', 'hashed_pw_325', '2025-05-02 12:56:55'),
('vwright326', 'Vera Wright', 'vwright326@example.com', '07123457026', 'hashed_pw_326', '2025-06-20 09:03:12'),
('bsingh327', 'Bobby Singh', 'bsingh327@example.com', '07123457027', 'hashed_pw_327', '2025-05-03 21:19:47'),
('jclark328', 'Joanna Clark', 'jclark328@example.com', '07123457028', 'hashed_pw_328', '2025-04-25 11:28:36'),
('cfernandez329', 'Cruz Fernandez', 'cfernandez329@example.com', '07123457029', 'hashed_pw_329', '2025-05-29 15:04:30'),
('mreid330', 'Mira Reid', 'mreid330@example.com', '07123457030', 'hashed_pw_330', '2025-06-03 13:42:21'),
('lgrant331', 'Logan Grant', 'lgrant331@example.com', '07123457031', 'hashed_pw_331', '2025-05-10 19:33:17');

INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('tcooper332', 'Troy Cooper', 'tcooper332@example.com', '07123457032', 'hashed_pw_332', '2025-05-20 16:27:44'),
('nstevens333', 'Nyla Stevens', 'nstevens333@example.com', '07123457033', 'hashed_pw_333', '2025-06-07 07:19:10'),
('gward334', 'Gabriel Ward', 'gward334@example.com', '07123457034', 'hashed_pw_334', '2025-05-13 13:02:51'),
('ashah335', 'Amira Shah', 'ashah335@example.com', '07123457035', 'hashed_pw_335', '2025-06-10 09:15:38'),
('obennett336', 'Owen Bennett', 'obennett336@example.com', '07123457036', 'hashed_pw_336', '2025-06-01 11:33:14'),
('mriley337', 'Maya Riley', 'mriley337@example.com', '07123457037', 'hashed_pw_337', '2025-05-18 14:08:42'),
('jstone338', 'Juliet Stone', 'jstone338@example.com', '07123457038', 'hashed_pw_338', '2025-05-03 19:22:07'),
('zchapman339', 'Zion Chapman', 'zchapman339@example.com', '07123457039', 'hashed_pw_339', '2025-06-14 10:56:03'),
('tberry340', 'Tiana Berry', 'tberry340@example.com', '07123457040', 'hashed_pw_340', '2025-06-18 08:42:50'),
('eburton341', 'Elliot Burton', 'eburton341@example.com', '07123457041', 'hashed_pw_341', '2025-04-29 06:33:29'),
('rparker342', 'Ruth Parker', 'rparker342@example.com', '07123457042', 'hashed_pw_342', '2025-06-02 17:57:44'),
('dphillips343', 'Dylan Phillips', 'dphillips343@example.com', '07123457043', 'hashed_pw_343', '2025-05-22 09:11:17'),
('lturner344', 'Lana Turner', 'lturner344@example.com', '07123457044', 'hashed_pw_344', '2025-05-28 21:45:30'),
('wsanders345', 'Wren Sanders', 'wsanders345@example.com', '07123457045', 'hashed_pw_345', '2025-04-30 12:24:52'),
('cmehta346', 'Chirag Mehta', 'cmehta346@example.com', '07123457046', 'hashed_pw_346', '2025-06-08 07:19:27'),
('hporter347', 'Holly Porter', 'hporter347@example.com', '07123457047', 'hashed_pw_347', '2025-05-04 13:50:39'),
('jdixon348', 'Joel Dixon', 'jdixon348@example.com', '07123457048', 'hashed_pw_348', '2025-06-16 22:18:12'),
('aramirez349', 'Ana Ramirez', 'aramirez349@example.com', '07123457049', 'hashed_pw_349', '2025-06-12 15:06:25'),
('mgomez350', 'Marco Gomez', 'mgomez350@example.com', '07123457050', 'hashed_pw_350', '2025-05-16 18:44:31'),
('sfrancis351', 'Sienna Francis', 'sfrancis351@example.com', '07123457051', 'hashed_pw_351', '2025-04-21 20:27:16'),
('ckaur352', 'Carmen Kaur', 'ckaur352@example.com', '07123457052', 'hashed_pw_352', '2025-05-11 09:55:18'),
('jowens353', 'Jaxon Owens', 'jowens353@example.com', '07123457053', 'hashed_pw_353', '2025-06-05 11:28:42'),
('asmith354', 'Ayla Smith', 'asmith354@example.com', '07123457054', 'hashed_pw_354', '2025-04-23 07:47:33'),
('mmorris355', 'Milan Morris', 'mmorris355@example.com', '07123457055', 'hashed_pw_355', '2025-06-06 08:49:17'),
('mabbott356', 'Myles Abbott', 'mabbott356@example.com', '07123457056', 'hashed_pw_356', '2025-05-07 10:21:03'),
('hkhan357', 'Hiba Khan', 'hkhan357@example.com', '07123457057', 'hashed_pw_357', '2025-05-26 14:57:01'),
('rcampbell358', 'Reid Campbell', 'rcampbell358@example.com', '07123457058', 'hashed_pw_358', '2025-06-17 19:13:29'),
('lspencer359', 'Lola Spencer', 'lspencer359@example.com', '07123457059', 'hashed_pw_359', '2025-06-09 10:01:46'),
('hross360', 'Harley Ross', 'hross360@example.com', '07123457060', 'hashed_pw_360', '2025-05-24 08:12:10'),
('zabbas361', 'Zain Abbas', 'zabbas361@example.com', '07123457061', 'hashed_pw_361', '2025-05-09 11:47:51'),
('rmcbride362', 'Rae McBride', 'rmcbride362@example.com', '07123457062', 'hashed_pw_362', '2025-06-19 16:37:00'),
('egibbs363', 'Evelyn Gibbs', 'egibbs363@example.com', '07123457063', 'hashed_pw_363', '2025-04-28 19:59:33'),
('oprice364', 'Ollie Price', 'oprice364@example.com', '07123457064', 'hashed_pw_364', '2025-05-02 07:17:15'),
('akamara365', 'Aiko Kamara', 'akamara365@example.com', '07123457065', 'hashed_pw_365', '2025-06-11 13:39:46'),
('awhite366', 'Ari White', 'awhite366@example.com', '07123457066', 'hashed_pw_366', '2025-04-27 22:50:06'),
('tdoyle367', 'Trey Doyle', 'tdoyle367@example.com', '07123457067', 'hashed_pw_367', '2025-05-27 06:16:57'),
('gnelson368', 'Gia Nelson', 'gnelson368@example.com', '07123457068', 'hashed_pw_368', '2025-05-12 17:33:08'),
('ngrant369', 'Nash Grant', 'ngrant369@example.com', '07123457069', 'hashed_pw_369', '2025-06-04 09:00:48'),
('emartinez370', 'Eloise Martinez', 'emartinez370@example.com', '07123457070', 'hashed_pw_370', '2025-06-20 08:13:22'),
('jjones371', 'Juliet Jones', 'jjones371@example.com', '07123457071', 'hashed_pw_371', '2025-06-02 10:55:14'),
('abryant372', 'Arjun Bryant', 'abryant372@example.com', '07123457072', 'hashed_pw_372', '2025-05-01 14:39:30'),
('zpatel373', 'Zoey Patel', 'zpatel373@example.com', '07123457073', 'hashed_pw_373', '2025-06-13 19:28:41'),
('dross374', 'Dominic Ross', 'dross374@example.com', '07123457074', 'hashed_pw_374', '2025-05-06 16:07:22'),
('jreed375', 'Julia Reed', 'jreed375@example.com', '07123457075', 'hashed_pw_375', '2025-04-24 09:44:37'),
('bpeterson376', 'Bella Peterson', 'bpeterson376@example.com', '07123457076', 'hashed_pw_376', '2025-06-15 07:19:45');

INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('lpeterson376', 'Bella Peterson', 'lpeterson976@example.com', '07123457076', 'hashed_pw_376', '2025-06-15 07:19:33'),
('sallen377', 'Samiya Allen', 'sallen377@example.com', '07123457077', 'hashed_pw_377', '2025-05-28 14:48:05'),
('gferguson378', 'Gideon Ferguson', 'gferguson378@example.com', '07123457078', 'hashed_pw_378', '2025-06-11 20:51:13'),
('mmurphy379', 'Mariyah Murphy', 'mmurphy379@example.com', '07123457079', 'hashed_pw_379', '2025-05-09 16:23:44'),
('dharvey380', 'Dane Harvey', 'dharvey380@example.com', '07123457080', 'hashed_pw_380', '2025-06-17 09:05:21'),
('lsimmons381', 'Layla Simmons', 'lsimmons381@example.com', '07123457081', 'hashed_pw_381', '2025-04-29 17:32:56'),
('zday382', 'Zachary Day', 'zday382@example.com', '07123457082', 'hashed_pw_382', '2025-06-10 06:19:08'),
('lvasquez383', 'Lena Vasquez', 'lvasquez383@example.com', '07123457083', 'hashed_pw_383', '2025-06-01 12:41:37'),
('sabbott384', 'Stefan Abbott', 'sabbott384@example.com', '07123457084', 'hashed_pw_384', '2025-05-03 18:02:11'),
('nmitchell385', 'Natalie Mitchell', 'nmitchell385@example.com', '07123457085', 'hashed_pw_385', '2025-06-04 10:55:42'),
('cmorgan386', 'Cyrus Morgan', 'cmorgan386@example.com', '07123457086', 'hashed_pw_386', '2025-05-30 13:12:29'),
('dbaxter387', 'Delilah Baxter', 'dbaxter387@example.com', '07123457087', 'hashed_pw_387', '2025-06-20 20:22:18'),
('kwells388', 'Kai Wells', 'kwells388@example.com', '07123457088', 'hashed_pw_388', '2025-04-25 11:48:59'),
('tobrien389', 'Tamara O’Brien', 'tobrien389@example.com', '07123457089', 'hashed_pw_389', '2025-05-18 14:04:26'),
('rparsons390', 'Raya Parsons', 'rparsons390@example.com', '07123457090', 'hashed_pw_390', '2025-06-13 09:43:36'),
('mfoster391', 'Milo Foster', 'mfoster391@example.com', '07123457091', 'hashed_pw_391', '2025-05-07 17:27:51'),
('gchan392', 'Gianna Chan', 'gchan392@example.com', '07123457092', 'hashed_pw_392', '2025-06-03 23:30:04'),
('hroberts393', 'Hamza Roberts', 'hroberts393@example.com', '07123457093', 'hashed_pw_393', '2025-06-05 08:59:10'),
('ajames394', 'Adeline James', 'ajames394@example.com', '07123457094', 'hashed_pw_394', '2025-04-22 21:13:46'),
('mtaylor395', 'Micah Taylor', 'mtaylor395@example.com', '07123457095', 'hashed_pw_395', '2025-05-21 10:40:37'),
('elewis396', 'Emmy Lewis', 'elewis396@example.com', '07123457096', 'hashed_pw_396', '2025-06-09 07:14:25'),
('cjackson397', 'Cory Jackson', 'cjackson397@example.com', '07123457097', 'hashed_pw_397', '2025-06-07 15:25:17'),
('avaughn398', 'Ava Vaughn', 'avaughn398@example.com', '07123457098', 'hashed_pw_398', '2025-05-08 12:39:22'),
('ekaur399', 'Esha Kaur', 'ekaur399@example.com', '07123457099', 'hashed_pw_399', '2025-05-27 06:50:53'),
('zbell400', 'Zane Bell', 'zbell400@example.com', '07123457100', 'hashed_pw_400', '2025-06-06 18:11:34'),
('prichards401', 'Penelope Richards', 'prichards401@example.com', '07123457101', 'hashed_pw_401', '2025-04-26 07:19:41'),
('amir402', 'Adam Mir', 'amir402@example.com', '07123457102', 'hashed_pw_402', '2025-06-08 09:32:09'),
('snelson403', 'Skyler Nelson', 'snelson403@example.com', '07123457103', 'hashed_pw_403', '2025-06-18 14:49:56'),
('kali404', 'Kamila Ali', 'kali404@example.com', '07123457104', 'hashed_pw_404', '2025-05-13 10:05:10'),
('jdean405', 'Jayden Dean', 'jdean405@example.com', '07123457105', 'hashed_pw_405', '2025-05-29 08:24:39'),
('dmason406', 'Daisy Mason', 'dmason406@example.com', '07123457106', 'hashed_pw_406', '2025-04-24 16:28:43'),
('ebishop407', 'Ethan Bishop', 'ebishop407@example.com', '07123457107', 'hashed_pw_407', '2025-06-02 12:58:55'),
('cgreen408', 'Cara Green', 'cgreen408@example.com', '07123457108', 'hashed_pw_408', '2025-05-06 13:33:01'),
('mscott409', 'Mohammed Scott', 'mscott409@example.com', '07123457109', 'hashed_pw_409', '2025-06-19 08:06:48'),
('kperry410', 'Keira Perry', 'kperry410@example.com', '07123457110', 'hashed_pw_410', '2025-04-30 10:10:22'),
('jhall411', 'Juno Hall', 'jhall411@example.com', '07123457111', 'hashed_pw_411', '2025-06-17 13:49:12'),
('ofranco412', 'Oriana Franco', 'ofranco412@example.com', '07123457112', 'hashed_pw_412', '2025-05-05 15:58:31'),
('rgrewal413', 'Rohan Grewal', 'rgrewal413@example.com', '07123457113', 'hashed_pw_413', '2025-06-15 17:04:18'),
('dellis414', 'Devon Ellis', 'dellis414@example.com', '07123457114', 'hashed_pw_414', '2025-05-12 08:30:42'),
('jwatts415', 'Juliette Watts', 'jwatts415@example.com', '07123457115', 'hashed_pw_415', '2025-06-11 23:27:14'),
('nlane416', 'Noor Lane', 'nlane416@example.com', '07123457116', 'hashed_pw_416', '2025-06-03 06:48:31'),
('abeck417', 'Aaron Beck', 'abeck417@example.com', '07123457117', 'hashed_pw_417', '2025-04-28 18:25:09'),
('cmoreno418', 'Celine Moreno', 'cmoreno418@example.com', '07123457118', 'hashed_pw_418', '2025-06-20 13:40:33'),
('ghamilton419', 'Grace Hamilton', 'ghamilton419@example.com', '07123457119', 'hashed_pw_419', '2025-05-26 08:22:17'),
('mjohnston420', 'Mina Johnston', 'mjohnston420@example.com', '07123457120', 'hashed_pw_420', '2025-04-20 09:39:18'),
('zgray421', 'Zayn Gray', 'gray453@example.com', '07248233429', 'hashed_pw_421', '2025-04-23 06:21:20’);

INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('khoward422', 'Kai Howard', 'khoward422@example.com', '07123457122', 'hashed_pw_422', NULL),
('mjones423', 'Mila Jones', 'mjones423@example.com', '07123457123', 'hashed_pw_423', NULL),
('sali424', 'Sana Ali', 'sali424@example.com', '07123457124', 'hashed_pw_424', NULL),
('erussell425', 'Elliot Russell', 'erussell425@example.com', '07123457125', 'hashed_pw_425', NULL),
('blane426', 'Bailey Lane', 'blane426@example.com', '07123457126', 'hashed_pw_426', NULL),
('ttaylor427', 'Tamia Taylor', 'ttaylor427@example.com', '07123457127', 'hashed_pw_427', NULL),
('adean428', 'Arlo Dean', 'adean428@example.com', '07123457128', 'hashed_pw_428', NULL),
('knguyen429', 'Kim Nguyen', 'knguyen429@example.com', '07123457129', 'hashed_pw_429', NULL),
('croberts430', 'Cody Roberts', 'croberts430@example.com', '07123457130', 'hashed_pw_430', NULL),
('hjackson431', 'Hazel Jackson', 'hjackson431@example.com', '07123457131', 'hashed_pw_431', NULL),
('jrodriguez432', 'Jada Rodriguez', 'jrodriguez432@example.com', '07123457132', 'hashed_pw_432', NULL),
('ayoung433', 'Aiden Young', 'ayoung433@example.com', '07123457133', 'hashed_pw_433', NULL),
('ccampbell434', 'Chloe Campbell', 'ccampbell434@example.com', '07123457134', 'hashed_pw_434', NULL),
('vshaw435', 'Vivaan Shaw', 'vshaw435@example.com', '07123457135', 'hashed_pw_435', NULL),
('odouglas436', 'Omar Douglas', 'odouglas436@example.com', '07123457136', 'hashed_pw_436', NULL),
('nlopez437', 'Nina Lopez', 'nlopez437@example.com', '07123457137', 'hashed_pw_437', NULL),
('xwells438', 'Xavier Wells', 'xwells438@example.com', '07123457138', 'hashed_pw_438', NULL),
('yhamilton439', 'Yasmine Hamilton', 'yhamilton439@example.com', '07123457139', 'hashed_pw_439', NULL),
('lroberts440', 'Leo Roberts', 'lroberts440@example.com', '07123457140', 'hashed_pw_440', NULL),
('fcoleman441', 'Freya Coleman', 'fcoleman441@example.com', '07123457141', 'hashed_pw_441', NULL),
('hfernandez442', 'Hugo Fernandez', 'hfernandez442@example.com', '07123457142', 'hashed_pw_442', NULL),
('czhang443', 'Cara Zhang', 'czhang443@example.com', '07123457143', 'hashed_pw_443', NULL),
('mmorrison444', 'Max Morrison', 'mmorrison444@example.com', '07123457144', 'hashed_pw_444', NULL),
('lfranklin445', 'Lara Franklin', 'lfranklin445@example.com', '07123457145', 'hashed_pw_445', NULL),
('rgeorge446', 'Riley George', 'rgeorge446@example.com', '07123457146', 'hashed_pw_446', NULL),
('jward447', 'Juno Ward', 'jward447@example.com', '07123457147', 'hashed_pw_447', NULL),
('tpatel448', 'Tariq Patel', 'tpatel448@example.com', '07123457148', 'hashed_pw_448', NULL),
('kmason449', 'Kiana Mason', 'kmason449@example.com', '07123457149', 'hashed_pw_449', NULL),
('jdawson450', 'Jace Dawson', 'jdawson450@example.com', '07123457150', 'hashed_pw_450', NULL);

INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('acole451', 'Amara Cole', 'acole451@example.com', '07123457151', 'hashed_pw_451', NULL),
('tjones452', 'Theo Jones', 'tjones452@example.com', '07123457152', 'hashed_pw_452', NULL),
('nhughes453', 'Nia Hughes', 'nhughes453@example.com', '07123457153', 'hashed_pw_453', NULL),
('cmiller454', 'Caleb Miller', 'cmiller454@example.com', '07123457154', 'hashed_pw_454', NULL),
('slane455', 'Sophie Lane', 'slane455@example.com', '07123457155', 'hashed_pw_455', NULL),
('ayates456', 'Aria Yates', 'ayates456@example.com', '07123457156', 'hashed_pw_456', NULL),
('bkennedy457', 'Blaine Kennedy', 'bkennedy457@example.com', '07123457157', 'hashed_pw_457', NULL),
('dortiz458', 'Daisy Ortiz', 'dortiz458@example.com', '07123457158', 'hashed_pw_458', NULL),
('wmurphy459', 'Wyatt Murphy', 'wmurphy459@example.com', '07123457159', 'hashed_pw_459', NULL),
('rlopez460', 'Rhea Lopez', 'rlopez460@example.com', '07123457160', 'hashed_pw_460', NULL),
('pkhan461', 'Parveen Khan', 'pkhan461@example.com', '07123457161', 'hashed_pw_461', NULL),
('svaughn462', 'Sage Vaughn', 'svaughn462@example.com', '07123457162', 'hashed_pw_462', NULL),
('jgilbert463', 'Jai Gilbert', 'jgilbert463@example.com', '07123457163', 'hashed_pw_463', NULL),
('npeters464', 'Nyla Peters', 'npeters464@example.com', '07123457164', 'hashed_pw_464', NULL),
('cshaw465', 'Carmen Shaw', 'cshaw465@example.com', '07123457165', 'hashed_pw_465', NULL),
('ekelley466', 'Ezra Kelley', 'ekelley466@example.com', '07123457166', 'hashed_pw_466', NULL),
('vsingh467', 'Vivian Singh', 'vsingh467@example.com', '07123457167', 'hashed_pw_467', NULL),
('lward468', 'Lenny Ward', 'lward468@example.com', '07123457168', 'hashed_pw_468', NULL),
('ojames469', 'Orla James', 'ojames469@example.com', '07123457169', 'hashed_pw_469', NULL),
('rmorris470', 'Rowan Morris', 'rmorris470@example.com', '07123457170', 'hashed_pw_470', NULL),
('bbanks471', 'Bria Banks', 'bbanks471@example.com', '07123457171', 'hashed_pw_471', NULL),
('tdiaz472', 'Toby Diaz', 'tdiaz472@example.com', '07123457172', 'hashed_pw_472', NULL),
('alayne473', 'Ari Layne', 'alayne473@example.com', '07123457173', 'hashed_pw_473', NULL),
('krodriguez474', 'Kira Rodriguez', 'krodriguez474@example.com', '07123457174', 'hashed_pw_474', NULL),
('fthomas475', 'Felix Thomas', 'fthomas475@example.com', '07123457175', 'hashed_pw_475', NULL),
('jnelson476', 'Jada Nelson', 'jnelson476@example.com', '07123457176', 'hashed_pw_476', NULL),
('edixon477', 'Ellis Dixon', 'edixon477@example.com', '07123457177', 'hashed_pw_477', NULL),
('tscott478', 'Thalia Scott', 'tscott478@example.com', '07123457178', 'hashed_pw_478', NULL),
('omartin479', 'Omari Martin', 'omartin479@example.com', '07123457179', 'hashed_pw_479', NULL),
('ycooper480', 'Yusuf Cooper', 'ycooper480@example.com', '07123457180', 'hashed_pw_480', NULL);

INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('kmitchell481', 'Kian Mitchell', 'kmitchell481@example.com', '07123457181', 'hashed_pw_481', NULL),
('cbailey482', 'Cleo Bailey', 'cbailey482@example.com', '07123457182', 'hashed_pw_482', NULL),
('lparker483', 'Lyla Parker', 'lparker483@example.com', '07123457183', 'hashed_pw_483', NULL),
('tbennett484', 'Troy Bennett', 'tbennett484@example.com', '07123457184', 'hashed_pw_484', NULL),
('rsmith485', 'Renee Smith', 'rsmith485@example.com', '07123457185', 'hashed_pw_485', NULL),
('jmorales486', 'Jasper Morales', 'jmorales486@example.com', '07123457186', 'hashed_pw_486', NULL),
('hcohen487', 'Harper Cohen', 'hcohen487@example.com', '07123457187', 'hashed_pw_487', NULL),
('olawson488', 'Owen Lawson', 'olawson488@example.com', '07123457188', 'hashed_pw_488', NULL),
('rrichardson489', 'Riley Richardson', 'rrichardson489@example.com', '07123457189', 'hashed_pw_489', NULL),
('eholmes490', 'Eva Holmes', 'eholmes490@example.com', '07123457190', 'hashed_pw_490', NULL),
('lward491', 'Leila Ward', 'lward491@example.com', '07123457191', 'hashed_pw_491', NULL),
('tsharp492', 'Theo Sharp', 'tsharp492@example.com', '07123457192', 'hashed_pw_492', NULL),
('mgill493', 'Macy Gill', 'mgill493@example.com', '07123457193', 'hashed_pw_493', NULL),
('mlewis494', 'Micah Lewis', 'mlewis494@example.com', '07123457194', 'hashed_pw_494', NULL),
('ebates495', 'Eleanor Bates', 'ebates495@example.com', '07123457195', 'hashed_pw_495', NULL),
('osilva496', 'Omar Silva', 'osilva496@example.com', '07123457196', 'hashed_pw_496', NULL),
('zcox497', 'Zainab Cox', 'zcox497@example.com', '07123457197', 'hashed_pw_497', NULL),
('rhayes498', 'Reid Hayes', 'rhayes498@example.com', '07123457198', 'hashed_pw_498', NULL),
('adelgado499', 'Amari Delgado', 'adelgado499@example.com', '07123457199', 'hashed_pw_499', NULL),
('vhart500', 'Vera Hart', 'vhart500@example.com', '07123457200', 'hashed_pw_500', NULL),
('dtucker501', 'Dante Tucker', 'dtucker501@example.com', '07123457201', 'hashed_pw_501', NULL),
('gporter502', 'Gia Porter', 'gporter502@example.com', '07123457202', 'hashed_pw_502', NULL),
('kcampbell503', 'Kody Campbell', 'kcampbell503@example.com', '07123457203', 'hashed_pw_503', NULL),
('mbrooks504', 'Marina Brooks', 'mbrooks504@example.com', '07123457204', 'hashed_pw_504', NULL),
('fward505', 'Freddie Ward', 'fward505@example.com', '07123457205', 'hashed_pw_505', NULL),
('plopez506', 'Priya Lopez', 'plopez506@example.com', '07123457206', 'hashed_pw_506', NULL),
('csavage507', 'Caleb Savage', 'csavage507@example.com', '07123457207', 'hashed_pw_507', NULL),
('nperry508', 'Noor Perry', 'nperry508@example.com', '07123457208', 'hashed_pw_508', NULL),
('cgriffin509', 'Cleo Griffin', 'cgriffin509@example.com', '07123457209', 'hashed_pw_509', NULL),
('ewheeler510', 'Elias Wheeler', 'ewheeler510@example.com', '07123457210', 'hashed_pw_510', NULL),
('amalik511', 'Amira Malik', 'amalik511@example.com', '07123457211', 'hashed_pw_511', NULL),
('jrice512', 'Jace Rice', 'jrice512@example.com', '07123457212', 'hashed_pw_512', NULL),
('dcoleman513', 'Delia Coleman', 'dcoleman513@example.com', '07123457213', 'hashed_pw_513', NULL),
('alewis514', 'Arya Lewis', 'alewis514@example.com', '07123457214', 'hashed_pw_514', NULL),
('thicks515', 'Toby Hicks', 'thicks515@example.com', '07123457215', 'hashed_pw_515', NULL),
('bmyers516', 'Bea Myers', 'bmyers516@example.com', '07123457216', 'hashed_pw_516', NULL),
('ncooper517', 'Noah Cooper', 'ncooper517@example.com', '07123457217', 'hashed_pw_517', NULL),
('kwatson518', 'Kiara Watson', 'kwatson518@example.com', '07123457218', 'hashed_pw_518', NULL),
('ajenkins519', 'Axel Jenkins', 'ajenkins519@example.com', '07123457219', 'hashed_pw_519', NULL),
('smendez520', 'Sasha Mendez', 'smendez520@example.com', '07123457220', 'hashed_pw_520', NULL),
('nfreeman521', 'Neela Freeman', 'nfreeman521@example.com', '07123457221', 'hashed_pw_521', NULL),
('tortega522', 'Tomas Ortega', 'tortega522@example.com', '07123457222', 'hashed_pw_522', NULL),
('ttodd523', 'Tia Todd', 'ttodd523@example.com', '07123457223', 'hashed_pw_523', NULL),
('kscott524', 'Kamran Scott', 'kscott524@example.com', '07123457224', 'hashed_pw_524', NULL),
('sgarcia525', 'Sophie Garcia', 'sgarcia525@example.com', '07123457225', 'hashed_pw_525', NULL),
('cbradley526', 'Cyrus Bradley', 'cbradley526@example.com', '07123457226', 'hashed_pw_526', NULL),
('tjenkins527', 'Talia Jenkins', 'tjenkins527@example.com', '07123457227', 'hashed_pw_527', NULL),
('khart528', 'Kobi Hart', 'khart528@example.com', '07123457228', 'hashed_pw_528', NULL),
('alayne529', 'Avi Layne', 'alayne529@example.com', '07123457229', 'hashed_pw_529', NULL),
('esantiago530', 'Elena Santiago', 'esantiago530@example.com', '07123457230', 'hashed_pw_530', NULL);


INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('jreid531', 'Juno Reid', 'jreid531@example.com', '07123457231', 'hashed_pw_531', NULL),
('owatson532', 'Ollie Watson', 'owatson532@example.com', '07123457232', 'hashed_pw_532', NULL),
('krogers533', 'Kamari Rogers', 'krogers533@example.com', '07123457233', 'hashed_pw_533', NULL),
('elee534', 'Esme Lee', 'elee534@example.com', '07123457234', 'hashed_pw_534', NULL),
('tzimmerman535', 'Troy Zimmerman', 'tzimmerman535@example.com', '07123457235', 'hashed_pw_535', NULL),
('nbarrett536', 'Noah Barrett', 'nbarrett536@example.com', '07123457236', 'hashed_pw_536', NULL),
('cquinn537', 'Cleo Quinn', 'cquinn537@example.com', '07123457237', 'hashed_pw_537', NULL),
('jowens538', 'Joel Owens', 'jowens538@example.com', '07123457238', 'hashed_pw_538', NULL),
('mstone539', 'Maeve Stone', 'mstone539@example.com', '07123457239', 'hashed_pw_539', NULL),
('rvasquez540', 'Reina Vasquez', 'rvasquez540@example.com', '07123457240', 'hashed_pw_540', NULL),
('hphillips541', 'Hassan Phillips', 'hphillips541@example.com', '07123457241', 'hashed_pw_541', NULL),
('zrichards542', 'Zia Richards', 'zrichards542@example.com', '07123457242', 'hashed_pw_542', NULL),
('ddaniels543', 'Devin Daniels', 'ddaniels543@example.com', '07123457243', 'hashed_pw_543', NULL),
('alyons544', 'Alba Lyons', 'alyons544@example.com', '07123457244', 'hashed_pw_544', NULL),
('iryan545', 'Imran Ryan', 'iryan545@example.com', '07123457245', 'hashed_pw_545', NULL),
('dward546', 'Daria Ward', 'dward546@example.com', '07123457246', 'hashed_pw_546', NULL),
('nperkins547', 'Nico Perkins', 'nperkins547@example.com', '07123457247', 'hashed_pw_547', NULL),
('emendez548', 'Emiliana Mendez', 'emendez548@example.com', '07123457248', 'hashed_pw_548', NULL),
('hchowdhury549', 'Hasan Chowdhury', 'hchowdhury549@example.com', '07123457249', 'hashed_pw_549', NULL),
('mcampbell550', 'Mina Campbell', 'mcampbell550@example.com', '07123457250', 'hashed_pw_550', NULL),
('blam551', 'Beau Lam', 'blam551@example.com', '07123457251', 'hashed_pw_551', NULL),
('jortega552', 'Jay Ortega', 'jortega552@example.com', '07123457252', 'hashed_pw_552', NULL),
('mlarsen553', 'Malik Larsen', 'mlarsen553@example.com', '07123457253', 'hashed_pw_553', NULL),
('bgill554', 'Bianca Gill', 'bgill554@example.com', '07123457254', 'hashed_pw_554', NULL),
('tkim555', 'Tessa Kim', 'tkim555@example.com', '07123457255', 'hashed_pw_555', NULL),
('csingh556', 'Cyrus Singh', 'csingh556@example.com', '07123457256', 'hashed_pw_556', NULL),
('lrojas557', 'Lila Rojas', 'lrojas557@example.com', '07123457257', 'hashed_pw_557', NULL),
('rmitchell558', 'Rami Mitchell', 'rmitchell558@example.com', '07123457258', 'hashed_pw_558', NULL),
('ysullivan559', 'Yara Sullivan', 'ysullivan559@example.com', '07123457259', 'hashed_pw_559', NULL),
('cjordan560', 'Cory Jordan', 'cjordan560@example.com', '07123457260', 'hashed_pw_560', NULL),
('saustin561', 'Summer Austin', 'saustin561@example.com', '07123457261', 'hashed_pw_561', NULL),
('jgonzalez562', 'Janet Gonzalez', 'jgonzalez562@example.com', '07123457262', 'hashed_pw_562', NULL),
('arodriguez563', 'Arianne Rodriguez', 'arodriguez563@example.com', '07123457263', 'hashed_pw_563', NULL),
('aturner564', 'Ayla Turner', 'aturner564@example.com', '07123457264', 'hashed_pw_564', NULL),
('pwhite565', 'Parker White', 'pwhite565@example.com', '07123457265', 'hashed_pw_565', NULL),
('khanley566', 'Kade Hanley', 'khanley566@example.com', '07123457266', 'hashed_pw_566', NULL),
('anash567', 'Alina Nash', 'anash567@example.com', '07123457267', 'hashed_pw_567', NULL),
('zbrooks568', 'Zaki Brooks', 'zbrooks568@example.com', '07123457268', 'hashed_pw_568', NULL),
('ehayes569', 'Elise Hayes', 'ehayes569@example.com', '07123457269', 'hashed_pw_569', NULL),
('gmehta570', 'Gavin Mehta', 'gmehta570@example.com', '07123457270', 'hashed_pw_570', NULL),
('lmartinez571', 'Layla Martinez', 'lmartinez571@example.com', '07123457271', 'hashed_pw_571', NULL),
('nsanders572', 'Noor Sanders', 'nsanders572@example.com', '07123457272', 'hashed_pw_572', NULL),
('nward573', 'Nadia Ward', 'nward573@example.com', '07123457273', 'hashed_pw_573', NULL),
('zclarke574', 'Zion Clarke', 'zclarke574@example.com', '07123457274', 'hashed_pw_574', NULL),
('lcollins575', 'Lior Collins', 'lcollins575@example.com', '07123457275', 'hashed_pw_575', NULL),
('hharrison576', 'Helena Harrison', 'hharrison576@example.com', '07123457276', 'hashed_pw_576', NULL),
('bcoleman577', 'Bryn Coleman', 'bcoleman577@example.com', '07123457277', 'hashed_pw_577', NULL),
('rmahmood578', 'Rida Mahmood', 'rmahmood578@example.com', '07123457278', 'hashed_pw_578', NULL),
('jsandhu579', 'Jai Sandhu', 'jsandhu579@example.com', '07123457279', 'hashed_pw_579', NULL),
('afoster580', 'Anaya Foster', 'afoster580@example.com', '07123457280', 'hashed_pw_580', NULL);

INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('jdixon581', 'Jules Dixon', 'jdixon581@example.com', '07123457281', 'hashed_pw_581', NULL),
('vmurphy582', 'Vihaan Murphy', 'vmurphy582@example.com', '07123457282', 'hashed_pw_582', NULL),
('alawrence583', 'Alisha Lawrence', 'alawrence583@example.com', '07123457283', 'hashed_pw_583', NULL),
('cwells584', 'Cian Wells', 'cwells584@example.com', '07123457284', 'hashed_pw_584', NULL),
('mcampbell585', 'Mae Campbell', 'mcampbell585@example.com', '07123457285', 'hashed_pw_585', NULL);

INSERT INTO users (username, full_name, email, phone, password_hash, last_login) VALUES
('twright586', 'Talia Wright', 'twright586@example.com', '07123457286', 'hashed_pw_586', NULL),
('mgarcia587', 'Mateo Garcia', 'mgarcia587@example.com', '07123457287', 'hashed_pw_587', NULL),
('khughes588', 'Kira Hughes', 'khughes588@example.com', '07123457288', 'hashed_pw_588', NULL),
('oblake589', 'Odin Blake', 'oblake589@example.com', '07123457289', 'hashed_pw_589', NULL),
('jpatel590', 'Jaya Patel', 'jpatel590@example.com', '07123457290', 'hashed_pw_590', NULL),
('lcampbell591', 'Luca Campbell', 'lcampbell591@example.com', '07123457291', 'hashed_pw_591', NULL),
('ssharma592', 'Simran Sharma', 'ssharma592@example.com', '07123457292', 'hashed_pw_592', NULL),
('ebenson593', 'Eden Benson', 'ebenson593@example.com', '07123457293', 'hashed_pw_593', NULL),
('nyates594', 'Niko Yates', 'nyates594@example.com', '07123457294', 'hashed_pw_594', NULL),
('kturner595', 'Keira Turner', 'kturner595@example.com', '07123457295', 'hashed_pw_595', NULL);

INSERT INTO users (user_id, username, full_name, email, phone, password_hash, last_login) VALUES
(159, 'jsharp159', 'Jessica Sharp', 'jsharp159@example.com', '07123457159', 'hashed_pw_159', NULL),
(160, 'bparker160', 'Benjamin Parker', 'bparker160@example.com', '07123457160', 'hashed_pw_160', NULL),
(161, 'lfield161', 'Lara Field', 'lfield161@example.com', '07123457161', 'hashed_pw_161', NULL),
(162, 'dwatson162', 'Daniel Watson', 'dwatson162@example.com', '07123457162', 'hashed_pw_162', NULL),
(163, 'mellis163', 'Maya Ellis', 'mellis163@example.com', '07123457163', 'hashed_pw_163', NULL),
(164, 'tbrook164', 'Theo Brooks', 'tbrook164@example.com', '07123457164', 'hashed_pw_164', NULL),
(165, 'nsingh165', 'Nina Singh', 'nsingh165@example.com', '07123457165', 'hashed_pw_165', NULL),
(166, 'cphillips166', 'Caleb Phillips', 'cphillips166@example.com', '07123457166', 'hashed_pw_166', NULL),
(167, 'aroach167', 'Amelia Roach', 'aroach167@example.com', '07123457167', 'hashed_pw_167', NULL),
(168, 'mmurray168', 'Milo Murray', 'mmurray168@example.com', '07123457168', 'hashed_pw_168', NULL);

INSERT INTO users (user_id, username, full_name, email, phone, password_hash, last_login) VALUES
(169, 'ncooper169', 'Nathan Cooper', 'ncooper169@example.com', '07123457169', 'hashed_pw_169', NULL),
(170, 'sbailey170', 'Sophia Bailey', 'sbailey170@example.com', '07123457170', 'hashed_pw_170', NULL),
(171, 'tgriffin171', 'Thomas Griffin', 'tgriffin171@example.com', '07123457171', 'hashed_pw_171', NULL),
(172, 'eharrison172', 'Emily Harrison', 'eharrison172@example.com', '07123457172', 'hashed_pw_172', NULL),
(173, 'cpatel173', 'Cameron Patel', 'cpatel173@example.com', '07123457173', 'hashed_pw_173', NULL),
(174, 'lfoster174', 'Lily Foster', 'lfoster174@example.com', '07123457174', 'hashed_pw_174', NULL),
(175, 'grichards175', 'George Richards', 'grichards175@example.com', '07123457175', 'hashed_pw_175', NULL),
(176, 'kward176', 'Katie Ward', 'kward176@example.com', '07123457176', 'hashed_pw_176', NULL),
(177, 'jmoore177', 'Jacob Moore', 'jmoore177@example.com', '07123457177', 'hashed_pw_177', NULL),
(178, 'eholmes178', 'Eva Holmes', 'eholmes178@example.com', '07123457178', 'hashed_pw_178', NULL),
(179, 'bthomas179', 'Benjamin Thomas', 'bthomas179@example.com', '07123457179', 'hashed_pw_179', NULL),
(180, 'aevans180', 'Alice Evans', 'aevans180@example.com', '07123457180', 'hashed_pw_180', NULL),
(181, 'ojones181', 'Oscar Jones', 'ojones181@example.com', '07123457181', 'hashed_pw_181', NULL),
(182, 'rlee182', 'Ruby Lee', 'rlee182@example.com', '07123457182', 'hashed_pw_182', NULL),
(183, 'dclark183', 'Dylan Clark', 'dclark183@example.com', '07123457183', 'hashed_pw_183', NULL),
(184, 'ismith184', 'Ivy Smith', 'ismith184@example.com', '07123457184', 'hashed_pw_184', NULL),
(185, 'jmartin185', 'Jayden Martin', 'jmartin185@example.com', '07123457185', 'hashed_pw_185', NULL),
(186, 'lparker186', 'Lucy Parker', 'lparker186@example.com', '07123457186', 'hashed_pw_186', NULL),
(187, 'owilliams187', 'Owen Williams', 'owilliams187@example.com', '07123457187', 'hashed_pw_187', NULL),
(188, 'mevans188', 'Mila Evans', 'mevans188@example.com', '07123457188', 'hashed_pw_188', NULL);

INSERT INTO users (user_id, username, full_name, email, phone, password_hash, last_login) VALUES
(189, 'hgraham189', 'Harriet Graham', 'hgraham189@example.com', '07123457189', 'hashed_pw_189', NULL),
(190, 'kbell190', 'Kai Bell', 'kbell190@example.com', '07123457190', 'hashed_pw_190', NULL),
(191, 'hcole191', 'Holly Cole', 'hcole191@example.com', '07123457191', 'hashed_pw_191', NULL),
(192, 'tward192', 'Toby Ward', 'tward192@example.com', '07123457192', 'hashed_pw_192', NULL),
(193, 'rgriffiths193', 'Rose Griffiths', 'rgriffiths193@example.com', '07123457193', 'hashed_pw_193', NULL),
(194, 'zbrooks194', 'Zayn Brooks', 'zbrooks194@example.com', '07123457194', 'hashed_pw_194', NULL),
(195, 'amelton195', 'Amelia Melton', 'amelton195@example.com', '07123457195', 'hashed_pw_195', NULL),
(196, 'lwallace196', 'Leo Wallace', 'lwallace196@example.com', '07123457196', 'hashed_pw_196', NULL),
(197, 'cpearson197', 'Chloe Pearson', 'cpearson197@example.com', '07123457197', 'hashed_pw_197', NULL),
(198, 'hpotter198', 'Harry Potter', 'hpotter198@example.com', '07123457198', 'hashed_pw_198', NULL),
(199, 'rgreen199', 'Rachel Green', 'rgreen199@example.com', '07123457199', 'hashed_pw_199', NULL),
(200, 'mross200', 'Mason Ross', 'mross200@example.com', '07123457200', 'hashed_pw_200', NULL),
(201, 'lryan201', 'Lily Ryan', 'lryan201@example.com', '07123457201', 'hashed_pw_201', NULL),
(202, 'cfleming202', 'Caleb Fleming', 'cfleming202@example.com', '07123457202', 'hashed_pw_202', NULL),
(203, 'owatson203', 'Olivia Watson', 'owatson203@example.com', '07123457203', 'hashed_pw_203', NULL),
(204, 'rbutler204', 'Reuben Butler', 'rbutler204@example.com', '07123457204', 'hashed_pw_204', NULL),
(205, 'hthomas205', 'Hallie Thomas', 'hthomas205@example.com', '07123457205', 'hashed_pw_205', NULL),
(206, 'dchapman206', 'Dexter Chapman', 'dchapman206@example.com', '07123457206', 'hashed_pw_206', NULL),
(207, 'eabbott207', 'Erin Abbott', 'eabbott207@example.com', '07123457207', 'hashed_pw_207', NULL),
(208, 'jsavage208', 'Jenson Savage', 'jsavage208@example.com', '07123457208', 'hashed_pw_208', NULL);

INSERT INTO users (user_id, username, full_name, email, phone, password_hash, last_login) VALUES
(209, 'llewis209', 'Lena Lewis', 'llewis209@example.com', '07123457209', 'hashed_pw_209', NULL),
(210, 'abrady210', 'Archie Brady', 'abrady210@example.com', '07123457210', 'hashed_pw_210', NULL),
(211, 'cward211', 'Clara Ward', 'cward211@example.com', '07123457211', 'hashed_pw_211', NULL),
(212, 'jblake212', 'Jude Blake', 'jblake212@example.com', '07123457212', 'hashed_pw_212', NULL),
(213, 'fchapman213', 'Freya Chapman', 'fchapman213@example.com', '07123457213', 'hashed_pw_213', NULL),
(214, 'ameadows214', 'Aidan Meadows', 'ameadows214@example.com', '07123457214', 'hashed_pw_214', NULL),
(215, 'eroberts215', 'Eliza Roberts', 'eroberts215@example.com', '07123457215', 'hashed_pw_215', NULL),
(216, 'jclarke216', 'Jack Clarke', 'jclarke216@example.com', '07123457216', 'hashed_pw_216', NULL),
(217, 'imacdonald217', 'Isabelle Macdonald', 'imacdonald217@example.com', '07123457217', 'hashed_pw_217', NULL),
(218, 'wprice218', 'William Price', 'wprice218@example.com', '07123457218', 'hashed_pw_218', NULL),
(219, 'zrichards219', 'Zara Richards', 'zrichards219@example.com', '07123457219', 'hashed_pw_219', NULL),
(220, 'bperry220', 'Blake Perry', 'bperry220@example.com', '07123457220', 'hashed_pw_220', NULL),
(221, 'nbyrne221', 'Noah Byrne', 'nbyrne221@example.com', '07123457221', 'hashed_pw_221', NULL),
(222, 'hmcgrath222', 'Heidi McGrath', 'hmcgrath222@example.com', '07123457222', 'hashed_pw_222', NULL),
(223, 'sthorne223', 'Samuel Thorne', 'sthorne223@example.com', '07123457223', 'hashed_pw_223', NULL),
(224, 'rhamilton224', 'Rosie Hamilton', 'rhamilton224@example.com', '07123457224', 'hashed_pw_224', NULL),
(225, 'nobrien225', 'Nathan O’Brien', 'nobrien225@example.com', '07123457225', 'hashed_pw_225', NULL),
(226, 'kcook226', 'Kiera Cook', 'kcook226@example.com', '07123457226', 'hashed_pw_226', NULL),
(227, 'tneal227', 'Tyler Neal', 'tneal227@example.com', '07123457227', 'hashed_pw_227', NULL),
(228, 'gwatts228', 'Grace Watts', 'gwatts228@example.com', '07123457228', 'hashed_pw_228', NULL);

INSERT INTO users (user_id, username, full_name, email, phone, password_hash, last_login) VALUES
(229, 'jbarrett229', 'Jasmine Barrett', 'jbarrett229@example.com', '07123457229', 'hashed_pw_229', NULL),
(230, 'mknight230', 'Marcus Knight', 'mknight230@example.com', '07123457230', 'hashed_pw_230', NULL),
(231, 'cwest231', 'Charlotte West', 'cwest231@example.com', '07123457231', 'hashed_pw_231', NULL),
(232, 'jkelly232', 'Joel Kelly', 'jkelly232@example.com', '07123457232', 'hashed_pw_232', NULL),
(233, 'alynch233', 'Arabella Lynch', 'alynch233@example.com', '07123457233', 'hashed_pw_233', NULL),
(234, 'dshaw234', 'Dexter Shaw', 'dshaw234@example.com', '07123457234', 'hashed_pw_234', NULL),
(235, 'sdaniels235', 'Scarlett Daniels', 'sdaniels235@example.com', '07123457235', 'hashed_pw_235', NULL),
(236, 'jperry236', 'Joshua Perry', 'jperry236@example.com', '07123457236', 'hashed_pw_236', NULL),
(237, 'cscott237', 'Clara Scott', 'cscott237@example.com', '07123457237', 'hashed_pw_237', NULL),
(238, 'olawson238', 'Ollie Lawson', 'olawson238@example.com', '07123457238', 'hashed_pw_238', NULL),
(239, 'hgoodwin239', 'Hannah Goodwin', 'hgoodwin239@example.com', '07123457239', 'hashed_pw_239', NULL),
(240, 'jward240', 'Jude Ward', 'jward240@example.com', '07123457240', 'hashed_pw_240', NULL),
(241, 'rbanks241', 'Reggie Banks', 'rbanks241@example.com', '07123457241', 'hashed_pw_241', NULL),
(242, 'nmills242', 'Niamh Mills', 'nmills242@example.com', '07123457242', 'hashed_pw_242', NULL),
(243, 'lwalsh243', 'Logan Walsh', 'lwalsh243@example.com', '07123457243', 'hashed_pw_243', NULL),
(244, 'slopez244', 'Sofia Lopez', 'slopez244@example.com', '07123457244', 'hashed_pw_244', NULL),
(245, 'tkelly245', 'Theo Kelly', 'tkelly245@example.com', '07123457245', 'hashed_pw_245', NULL),
(246, 'egreen246', 'Ellie Green', 'egreen246@example.com', '07123457246', 'hashed_pw_246', NULL),
(247, 'hsutton247', 'Harrison Sutton', 'hsutton247@example.com', '07123457247', 'hashed_pw_247', NULL),
(248, 'zjones248', 'Zoe Jones', 'zjones248@example.com', '07123457248', 'hashed_pw_248', NULL),
(249, 'ccampbell249', 'Cody Campbell', 'ccampbell249@example.com', '07123457249', 'hashed_pw_249', NULL),
(250, 'eslater250', 'Esme Slater', 'eslater250@example.com', '07123457250', 'hashed_pw_250', NULL);
INSERT INTO users (user_id, username, full_name, email, phone, password_hash, last_login) VALUES
(297, 'alowe297', 'Ava Lowe', 'alowe297@example.com', '07123457297', 'hashed_pw_297', NULL),
(298, 'nhart298', 'Noah Hart', 'nhart298@example.com', '07123457298', 'hashed_pw_298', NULL),
(299, 'emorton299', 'Ella Morton', 'emorton299@example.com', '07123457299', 'hashed_pw_299', NULL),
(300, 'jwelch300', 'Jayden Welch', 'jwelch300@example.com', '07123457300', 'hashed_pw_300', NULL),
(301, 'sbailey301', 'Seth Bailey', 'sbailey301@example.com', '07123457301', 'hashed_pw_301', NULL),
(302, 'lgriffin302', 'Luna Griffin', 'lgriffin302@example.com', '07123457302', 'hashed_pw_302', NULL),
(303, 'jtucker303', 'Jaxon Tucker', 'jtucker303@example.com', '07123457303', 'hashed_pw_303', NULL),
(304, 'kstevens304', 'Katie Stevens', 'kstevens304@example.com', '07123457304', 'hashed_pw_304', NULL),
(305, 'osharp305', 'Owen Sharp', 'osharp305@example.com', '07123457305', 'hashed_pw_305', NULL),
(306, 'pknight306', 'Phoebe Knight', 'pknight306@example.com', '07123457306', 'hashed_pw_306', NULL),
(307, 'mjohnson307', 'Mason Johnson', 'mjohnson307@example.com', '07123457307', 'hashed_pw_307', NULL),
(308, 'ismith308', 'Isla Smith', 'ismith308@example.com', '07123457308', 'hashed_pw_308', NULL),
(309, 'hclarke309', 'Harvey Clarke', 'hclarke309@example.com', '07123457309', 'hashed_pw_309', NULL),
(310, 'rmitchell310', 'Rosie Mitchell', 'rmitchell310@example.com', '07123457310', 'hashed_pw_310', NULL),
(311, 'jboyd311', 'James Boyd', 'jboyd311@example.com', '07123457311', 'hashed_pw_311', NULL),
(312, 'eblack312', 'Erin Black', 'eblack312@example.com', '07123457312', 'hashed_pw_312', NULL),
(313, 'rhayes313', 'Reece Hayes', 'rhayes313@example.com', '07123457313', 'hashed_pw_313', NULL),
(314, 'nwalker314', 'Niamh Walker', 'nwalker314@example.com', '07123457314', 'hashed_pw_314', NULL),
(315, 'tboyle315', 'Theo Boyle', 'tboyle315@example.com', '07123457315', 'hashed_pw_315', NULL),
(316, 'cpaterson316', 'Chloe Paterson', 'cpaterson316@example.com', '07123457316', 'hashed_pw_316', NULL),
(317, 'jkeane317', 'Jude Keane', 'jkeane317@example.com', '07123457317', 'hashed_pw_317', NULL),
(318, 'lspencer318', 'Lilly Spencer', 'lspencer318@example.com', '07123457318', 'hashed_pw_318', NULL),
(319, 'dgrant319', 'Dylan Grant', 'dgrant319@example.com', '07123457319', 'hashed_pw_319', NULL),
(320, 'tallen320', 'Tilly Allen', 'tallen320@example.com', '07123457320', 'hashed_pw_320', NULL),
(321, 'rholland321', 'Riley Holland', 'rholland321@example.com', '07123457321', 'hashed_pw_321', NULL),
(322, 'ecampbell322', 'Elliot Campbell', 'ecampbell322@example.com', '07123457322', 'hashed_pw_322', NULL),
(323, 'lknight323', 'Lacey Knight', 'lknight323@example.com', '07123457323', 'hashed_pw_323', NULL),
(324, 'ahamilton324', 'Austin Hamilton', 'ahamilton324@example.com', '07123457324', 'hashed_pw_324', NULL),
(325, 'mmacdonald325', 'Maisie Macdonald', 'mmacdonald325@example.com', '07123457325', 'hashed_pw_325', NULL),
(326, 'esimpson326', 'Ethan Simpson', 'esimpson326@example.com', '07123457326', 'hashed_pw_326', NULL);


  
### More into vehicles:
INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(27, 'VXZ123', 'Car', 'Toyota', 'Corolla', 2015),
(28, 'JKT456', 'Truck', 'Ford', 'F-250', 2021),
(29, 'MNO789', 'Motorcycle', 'Honda', 'CBR600RR', 2019),
(30, 'PLQ321', 'Bus', 'Mercedes-Benz', 'Citaro', 2013),
(31, 'RSD654', 'Car', 'Hyundai', 'Sonata', 2020),
(32, 'WEC987', 'Truck', 'Chevrolet', 'Colorado', 2018),
(33, 'TYH432', 'Motorcycle', 'Yamaha', 'R3', 2017),
(34, 'IKL765', 'Bus', 'Volvo', 'B9TL', 2010),
(35, 'UJN109', 'Car', 'Kia', 'Optima', 2016),
(36, 'BGT234', 'Truck', 'Isuzu', 'N-Series', 2015),
(37, 'LPO567', 'Motorcycle', 'Ducati', 'Monster 821', 2022),
(38, 'MJK890', 'Bus', 'Iveco', 'Crossway', 2014),
(39, 'NHG321', 'Car', 'Mazda', 'Mazda6', 2018),
(40, 'AED210', 'Truck', 'Mitsubishi', 'L200', 2019);
  
INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(41, 'QWE123', 'Car', 'Volkswagen', 'Golf', 2017),
(42, 'RTY456', 'Truck', 'MAN', 'TGS', 2020),
(43, 'UIO789', 'Motorcycle', 'Suzuki', 'GSX-R750', 2016),
(44, 'PAS321', 'Bus', 'Scania', 'Citywide', 2015),
(45, 'DFG654', 'Car', 'Nissan', 'Altima', 2019),
(46, 'HJK987', 'Truck', 'DAF', 'LF', 2012),
(47, 'ZXC432', 'Motorcycle', 'KTM', 'Duke 390', 2021),
(48, 'VBN765', 'Bus', 'Alexander Dennis', 'Enviro200', 2014),
(49, 'MNB109', 'Car', 'Renault', 'Megane', 2018),
(50, 'QAZ234', 'Truck', 'Tata', 'Prima', 2016),
(51, 'WSX567', 'Motorcycle', 'Aprilia', 'RS 660', 2023),
(52, 'EDC890', 'Bus', 'Ashok Leyland', 'Viking', 2011),
(53, 'RFV321', 'Car', 'Skoda', 'Octavia', 2020),
(54, 'TGB210', 'Truck', 'Hino', '500 Series', 2019),
(55, 'YHN432', 'Motorcycle', 'Royal Enfield', 'Meteor 350', 2022),
(56, 'UJM765', 'Bus', 'BYD', 'K9', 2023),
(57, 'IKM109', 'Car', 'Peugeot', '308', 2015),
(58, 'OLP234', 'Truck', 'Freightliner', 'M2', 2018),
(59, 'AWZ567', 'Motorcycle', 'Benelli', 'TNT 600i', 2020),
(60, 'SXD890', 'Bus', 'Optare', 'Solo SR', 2012);

INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(61, 'LUX001', 'Car', 'BMW', '3 Series', 2019),
(62, 'TRK002', 'Truck', 'Volvo', 'FH16', 2020),
(63, 'MOT003', 'Motorcycle', 'Triumph', 'Street Triple', 2018),
(64, 'BUS004', 'Bus', 'King Long', 'XMQ6129Y', 2016),
(65, 'CAR005', 'Car', 'Audi', 'A4', 2022),
(66, 'TRK006', 'Truck', 'Iveco', 'Stralis', 2017),
(67, 'MOT007', 'Motorcycle', 'Kawasaki', 'Ninja 650', 2019),
(68, 'BUS008', 'Bus', 'Neoplan', 'Skyliner', 2013),
(69, 'CAR009', 'Car', 'Fiat', 'Tipo', 2015),
(70, 'TRK010', 'Truck', 'Ram', '1500', 2021),
(71, 'MOT011', 'Motorcycle', 'Harley-Davidson', 'Iron 883', 2020),
(72, 'BUS012', 'Bus', 'Setra', 'S 416 GT-HD', 2012),
(73, 'CAR013', 'Car', 'Citroën', 'C4', 2016),
(74, 'TRK014', 'Truck', 'Scania', 'R500', 2018),
(75, 'MOT015', 'Motorcycle', 'Moto Guzzi', 'V7', 2021),
(76, 'BUS016', 'Bus', 'Solaris', 'Urbino 12', 2014),
(77, 'CAR017', 'Car', 'Seat', 'Leon', 2017),
(78, 'TRK018', 'Truck', 'Fuso', 'Canter', 2019),
(79, 'MOT019', 'Motorcycle', 'Husqvarna', 'Vitpilen 401', 2022),
(80, 'BUS020', 'Bus', 'Yutong', 'ZK6120H', 2015),
(81, 'CAR021', 'Car', 'Genesis', 'G70', 2020),
(82, 'TRK022', 'Truck', 'Kenworth', 'T680', 2016),
(83, 'MOT023', 'Motorcycle', 'MV Agusta', 'Brutale 800', 2023),
(84, 'BUS024', 'Bus', 'Mercedes-Benz', 'Sprinter City 45', 2022),
(85, 'CAR025', 'Car', 'Lexus', 'IS 300', 2018),
(86, 'TRK026', 'Truck', 'Peterbilt', '579', 2017),
(87, 'MOT027', 'Motorcycle', 'Indian', 'Scout', 2021),
(88, 'BUS028', 'Bus', 'Temsa', 'MD9', 2011),
(89, 'CAR029', 'Car', 'Alfa Romeo', 'Giulia', 2021),
(90, 'TRK030', 'Truck', 'Western Star', '4700', 2015),
(91, 'MOT031', 'Motorcycle', 'Zero', 'SR/F', 2023),
(92, 'BUS032', 'Bus', 'Blue Bird', 'All American', 2016),
(93, 'CAR033', 'Car', 'Subaru', 'Impreza', 2019),
(94, 'TRK034', 'Truck', 'Renault', 'T High', 2021),
(95, 'MOT035', 'Motorcycle', 'CFMoto', '300NK', 2020),
(96, 'BUS036', 'Bus', 'Gillig', 'Low Floor', 2017),
(97, 'CAR037', 'Car', 'Infiniti', 'Q50', 2017),
(98, 'TRK038', 'Truck', 'Mack', 'Anthem', 2020),
(99, 'MOT039', 'Motorcycle', 'GasGas', 'SM 700', 2022),
(100, 'BUS040', 'Bus', 'Plaxton', 'Panther', 2018);
  
INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(101, 'HVY001', 'Other', 'Caterpillar', '797F Dump Truck', 2020),
(102, 'HVY002', 'Other', 'Komatsu', 'HD785-8', 2019),
(103, 'HVY003', 'Other', 'Liebherr', 'T 264', 2021),
(104, 'HVY004', 'Other', 'Volvo CE', 'A60H Articulated Hauler', 2018),
(105, 'HVY005', 'Other', 'Terex', 'TR100', 2017),
(106, 'HVY006', 'Other', 'Hitachi', 'EH5000AC-3', 2022),
(107, 'HVY007', 'Other', 'BelAZ', '75710', 2015),
(108, 'HVY008', 'Other', 'Doosan', 'DA45', 2020),
(109, 'HVY009', 'Other', 'John Deere', '460E II', 2019),
(110, 'HVY010', 'Other', 'BEML', 'BH100', 2016),
(111, 'HVY011', 'Other', 'Scania', 'Heavy Tipper XT', 2023),
(112, 'HVY012', 'Other', 'Mercedes-Benz', 'Arocs 5051K', 2018),
(113, 'HVY013', 'Other', 'MAN', 'TGS 50.500', 2021),
(114, 'HVY014', 'Other', 'Tatra', 'Phoenix Euro 6', 2022),
(115, 'HVY015', 'Other', 'Kamaz', '6520', 2014),
(116, 'HVY016', 'Other', 'Renault Trucks', 'K XTREM', 2017),
(117, 'HVY017', 'Other', 'DAF', 'CF FAT Construction', 2020),
(118, 'HVY018', 'Other', 'IVECO', 'Trakker 450', 2016),
(119, 'HVY019', 'Other', 'Mack Trucks', 'Granite', 2019),
(120, 'HVY020', 'Other', 'Western Star', '49X', 2021),
(121, 'HVY021', 'Other', 'Freightliner', '114SD', 2015),
(122, 'HVY022', 'Other', 'Kenworth', 'W990', 2023),
(123, 'HVY023', 'Other', 'Peterbilt', '567', 2018),
(124, 'HVY024', 'Other', 'Ford', 'F-750 SD', 2022),
(125, 'HVY025', 'Other', 'Navistar', 'HX Series', 2020),
(126, 'HVY026', 'Other', 'Volvo', 'FMX', 2017),
(127, 'HVY027', 'Other', 'Mahindra', 'Blazo X 49', 2019),
(128, 'HVY028', 'Other', 'Ashok Leyland', 'Captain 5532', 2021),
(129, 'HVY029', 'Other', 'Tata Motors', 'Prima LX 5530', 2018),
(130, 'HVY030', 'Other', 'UD Trucks', 'Quester CWE', 2020),
(131, 'HVY031', 'Other', 'Hino', 'Profia', 2022),
(132, 'HVY032', 'Other', 'Kraz', '65053', 2016),
(133, 'HVY033', 'Other', 'AMW', '4923 TR', 2019),
(134, 'HVY034', 'Other', 'FAW', 'JH6', 2023),
(135, 'HVY035', 'Other', 'Shacman', 'F3000', 2021),
(136, 'HVY036', 'Other', 'Sinotruk', 'HOWO A7', 2015),
(137, 'HVY037', 'Other', 'Dongfeng', 'KC', 2020),
(138, 'HVY038', 'Other', 'Yutong', 'ZK6129HQ', 2018),
(139, 'HVY039', 'Other', 'Foton Daimler', 'GTX 6x4', 2017),
(140, 'HVY040', 'Other', 'Kamaz', 'Neo 5490', 2021);

INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(141, 'XZC301', 'Car', 'Subaru', 'Legacy', 2020),
(142, 'VBN302', 'Truck', 'Freightliner', 'M2 106', 2021),
(143, 'MLK303', 'Motorcycle', 'Benelli', 'Leoncino 500', 2019),
(144, 'DFR304', 'Bus', 'Neoplan', 'Jetliner', 2018),
(145, 'QWE305', 'Other', 'Caterpillar', '990K', 2022),
(146, 'PLM306', 'Car', 'Genesis', 'G90', 2021),
(147, 'HYT307', 'Truck', 'Western Star', '4700 SB', 2019),
(148, 'JKL308', 'Motorcycle', 'CFMoto', '650NK', 2020),
(149, 'TRE309', 'Bus', 'King Long', 'XMQ6127Y', 2017),
(150, 'OIU310', 'Other', 'Liebherr', 'T 282 C', 2023),
(151, 'YUI311', 'Car', 'Skoda', 'Fabia', 2018),
(152, 'ASD312', 'Truck', 'DAF', 'XF 530', 2020),
(153, 'HJK313', 'Motorcycle', 'Indian', 'Challenger', 2022),
(154, 'MNB314', 'Bus', 'BYD', 'K8S', 2023),
(155, 'UYT315', 'Other', 'Komatsu', 'HD605-8', 2020),
(156, 'IKJ316', 'Car', 'Peugeot', '508', 2019),
(157, 'OLP317', 'Truck', 'Kamaz', '65201', 2017),
(158, 'BNM318', 'Motorcycle', 'Zero Motorcycles', 'DSR/X', 2023),
(159, 'VCX319', 'Bus', 'Yutong', 'ICE12', 2021),
(160, 'QAZ320', 'Other', 'Volvo CE', 'R100E', 2021),
(161, 'EDC321', 'Car', 'Chery', 'Arrizo 6', 2020),
(162, 'RFV322', 'Truck', 'Ashok Leyland', 'Captain 4032', 2022),
(163, 'TGB323', 'Motorcycle', 'Bajaj', 'Dominar 400', 2018),
(164, 'YHN324', 'Bus', 'Temsa', 'Maraton', 2019),
(165, 'UJM325', 'Other', 'Hitachi', 'EH1100-5', 2020),
(166, 'IKM326', 'Car', 'Renault', 'Talisman', 2017),
(167, 'OLK327', 'Truck', 'Tata Motors', 'Ultra T.14', 2021),
(168, 'WSX328', 'Motorcycle', 'GasGas', 'ES 700', 2023),
(169, 'EDV329', 'Bus', 'Setra', 'S 417 TC', 2020),
(170, 'FRB330', 'Other', 'John Deere', '460E-II', 2022),
(171, 'GTN331', 'Car', 'Fiat', '500X', 2022),
(172, 'HYM332', 'Truck', 'IVECO', 'S-Way', 2021),
(173, 'KLO333', 'Motorcycle', 'KTM', 'RC 390', 2021),
(174, 'ZXT334', 'Bus', 'Solaris', 'Trollino 18', 2020),
(175, 'LPK335', 'Other', 'Doosan', 'DA45-5', 2019),
(176, 'XCY336', 'Car', 'Alfa Romeo', 'Tonale', 2023),
(177, 'RTV337', 'Truck', 'Scania', 'P 360 XT', 2020),
(178, 'BGN338', 'Motorcycle', 'Husqvarna', 'Svartpilen 701', 2020),
(179, 'NHY339', 'Bus', 'Irisbus', 'Citelis', 2016),
(180, 'MJU340', 'Other', 'BelAZ', '7530C', 2017);


INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(181, 'CAR341', 'Car', 'Toyota', 'Avalon', 2021),
(182, 'TRK342', 'Truck', 'Ford', 'F-750', 2022),
(183, 'MOT343', 'Motorcycle', 'Harley-Davidson', 'Street Bob 114', 2023),
(184, 'BUS344', 'Bus', 'Mercedes-Benz', 'Sprinter Transfer 45', 2020),
(185, 'OTH345', 'Other', 'Komatsu', 'D375A-8 Dozer', 2019),
(186, 'CAR346', 'Car', 'Mazda', 'MX-30', 2022),
(187, 'TRK347', 'Truck', 'IVECO', 'Eurocargo', 2021),
(188, 'MOT348', 'Motorcycle', 'Honda', 'CB500X', 2023),
(189, 'BUS349', 'Bus', 'VDL', 'Citea SLF', 2018),
(190, 'OTH350', 'Other', 'Bell Equipment', 'B50E', 2022),
(191, 'CAR351', 'Car', 'Volvo', 'S90', 2020),
(192, 'TRK352', 'Truck', 'Volvo', 'FH Electric', 2023),
(193, 'MOT353', 'Motorcycle', 'Suzuki', 'V-Strom 1050XT', 2021),
(194, 'BUS354', 'Bus', 'MAN', 'Lion’s City 18G', 2020),
(195, 'OTH355', 'Other', 'Caterpillar', '6015B Excavator', 2018),
(196, 'CAR356', 'Car', 'Audi', 'Q5 Sportback', 2021),
(197, 'TRK357', 'Truck', 'Mercedes-Benz', 'Econic NGT', 2022),
(198, 'MOT358', 'Motorcycle', 'Royal Enfield', 'Classic 350', 2022),
(199, 'BUS359', 'Bus', 'Otokar', 'Kent C CNG', 2023),
(200, 'OTH360', 'Other', 'Liebherr', 'LR 1800-1.0', 2021),
(201, 'CAR361', 'Car', 'Nissan', 'Maxima', 2019),
(202, 'TRK362', 'Truck', 'Mack', 'LR Electric', 2021),
(203, 'MOT363', 'Motorcycle', 'Ducati', 'DesertX', 2023),
(204, 'BUS364', 'Bus', 'Scania', 'Interlink HD', 2022),
(205, 'OTH365', 'Other', 'Hitachi', 'ZX350LC-6', 2020),
(206, 'CAR366', 'Car', 'Citroën', 'C5 X', 2023),
(207, 'TRK367', 'Truck', 'Peterbilt', '579 EV', 2023),
(208, 'MOT368', 'Motorcycle', 'Triumph', 'Speed Twin 1200', 2022),
(209, 'BUS369', 'Bus', 'Iveco', 'Crossway LE', 2020),
(210, 'OTH370', 'Other', 'Volvo CE', 'EC950E', 2022),
(211, 'CAR371', 'Car', 'Hyundai', 'Ioniq 6', 2023),
(212, 'TRK372', 'Truck', 'DAF', 'XF Electric', 2023),
(213, 'MOT373', 'Motorcycle', 'Yamaha', 'Tracer 9 GT', 2022),
(214, 'BUS374', 'Bus', 'Alexander Dennis', 'Enviro100EV', 2023),
(215, 'OTH375', 'Other', 'Doosan', 'DX530LC-7', 2021),
(216, 'CAR376', 'Car', 'Renault', 'Arkana', 2022),
(217, 'TRK377', 'Truck', 'Kamaz', '54901', 2021),
(218, 'MOT378', 'Motorcycle', 'Aprilia', 'RS 457', 2024),
(219, 'BUS379', 'Bus', 'Solaris', 'Urbino 15 LE Electric', 2023),
(220, 'OTH380', 'Other', 'John Deere', '850L Dozer', 2022);

INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(221, 'CAR381', 'Car', 'Kia', 'EV6', 2023),
(222, 'TRK382', 'Truck', 'Freightliner', 'Cascadia Electric', 2022),
(223, 'MOT383', 'Motorcycle', 'Kawasaki', 'Ninja ZX-6R', 2022),
(224, 'BUS384', 'Bus', 'VDL', 'Futura FHD2', 2021),
(225, 'OTH385', 'Other', 'Caterpillar', 'M320', 2020),
(226, 'CAR386', 'Car', 'Chevrolet', 'Bolt EUV', 2022),
(227, 'TRK387', 'Truck', 'Navistar', 'eMV Series', 2023),
(228, 'MOT388', 'Motorcycle', 'BMW', 'CE 04', 2023),
(229, 'BUS389', 'Bus', 'MAN', 'Lion’s City E', 2023),
(230, 'OTH390', 'Other', 'Volvo CE', 'EC230 Electric', 2022),
(231, 'CAR391', 'Car', 'MG', '4 EV', 2023),
(232, 'TRK392', 'Truck', 'Renault Trucks', 'E-Tech D Wide', 2023),
(233, 'MOT393', 'Motorcycle', 'Yamaha', 'XSR900', 2022),
(234, 'BUS394', 'Bus', 'Yutong', 'ICE12 Recharge', 2022),
(235, 'OTH395', 'Other', 'Hitachi', 'ZW310-6 Wheel Loader', 2021),
(236, 'CAR396', 'Car', 'Fiat', 'Panda', 2021),
(237, 'TRK397', 'Truck', 'Scania', 'S 500 A6x2', 2022),
(238, 'MOT398', 'Motorcycle', 'Ducati', 'Scrambler Icon', 2023),
(239, 'BUS399', 'Bus', 'Solaris', 'InterUrbino 12', 2021),
(240, 'OTH400', 'Other', 'Komatsu', 'PC1250-11', 2020),
(241, 'CAR401', 'Car', 'Lexus', 'NX 350h', 2022),
(242, 'TRK402', 'Truck', 'Mercedes-Benz', 'Zetros', 2023),
(243, 'MOT403', 'Motorcycle', 'Triumph', 'Tiger 900 GT Pro', 2022),
(244, 'BUS404', 'Bus', 'Blue Bird', 'Vision Electric', 2022),
(245, 'OTH405', 'Other', 'John Deere', '872G Motor Grader', 2021),
(246, 'CAR406', 'Car', 'Opel', 'Mokka-e', 2023),
(247, 'TRK407', 'Truck', 'Mack', 'Anthem Day Cab', 2021),
(248, 'MOT408', 'Motorcycle', 'Harley-Davidson', 'Nightster', 2023),
(249, 'BUS409', 'Bus', 'BYD', 'K9FE', 2023),
(250, 'OTH410', 'Other', 'Doosan', 'DL550-7', 2022),
(251, 'CAR411', 'Car', 'Volkswagen', 'ID.7', 2024),
(252, 'TRK412', 'Truck', 'Kenworth', 'T880S', 2022),
(253, 'MOT413', 'Motorcycle', 'KTM', '790 Duke', 2023),
(254, 'BUS414', 'Bus', 'Setra', 'S 531 DT', 2022),
(255, 'OTH415', 'Other', 'Bell Equipment', 'B30E', 2021),
(256, 'CAR416', 'Car', 'Mini', 'Cooper SE', 2023),
(257, 'TRK417', 'Truck', 'DAF', 'XG+', 2022),
(258, 'MOT418', 'Motorcycle', 'Suzuki', 'GSX-8S', 2023),
(259, 'BUS419', 'Bus', 'Plaxton', 'Panorama', 2021),
(260, 'OTH420', 'Other', 'Liebherr', 'LH 50 M', 2022);

INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(261, 'CAR421', 'Car', 'Peugeot', 'e-208', 2023),
(262, 'TRK422', 'Truck', 'Peterbilt', '589', 2023),
(263, 'MOT423', 'Motorcycle', 'Honda', 'CBR500R', 2023),
(264, 'BUS424', 'Bus', 'Isuzu', 'Erga Duo', 2022),
(265, 'OTH425', 'Other', 'Hitachi', 'ZX690LCH-7', 2023),
(266, 'CAR426', 'Car', 'Subaru', 'Crosstrek Hybrid', 2022),
(267, 'TRK427', 'Truck', 'Volvo', 'FE Electric', 2022),
(268, 'MOT428', 'Motorcycle', 'CFMoto', 'Papio XO-1', 2024),
(269, 'BUS429', 'Bus', 'Neoplan', 'Tourliner', 2022),
(270, 'OTH430', 'Other', 'Caterpillar', 'M315F', 2021),
(271, 'CAR431', 'Car', 'Nissan', 'Juke Hybrid', 2022),
(272, 'TRK432', 'Truck', 'MAN', 'TGE 3.180', 2023),
(273, 'MOT433', 'Motorcycle', 'Harley-Davidson', 'LiveWire S2 Del Mar', 2024),
(274, 'BUS434', 'Bus', 'Alexander Dennis', 'Enviro100EV', 2024),
(275, 'OTH435', 'Other', 'Volvo CE', 'L260H', 2023),
(276, 'CAR436', 'Car', 'Mazda', 'CX-60 PHEV', 2023),
(277, 'TRK437', 'Truck', 'Scania', 'L 320 Hybrid', 2023),
(278, 'MOT438', 'Motorcycle', 'Yamaha', 'MT-09 SP', 2023),
(279, 'BUS439', 'Bus', 'VDL', 'Citea LF-122', 2023),
(280, 'OTH440', 'Other', 'Doosan', 'DX1000LC-7', 2024),
(281, 'CAR441', 'Car', 'Skoda', 'Enyaq Coupe iV', 2023),
(282, 'TRK442', 'Truck', 'IVECO', 'T-Way', 2022),
(283, 'MOT443', 'Motorcycle', 'Suzuki', 'GSX-S950', 2023),
(284, 'BUS444', 'Bus', 'Setra', 'S 416 UL Business', 2022),
(285, 'OTH445', 'Other', 'John Deere', '410 P-Tier', 2023),
(286, 'CAR446', 'Car', 'BMW', 'iX1 xDrive30', 2024),
(287, 'TRK447', 'Truck', 'Mercedes-Benz', 'eActros 600', 2024),
(288, 'MOT448', 'Motorcycle', 'Aprilia', 'Tuareg 660', 2023),
(289, 'BUS449', 'Bus', 'Plaxton', 'Leopard', 2023),
(290, 'OTH450', 'Other', 'Bell Equipment', 'B45E', 2023),
(291, 'CAR451', 'Car', 'Toyota', 'bZ4X', 2023),
(292, 'TRK452', 'Truck', 'DAF', 'CF Electric', 2023),
(293, 'MOT453', 'Motorcycle', 'KTM', '1290 Super Duke R', 2023),
(294, 'BUS454', 'Bus', 'Yutong', 'T13', 2023),
(295, 'OTH455', 'Other', 'Komatsu', 'WA800-8E0', 2022),
(296, 'CAR456', 'Car', 'Renault', 'Scénic E-Tech', 2024),
(297, 'TRK457', 'Truck', 'Ashok Leyland', 'Ecomet STAR 1815', 2023),
(298, 'MOT458', 'Motorcycle', 'Royal Enfield', 'Shotgun 650', 2024),
(299, 'BUS459', 'Bus', 'Solaris', 'Trollino 24', 2023),
(300, 'OTH460', 'Other', 'Liebherr', 'LTM 1300-6.3', 2023);

INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(301, 'CAR461', 'Car', 'Audi', 'Q4 e-tron', 2023),
(302, 'TRK462', 'Truck', 'Volvo', 'VNR Electric', 2023),
(303, 'MOT463', 'Motorcycle', 'BMW', 'R 1300 GS', 2024),
(304, 'BUS464', 'Bus', 'MAN', 'Lion’s Intercity LE', 2023),
(305, 'OTH465', 'Other', 'Hitachi', 'ZX890LCH-7', 2023),
(306, 'CAR466', 'Car', 'Hyundai', 'Ioniq 5 N', 2024),
(307, 'TRK467', 'Truck', 'Western Star', '47X', 2022),
(308, 'MOT468', 'Motorcycle', 'Ducati', 'Multistrada V4 S', 2023),
(309, 'BUS469', 'Bus', 'Mercedes-Benz', 'eCitaro G', 2024),
(310, 'OTH470', 'Other', 'Liebherr', 'PR 776', 2023),
(311, 'CAR471', 'Car', 'Peugeot', 'e-308 SW', 2024),
(312, 'TRK472', 'Truck', 'Kenworth', 'T680 Next Gen', 2023),
(313, 'MOT473', 'Motorcycle', 'Triumph', 'Scrambler 1200 X', 2023),
(314, 'BUS474', 'Bus', 'Solaris', 'Trollino 24', 2023),
(315, 'OTH475', 'Other', 'Volvo CE', 'EC380E', 2022),
(316, 'CAR476', 'Car', 'Chrysler', 'Airflow', 2023),
(317, 'TRK477', 'Truck', 'DAF', 'XG Electric', 2023),
(318, 'MOT478', 'Motorcycle', 'Yamaha', 'MT-10 SP', 2024),
(319, 'BUS479', 'Bus', 'Iveco', 'E-Way', 2023),
(320, 'OTH480', 'Other', 'Caterpillar', '745 Articulated Truck', 2022),
(321, 'CAR481', 'Car', 'Ford', 'Mustang Mach-E GT', 2024),
(322, 'TRK482', 'Truck', 'Mack', 'MD Electric', 2024),
(323, 'MOT483', 'Motorcycle', 'Honda', 'Hornet 750', 2024),
(324, 'BUS484', 'Bus', 'BYD', 'K7M', 2023),
(325, 'OTH485', 'Other', 'Doosan', 'DL580-7', 2023),
(326, 'CAR486', 'Car', 'Volkswagen', 'ID. Buzz Cargo', 2024),
(327, 'TRK487', 'Truck', 'IVECO', 'eDaily', 2023),
(328, 'MOT488', 'Motorcycle', 'Kawasaki', 'Z900 SE', 2024),
(329, 'BUS489', 'Bus', 'Alexander Dennis', 'Enviro500EV', 2023),
(330, 'OTH490', 'Other', 'Bell Equipment', 'B60E', 2023),
(331, 'CAR491', 'Car', 'Skoda', 'Superb iV', 2023),
(332, 'TRK492', 'Truck', 'Navistar', 'HX520', 2022),
(333, 'MOT493', 'Motorcycle', 'Aprilia', 'RS 660 Extrema', 2023),
(334, 'BUS494', 'Bus', 'Plaxton', 'Panther LE', 2023),
(335, 'OTH495', 'Other', 'Komatsu', 'D155AX-8', 2022),
(336, 'CAR496', 'Car', 'MG', 'MG5 EV Long Range', 2024),
(337, 'TRK497', 'Truck', 'Peterbilt', '220EV', 2023),
(338, 'MOT498', 'Motorcycle', 'Royal Enfield', 'Super Meteor 650', 2023),
(339, 'BUS499', 'Bus', 'Setra', 'S 518 HD', 2023),
(340, 'OTH500', 'Other', 'John Deere', '850 P-Tier Dozer', 2023);

INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(341, 'CAR501', 'Car', 'Citroën', 'ë-C4 X', 2023),
(342, 'TRK502', 'Truck', 'Renault Trucks', 'C 440 XLoad', 2023),
(343, 'MOT503', 'Motorcycle', 'Suzuki', 'V-Strom 800DE', 2023),
(344, 'BUS504', 'Bus', 'VDL', 'Citea SLFA-181 Electric', 2023),
(345, 'OTH505', 'Other', 'Komatsu', 'PC210LCi-11', 2022),
(346, 'CAR506', 'Car', 'Honda', 'e:Ny1', 2024),
(347, 'TRK507', 'Truck', 'Scania', 'G 500 XT', 2023),
(348, 'MOT508', 'Motorcycle', 'Triumph', 'Tiger 660 Sport', 2024),
(349, 'BUS509', 'Bus', 'Yutong', 'ICE13', 2023),
(350, 'OTH510', 'Other', 'Volvo CE', 'A40G', 2023),
(351, 'CAR511', 'Car', 'Kia', 'Niro EV', 2023),
(352, 'TRK512', 'Truck', 'Peterbilt', '389X', 2023),
(353, 'MOT513', 'Motorcycle', 'Royal Enfield', 'Hunter 350', 2023),
(354, 'BUS514', 'Bus', 'MAN', 'Intercity LE 14', 2024),
(355, 'OTH515', 'Other', 'Doosan', 'DX210W-7', 2023),
(356, 'CAR516', 'Car', 'MG', 'ZS EV', 2023),
(357, 'TRK517', 'Truck', 'IVECO', 'X-Way AD', 2022),
(358, 'MOT518', 'Motorcycle', 'Aprilia', 'SR GT 200', 2023),
(359, 'BUS519', 'Bus', 'Alexander Dennis', 'Enviro300', 2023),
(360, 'OTH520', 'Other', 'Liebherr', 'LH 60 M Timber', 2023),
(361, 'CAR521', 'Car', 'Tesla', 'Model Y Long Range', 2024),
(362, 'TRK522', 'Truck', 'Volvo', 'FM Electric', 2024),
(363, 'MOT523', 'Motorcycle', 'Honda', 'Rebel 1100T', 2024),
(364, 'BUS524', 'Bus', 'BYD', 'B12D', 2023),
(365, 'OTH525', 'Other', 'Bell Equipment', 'B20E', 2023),
(366, 'CAR526', 'Car', 'Hyundai', 'Kona Electric', 2024),
(367, 'TRK527', 'Truck', 'Mercedes-Benz', 'Unimog U 5032', 2023),
(368, 'MOT528', 'Motorcycle', 'Yamaha', 'XSR125', 2023),
(369, 'BUS529', 'Bus', 'Plaxton', 'Elitez', 2023),
(370, 'OTH530', 'Other', 'Caterpillar', '950 GC', 2023),
(371, 'CAR531', 'Car', 'Ford', 'Explorer Electric', 2024),
(372, 'TRK532', 'Truck', 'MAN', 'TGX 18.640', 2023),
(373, 'MOT533', 'Motorcycle', 'KTM', '450 SMR', 2023),
(374, 'BUS534', 'Bus', 'Solaris', 'Alpino 8', 2023),
(375, 'OTH535', 'Other', 'John Deere', '317G Compact Track Loader', 2023),
(376, 'CAR536', 'Car', 'Nissan', 'Leaf e+', 2023),
(377, 'TRK537', 'Truck', 'DAF', 'LF Electric 19T', 2024),
(378, 'MOT538', 'Motorcycle', 'Ducati', 'Monster SP', 2023),
(379, 'BUS539', 'Bus', 'Setra', 'TopClass S 531 DT', 2023),
(380, 'OTH540', 'Other', 'Hitachi', 'EH4000AC-3', 2023);

INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(381, 'CAR541', 'Car', 'Opel', 'Astra Electric', 2024),
(382, 'TRK542', 'Truck', 'Kenworth', 'K270E', 2023),
(383, 'MOT543', 'Motorcycle', 'BMW', 'F 900 GS Adventure', 2024),
(384, 'BUS544', 'Bus', 'VDL', 'Futura FHD2-135', 2023),
(385, 'OTH545', 'Other', 'Volvo CE', 'EC750E HR', 2023),
(386, 'CAR546', 'Car', 'Citroën', 'C3 Aircross Hybrid 136', 2024),
(387, 'TRK547', 'Truck', 'Renault Trucks', 'D Z.E.', 2023),
(388, 'MOT548', 'Motorcycle', 'Suzuki', 'GSX-R125', 2023),
(389, 'BUS549', 'Bus', 'Solaris', 'Urbino 24 Hybrid', 2024),
(390, 'OTH550', 'Other', 'Hitachi', 'ZX530LCH-7', 2023),
(391, 'CAR551', 'Car', 'DS Automobiles', 'DS 4 E-Tense', 2024),
(392, 'TRK552', 'Truck', 'IVECO', 'Daily CNG', 2023),
(393, 'MOT553', 'Motorcycle', 'Ducati', 'Streetfighter V4 SP2', 2024),
(394, 'BUS554', 'Bus', 'BYD', 'K6', 2023),
(395, 'OTH555', 'Other', 'Bell Equipment', 'L2606E', 2023),
(396, 'CAR556', 'Car', 'Skoda', 'Kamiq Monte Carlo', 2023),
(397, 'TRK557', 'Truck', 'Volvo', 'FM Low Entry Cab', 2024),
(398, 'MOT558', 'Motorcycle', 'KTM', '450 SX-F', 2024),
(399, 'BUS559', 'Bus', 'Setra', 'S 416 HDH', 2023),
(400, 'OTH560', 'Other', 'Doosan', 'DA45-7', 2023),
(401, 'CAR561', 'Car', 'Mazda', 'MX-5 RF', 2023),
(402, 'TRK562', 'Truck', 'Mercedes-Benz', 'Arocs 8x8', 2023),
(403, 'MOT563', 'Motorcycle', 'Triumph', 'Trident 660 Triple Tribute', 2024),
(404, 'BUS564', 'Bus', 'Irisbus', 'Crossway LE Line', 2023),
(405, 'OTH565', 'Other', 'John Deere', '844 P-Tier Loader', 2023),
(406, 'CAR566', 'Car', 'Alfa Romeo', 'Stelvio Quadrifoglio', 2023),
(407, 'TRK567', 'Truck', 'Ashok Leyland', 'Captain 3520 8x4', 2023),
(408, 'MOT568', 'Motorcycle', 'Harley-Davidson', 'CVO Road Glide ST', 2024),
(409, 'BUS569', 'Bus', 'MAN', 'eBus Low Entry', 2023),
(410, 'OTH570', 'Other', 'Liebherr', 'LH 80 M', 2023),
(411, 'CAR571', 'Car', 'Renault', 'Austral E-Tech Full Hybrid', 2024),
(412, 'TRK572', 'Truck', 'DAF', 'CF 450 FAN', 2023),
(413, 'MOT573', 'Motorcycle', 'Benelli', '302S', 2024),
(414, 'BUS574', 'Bus', 'Blue Bird', 'All American RE Electric', 2024),
(415, 'OTH575', 'Other', 'Caterpillar', 'M320F Wheeled Excavator', 2023),
(416, 'CAR576', 'Car', 'Genesis', 'GV70 Electrified', 2024),
(417, 'TRK577', 'Truck', 'Mack', 'Granite Sleeper', 2023),
(418, 'MOT578', 'Motorcycle', 'Yamaha', 'Tenere 700 World Raid', 2024),
(419, 'BUS579', 'Bus', 'Yutong', 'U12', 2024),
(420, 'OTH580', 'Other', 'Komatsu', 'HD465-8', 2023);

INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(421, 'CAR581', 'Car', 'Mini', 'Countryman SE ALL4', 2024),
(422, 'TRK582', 'Truck', 'Freightliner', 'eCascadia', 2024),
(423, 'MOT583', 'Motorcycle', 'Aprilia', 'Tuono V4 1100 Factory', 2024),
(424, 'BUS584', 'Bus', 'Plaxton', 'Elitei Interdeck', 2024),
(425, 'OTH585', 'Other', 'Volvo CE', 'EC550E', 2024),
(426, 'CAR586', 'Car', 'Lexus', 'RZ 450e', 2024),
(427, 'TRK587', 'Truck', 'Western Star', '49X XD Offroad', 2023),
(428, 'MOT588', 'Motorcycle', 'Suzuki', 'SV650', 2023),
(429, 'BUS589', 'Bus', 'Setra', 'S 416 GT-HD/2', 2024),
(430, 'OTH590', 'Other', 'Caterpillar', 'D6 XE', 2023),
(431, 'CAR591', 'Car', 'DS Automobiles', 'DS 7 E-Tense', 2024),
(432, 'TRK592', 'Truck', 'MAN', 'TGS 26.510', 2024),
(433, 'MOT593', 'Motorcycle', 'Kawasaki', 'Z650RS', 2023),
(434, 'BUS594', 'Bus', 'Alexander Dennis', 'Enviro400FCEV', 2024),
(435, 'OTH595', 'Other', 'Hitachi', 'EX5600-7', 2024),
(436, 'CAR596', 'Car', 'Peugeot', '408 Hybrid', 2024),
(437, 'TRK597', 'Truck', 'Tata Motors', 'Prima G.35K', 2023),
(438, 'MOT598', 'Motorcycle', 'Ducati', 'Hypermotard 950 RVE', 2023),
(439, 'BUS599', 'Bus', 'BYD', 'C10MS', 2024),
(440, 'OTH600', 'Other', 'Bell Equipment', 'L1706E', 2024),
(441, 'CAR601', 'Car', 'Renault', 'Megane E-Tech', 2024),
(442, 'TRK602', 'Truck', 'Volvo', 'FH LNG', 2023),
(443, 'MOT603', 'Motorcycle', 'Harley-Davidson', 'Pan America 1250 Special', 2024),
(444, 'BUS604', 'Bus', 'Solaris', 'InterUrbino Hydrogen', 2024),
(445, 'OTH605', 'Other', 'Liebherr', 'TA 230 Litronic', 2024),
(446, 'CAR606', 'Car', 'Mazda', 'CX-70 PHEV', 2024),
(447, 'TRK607', 'Truck', 'Kenworth', 'W990 Studio Sleeper', 2023),
(448, 'MOT608', 'Motorcycle', 'CFMoto', '450NK', 2024),
(449, 'BUS609', 'Bus', 'MAN', 'Lion’s City 12 E LE', 2024),
(450, 'OTH610', 'Other', 'John Deere', '410E-II', 2024),
(451, 'CAR611', 'Car', 'Genesis', 'GV60 Performance', 2024),
(452, 'TRK612', 'Truck', 'Ashok Leyland', 'AVTR 4825 Tipper', 2023),
(453, 'MOT613', 'Motorcycle', 'Royal Enfield', 'Himalayan 450', 2024),
(454, 'BUS614', 'Bus', 'VDL', 'Citea Electric New Gen', 2024),
(455, 'OTH615', 'Other', 'Doosan', 'DL420-7', 2024),
(456, 'CAR616', 'Car', 'Toyota', 'C-HR GR Sport Plug-in Hybrid', 2024),
(457, 'TRK617', 'Truck', 'Scania', 'XT G 540 10x4', 2024),
(458, 'MOT618', 'Motorcycle', 'BMW', 'R 18 Roctane', 2024),
(459, 'BUS619', 'Bus', 'Setra', 'ComfortClass S 515 HD', 2024),
(460, 'OTH620', 'Other', 'Komatsu', 'WA475-10', 2024);

INSERT INTO vehicles (user_id, registration_number, vehicle_type, brand, model, year) VALUES
(461, 'CAR621', 'Car', 'Subaru', 'Solterra', 2024),
(462, 'TRK622', 'Truck', 'DAF', 'XDC 450', 2024),
(463, 'MOT623', 'Motorcycle', 'Yamaha', 'R7 World GP Edition', 2024),
(464, 'BUS624', 'Bus', 'VDL', 'Citea LLE-99 Electric', 2024),
(465, 'OTH625', 'Other', 'Hitachi', 'EX3600-7', 2024),
(466, 'CAR626', 'Car', 'Volkswagen', 'ID.4 GTX', 2024),
(467, 'TRK627', 'Truck', 'Mack', 'Anthem 70-inch Sleeper', 2023),
(468, 'MOT628', 'Motorcycle', 'Honda', 'CB650R', 2024),
(469, 'BUS629', 'Bus', 'Neoplan', 'Cityliner Platin', 2024),
(470, 'OTH630', 'Other', 'Volvo CE', 'EC950F HR', 2024),
(471, 'CAR631', 'Car', 'Fiat', '600e', 2024),
(472, 'TRK632', 'Truck', 'IVECO', 'S-Way NP', 2024),
(473, 'MOT633', 'Motorcycle', 'KTM', '790 Adventure', 2024),
(474, 'BUS634', 'Bus', 'Yutong', 'T15E', 2024),
(475, 'OTH635', 'Other', 'Komatsu', 'PC4000-11', 2024),
(476, 'CAR636', 'Car', 'Nissan', 'Ariya', 2024),
(477, 'TRK637', 'Truck', 'Peterbilt', '389X Special Edition', 2023),
(478, 'MOT638', 'Motorcycle', 'Royal Enfield', 'Scram 411', 2024),
(479, 'BUS639', 'Bus', 'MAN', 'eBus EfficientHybrid', 2024),
(480, 'OTH640', 'Other', 'Liebherr', 'L 586 XPower', 2024),
(481, 'CAR641', 'Car', 'BMW', 'i5 M60', 2024),
(482, 'TRK642', 'Truck', 'Renault Trucks', 'C Optifuel', 2023),
(483, 'MOT643', 'Motorcycle', 'Ducati', 'Diavel V4', 2024),
(484, 'BUS644', 'Bus', 'Blue Bird', 'Vision Electric G2', 2024),
(485, 'OTH645', 'Other', 'John Deere', '672 P-Tier Grader', 2024),
(486, 'CAR646', 'Car', 'Tesla', 'Model 3 Performance', 2024),
(487, 'TRK647', 'Truck', 'Scania', 'S 770 A6x4', 2023),
(488, 'MOT648', 'Motorcycle', 'Aprilia', 'RSV4 Factory', 2024),
(489, 'BUS649', 'Bus', 'Setra', 'ComfortClass S 516 HD', 2024),
(490, 'OTH650', 'Other', 'Doosan', 'DL580-5', 2024),
(491, 'CAR651', 'Car', 'Opel', 'Grandland GSe', 2024),
(492, 'TRK652', 'Truck', 'Mercedes-Benz', 'Actros L', 2024),
(493, 'MOT653', 'Motorcycle', 'Suzuki', 'GSX-8R', 2024),
(494, 'BUS654', 'Bus', 'BYD', 'K8M', 2024),
(495, 'OTH655', 'Other', 'Caterpillar', 'D10 Dozer', 2024),
(496, 'CAR656', 'Car', 'Hyundai', 'IONIQ 7', 2024),
(497, 'TRK657', 'Truck', 'Kenworth', 'T680 Fuel Cell Electric', 2024),
(498, 'MOT658', 'Motorcycle', 'Harley-Davidson', 'CVO Street Glide', 2024),
(499, 'BUS659', 'Bus', 'Solaris', 'Urbino 18.75 Electric', 2024),
(500, 'OTH660', 'Other', 'Volvo CE', 'L350H', 2024);


#### Filling gap again:
INSERT INTO vehicles (vehicle_id, user_id, registration_number, vehicle_type, brand, model, year) VALUES
(182, 324, 'CART182', 'Car', 'Nissan', 'Altima', 2022),
(183, 147, 'TRKT183', 'Truck', 'Volvo', 'FH540', 2023),
(184, 476, 'MOTT184', 'Motorcycle', 'Triumph', 'Street Twin', 2022),
(185, 108, 'BUST185', 'Bus', 'Scania', 'Citywide LF CNG', 2023),
(186, 492, 'OTHT186', 'Other', 'Caterpillar', '777G', 2023),
(187, 63,  'CART187', 'Car', 'Hyundai', 'Elantra Hybrid', 2023),
(188, 411, 'TRKT188', 'Truck', 'MAN', 'TGS 41.440', 2022),
(189, 203, 'MOTT189', 'Motorcycle', 'Honda', 'CB300R', 2023),
(190, 90,  'BUST190', 'Bus', 'Iveco', 'Bus Crossway LE', 2023),
(191, 378, 'OTHT191', 'Other', 'Komatsu', 'HD785-7', 2023),
(192, 5,   'CART192', 'Car', 'Ford', 'Focus Active', 2023),
(193, 187, 'TRKT193', 'Truck', 'DAF', 'XF 530 FT', 2022),
(194, 431, 'MOTT194', 'Motorcycle', 'Benelli', 'TNT 600i', 2022),
(195, 259, 'BUST195', 'Bus', 'Yutong', 'ICE12', 2022),
(196, 114, 'OTHT196', 'Other', 'Bell Equipment', 'B60E', 2023),
(197, 301, 'CART197', 'Car', 'Volkswagen', 'Arteon Shooting Brake', 2023),
(198, 215, 'TRKT198', 'Truck', 'Mercedes-Benz', 'Unimog U 4023', 2023),
(199, 487, 'MOTT199', 'Motorcycle', 'CFMoto', '650MT', 2022),
(200, 356, 'BUST200', 'Bus', 'MAN', 'Lion’s Coach L', 2023),
(201, 79,  'OTHT201', 'Other', 'Volvo CE', 'R100E Hauler', 2023),
(202, 250, 'CART202', 'Car', 'Peugeot', '508 SW Hybrid', 2023),
(203, 132, 'TRKT203', 'Truck', 'Scania', 'P 320 XT', 2022),
(204, 445, 'MOTT204', 'Motorcycle', 'BMW', 'G 310 GS', 2022),
(205, 41,  'BUST205', 'Bus', 'Solaris', 'Alpino 8.6', 2023),
(206, 229, 'OTHT206', 'Other', 'Doosan', 'DX800LC-5', 2023),
(207, 392, 'CART207', 'Car', 'Lexus', 'UX 300e', 2023),
(208, 283, 'TRKT208', 'Truck', 'IVECO', 'T-Way 380', 2022),
(209, 194, 'MOTT209', 'Motorcycle', 'Indian', 'Scout Bobber', 2023),
(210, 61,  'BUST210', 'Bus', 'Setra', 'S 417 TC', 2023),
(211, 8,   'OTHT211', 'Other', 'Liebherr', 'TA 230', 2023),
(212, 413, 'CART212', 'Car', 'Fiat', 'Panda Cross Hybrid', 2023),
(213, 298, 'TRKT213', 'Truck', 'Kamaz', '65222', 2023),
(214, 339, 'MOTT214', 'Motorcycle', 'Yamaha', 'XSR700 Legacy', 2024),
(215, 107, 'BUST215', 'Bus', 'BYD', 'K12A', 2023),
(216, 490, 'OTHT216', 'Other', 'John Deere', '410 P-Tier', 2023),
(217, 273, 'CART217', 'Car', 'Genesis', 'GV80 Coupe', 2024),
(218, 152, 'TRKT218', 'Truck', 'Renault Trucks', 'K 520 XT', 2023),
(219, 398, 'MOTT219', 'Motorcycle', 'Ducati', 'SuperSport 950', 2023),
(220, 339, 'BUST220', 'Bus', 'Plaxton', 'Panther LE', 2023),
(221, 421, 'OTHT221', 'Other', 'Volvo CE', 'EC300E Hybrid', 2023);

INSERT INTO vehicles (vehicle_id, user_id, registration_number, vehicle_type, brand, model, year) VALUES
(222, 462, 'CART222', 'Car', 'Skoda', 'Octavia e-TEC', 2023),
(223, 138, 'TRKT223', 'Truck', 'DAF', 'XG+ 530', 2023),
(224, 396, 'MOTT224', 'Motorcycle', 'Honda', 'CB500F', 2022),
(225, 270, 'BUST225', 'Bus', 'MAN', 'Intercity LE', 2023),
(226, 489, 'OTHT226', 'Other', 'Caterpillar', 'D8T Dozer', 2023),
(227, 347, 'CART227', 'Car', 'MG', 'HS Plug-in Hybrid', 2023),
(228, 195, 'TRKT228', 'Truck', 'IVECO', 'Daily Blue Power', 2022),
(229, 8,   'MOTT229', 'Motorcycle', 'Benelli', 'Leoncino Trail', 2023),
(230, 418, 'BUST230', 'Bus', 'Plaxton', 'Panorama Elite', 2023),
(231, 57,  'OTHT231', 'Other', 'Bell Equipment', 'B30E', 2023),
(232, 298, 'CART232', 'Car', 'Vauxhall', 'Mokka-e', 2023),
(233, 221, 'TRKT233', 'Truck', 'Freightliner', 'M2 112', 2022),
(234, 100, 'MOTT234', 'Motorcycle', 'Yamaha', 'Tracer 7', 2023),
(235, 331, 'BUST235', 'Bus', 'BYD', 'C8M', 2022),
(236, 154, 'OTHT236', 'Other', 'Komatsu', 'PC490LC-11', 2023),
(237, 489, 'CART237', 'Car', 'Renault', 'Captur E-Tech', 2024),
(238, 62,  'TRKT238', 'Truck', 'Western Star', '57X', 2023),
(239, 241, 'MOTT239', 'Motorcycle', 'Aprilia', 'Tuareg 660', 2023),
(240, 394, 'BUST240', 'Bus', 'VDL', 'Futura FDD2', 2023),
(241, 15,  'OTHT241', 'Other', 'Volvo CE', 'L180H HL', 2022),
(242, 333, 'CART242', 'Car', 'Audi', 'Q3 45 TFSI e', 2023),
(243, 186, 'TRKT243', 'Truck', 'Renault Trucks', 'C 430 P6x4', 2023),
(244, 445, 'MOTT244', 'Motorcycle', 'Ducati', 'Scrambler Nightshift', 2023),
(245, 123, 'BUST245', 'Bus', 'MAN', 'Lion’s City 12G', 2022),
(246, 60,  'OTHT246', 'Other', 'Hitachi', 'ZX350LC-7', 2023),
(247, 410, 'CART247', 'Car', 'Mercedes-Benz', 'EQB 300 4MATIC', 2024),
(248, 35,  'TRKT248', 'Truck', 'Mack', 'Pinnacle DayCab', 2022),
(249, 109, 'MOTT249', 'Motorcycle', 'BMW', 'F 850 GS', 2023),
(250, 250, 'BUST250', 'Bus', 'Solaris', 'InterUrbino Hydrogen', 2023),
(251, 274, 'OTHT251', 'Other', 'Doosan', 'DL420-7', 2023),
(252, 431, 'CART252', 'Car', 'Genesis', 'GV70 Electrified', 2024),
(253, 61,  'TRKT253', 'Truck', 'Tata Motors', 'Prima LX 2830', 2023),
(254, 19,  'MOTT254', 'Motorcycle', 'Harley-Davidson', 'Sportster S', 2024),
(255, 307, 'BUST255', 'Bus', 'Setra', 'S 515 HD', 2023),
(256, 471, 'OTHT256', 'Other', 'Liebherr', 'PR 736 G8', 2023),
(257, 83,  'CART257', 'Car', 'Ford', 'Explorer Plug-in Hybrid', 2023),
(258, 313, 'TRKT258', 'Truck', 'Mercedes-Benz', 'eActros 300', 2023),
(259, 131, 'MOTT259', 'Motorcycle', 'Royal Enfield', 'Interceptor 650', 2023),
(260, 489, 'BUST260', 'Bus', 'Otokar', 'Territo U', 2023),
(261, 244, 'OTHT261', 'Other', 'Caterpillar', '740 GC', 2023);

INSERT INTO vehicles (vehicle_id, user_id, registration_number, vehicle_type, brand, model, year) VALUES
(262, 253, 'CART262', 'Car', 'Chevrolet', 'Bolt EUV', 2023),
(263, 336, 'TRKT263', 'Truck', 'Volvo', 'VNR Electric', 2023),
(264, 77,  'MOTT264', 'Motorcycle', 'Suzuki', 'GSX-R750', 2023),
(265, 115, 'BUST265', 'Bus', 'Mercedes-Benz', 'Intouro K', 2022),
(266, 271, 'OTHT266', 'Other', 'Hitachi', 'ZW310-6', 2023),
(267, 448, 'CART267', 'Car', 'Peugeot', 'e-2008', 2023),
(268, 150, 'TRKT268', 'Truck', 'Mack', 'LR Electric', 2023),
(269, 419, 'MOTT269', 'Motorcycle', 'Ducati', 'Monster 937', 2022),
(270, 334, 'BUST270', 'Bus', 'BYD', 'B12A01', 2023),
(271, 213, 'OTHT271', 'Other', 'Komatsu', 'PC700LC-11', 2022),
(272, 409, 'CART272', 'Car', 'Toyota', 'Corolla Cross Hybrid', 2023),
(273, 139, 'TRKT273', 'Truck', 'IVECO', 'Eurocargo Natural Power', 2022),
(274, 397, 'MOTT274', 'Motorcycle', 'Honda', 'CBR650R', 2023),
(275, 48,  'BUST275', 'Bus', 'VDL', 'Citea SLFA-180', 2023),
(276, 481, 'OTHT276', 'Other', 'Caterpillar', '990K', 2022),
(277, 111, 'CART277', 'Car', 'Mazda', 'MX-30 EV', 2023),
(278, 284, 'TRKT278', 'Truck', 'Freightliner', 'ECascadia', 2023),
(279, 2,   'MOTT279', 'Motorcycle', 'Royal Enfield', 'Meteor 350', 2022),
(280, 208, 'BUST280', 'Bus', 'Alexander Dennis', 'Enviro100EV', 2023),
(281, 495, 'OTHT281', 'Other', 'Bell Equipment', 'L2606E Loader', 2023),
(282, 134, 'CART282', 'Car', 'Alfa Romeo', 'Tonale PHEV', 2023),
(283, 256, 'TRKT283', 'Truck', 'Scania', 'G 540 XT', 2022),
(284, 437, 'MOTT284', 'Motorcycle', 'Triumph', 'Tiger Sport 660', 2023),
(285, 105, 'BUST285', 'Bus', 'MAN', 'Lion’s City E LE', 2023),
(286, 329, 'OTHT286', 'Other', 'Doosan', 'DX1000LC-7', 2023),
(287, 335, 'CART287', 'Car', 'MG', 'MG4 EV', 2023),
(288, 406, 'TRKT288', 'Truck', 'Peterbilt', '520EV', 2022),
(289, 190, 'MOTT289', 'Motorcycle', 'CFMoto', '450SR', 2023),
(290, 300, 'BUST290', 'Bus', 'Setra', 'S 418 LE business', 2022),
(291, 124, 'OTHT291', 'Other', 'Volvo CE', 'EC230 Electric', 2023),
(292, 444, 'CART292', 'Car', 'Fiat', '500e', 2023),
(293, 329, 'TRKT293', 'Truck', 'Tata Motors', 'Ultra T.9', 2023),
(294, 405, 'MOTT294', 'Motorcycle', 'Yamaha', 'Tracer 9 GT+', 2023),
(295, 36,  'BUST295', 'Bus', 'Plaxton', 'Elite Interdeck', 2023),
(296, 480, 'OTHT296', 'Other', 'John Deere', '350 P-Tier Excavator', 2023),
(297, 98,  'CART297', 'Car', 'BMW', 'X1 xDrive30e', 2023),
(298, 158, 'TRKT298', 'Truck', 'DAF', 'CF Electric', 2023),
(299, 493, 'MOTT299', 'Motorcycle', 'Aprilia', 'SRV 850', 2023),
(300, 320, 'BUST300', 'Bus', 'Yutong', 'ICE18', 2022),
(301, 49,  'OTHT301', 'Other', 'Liebherr', 'LH 50 M', 2022);

INSERT INTO vehicles (vehicle_id, user_id, registration_number, vehicle_type, brand, model, year) VALUES
(302, 329, 'CART302', 'Car', 'Toyota', 'C-HR GR Sport', 2024),
(303, 25,  'TRKT303', 'Truck', 'Mercedes-Benz', 'Arocs 6x6', 2023),
(304, 438, 'MOTT304', 'Motorcycle', 'Suzuki', 'GSX-S1000GX', 2024),
(305, 476, 'BUST305', 'Bus', 'VDL', 'Citea SLF-120 Electric', 2023),
(306, 331, 'OTHT306', 'Other', 'John Deere', '460E-II', 2023),
(307, 67,  'CART307', 'Car', 'Nissan', 'Qashqai e-POWER', 2023),
(308, 184, 'TRKT308', 'Truck', 'Western Star', '47X SF', 2023),
(309, 4,   'MOTT309', 'Motorcycle', 'Harley-Davidson', 'Nightster Special', 2023),
(310, 290, 'BUST310', 'Bus', 'Solaris', 'Trollino 24 Hybrid', 2023),
(311, 176, 'OTHT311', 'Other', 'Caterpillar', '725 Articulated Truck', 2023),
(312, 491, 'CART312', 'Car', 'Hyundai', 'Ioniq 6 SE', 2024),
(313, 211, 'TRKT313', 'Truck', 'Scania', 'S 500 XT', 2024),
(314, 112, 'MOTT314', 'Motorcycle', 'Yamaha', 'R3 World GP Edition', 2023),
(315, 398, 'BUST315', 'Bus', 'Neoplan', 'Tourliner C', 2023),
(316, 82,  'OTHT316', 'Other', 'Doosan', 'DA30-7', 2023),
(317, 165, 'CART317', 'Car', 'Volvo', 'XC40 Recharge', 2024),
(318, 106, 'TRKT318', 'Truck', 'Kenworth', 'T880 Tri-Drive', 2023),
(319, 445, 'MOTT319', 'Motorcycle', 'Aprilia', 'RS 457', 2024),
(320, 119, 'BUST320', 'Bus', 'Setra', 'S 519 HD', 2024),
(321, 73,  'OTHT321', 'Other', 'Komatsu', 'HM400-5', 2023),
(322, 364, 'CART322', 'Car', 'Renault', 'Scenic Vision', 2024),
(323, 486, 'TRKT323', 'Truck', 'IVECO', 'X-Way 8x4', 2023),
(324, 102, 'MOTT324', 'Motorcycle', 'Ducati', 'DesertX Rally', 2024),
(325, 217, 'BUST325', 'Bus', 'Alexander Dennis', 'Enviro500EV CHARGE', 2024),
(326, 411, 'OTHT326', 'Other', 'Hitachi', 'EX2000-7', 2023),
(327, 235, 'CART327', 'Car', 'BMW', 'iX1 xDrive30', 2024),
(328, 172, 'TRKT328', 'Truck', 'Tata Motors', 'Signa 3523.TK', 2023),
(329, 356, 'MOTT329', 'Motorcycle', 'KTM', 'RC 8C', 2024),
(330, 369, 'BUST330', 'Bus', 'BYD', 'K9UD', 2023),
(331, 59,  'OTHT331', 'Other', 'Liebherr', 'T 274', 2024),
(332, 227, 'CART332', 'Car', 'Fiat', '600 Hybrid', 2024),
(333, 404, 'TRKT333', 'Truck', 'DAF', 'XDC 450', 2024),
(334, 275, 'MOTT334', 'Motorcycle', 'BMW', 'CE 02', 2024),
(335, 94,  'BUST335', 'Bus', 'Blue Bird', 'Vision Low Floor', 2023),
(336, 341, 'OTHT336', 'Other', 'John Deere', '410 P Tier', 2024),
(337, 203, 'CART337', 'Car', 'Opel', 'Mokka Electric', 2023),
(338, 116, 'TRKT338', 'Truck', 'Navistar', 'HX620', 2023),
(339, 45,  'MOTT339', 'Motorcycle', 'Triumph', 'Scrambler 900', 2023),
(340, 477, 'BUST340', 'Bus', 'MAN', 'eLion L', 2024),
(341, 386, 'OTHT341', 'Other', 'Volvo CE', 'EC500', 2024);

INSERT INTO vehicles (vehicle_id, user_id, registration_number, vehicle_type, brand, model, year) VALUES
(27, 128, 'CART027', 'Car', 'Honda', 'Insight', 2021),
(28, 402, 'TRKT028', 'Truck', 'DAF', 'CF 530', 2022),
(29, 311, 'MOTT029', 'Motorcycle', 'Suzuki', 'GSX-R125', 2023),
(30, 237, 'BUST030', 'Bus', 'Irisbus', 'Crossway LE', 2022),
(31, 456, 'OTHT031', 'Other', 'Volvo CE', 'EC480E', 2023),
(32, 99,  'CART032', 'Car', 'Kia', 'Niro Plus', 2023),
(33, 154, 'TRKT033', 'Truck', 'Scania', 'P 410 XT', 2023),
(34, 17,  'MOTT034', 'Motorcycle', 'Ducati', 'Monster Plus', 2023),
(35, 485, 'BUST035', 'Bus', 'Solaris', 'Urbino 12 Hydrogen', 2023),
(36, 410, 'OTHT036', 'Other', 'John Deere', '744 P-Tier', 2023),
(37, 344, 'CART037', 'Car', 'Mazda', 'CX-30', 2022),
(38, 242, 'TRKT038', 'Truck', 'Mercedes-Benz', 'Econic NGT', 2022),
(39, 13,  'MOTT039', 'Motorcycle', 'Royal Enfield', 'Classic 350', 2023),
(40, 371, 'BUST040', 'Bus', 'Temsa', 'Avenue Electron', 2023),
(41, 252, 'OTHT041', 'Other', 'Liebherr', 'LR 636', 2023),
(42, 118, 'CART042', 'Car', 'Fiat', 'Tipo Cross', 2022),
(43, 319, 'TRKT043', 'Truck', 'IVECO', 'eDaily Chassis Cab', 2023),
(44, 81,  'MOTT044', 'Motorcycle', 'BMW', 'C 400 GT', 2022),
(45, 479, 'BUST045', 'Bus', 'MAN', 'TGE City', 2022),
(46, 186, 'OTHT046', 'Other', 'Komatsu', 'WA200-8', 2023),
(47, 229, 'CART047', 'Car', 'Opel', 'Astra Electric', 2024),
(48, 45,  'TRKT048', 'Truck', 'Renault Trucks', 'T High 480', 2023),
(49, 266, 'MOTT049', 'Motorcycle', 'Benelli', 'Imperiale 400', 2023),
(50, 375, 'BUST050', 'Bus', 'BYD', 'K7M', 2022),
(51, 197, 'OTHT051', 'Other', 'Doosan', 'DX420LC-7', 2023),
(52, 223, 'CART052', 'Car', 'Lexus', 'ES 300h F Sport', 2023),
(53, 383, 'TRKT053', 'Truck', 'DAF', 'XD Electric', 2024),
(54, 303, 'MOTT054', 'Motorcycle', 'Aprilia', 'SR GT 125', 2023),
(55, 73,  'BUST055', 'Bus', 'Plaxton', 'Leopard', 2022),
(56, 147, 'OTHT056', 'Other', 'Volvo CE', 'EC140E', 2023),
(57, 470, 'CART057', 'Car', 'Skoda', 'Scala', 2023),
(58, 180, 'TRKT058', 'Truck', 'Tata Motors', 'Prima FL 5530.S', 2023),
(59, 68,  'MOTT059', 'Motorcycle', 'KTM', '390 Adventure SW', 2023),
(60, 432, 'BUST060', 'Bus', 'Alexander Dennis', 'Enviro200', 2023),
(61, 321, 'OTHT061', 'Other', 'Bell Equipment', 'B45E', 2023),
(62, 370, 'CART062', 'Car', 'Hyundai', 'Bayon', 2023),
(63, 297, 'TRKT063', 'Truck', 'Freightliner', '114SD Plus', 2022),
(64, 288, 'MOTT064', 'Motorcycle', 'Harley-Davidson', 'X500', 2024),
(65, 102, 'BUST065', 'Bus', 'Yutong', 'ZK6128BEV', 2022),
(66, 378, 'OTHT066', 'Other', 'Hitachi', 'ZX400MC-7', 2023),
(67, 9,   'CART067', 'Car', 'Renault', 'Austral E-Tech Hybrid', 2024);

###
USE tunnel_project;
CREATE TABLE tunnel_charges (
    charge_id INT AUTO_INCREMENT PRIMARY KEY,
    tunnel_id INT NOT NULL,
    user_id INT NOT NULL,
    vehicle_type VARCHAR(30) NOT NULL,
    base_rate DECIMAL(6,2) NOT NULL,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (tunnel_id) REFERENCES tunnels(tunnel_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

##### Populating tunnel_charges more:
INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 8, 'Northbound', 'Car', 3.40, 1.80, 'Y', '20%', 6, 9),
(23, 9, 'Southbound', 'Truck', 10.20, 8.10, 'Y', '15%', 4, 10),
(26, 10, 'Northbound', 'Motorcycle', 2.30, 1.40, 'Y', '10%', 7, 10),
(22, 11, 'Southbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(23, 12, 'Northbound', 'Car', 4.10, 2.20, 'Y', '25%', 5, 9),
(26, 13, 'Southbound', 'Truck', 9.80, 7.90, 'N', '0%', 3, 10),
(22, 14, 'Northbound', 'Other', 3.90, 2.40, 'N', '0%', 10, 4),
(23, 15, 'Southbound', 'Motorcycle', 2.45, 1.35, 'Y', '15%', 6, 10),
(26, 16, 'Northbound', 'Car', 3.75, 1.85, 'Y', '20%', 4, 8),
(22, 17, 'Southbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(23, 18, 'Northbound', 'Truck', 10.00, 7.80, 'N', '0%', 4, 10),
(26, 19, 'Southbound', 'Other', 3.70, 2.00, 'N', '0%', 9, 3),
(22, 20, 'Northbound', 'Car', 3.95, 2.10, 'Y', '15%', 7, 9),
(23, 21, 'Southbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(26, 22, 'Northbound', 'Motorcycle', 2.60, 1.50, 'Y', '20%', 5, 10),
(22, 23, 'Southbound', 'Truck', 10.50, 8.00, 'Y', '10%', 6, 10),
(23, 24, 'Northbound', 'Car', 4.20, 2.30, 'Y', '30%', 5, 9),
(26, 25, 'Southbound', 'Other', 3.95, 2.25, 'N', '0%', 10, 2),
(23, 26, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(22, 27, 'Southbound', 'Motorcycle', 2.55, 1.45, 'Y', '10%', 6, 10);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 28, 'Northbound', 'Car', 3.80, 2.00, 'Y', '15%', 6, 10),
(23, 29, 'Southbound', 'Truck', 10.30, 8.20, 'N', '0%', 4, 9),
(26, 30, 'Northbound', 'Motorcycle', 2.20, 1.30, 'Y', '10%', 7, 11),
(22, 31, 'Southbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(23, 32, 'Northbound', 'Other', 3.95, 2.30, 'N', '0%', 10, 2),
(26, 33, 'Southbound', 'Truck', 9.60, 7.60, 'Y', '10%', 4, 10),
(22, 34, 'Northbound', 'Car', 3.65, 1.95, 'Y', '20%', 5, 8),
(23, 35, 'Southbound', 'Motorcycle', 2.55, 1.45, 'Y', '15%', 6, 10),
(26, 36, 'Northbound', 'Truck', 10.00, 7.85, 'N', '0%', 4, 10),
(22, 37, 'Southbound', 'Other', 3.90, 2.20, 'N', '0%', 9, 3),
(23, 38, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(26, 39, 'Southbound', 'Car', 4.15, 2.35, 'Y', '25%', 5, 9),
(22, 40, 'Northbound', 'Truck', 9.85, 8.00, 'Y', '10%', 4, 10),
(23, 41, 'Southbound', 'Motorcycle', 2.40, 1.40, 'Y', '10%', 6, 9),
(26, 42, 'Northbound', 'Car', 4.00, 2.25, 'Y', '20%', 5, 10),
(22, 43, 'Southbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(23, 44, 'Northbound', 'Other', 3.85, 2.15, 'N', '0%', 10, 3),
(26, 45, 'Southbound', 'Truck', 10.10, 8.10, 'Y', '5%', 4, 9),
(22, 46, 'Northbound', 'Car', 3.70, 2.10, 'Y', '15%', 6, 10),
(26, 47, 'Southbound', 'Motorcycle', 2.35, 1.25, 'Y', '10%', 7, 10);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 88, 'Northbound', 'Car', 4.10, 2.30, 'Y', '50%', 5, 9),
(23, 89, 'Southbound', 'Truck', 10.25, 8.00, 'N', '0%', 4, 9),
(26, 90, 'Northbound', 'Motorcycle', 2.30, 1.30, 'Y', '50%', 6, 10),
(14, 91, 'Southbound', 'Other', 3.70, 2.00, 'N', '0%', 10, 3),
(22, 92, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(23, 93, 'Southbound', 'Car', 4.00, 2.10, 'N', '0%', 6, 9),
(26, 94, 'Northbound', 'Truck', 9.95, 7.90, 'Y', '50%', 4, 10),
(17, 95, 'Southbound', 'Motorcycle', 2.50, 1.50, 'N', '0%', 5, 10),
(22, 96, 'Northbound', 'Car', 3.85, 2.10, 'Y', '50%', 7, 10),
(5, 97, 'Southbound', 'Truck', 10.00, 7.80, 'N', '0%', 3, 9),
(23, 98, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(26, 99, 'Southbound', 'Car', 4.10, 2.40, 'N', '0%', 6, 9),
(22, 100, 'Northbound', 'Other', 3.95, 2.30, 'Y', '50%', 9, 4),
(9, 101, 'Southbound', 'Truck', 9.60, 7.50, 'N', '0%', 4, 10),
(23, 102, 'Northbound', 'Motorcycle', 2.20, 1.40, 'Y', '50%', 5, 10),
(26, 103, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(22, 104, 'Northbound', 'Car', 3.90, 2.20, 'Y', '50%', 6, 9),
(10, 105, 'Southbound', 'Motorcycle', 2.60, 1.60, 'N', '0%', 7, 10),
(23, 106, 'Northbound', 'Truck', 10.15, 8.05, 'Y', '50%', 4, 10),
(26, 107, 'Southbound', 'Other', 3.85, 2.15, 'N', '0%', 10, 2);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 108, 'Northbound', 'Car', 3.95, 2.10, 'Y', '50%', 6, 9),
(13, 109, 'Southbound', 'Truck', 10.40, 8.10, 'N', '0%', 4, 10),
(26, 110, 'Northbound', 'Motorcycle', 2.20, 1.20, 'Y', '50%', 5, 10),
(19, 111, 'Southbound', 'Other', 3.75, 2.25, 'N', '0%', 9, 3),
(23, 112, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(26, 113, 'Southbound', 'Car', 4.20, 2.50, 'N', '0%', 6, 10),
(22, 114, 'Northbound', 'Truck', 9.90, 7.90, 'Y', '50%', 4, 10),
(5, 115, 'Southbound', 'Motorcycle', 2.60, 1.50, 'N', '0%', 7, 10),
(23, 116, 'Northbound', 'Car', 3.85, 2.20, 'Y', '50%', 5, 9),
(26, 117, 'Southbound', 'Truck', 10.15, 7.95, 'N', '0%', 3, 9),
(22, 118, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(9, 119, 'Southbound', 'Other', 3.90, 2.30, 'N', '0%', 10, 2),
(23, 120, 'Northbound', 'Motorcycle', 2.40, 1.30, 'Y', '50%', 6, 9),
(26, 121, 'Southbound', 'Car', 4.00, 2.25, 'N', '0%', 5, 10),
(22, 122, 'Northbound', 'Truck', 9.85, 7.85, 'Y', '50%', 4, 9),
(17, 123, 'Southbound', 'Motorcycle', 2.55, 1.45, 'N', '0%', 6, 10),
(23, 124, 'Northbound', 'Car', 4.05, 2.35, 'Y', '50%', 5, 9),
(26, 125, 'Southbound', 'Truck', 10.30, 8.10, 'N', '0%', 4, 10),
(22, 126, 'Northbound', 'Other', 3.80, 2.00, 'Y', '50%', 6, 10),
(11, 127, 'Southbound', 'Motorcycle', 2.50, 1.40, 'N', '0%', 7, 10);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 128, 'Northbound', 'Car', 4.10, 2.20, 'Y', '50%', 6, 9),
(7, 129, 'Southbound', 'Truck', 10.40, 8.20, 'N', '0%', 4, 10),
(23, 130, 'Northbound', 'Motorcycle', 2.25, 1.25, 'Y', '50%', 5, 10),
(14, 131, 'Southbound', 'Other', 3.85, 2.10, 'N', '0%', 10, 3),
(26, 132, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(3, 133, 'Southbound', 'Car', 4.20, 2.40, 'N', '0%', 6, 9),
(22, 134, 'Northbound', 'Truck', 9.95, 7.95, 'Y', '50%', 4, 9),
(26, 135, 'Southbound', 'Motorcycle', 2.50, 1.50, 'N', '0%', 7, 10),
(23, 136, 'Northbound', 'Car', 3.90, 2.15, 'Y', '50%', 5, 9),
(11, 137, 'Southbound', 'Truck', 10.00, 7.80, 'N', '0%', 4, 10),
(22, 138, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(13, 139, 'Southbound', 'Other', 3.70, 2.00, 'N', '0%', 10, 2),
(23, 140, 'Northbound', 'Motorcycle', 2.35, 1.35, 'Y', '50%', 6, 10),
(26, 141, 'Southbound', 'Car', 3.80, 2.00, 'N', '0%', 5, 9),
(22, 142, 'Northbound', 'Truck', 10.10, 8.00, 'Y', '50%', 4, 10),
(15, 143, 'Southbound', 'Motorcycle', 2.45, 1.40, 'N', '0%', 6, 10),
(23, 144, 'Northbound', 'Car', 4.00, 2.25, 'Y', '50%', 5, 9),
(26, 145, 'Southbound', 'Truck', 10.20, 8.15, 'N', '0%', 4, 10),
(22, 146, 'Northbound', 'Other', 3.95, 2.25, 'Y', '50%', 6, 10),
(9, 147, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 148, 'Northbound', 'Car', 3.85, 2.10, 'Y', '50%', 5, 9),
(26, 149, 'Southbound', 'Motorcycle', 2.55, 1.45, 'N', '0%', 7, 10);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 150, 'Northbound', 'Car', 4.10, 2.20, 'Y', '50%', 6, 9),
(5, 151, 'Southbound', 'Truck', 10.30, 8.00, 'N', '0%', 4, 10),
(23, 152, 'Northbound', 'Motorcycle', 2.35, 1.25, 'Y', '50%', 5, 10),
(3, 153, 'Southbound', 'Other', 3.90, 2.15, 'N', '0%', 10, 3),
(26, 154, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(7, 155, 'Southbound', 'Car', 4.25, 2.45, 'N', '0%', 6, 9),
(22, 156, 'Northbound', 'Truck', 10.05, 7.95, 'Y', '50%', 4, 9),
(8, 157, 'Southbound', 'Motorcycle', 2.45, 1.35, 'N', '0%', 6, 10),
(23, 158, 'Northbound', 'Car', 3.85, 2.20, 'Y', '50%', 5, 9),
(26, 159, 'Southbound', 'Truck', 10.20, 8.10, 'N', '0%', 3, 10),
(22, 160, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(6, 161, 'Southbound', 'Other', 3.80, 2.10, 'N', '0%', 9, 3),
(23, 162, 'Northbound', 'Motorcycle', 2.50, 1.40, 'Y', '50%', 6, 10),
(26, 163, 'Southbound', 'Car', 4.10, 2.30, 'N', '0%', 5, 10),
(22, 164, 'Northbound', 'Truck', 10.10, 8.00, 'Y', '50%', 4, 10),
(13, 165, 'Southbound', 'Motorcycle', 2.55, 1.45, 'N', '0%', 6, 9),
(23, 166, 'Northbound', 'Car', 3.95, 2.25, 'Y', '50%', 5, 9),
(26, 167, 'Southbound', 'Truck', 10.30, 8.10, 'N', '0%', 4, 10),
(22, 168, 'Northbound', 'Other', 3.85, 2.20, 'Y', '50%', 6, 10),
(4, 169, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 170, 'Northbound', 'Car', 4.00, 2.35, 'Y', '50%', 5, 9),
(26, 171, 'Southbound', 'Motorcycle', 2.65, 1.55, 'N', '0%', 6, 10),
(22, 172, 'Northbound', 'Car', 4.05, 2.30, 'Y', '50%', 6, 10),
(17, 173, 'Southbound', 'Truck', 9.80, 7.90, 'N', '0%', 4, 10),
(23, 174, 'Northbound', 'Motorcycle', 2.40, 1.35, 'Y', '50%', 6, 9),
(20, 175, 'Southbound', 'Other', 3.70, 2.00, 'N', '0%', 9, 3),
(26, 176, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(22, 177, 'Southbound', 'Car', 3.95, 2.20, 'N', '0%', 5, 9),
(23, 178, 'Northbound', 'Truck', 10.00, 8.00, 'Y', '50%', 4, 10),
(26, 179, 'Southbound', 'Motorcycle', 2.30, 1.20, 'N', '0%', 6, 10),
(22, 180, 'Northbound', 'Car', 4.10, 2.25, 'Y', '50%', 6, 9),
(12, 181, 'Southbound', 'Truck', 10.05, 7.85, 'N', '0%', 4, 10),
(23, 182, 'Northbound', 'Motorcycle', 2.20, 1.30, 'Y', '50%', 5, 9),
(8, 183, 'Southbound', 'Car', 3.90, 2.10, 'N', '0%', 6, 10),
(26, 184, 'Northbound', 'Other', 3.75, 2.00, 'Y', '50%', 6, 10),
(22, 185, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 186, 'Northbound', 'Car', 4.15, 2.35, 'Y', '50%', 5, 10),
(26, 187, 'Southbound', 'Truck', 9.95, 7.90, 'N', '0%', 4, 9),
(22, 188, 'Northbound', 'Motorcycle', 2.55, 1.45, 'Y', '50%', 6, 9),
(19, 189, 'Southbound', 'Truck', 10.20, 8.10, 'N', '0%', 4, 10),
(23, 190, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(26, 191, 'Southbound', 'Car', 3.95, 2.15, 'N', '0%', 6, 10),
(22, 192, 'Northbound', 'Truck', 10.10, 8.00, 'Y', '50%', 4, 10),
(11, 193, 'Southbound', 'Motorcycle', 2.60, 1.50, 'N', '0%', 6, 10),
(23, 194, 'Northbound', 'Car', 4.05, 2.30, 'Y', '50%', 5, 9),
(26, 195, 'Southbound', 'Truck', 10.25, 8.15, 'N', '0%', 3, 9),
(22, 196, 'Northbound', 'Other', 3.85, 2.25, 'Y', '50%', 6, 10),
(5, 197, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 198, 'Northbound', 'Motorcycle', 2.45, 1.35, 'Y', '50%', 5, 10),
(26, 199, 'Southbound', 'Car', 4.20, 2.50, 'N', '0%', 6, 10);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 101, 'Northbound', 'Car', 4.00, 2.30, 'Y', '50%', 6, 9),
(11, 244, 'Southbound', 'Truck', 10.35, 8.05, 'N', '0%', 4, 9),
(23, 58, 'Northbound', 'Motorcycle', 2.50, 1.30, 'Y', '50%', 5, 10),
(9, 392, 'Southbound', 'Other', 3.85, 2.20, 'N', '0%', 10, 3),
(26, 17, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(3, 476, 'Southbound', 'Car', 3.90, 2.00, 'N', '0%', 6, 9),
(22, 220, 'Northbound', 'Truck', 10.10, 7.90, 'Y', '50%', 4, 10),
(7, 350, 'Southbound', 'Motorcycle', 2.60, 1.40, 'N', '0%', 7, 10),
(23, 312, 'Northbound', 'Car', 4.05, 2.40, 'Y', '50%', 5, 10),
(26, 89, 'Southbound', 'Truck', 10.00, 8.00, 'N', '0%', 3, 9),
(22, 498, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(13, 72, 'Southbound', 'Other', 3.75, 2.10, 'N', '0%', 10, 3),
(23, 126, 'Northbound', 'Motorcycle', 2.45, 1.35, 'Y', '50%', 5, 9),
(26, 311, 'Southbound', 'Car', 4.15, 2.25, 'N', '0%', 6, 10),
(22, 200, 'Northbound', 'Truck', 9.90, 7.85, 'Y', '50%', 4, 10),
(17, 141, 'Southbound', 'Motorcycle', 2.55, 1.50, 'N', '0%', 5, 9),
(23, 15, 'Northbound', 'Car', 3.95, 2.15, 'Y', '50%', 5, 9),
(26, 264, 'Southbound', 'Truck', 10.25, 8.10, 'N', '0%', 4, 9),
(22, 198, 'Northbound', 'Other', 3.85, 2.30, 'Y', '50%', 6, 10),
(4, 367, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 201, 'Northbound', 'Car', 3.90, 2.10, 'Y', '50%', 6, 9),
(11, 87, 'Southbound', 'Truck', 10.25, 8.10, 'N', '0%', 4, 9),
(23, 422, 'Northbound', 'Motorcycle', 2.35, 1.35, 'Y', '50%', 5, 10),
(19, 308, 'Southbound', 'Other', 3.85, 2.15, 'N', '0%', 10, 3),
(26, 244, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(6, 319, 'Southbound', 'Car', 3.95, 2.30, 'N', '0%', 6, 9),
(22, 153, 'Northbound', 'Truck', 10.15, 8.05, 'Y', '50%', 4, 10),
(8, 199, 'Southbound', 'Motorcycle', 2.60, 1.50, 'N', '0%', 7, 10),
(23, 47, 'Northbound', 'Car', 3.80, 2.10, 'Y', '50%', 5, 9),
(26, 346, 'Southbound', 'Truck', 10.30, 8.20, 'N', '0%', 3, 10),
(22, 401, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(4, 97, 'Southbound', 'Other', 3.70, 2.00, 'N', '0%', 9, 2),
(23, 374, 'Northbound', 'Motorcycle', 2.45, 1.40, 'Y', '50%', 6, 10),
(26, 78, 'Southbound', 'Car', 4.05, 2.25, 'N', '0%', 5, 10),
(22, 313, 'Northbound', 'Truck', 10.05, 7.85, 'Y', '50%', 4, 9),
(13, 142, 'Southbound', 'Motorcycle', 2.55, 1.45, 'N', '0%', 6, 10),
(23, 329, 'Northbound', 'Car', 4.10, 2.40, 'Y', '50%', 5, 9),
(26, 291, 'Southbound', 'Truck', 10.10, 8.00, 'N', '0%', 3, 10),
(22, 118, 'Northbound', 'Other', 3.85, 2.20, 'Y', '50%', 6, 10),
(17, 215, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 93, 'Northbound', 'Car', 3.95, 2.25, 'Y', '50%', 5, 9),
(26, 125, 'Southbound', 'Motorcycle', 2.65, 1.55, 'N', '0%', 7, 10),
(22, 262, 'Northbound', 'Car', 4.00, 2.30, 'Y', '50%', 6, 10),
(9, 167, 'Southbound', 'Truck', 10.00, 7.95, 'N', '0%', 4, 10),
(23, 229, 'Northbound', 'Motorcycle', 2.50, 1.35, 'Y', '50%', 5, 9),
(7, 275, 'Southbound', 'Other', 3.75, 2.10, 'N', '0%', 9, 3),
(26, 194, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(22, 382, 'Southbound', 'Car', 3.85, 2.20, 'N', '0%', 5, 9),
(23, 420, 'Northbound', 'Truck', 10.15, 8.10, 'Y', '50%', 4, 10),
(26, 184, 'Southbound', 'Motorcycle', 2.30, 1.20, 'N', '0%', 6, 10),
(22, 308, 'Northbound', 'Car', 4.10, 2.25, 'Y', '50%', 6, 9),
(11, 462, 'Southbound', 'Truck', 10.05, 7.90, 'N', '0%', 4, 9),
(23, 159, 'Northbound', 'Motorcycle', 2.20, 1.30, 'Y', '50%', 5, 10),
(6, 182, 'Southbound', 'Car', 3.90, 2.15, 'N', '0%', 6, 10),
(26, 78, 'Northbound', 'Other', 3.75, 2.00, 'Y', '50%', 6, 10),
(22, 249, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 123, 'Northbound', 'Car', 4.15, 2.35, 'Y', '50%', 5, 10),
(26, 497, 'Southbound', 'Truck', 10.25, 8.15, 'N', '0%', 3, 9),
(22, 186, 'Northbound', 'Motorcycle', 2.55, 1.45, 'Y', '50%', 6, 9),
(3, 107, 'Southbound', 'Truck', 10.20, 8.00, 'N', '0%', 4, 10),
(23, 252, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(26, 72, 'Southbound', 'Car', 3.95, 2.15, 'N', '0%', 6, 10),
(22, 135, 'Northbound', 'Truck', 10.10, 8.00, 'Y', '50%', 4, 10),
(5, 409, 'Southbound', 'Motorcycle', 2.60, 1.50, 'N', '0%', 6, 10),
(23, 374, 'Northbound', 'Car', 4.05, 2.30, 'Y', '50%', 5, 9),
(26, 136, 'Southbound', 'Truck', 10.25, 8.10, 'N', '0%', 3, 9),
(22, 491, 'Northbound', 'Other', 3.85, 2.25, 'Y', '50%', 6, 10),
(12, 281, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 33, 'Northbound', 'Motorcycle', 2.45, 1.35, 'Y', '50%', 5, 10),
(26, 256, 'Southbound', 'Car', 4.20, 2.50, 'N', '0%', 6, 10);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 316, 'Northbound', 'Car', 4.05, 2.20, 'Y', '50%', 6, 9),
(14, 287, 'Southbound', 'Truck', 10.40, 8.10, 'N', '0%', 4, 10),
(23, 102, 'Northbound', 'Motorcycle', 2.55, 1.40, 'Y', '50%', 5, 10),
(9, 401, 'Southbound', 'Other', 3.85, 2.00, 'N', '0%', 10, 3),
(26, 190, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(5, 486, 'Southbound', 'Car', 3.95, 2.25, 'N', '0%', 6, 9),
(22, 47, 'Northbound', 'Truck', 10.10, 7.85, 'Y', '50%', 4, 10),
(19, 267, 'Southbound', 'Motorcycle', 2.50, 1.45, 'N', '0%', 7, 10),
(23, 322, 'Northbound', 'Car', 3.80, 2.15, 'Y', '50%', 5, 9),
(26, 108, 'Southbound', 'Truck', 10.20, 8.00, 'N', '0%', 4, 10),
(22, 390, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(4, 56, 'Southbound', 'Other', 3.75, 2.05, 'N', '0%', 9, 3),
(23, 214, 'Northbound', 'Motorcycle', 2.40, 1.35, 'Y', '50%', 6, 10),
(26, 87, 'Southbound', 'Car', 4.15, 2.35, 'N', '0%', 5, 10),
(22, 242, 'Northbound', 'Truck', 9.95, 7.80, 'Y', '50%', 4, 9),
(17, 365, 'Southbound', 'Motorcycle', 2.65, 1.55, 'N', '0%', 6, 9),
(23, 89, 'Northbound', 'Car', 3.85, 2.10, 'Y', '50%', 5, 9),
(26, 313, 'Southbound', 'Truck', 10.25, 8.20, 'N', '0%', 3, 10),
(22, 78, 'Northbound', 'Other', 3.95, 2.30, 'Y', '50%', 6, 10),
(3, 169, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 304, 'Northbound', 'Car', 4.00, 2.25, 'Y', '50%', 5, 9),
(26, 132, 'Southbound', 'Motorcycle', 2.60, 1.40, 'N', '0%', 6, 10),
(22, 260, 'Northbound', 'Car', 4.10, 2.25, 'Y', '50%', 6, 10),
(18, 177, 'Southbound', 'Truck', 10.00, 7.90, 'N', '0%', 4, 10),
(23, 415, 'Northbound', 'Motorcycle', 2.20, 1.30, 'Y', '50%', 5, 9),
(10, 332, 'Southbound', 'Car', 3.90, 2.10, 'N', '0%', 6, 9),
(26, 98, 'Northbound', 'Other', 3.75, 2.05, 'Y', '50%', 6, 10),
(22, 271, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 120, 'Northbound', 'Car', 3.95, 2.20, 'Y', '50%', 5, 9),
(26, 462, 'Southbound', 'Truck', 10.10, 7.95, 'N', '0%', 3, 9),
(22, 358, 'Northbound', 'Motorcycle', 2.55, 1.45, 'Y', '50%', 6, 10),
(5, 236, 'Southbound', 'Truck', 10.20, 8.10, 'N', '0%', 4, 10),
(23, 401, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(26, 310, 'Southbound', 'Car', 4.20, 2.40, 'N', '0%', 6, 10),
(22, 140, 'Northbound', 'Truck', 10.05, 7.80, 'Y', '50%', 4, 10),
(6, 321, 'Southbound', 'Motorcycle', 2.50, 1.50, 'N', '0%', 6, 10),
(23, 268, 'Northbound', 'Car', 4.05, 2.35, 'Y', '50%', 5, 9),
(26, 221, 'Southbound', 'Truck', 10.30, 8.15, 'N', '0%', 4, 10),
(22, 124, 'Northbound', 'Other', 3.85, 2.25, 'Y', '50%', 6, 10),
(9, 466, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 97, 'Northbound', 'Motorcycle', 2.45, 1.35, 'Y', '50%', 5, 10),
(26, 172, 'Southbound', 'Car', 3.95, 2.15, 'N', '0%', 6, 9),
(22, 207, 'Northbound', 'Truck', 10.15, 8.05, 'Y', '50%', 4, 10),
(13, 336, 'Southbound', 'Motorcycle', 2.65, 1.55, 'N', '0%', 5, 10),
(23, 107, 'Northbound', 'Car', 4.00, 2.30, 'Y', '50%', 5, 9),
(26, 441, 'Southbound', 'Truck', 10.25, 8.00, 'N', '0%', 4, 9),
(22, 379, 'Northbound', 'Other', 3.90, 2.30, 'Y', '50%', 6, 10),
(4, 109, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 109, 'Northbound', 'Car', 4.10, 2.30, 'Y', '50%', 6, 9),
(14, 306, 'Southbound', 'Truck', 10.40, 8.10, 'N', '0%', 4, 10),
(23, 437, 'Northbound', 'Motorcycle', 2.50, 1.30, 'Y', '50%', 5, 10),
(5, 312, 'Southbound', 'Other', 3.85, 2.00, 'N', '0%', 10, 3),
(26, 268, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(6, 341, 'Southbound', 'Car', 3.90, 2.25, 'N', '0%', 6, 9),
(22, 190, 'Northbound', 'Truck', 10.05, 7.85, 'Y', '50%', 4, 10),
(8, 213, 'Southbound', 'Motorcycle', 2.55, 1.40, 'N', '0%', 7, 10),
(23, 483, 'Northbound', 'Car', 3.95, 2.15, 'Y', '50%', 5, 9),
(26, 132, 'Southbound', 'Truck', 10.20, 8.10, 'N', '0%', 3, 10),
(22, 60, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(12, 94, 'Southbound', 'Other', 3.70, 2.10, 'N', '0%', 10, 3),
(23, 497, 'Northbound', 'Motorcycle', 2.35, 1.35, 'Y', '50%', 6, 10),
(26, 83, 'Southbound', 'Car', 4.10, 2.40, 'N', '0%', 5, 10),
(22, 206, 'Northbound', 'Truck', 10.15, 8.00, 'Y', '50%', 4, 10),
(13, 78, 'Southbound', 'Motorcycle', 2.45, 1.45, 'N', '0%', 6, 10),
(23, 391, 'Northbound', 'Car', 4.00, 2.25, 'Y', '50%', 5, 9),
(26, 300, 'Southbound', 'Truck', 10.10, 7.90, 'N', '0%', 4, 10),
(22, 417, 'Northbound', 'Other', 3.85, 2.15, 'Y', '50%', 6, 10),
(17, 164, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 118, 'Northbound', 'Car', 3.85, 2.10, 'Y', '50%', 5, 9),
(26, 250, 'Southbound', 'Motorcycle', 2.60, 1.50, 'N', '0%', 6, 10),
(22, 328, 'Northbound', 'Car', 4.10, 2.30, 'Y', '50%', 6, 10),
(9, 72, 'Southbound', 'Truck', 10.00, 7.80, 'N', '0%', 4, 10),
(23, 351, 'Northbound', 'Motorcycle', 2.40, 1.30, 'Y', '50%', 5, 9),
(7, 298, 'Southbound', 'Car', 3.95, 2.20, 'N', '0%', 6, 10),
(26, 158, 'Northbound', 'Other', 3.75, 2.00, 'Y', '50%', 6, 10),
(22, 181, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 392, 'Northbound', 'Car', 3.90, 2.15, 'Y', '50%', 5, 9),
(26, 144, 'Southbound', 'Truck', 10.30, 8.15, 'N', '0%', 3, 10),
(22, 252, 'Northbound', 'Motorcycle', 2.55, 1.45, 'Y', '50%', 6, 9),
(10, 487, 'Southbound', 'Truck', 10.10, 7.95, 'N', '0%', 4, 10),
(23, 135, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(26, 358, 'Southbound', 'Car', 4.15, 2.35, 'N', '0%', 6, 10),
(22, 198, 'Northbound', 'Truck', 10.05, 7.90, 'Y', '50%', 4, 10),
(4, 316, 'Southbound', 'Motorcycle', 2.50, 1.50, 'N', '0%', 6, 10),
(23, 453, 'Northbound', 'Car', 4.05, 2.30, 'Y', '50%', 5, 9),
(26, 229, 'Southbound', 'Truck', 10.25, 8.05, 'N', '0%', 4, 10),
(22, 74, 'Northbound', 'Other', 3.90, 2.20, 'Y', '50%', 6, 10),
(6, 209, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 343, 'Northbound', 'Motorcycle', 2.45, 1.35, 'Y', '50%', 5, 10),
(26, 393, 'Southbound', 'Car', 4.00, 2.25, 'N', '0%', 6, 9),
(22, 196, 'Northbound', 'Truck', 10.20, 8.00, 'Y', '50%', 4, 10),
(15, 222, 'Southbound', 'Motorcycle', 2.65, 1.55, 'N', '0%', 6, 10),
(23, 280, 'Northbound', 'Car', 4.00, 2.30, 'Y', '50%', 5, 9),
(26, 488, 'Southbound', 'Truck', 10.20, 8.10, 'N', '0%', 4, 10),
(22, 145, 'Northbound', 'Other', 3.80, 2.15, 'Y', '50%', 6, 10),
(19, 170, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 261, 'Northbound', 'Motorcycle', 2.55, 1.45, 'Y', '50%', 5, 10),
(26, 214, 'Southbound', 'Car', 4.05, 2.30, 'N', '0%', 6, 10);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 437, 'Northbound', 'Car', 4.10, 2.30, 'Y', '50%', 6, 9),
(7, 168, 'Southbound', 'Truck', 10.20, 8.00, 'N', '0%', 4, 10),
(23, 201, 'Northbound', 'Motorcycle', 2.50, 1.30, 'Y', '50%', 5, 10),
(4, 267, 'Southbound', 'Other', 3.85, 2.00, 'N', '0%', 10, 3),
(26, 378, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(15, 459, 'Southbound', 'Car', 4.00, 2.10, 'N', '0%', 6, 9),
(22, 302, 'Northbound', 'Truck', 10.05, 7.85, 'Y', '50%', 4, 10),
(8, 170, 'Southbound', 'Motorcycle', 2.60, 1.45, 'N', '0%', 6, 10),
(23, 198, 'Northbound', 'Car', 3.95, 2.20, 'Y', '50%', 5, 10),
(26, 305, 'Southbound', 'Truck', 10.10, 7.90, 'N', '0%', 3, 10),
(22, 411, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(13, 115, 'Southbound', 'Other', 3.80, 2.10, 'N', '0%', 9, 3),
(23, 86, 'Northbound', 'Motorcycle', 2.35, 1.30, 'Y', '50%', 6, 10),
(26, 222, 'Southbound', 'Car', 4.05, 2.30, 'N', '0%', 5, 10),
(22, 462, 'Northbound', 'Truck', 10.15, 8.05, 'Y', '50%', 4, 9),
(19, 311, 'Southbound', 'Motorcycle', 2.55, 1.50, 'N', '0%', 6, 9),
(23, 494, 'Northbound', 'Car', 4.10, 2.25, 'Y', '50%', 5, 9),
(26, 167, 'Southbound', 'Truck', 10.30, 8.10, 'N', '0%', 4, 10),
(22, 138, 'Northbound', 'Other', 3.90, 2.25, 'Y', '50%', 6, 10),
(5, 398, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 75, 'Northbound', 'Car', 3.85, 2.15, 'Y', '50%', 5, 9),
(26, 275, 'Southbound', 'Motorcycle', 2.65, 1.55, 'N', '0%', 6, 10),
(22, 160, 'Northbound', 'Car', 4.00, 2.30, 'Y', '50%', 6, 10),
(11, 341, 'Southbound', 'Truck', 10.00, 7.80, 'N', '0%', 4, 10),
(23, 254, 'Northbound', 'Motorcycle', 2.40, 1.30, 'Y', '50%', 5, 9),
(10, 186, 'Southbound', 'Car', 3.95, 2.15, 'N', '0%', 6, 9),
(26, 293, 'Northbound', 'Other', 3.75, 2.00, 'Y', '50%', 6, 10),
(22, 121, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 216, 'Northbound', 'Car', 4.05, 2.35, 'Y', '50%', 5, 10),
(26, 146, 'Southbound', 'Truck', 10.10, 7.95, 'N', '0%', 3, 10),
(22, 352, 'Northbound', 'Motorcycle', 2.55, 1.45, 'Y', '50%', 6, 9),
(7, 175, 'Southbound', 'Truck', 10.25, 8.15, 'N', '0%', 4, 9),
(23, 123, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(26, 299, 'Southbound', 'Car', 4.00, 2.20, 'N', '0%', 6, 10),
(22, 206, 'Northbound', 'Truck', 10.05, 7.85, 'Y', '50%', 4, 10),
(3, 153, 'Southbound', 'Motorcycle', 2.50, 1.40, 'N', '0%', 5, 9),
(23, 419, 'Northbound', 'Car', 4.00, 2.30, 'Y', '50%', 5, 9),
(26, 195, 'Southbound', 'Truck', 10.20, 8.00, 'N', '0%', 3, 10),
(22, 96,  'Northbound', 'Other', 3.80, 2.10, 'Y', '50%', 6, 10),
(6, 285, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 104, 'Northbound', 'Motorcycle', 2.45, 1.35, 'Y', '50%', 5, 10),
(26, 281, 'Southbound', 'Car', 4.15, 2.40, 'N', '0%', 6, 10),
(22, 175, 'Northbound', 'Truck', 10.10, 8.00, 'Y', '50%', 4, 10),
(14, 126, 'Southbound', 'Motorcycle', 2.55, 1.45, 'N', '0%', 6, 10),
(23, 313, 'Northbound', 'Car', 4.05, 2.35, 'Y', '50%', 5, 9),
(26, 434, 'Southbound', 'Truck', 10.00, 7.95, 'N', '0%', 3, 9),
(22, 327, 'Northbound', 'Other', 3.90, 2.20, 'Y', '50%', 6, 10),
(8, 251, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 157, 'Northbound', 'Motorcycle', 2.50, 1.30, 'Y', '50%', 5, 10),
(26, 367, 'Southbound', 'Car', 4.10, 2.30, 'N', '0%', 6, 9);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 298, 'Northbound', 'Car', 4.10, 2.25, 'Y', '50%', 6, 9),
(6, 141, 'Southbound', 'Truck', 10.25, 8.05, 'N', '0%', 4, 10),
(23, 473, 'Northbound', 'Motorcycle', 2.40, 1.35, 'Y', '50%', 5, 10),
(17, 99, 'Southbound', 'Other', 3.80, 2.00, 'N', '0%', 10, 3),
(26, 410, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(13, 387, 'Southbound', 'Car', 3.95, 2.20, 'N', '0%', 6, 9),
(22, 214, 'Northbound', 'Truck', 10.05, 7.90, 'Y', '50%', 4, 10),
(10, 277, 'Southbound', 'Motorcycle', 2.55, 1.50, 'N', '0%', 7, 10),
(23, 354, 'Northbound', 'Car', 4.00, 2.30, 'Y', '50%', 5, 9),
(26, 116, 'Southbound', 'Truck', 10.10, 8.00, 'N', '0%', 3, 10),
(22, 111, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(19, 308, 'Southbound', 'Other', 3.70, 2.05, 'N', '0%', 9, 3),
(23, 157, 'Northbound', 'Motorcycle', 2.45, 1.35, 'Y', '50%', 6, 10),
(26, 243, 'Southbound', 'Car', 4.10, 2.25, 'N', '0%', 5, 10),
(22, 189, 'Northbound', 'Truck', 10.00, 7.85, 'Y', '50%', 4, 10),
(14, 411, 'Southbound', 'Motorcycle', 2.60, 1.40, 'N', '0%', 6, 9),
(23, 275, 'Northbound', 'Car', 3.90, 2.10, 'Y', '50%', 5, 10),
(26, 371, 'Southbound', 'Truck', 10.25, 8.10, 'N', '0%', 4, 10),
(22, 97,  'Northbound', 'Other', 3.85, 2.25, 'Y', '50%', 6, 10),
(12, 104, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 484, 'Northbound', 'Car', 4.15, 2.35, 'Y', '50%', 5, 9),
(26, 316, 'Southbound', 'Motorcycle', 2.65, 1.55, 'N', '0%', 7, 10),
(22, 58,  'Northbound', 'Car', 4.00, 2.30, 'Y', '50%', 6, 9),
(3, 266,  'Southbound', 'Truck', 10.20, 8.05, 'N', '0%', 4, 10),
(23, 141, 'Northbound', 'Motorcycle', 2.55, 1.45, 'Y', '50%', 5, 10),
(7, 295,  'Southbound', 'Car', 3.85, 2.15, 'N', '0%', 6, 9),
(26, 382, 'Northbound', 'Other', 3.90, 2.10, 'Y', '50%', 6, 10),
(22, 456, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 191, 'Northbound', 'Car', 3.95, 2.20, 'Y', '50%', 5, 9),
(26, 160, 'Southbound', 'Truck', 10.30, 8.20, 'N', '0%', 4, 9),
(22, 142, 'Northbound', 'Motorcycle', 2.50, 1.40, 'Y', '50%', 6, 10),
(9, 443,  'Southbound', 'Truck', 10.05, 7.90, 'N', '0%', 4, 10),
(23, 102, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(26, 465, 'Southbound', 'Car', 4.05, 2.25, 'N', '0%', 5, 10),
(22, 294, 'Northbound', 'Truck', 10.15, 8.05, 'Y', '50%', 4, 10),
(6, 337,  'Southbound', 'Motorcycle', 2.45, 1.35, 'N', '0%', 6, 10),
(23, 238, 'Northbound', 'Car', 4.05, 2.30, 'Y', '50%', 5, 9),
(26, 427, 'Southbound', 'Truck', 10.10, 7.95, 'N', '0%', 3, 10),
(22, 356, 'Northbound', 'Other', 3.75, 2.00, 'Y', '50%', 6, 10),
(5, 285,  'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 130, 'Northbound', 'Motorcycle', 2.60, 1.50, 'Y', '50%', 5, 10),
(26, 275, 'Southbound', 'Car', 3.95, 2.20, 'N', '0%', 6, 9),
(22, 187, 'Northbound', 'Truck', 10.05, 7.85, 'Y', '50%', 4, 10),
(11, 258, 'Southbound', 'Motorcycle', 2.55, 1.45, 'N', '0%', 6, 9),
(23, 326, 'Northbound', 'Car', 3.85, 2.15, 'Y', '50%', 5, 9),
(26, 419, 'Southbound', 'Truck', 10.15, 8.10, 'N', '0%', 4, 10),
(22, 235, 'Northbound', 'Other', 3.90, 2.30, 'Y', '50%', 6, 10),
(13, 397, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 223, 'Northbound', 'Motorcycle', 2.50, 1.30, 'Y', '50%', 5, 9),
(26, 172, 'Southbound', 'Car', 4.10, 2.30, 'N', '0%', 6, 10);

INSERT INTO tunnel_charges (tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(22, 398, 'Northbound', 'Car', 4.00, 2.20, 'Y', '50%', 6, 9),
(5, 261, 'Southbound', 'Truck', 10.10, 7.90, 'N', '0%', 4, 10),
(23, 352, 'Northbound', 'Motorcycle', 2.45, 1.30, 'Y', '50%', 5, 10),
(4, 147, 'Southbound', 'Other', 3.80, 2.00, 'N', '0%', 10, 3),
(26, 232, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(7, 426, 'Southbound', 'Car', 3.95, 2.15, 'N', '0%', 6, 9),
(22, 349, 'Northbound', 'Truck', 10.05, 8.05, 'Y', '50%', 4, 9),
(10, 118, 'Southbound', 'Motorcycle', 2.55, 1.50, 'N', '0%', 6, 10),
(23, 302, 'Northbound', 'Car', 4.10, 2.30, 'Y', '50%', 5, 9),
(26, 176, 'Southbound', 'Truck', 10.15, 8.10, 'N', '0%', 3, 10),
(22, 116, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(13, 173, 'Southbound', 'Other', 3.70, 2.05, 'N', '0%', 9, 3),
(23, 269, 'Northbound', 'Motorcycle', 2.35, 1.40, 'Y', '50%', 6, 10),
(26, 145, 'Southbound', 'Car', 4.00, 2.20, 'N', '0%', 5, 10),
(22, 412, 'Northbound', 'Truck', 10.20, 8.00, 'Y', '50%', 4, 10),
(15, 195, 'Southbound', 'Motorcycle', 2.65, 1.55, 'N', '0%', 6, 10),
(23, 411, 'Northbound', 'Car', 3.90, 2.10, 'Y', '50%', 5, 9),
(26, 304, 'Southbound', 'Truck', 10.00, 7.85, 'N', '0%', 4, 10),
(22, 161, 'Northbound', 'Other', 3.85, 2.25, 'Y', '50%', 6, 10),
(17, 135, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 105, 'Northbound', 'Car', 3.95, 2.25, 'Y', '50%', 5, 10),
(26, 351, 'Southbound', 'Motorcycle', 2.50, 1.45, 'N', '0%', 6, 9),
(22, 268, 'Northbound', 'Car', 4.05, 2.30, 'Y', '50%', 6, 10),
(6, 200, 'Southbound', 'Truck', 10.25, 8.10, 'N', '0%', 4, 10),
(23, 321, 'Northbound', 'Motorcycle', 2.60, 1.50, 'Y', '50%', 5, 9),
(26, 389, 'Southbound', 'Car', 3.90, 2.15, 'N', '0%', 6, 10),
(22, 390, 'Northbound', 'Truck', 10.10, 7.95, 'Y', '50%', 4, 10),
(12, 464, 'Southbound', 'Motorcycle', 2.55, 1.45, 'N', '0%', 6, 10),
(23, 222, 'Northbound', 'Car', 4.00, 2.30, 'Y', '50%', 5, 10),
(26, 205, 'Southbound', 'Truck', 10.30, 8.20, 'N', '0%', 3, 9),
(22, 356, 'Northbound', 'Other', 3.90, 2.25, 'Y', '50%', 6, 10),
(3, 318, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 187, 'Northbound', 'Motorcycle', 2.45, 1.35, 'Y', '50%', 5, 10),
(26, 149, 'Southbound', 'Car', 4.15, 2.40, 'N', '0%', 6, 10),
(22, 223, 'Northbound', 'Truck', 10.05, 7.90, 'Y', '50%', 4, 10),
(9, 109, 'Southbound', 'Motorcycle', 2.50, 1.50, 'N', '0%', 6, 9),
(23, 204, 'Northbound', 'Car', 4.05, 2.35, 'Y', '50%', 5, 10),
(26, 115, 'Southbound', 'Truck', 10.10, 8.00, 'N', '0%', 4, 10),
(22, 405, 'Northbound', 'Other', 3.80, 2.20, 'Y', '50%', 6, 10),
(8, 329, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(23, 326, 'Northbound', 'Motorcycle', 2.50, 1.30, 'Y', '50%', 5, 10),
(26, 273, 'Southbound', 'Car', 4.00, 2.20, 'N', '0%', 6, 10),
(22, 178, 'Northbound', 'Truck', 10.15, 8.10, 'Y', '50%', 4, 10),
(11, 243, 'Southbound', 'Motorcycle', 2.60, 1.55, 'N', '0%', 6, 10),
(23, 381, 'Northbound', 'Car', 4.05, 2.35, 'Y', '50%', 5, 9),
(26, 312, 'Southbound', 'Truck', 10.10, 7.90, 'N', '0%', 3, 10),
(22, 108, 'Northbound', 'Other', 3.95, 2.30, 'Y', '50%', 6, 10),
(20, 480, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0);



##### I have noticed the charge_id has skipped from 26 to 53, I’m filling the gap now:

  INSERT INTO tunnel_charges (charge_id, tunnel_id, user_id, direction, vehicle_type, peak_fee, off_peak_fee, discount_applicable, discount_applied, peak_start, peak_end) VALUES
(27, 22, 148, 'Northbound', 'Car', 4.05, 2.25, 'Y', '50%', 6, 9),
(28, 7, 311, 'Southbound', 'Truck', 10.15, 8.10, 'N', '0%', 4, 10),
(29, 23, 129, 'Northbound', 'Motorcycle', 2.50, 1.40, 'Y', '50%', 5, 10),
(30, 5, 420, 'Southbound', 'Other', 3.90, 2.10, 'N', '0%', 9, 3),
(31, 26, 244, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(32, 3, 187, 'Southbound', 'Car', 3.85, 2.15, 'N', '0%', 6, 9),
(33, 22, 302, 'Northbound', 'Truck', 10.25, 8.00, 'Y', '50%', 4, 10),
(34, 17, 361, 'Southbound', 'Motorcycle', 2.60, 1.50, 'N', '0%', 7, 10),
(35, 23, 98, 'Northbound', 'Car', 4.10, 2.30, 'Y', '50%', 5, 9),
(36, 26, 219, 'Southbound', 'Truck', 10.05, 7.95, 'N', '0%', 3, 10),
(37, 22, 156, 'Northbound', 'Bus', 0.00, 0.00, 'Y', '100%', 0, 0),
(38, 14, 414, 'Southbound', 'Other', 3.80, 2.05, 'N', '0%', 10, 2),
(39, 23, 174, 'Northbound', 'Motorcycle', 2.55, 1.35, 'Y', '50%', 6, 10),
(40, 26, 185, 'Southbound', 'Car', 3.95, 2.25, 'N', '0%', 5, 10),
(41, 22, 193, 'Northbound', 'Truck', 10.10, 7.85, 'Y', '50%', 4, 10),
(42, 12, 367, 'Southbound', 'Motorcycle', 2.45, 1.45, 'N', '0%', 6, 9),
(43, 23, 311, 'Northbound', 'Car', 4.05, 2.35, 'Y', '50%', 5, 10),
(44, 26, 284, 'Southbound', 'Truck', 10.30, 8.10, 'N', '0%', 4, 10),
(45, 22, 199, 'Northbound', 'Other', 3.85, 2.20, 'Y', '50%', 6, 10),
(46, 4, 273, 'Southbound', 'Bus', 0.00, 0.00, 'N', '0%', 0, 0),
(47, 23, 415, 'Northbound', 'Car', 4.00, 2.25, 'Y', '50%', 5, 9),
(48, 6, 176, 'Southbound', 'Motorcycle', 2.60, 1.40, 'N', '0%', 6, 10),
(49, 26, 349, 'Northbound', 'Truck', 10.15, 8.05, 'Y', '50%', 4, 10),
(50, 15, 124, 'Southbound', 'Car', 3.90, 2.10, 'N', '0%', 6, 9),
(51, 22, 140, 'Northbound', 'Motorcycle', 2.50, 1.30, 'Y', '50%', 6, 10),
(52, 10, 298, 'Southbound', 'Truck', 10.00, 7.90, 'N', '0%', 4, 10);

Now test:
SELECT COUNT(*) FROM tunnel_charges; # everything is fine

#### Now more into transaction table:
I did not use these as its not letting me to . I will populate all the tables first. Then will be back here.
INSERT INTO transactions (user_id, charge_id) VALUES
(102, 27),
(45, 28),
(376, 29),
(88, 30),
(207, 31),
(219, 32),
(11, 33),
(492, 34),
(325, 35),
(164, 36),
(119, 37),
(310, 38),
(205, 39),
(301, 40),
(238, 41),
(72, 42),
(99, 43),
(187, 44),
(276, 45),
(401, 46),
(508, 47),
(199, 48),
(4, 49),
(60, 50),
(423, 51),
(250, 52),
(47, 53),
(97, 54),
(181, 55),
(318, 56),
(7, 57),
(284, 58),
(376, 59),
(85, 60),
(172, 61),
(111, 62),
(437, 63),
(303, 64),
(149, 65),
(91, 66),
(250, 67),
(186, 68),
(70, 69),
(409, 70),
(90, 71),
(365, 72),
(124, 73),
(221, 74),
(373, 75),
(67, 76);



#### Real time data table population with more data:

INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES

(22, 101, 88.50, 15.20, 'High'),
(23, 102, 75.30, 21.50, 'High'),
(25, 103, 60.00, 27.80, 'Moderate'),
(26, 104, 92.10, 13.60, 'High'),
(22, 105, 47.80, 34.70, 'Moderate'),
(23, 106, 53.40, 30.20, 'Moderate'),
(25, 107, 66.60, 25.50, 'High'),
(26, 108, 80.90, 19.40, 'High'),

(1, 109, 20.30, 59.00, 'Low'),
(3, 110, 34.60, 42.10, 'Moderate'),
(5, 111, 10.20, 70.40, 'Low'),
(7, 112, 49.90, 33.30, 'Moderate'),
(9, 113, 56.80, 29.00, 'Moderate'),
(11, 114, 73.10, 22.50, 'High'),
(13, 115, 65.70, 26.40, 'High'),
(15, 116, 13.90, 68.90, 'Low'),
(17, 117, 58.60, 30.00, 'Moderate'),
(19, 118, 9.40, 76.30, 'Low'),
(21, 119, 39.20, 37.70, 'Moderate'),
(24, 120, 70.30, 23.80, 'High'),

(22, 121, 77.70, 20.20, 'High'),
(23, 122, 62.50, 26.00, 'High'),
(25, 123, 59.40, 28.90, 'Moderate'),
(26, 124, 85.60, 18.30, 'High'),
(22, 125, 44.10, 35.10, 'Moderate'),
(23, 126, 51.80, 31.20, 'Moderate'),
(25, 127, 68.70, 24.60, 'High'),
(26, 128, 91.50, 14.20, 'High'),

(2, 129, 17.60, 63.50, 'Low'),
(4, 130, 42.30, 39.10, 'Moderate'),
(6, 131, 48.90, 33.80, 'Moderate'),
(8, 132, 55.70, 28.10, 'Moderate'),
(10, 133, 69.40, 23.20, 'High'),
(12, 134, 38.20, 36.30, 'Moderate'),
(14, 135, 15.40, 67.20, 'Low'),
(16, 136, 61.30, 26.90, 'High'),
(18, 137, 11.70, 71.60, 'Low'),
(20, 138, 45.60, 34.20, 'Moderate'),

(22, 139, 83.10, 17.00, 'High'),
(23, 140, 67.40, 25.80, 'High'),
(25, 141, 64.90, 27.30, 'Moderate'),
(26, 142, 89.80, 16.50, 'High'),
(22, 143, 40.10, 36.00, 'Moderate'),
(23, 144, 52.00, 30.70, 'Moderate'),
(25, 145, 70.20, 22.10, 'High'),
(26, 146, 86.90, 18.90, 'High'),
(22, 147, 46.80, 32.60, 'Moderate'),
(23, 148, 60.50, 27.00, 'Moderate'),
(25, 149, 55.10, 29.40, 'Moderate'),
(26, 150, 94.30, 12.40, 'High');

INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES
(22, 151, 89.20, 14.90, 'High'),
(23, 152, 76.40, 22.80, 'High'),
(25, 153, 61.00, 27.50, 'Moderate'),
(26, 154, 93.50, 13.20, 'High'),
(22, 155, 45.30, 34.10, 'Moderate'),
(23, 156, 54.90, 30.10, 'Moderate'),
(25, 157, 67.80, 24.20, 'High'),
(26, 158, 81.40, 20.00, 'High'),
(1, 159, 19.70, 62.30, 'Low'),
(2, 160, 35.50, 40.50, 'Moderate'),
(3, 161, 11.40, 72.80, 'Low'),
(4, 162, 51.70, 31.60, 'Moderate'),
(5, 163, 58.30, 29.90, 'Moderate'),
(6, 164, 74.60, 23.70, 'High'),
(7, 165, 66.40, 25.30, 'High'),
(8, 166, 12.10, 69.90, 'Low'),
(9, 167, 59.50, 28.70, 'Moderate'),
(10, 168, 10.50, 77.50, 'Low'),
(11, 169, 38.40, 36.90, 'Moderate'),
(12, 170, 71.10, 22.00, 'High'),
(22, 171, 78.50, 20.40, 'High'),
(23, 172, 63.10, 26.20, 'High'),
(25, 173, 60.70, 28.10, 'Moderate'),
(26, 174, 86.80, 19.30, 'High'),
(22, 175, 43.60, 35.90, 'Moderate'),
(23, 176, 52.30, 32.10, 'Moderate'),
(25, 177, 69.80, 23.40, 'High'),
(26, 178, 90.70, 15.60, 'High'),
(13, 179, 16.90, 65.70, 'Low'),
(14, 180, 41.50, 39.80, 'Moderate'),
(15, 181, 47.30, 33.40, 'Moderate'),
(16, 182, 56.10, 28.60, 'Moderate'),
(17, 183, 68.00, 24.10, 'High'),
(18, 184, 36.80, 38.50, 'Moderate'),
(19, 185, 14.30, 70.80, 'Low'),
(20, 186, 60.90, 27.90, 'Moderate'),
(21, 187, 8.90, 79.80, 'Low'),
(24, 188, 73.20, 21.70, 'High'),
(22, 189, 82.30, 18.10, 'High'),
(23, 190, 66.70, 25.90, 'High'),
(25, 191, 65.30, 27.70, 'Moderate'),
(26, 192, 88.10, 17.20, 'High'),
(22, 193, 42.80, 36.20, 'Moderate'),
(23, 194, 50.90, 31.90, 'Moderate'),
(25, 195, 71.70, 22.30, 'High'),
(26, 196, 87.60, 18.80, 'High'),
(22, 197, 48.10, 32.80, 'Moderate'),
(23, 198, 57.40, 29.20, 'Moderate'),
(25, 199, 53.60, 30.60, 'Moderate'),
(26, 200, 95.80, 11.70, 'High');

INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES
(22, 201, 87.40, 16.30, 'High'),
(23, 202, 72.90, 21.90, 'High'),
(25, 203, 63.20, 26.70, 'Moderate'),
(26, 204, 91.80, 13.40, 'High'),
(22, 205, 46.50, 33.90, 'Moderate'),
(23, 206, 50.80, 31.80, 'Moderate'),
(25, 207, 67.90, 24.90, 'High'),
(26, 208, 83.30, 19.60, 'High'),
(1, 209, 21.40, 61.50, 'Low'),
(2, 210, 36.30, 41.70, 'Moderate'),
(3, 211, 12.30, 70.60, 'Low'),
(4, 212, 49.20, 34.00, 'Moderate'),
(5, 213, 55.60, 30.10, 'Moderate'),
(6, 214, 72.20, 22.10, 'High'),
(7, 215, 65.10, 25.20, 'High'),
(8, 216, 14.80, 68.30, 'Low'),
(9, 217, 61.20, 27.40, 'Moderate'),
(10, 218, 11.30, 74.90, 'Low'),
(11, 219, 39.60, 37.80, 'Moderate'),
(12, 220, 75.40, 20.70, 'High'),
(22, 221, 79.60, 18.60, 'High'),
(23, 222, 64.20, 26.10, 'High'),
(25, 223, 62.40, 28.00, 'Moderate'),
(26, 224, 89.30, 17.50, 'High'),
(22, 225, 41.30, 36.10, 'Moderate'),
(23, 226, 53.90, 30.80, 'Moderate'),
(25, 227, 68.20, 24.10, 'High'),
(26, 228, 92.00, 14.70, 'High'),
(13, 229, 17.30, 66.20, 'Low'),
(14, 230, 44.80, 38.90, 'Moderate'),
(15, 231, 48.90, 33.60, 'Moderate'),
(16, 232, 57.30, 28.50, 'Moderate'),
(17, 233, 70.80, 23.10, 'High'),
(18, 234, 37.20, 39.40, 'Moderate'),
(19, 235, 13.60, 69.40, 'Low'),
(20, 236, 58.00, 28.80, 'Moderate'),
(21, 237, 9.80, 78.60, 'Low'),
(24, 238, 74.50, 21.30, 'High'),
(22, 239, 81.90, 17.30, 'High'),
(23, 240, 68.40, 26.90, 'High'),
(25, 241, 66.80, 27.60, 'Moderate'),
(26, 242, 90.10, 16.40, 'High'),
(22, 243, 43.80, 35.30, 'Moderate'),
(23, 244, 51.00, 32.50, 'Moderate'),
(25, 245, 73.90, 22.60, 'High'),
(26, 246, 85.70, 19.50, 'High'),
(22, 247, 47.20, 33.20, 'Moderate'),
(23, 248, 56.30, 29.30, 'Moderate'),
(25, 249, 58.20, 31.00, 'Moderate'),
(26, 250, 93.90, 12.90, 'High');

INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES
(22, 251, 88.60, 16.10, 'High'),
(23, 252, 71.80, 21.10, 'High'),
(25, 253, 62.30, 27.20, 'Moderate'),
(26, 254, 90.20, 14.20, 'High'),
(22, 255, 44.20, 34.60, 'Moderate'),
(23, 256, 52.10, 31.50, 'Moderate'),
(25, 257, 66.00, 25.10, 'High'),
(26, 258, 84.50, 19.80, 'High'),
(1, 259, 22.90, 60.80, 'Low'),
(2, 260, 37.00, 42.40, 'Moderate'),
(3, 261, 13.20, 69.80, 'Low'),
(4, 262, 50.60, 33.10, 'Moderate'),
(5, 263, 57.40, 30.50, 'Moderate'),
(6, 264, 73.60, 22.40, 'High'),
(7, 265, 64.80, 25.60, 'High'),
(8, 266, 15.00, 67.70, 'Low'),
(9, 267, 60.10, 28.40, 'Moderate'),
(10, 268, 10.90, 76.10, 'Low'),
(11, 269, 40.20, 37.40, 'Moderate'),
(12, 270, 74.10, 21.90, 'High'),
(22, 271, 80.00, 19.40, 'High'),
(23, 272, 65.50, 26.40, 'High'),
(25, 273, 61.60, 28.20, 'Moderate'),
(26, 274, 88.70, 17.30, 'High'),
(22, 275, 42.00, 36.40, 'Moderate'),
(23, 276, 55.20, 31.20, 'Moderate'),
(25, 277, 69.10, 23.50, 'High'),
(26, 278, 91.30, 15.00, 'High'),
(13, 279, 18.40, 65.10, 'Low'),
(14, 280, 45.70, 39.60, 'Moderate'),
(15, 281, 49.50, 33.90, 'Moderate'),
(16, 282, 58.40, 29.10, 'Moderate'),
(17, 283, 69.90, 24.30, 'High'),
(18, 284, 38.00, 39.10, 'Moderate'),
(19, 285, 14.70, 70.20, 'Low'),
(20, 286, 59.00, 29.10, 'Moderate'),
(21, 287, 8.60, 77.90, 'Low'),
(24, 288, 72.50, 21.10, 'High'),
(22, 289, 83.60, 18.00, 'High'),
(23, 290, 67.00, 25.70, 'High'),
(25, 291, 64.40, 27.30, 'Moderate'),
(26, 292, 89.90, 16.70, 'High'),
(22, 293, 46.10, 35.80, 'Moderate'),
(23, 294, 54.60, 30.90, 'Moderate'),
(25, 295, 72.80, 22.80, 'High'),
(26, 296, 87.50, 19.10, 'High'),
(22, 297, 48.90, 32.90, 'Moderate'),
(23, 298, 58.20, 29.50, 'Moderate'),
(25, 299, 56.40, 30.90, 'Moderate'),
(26, 300, 94.70, 13.10, 'High');

INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES
(22, 301, 86.40, 16.60, 'High'),
(23, 302, 73.20, 21.60, 'High'),
(25, 303, 63.90, 26.10, 'Moderate'),
(26, 304, 92.70, 13.70, 'High'),
(22, 305, 45.00, 34.00, 'Moderate'),
(23, 306, 55.10, 30.40, 'Moderate'),
(25, 307, 67.50, 24.40, 'High'),
(26, 308, 84.80, 20.20, 'High'),
(1, 309, 20.80, 60.20, 'Low'),
(2, 310, 36.90, 41.30, 'Moderate'),
(3, 311, 12.60, 71.20, 'Low'),
(4, 312, 49.30, 33.40, 'Moderate'),
(5, 313, 57.10, 29.80, 'Moderate'),
(6, 314, 74.30, 22.30, 'High'),
(7, 315, 65.60, 24.70, 'High'),
(8, 316, 13.30, 69.30, 'Low'),
(9, 317, 58.40, 28.90, 'Moderate'),
(10, 318, 11.20, 76.00, 'Low'),
(11, 319, 39.90, 37.20, 'Moderate'),
(12, 320, 73.70, 21.20, 'High'),
(22, 321, 78.60, 18.80, 'High'),
(23, 322, 62.20, 25.60, 'High'),
(25, 323, 60.00, 27.10, 'Moderate'),
(26, 324, 88.30, 17.00, 'High'),
(22, 325, 42.90, 35.20, 'Moderate'),
(23, 326, 50.70, 31.40, 'Moderate'),
(25, 327, 68.00, 23.80, 'High'),
(26, 328, 91.60, 15.10, 'High'),
(13, 329, 18.90, 64.20, 'Low'),
(14, 330, 43.60, 39.20, 'Moderate'),
(15, 331, 47.40, 33.70, 'Moderate'),
(16, 332, 56.00, 29.20, 'Moderate'),
(17, 333, 71.10, 22.70, 'High'),
(18, 334, 36.40, 38.10, 'Moderate'),
(19, 335, 14.10, 70.50, 'Low'),
(20, 336, 59.20, 28.70, 'Moderate'),
(21, 337, 9.90, 78.40, 'Low'),
(24, 338, 72.30, 21.80, 'High'),
(22, 339, 82.80, 17.40, 'High'),
(23, 340, 66.20, 25.10, 'High'),
(25, 341, 63.30, 27.50, 'Moderate'),
(26, 342, 90.90, 16.10, 'High'),
(22, 343, 43.10, 35.00, 'Moderate'),
(23, 344, 52.40, 30.20, 'Moderate'),
(25, 345, 70.60, 22.50, 'High'),
(26, 346, 86.20, 18.20, 'High'),
(22, 347, 47.10, 33.10, 'Moderate'),
(23, 348, 56.80, 29.60, 'Moderate'),
(25, 349, 54.90, 30.80, 'Moderate'),
(26, 350, 95.30, 12.50, 'High');

INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES
(22, 351, 87.30, 15.90, 'High'),
(23, 352, 74.20, 20.90, 'High'),
(25, 353, 62.80, 26.90, 'Moderate'),
(26, 354, 91.20, 13.80, 'High'),
(22, 355, 44.70, 34.40, 'Moderate'),
(23, 356, 53.70, 30.10, 'Moderate'),
(25, 357, 65.90, 25.30, 'High'),
(26, 358, 83.90, 19.70, 'High'),
(1, 359, 21.70, 60.10, 'Low'),
(2, 360, 35.80, 41.10, 'Moderate'),
(3, 361, 13.00, 70.00, 'Low'),
(4, 362, 48.40, 33.30, 'Moderate'),
(5, 363, 56.90, 29.60, 'Moderate'),
(6, 364, 74.80, 22.20, 'High'),
(7, 365, 66.10, 24.80, 'High'),
(8, 366, 14.50, 68.20, 'Low'),
(9, 367, 60.30, 28.30, 'Moderate'),
(10, 368, 11.60, 76.20, 'Low'),
(11, 369, 40.50, 37.50, 'Moderate'),
(12, 370, 75.10, 21.60, 'High'),
(22, 371, 79.80, 18.10, 'High'),
(23, 372, 65.10, 25.80, 'High'),
(25, 373, 61.10, 28.00, 'Moderate'),
(26, 374, 89.40, 17.10, 'High'),
(22, 375, 43.30, 36.20, 'Moderate'),
(23, 376, 52.60, 30.70, 'Moderate'),
(25, 377, 69.40, 23.70, 'High'),
(26, 378, 90.60, 14.90, 'High'),
(13, 379, 17.80, 65.60, 'Low'),
(14, 380, 44.00, 38.40, 'Moderate'),
(15, 381, 48.70, 33.60, 'Moderate'),
(16, 382, 57.00, 28.20, 'Moderate'),
(17, 383, 70.50, 23.30, 'High'),
(18, 384, 36.60, 39.30, 'Moderate'),
(19, 385, 13.90, 69.80, 'Low'),
(20, 386, 58.70, 29.20, 'Moderate'),
(21, 387, 8.70, 78.70, 'Low'),
(24, 388, 73.50, 21.30, 'High'),
(22, 389, 82.00, 17.00, 'High'),
(23, 390, 67.90, 26.00, 'High'),
(25, 391, 66.50, 27.20, 'Moderate'),
(26, 392, 88.80, 16.60, 'High'),
(22, 393, 46.20, 35.90, 'Moderate'),
(23, 394, 54.80, 30.00, 'Moderate'),
(25, 395, 72.60, 22.70, 'High'),
(26, 396, 86.10, 18.50, 'High'),
(22, 397, 49.00, 33.00, 'Moderate'),
(23, 398, 59.00, 29.10, 'Moderate'),
(25, 399, 57.90, 31.10, 'Moderate'),
(26, 400, 94.40, 13.20, 'High');

INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES
(22, 401, 86.90, 15.50, 'High'),
(23, 402, 70.30, 21.40, 'High'),
(25, 403, 63.10, 26.80, 'Moderate'),
(26, 404, 93.20, 13.10, 'High'),
(22, 405, 45.80, 34.20, 'Moderate'),
(23, 406, 54.50, 30.30, 'Moderate'),
(25, 407, 66.70, 24.60, 'High'),
(26, 408, 84.60, 19.50, 'High'),
(1, 409, 22.30, 60.50, 'Low'),
(2, 410, 37.10, 42.50, 'Moderate'),
(3, 411, 13.10, 70.30, 'Low'),
(4, 412, 50.30, 33.20, 'Moderate'),
(5, 413, 57.30, 30.00, 'Moderate'),
(6, 414, 72.90, 22.50, 'High'),
(7, 415, 64.90, 25.50, 'High'),
(8, 416, 15.30, 68.70, 'Low'),
(9, 417, 59.90, 28.60, 'Moderate'),
(10, 418, 11.10, 76.80, 'Low'),
(11, 419, 40.60, 37.30, 'Moderate'),
(12, 420, 74.20, 21.50, 'High'),
(22, 421, 79.10, 18.70, 'High'),
(23, 422, 64.10, 26.10, 'High'),
(25, 423, 60.50, 27.90, 'Moderate'),
(26, 424, 88.20, 17.40, 'High'),
(22, 425, 42.70, 36.30, 'Moderate'),
(23, 426, 51.90, 30.90, 'Moderate'),
(25, 427, 69.60, 23.20, 'High'),
(26, 428, 90.30, 15.30, 'High'),
(13, 429, 16.80, 65.80, 'Low'),
(14, 430, 44.90, 39.00, 'Moderate'),
(15, 431, 48.60, 33.80, 'Moderate'),
(16, 432, 57.60, 28.80, 'Moderate'),
(17, 433, 70.60, 23.60, 'High'),
(18, 434, 37.00, 39.50, 'Moderate'),
(19, 435, 14.40, 70.90, 'Low'),
(20, 436, 58.30, 28.10, 'Moderate'),
(21, 437, 9.60, 79.00, 'Low'),
(24, 438, 72.10, 21.20, 'High'),
(22, 439, 81.70, 17.60, 'High'),
(23, 440, 67.10, 25.40, 'High'),
(25, 441, 65.80, 27.40, 'Moderate'),
(26, 442, 90.80, 16.30, 'High'),
(22, 443, 46.40, 35.60, 'Moderate'),
(23, 444, 53.20, 30.10, 'Moderate'),
(25, 445, 71.90, 22.90, 'High'),
(26, 446, 85.90, 18.60, 'High'),
(22, 447, 48.50, 32.70, 'Moderate'),
(23, 448, 57.50, 29.70, 'Moderate'),
(25, 449, 55.70, 30.40, 'Moderate'),
(26, 450, 96.10, 12.20, 'High');

INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES
(22, 401, 87.90, 16.20, 'High'),
(23, 402, 71.90, 21.10, 'High'),
(25, 403, 64.30, 26.20, 'Moderate'),
(26, 404, 92.60, 13.50, 'High'),
(22, 405, 45.20, 34.30, 'Moderate'),
(23, 406, 55.00, 30.60, 'Moderate'),
(25, 407, 66.20, 24.60, 'High'),
(26, 408, 85.10, 19.60, 'High'),
(1, 409, 20.60, 61.00, 'Low'),
(2, 410, 37.80, 42.20, 'Moderate'),
(3, 411, 13.40, 70.10, 'Low'),
(4, 412, 49.80, 33.00, 'Moderate'),
(5, 413, 58.00, 29.90, 'Moderate'),
(6, 414, 73.10, 22.60, 'High'),
(7, 415, 65.40, 24.80, 'High'),
(8, 416, 14.70, 68.50, 'Low'),
(9, 417, 60.00, 28.70, 'Moderate'),
(10, 418, 11.90, 75.90, 'Low'),
(11, 419, 39.70, 37.90, 'Moderate'),
(12, 420, 74.40, 21.30, 'High'),
(22, 421, 80.20, 18.40, 'High'),
(23, 422, 64.70, 26.30, 'High'),
(25, 423, 61.50, 28.10, 'Moderate'),
(26, 424, 88.60, 17.20, 'High'),
(22, 425, 43.00, 36.20, 'Moderate'),
(23, 426, 53.60, 30.80, 'Moderate'),
(25, 427, 70.40, 23.70, 'High'),
(26, 428, 91.40, 14.80, 'High'),
(13, 429, 17.10, 65.90, 'Low'),
(14, 430, 44.60, 39.30, 'Moderate'),
(15, 431, 47.20, 33.40, 'Moderate'),
(16, 432, 56.50, 28.40, 'Moderate'),
(17, 433, 71.40, 23.90, 'High'),
(18, 434, 36.90, 39.10, 'Moderate'),
(19, 435, 14.20, 69.60, 'Low'),
(20, 436, 58.60, 28.20, 'Moderate'),
(21, 437, 9.70, 78.30, 'Low'),
(24, 438, 73.30, 21.10, 'High'),
(22, 439, 83.50, 17.10, 'High'),
(23, 440, 66.30, 25.20, 'High'),
(25, 441, 64.90, 27.30, 'Moderate'),
(26, 442, 89.70, 16.20, 'High'),
(22, 443, 43.90, 35.80, 'Moderate'),
(23, 444, 51.60, 30.10, 'Moderate'),
(25, 445, 72.00, 22.40, 'High'),
(26, 446, 86.30, 18.30, 'High'),
(22, 447, 47.80, 32.80, 'Moderate'),
(23, 448, 58.30, 29.40, 'Moderate'),
(25, 449, 55.30, 30.70, 'Moderate'),
(26, 450, 94.90, 12.30, 'High');
*********

  
### Filling the gap from 1-26. Although I filled them before, but it failed as other foreign key related tables weren’t populated that time.

INSERT INTO realtimedata (data_id, tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES
(1, 22, 101, 82.30, 18.9, 'High'),
(2, 23, 102, 74.10, 21.2, 'High'),
(3, 25, 103, 63.50, 26.5, 'Moderate'),
(4, 26, 104, 91.40, 14.3, 'High'),
(5, 22, 105, 44.80, 34.2, 'Moderate'),
(6, 23, 106, 52.70, 30.5, 'Moderate'),
(7, 25, 107, 68.20, 24.1, 'High'),
(8, 26, 108, 87.10, 17.3, 'High'),
(9, 1, 109, 21.10, 62.3, 'Low'),
(10, 2, 110, 36.70, 41.8, 'Moderate'),
(11, 3, 111, 12.90, 71.5, 'Low'),
(12, 4, 112, 50.20, 33.6, 'Moderate'),
(13, 5, 113, 59.00, 28.9, 'Moderate'),
(14, 6, 114, 73.00, 22.7, 'High'),
(15, 7, 115, 64.60, 25.3, 'High'),
(16, 8, 116, 14.50, 68.9, 'Low'),
(17, 9, 117, 61.20, 27.8, 'Moderate'),
(18, 10, 118, 10.80, 76.2, 'Low'),
(19, 11, 119, 40.30, 36.6, 'Moderate'),
(20, 12, 120, 75.40, 21.1, 'High'),
(21, 22, 121, 79.60, 18.5, 'High'),
(22, 23, 122, 65.90, 26.0, 'High'),
(23, 25, 123, 60.80, 28.2, 'Moderate'),
(24, 26, 124, 89.50, 16.8, 'High'),
(25, 22, 125, 42.20, 36.0, 'Moderate'),
(26, 23, 126, 51.30, 31.0, 'Moderate');


INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES
(22, 127, 81.20, 18.7, 'High'),
(23, 128, 66.40, 25.3, 'High'),
(25, 129, 62.80, 26.9, 'Moderate'),
(26, 130, 90.30, 14.1, 'High'),
(22, 131, 45.90, 34.6, 'Moderate'),
(23, 132, 53.80, 30.0, 'Moderate'),
(25, 133, 68.70, 24.9, 'High'),
(26, 134, 86.60, 17.5, 'High'),
(24, 135, 73.40, 21.0, 'High'),
(1, 136, 19.20, 63.2, 'Low');


INSERT INTO realtimedata (tunnel_id, vehicle_id, traffic_density, avg_speed, congestion_level)
VALUES
(22, 137, 86.10, 16.80, 'High'),
(23, 138, 70.70, 21.00, 'High'),
(25, 139, 62.00, 27.00, 'Moderate'),
(26, 140, 93.70, 13.30, 'High'),
(22, 141, 46.00, 34.90, 'Moderate'),
(23, 142, 52.90, 30.60, 'Moderate'),
(25, 143, 67.20, 24.50, 'High'),
(26, 144, 85.40, 19.90, 'High'),
(1, 145, 20.70, 61.80, 'Low'),
(2, 146, 36.60, 42.70, 'Moderate'),
(3, 147, 13.30, 70.90, 'Low'),
(4, 148, 50.70, 33.50, 'Moderate'),
(5, 149, 57.60, 30.20, 'Moderate'),
(6, 150, 73.30, 22.10, 'High'),
(7, 151, 64.70, 25.60, 'High'),
(8, 152, 14.90, 68.60, 'Low'),
(9, 153, 59.30, 28.50, 'Moderate'),
(10, 154, 11.00, 76.50, 'Low'),
(11, 155, 40.80, 37.00, 'Moderate'),
(12, 156, 74.60, 21.40, 'High'),
(22, 157, 78.40, 18.30, 'High'),
(23, 158, 63.70, 26.40, 'High'),
(25, 159, 60.90, 28.30, 'Moderate'),
(26, 160, 88.70, 17.60, 'High'),
(22, 161, 43.70, 36.20, 'Moderate'),
(23, 162, 52.30, 30.90, 'Moderate'),
(25, 163, 69.20, 23.60, 'High'),
(26, 164, 90.50, 15.40, 'High'),
(13, 165, 16.60, 66.30, 'Low'),
(14, 166, 45.00, 39.50, 'Moderate'),
(15, 167, 48.90, 34.10, 'Moderate'),
(16, 168, 57.80, 28.80, 'Moderate'),
(17, 169, 70.70, 23.40, 'High'),
(18, 170, 37.50, 39.40, 'Moderate'),
(19, 171, 14.30, 70.40, 'Low'),
(20, 172, 58.90, 28.10, 'Moderate'),
(21, 173, 9.40, 78.20, 'Low'),
(24, 174, 72.70, 21.10, 'High'),
(22, 175, 81.30, 17.10, 'High'),
(23, 176, 66.10, 25.00, 'High'),
(25, 177, 64.60, 27.10, 'Moderate'),
(26, 178, 90.10, 16.20, 'High'),
(22, 179, 44.30, 35.90, 'Moderate'),
(23, 180, 54.40, 30.40, 'Moderate'),
(25, 181, 71.30, 23.00, 'High'),
(26, 182, 87.10, 18.10, 'High'),
(22, 183, 47.30, 32.60, 'Moderate'),
(23, 184, 58.20, 29.20, 'Moderate'),
(25, 185, 56.30, 30.70, 'Moderate'),
(26, 186, 95.10, 12.80, 'High');

### Note: This tunnel database has 16+ tables with more than 500 data in each table. Initially, the tables were filled with less data, but then it grew with more and more.
