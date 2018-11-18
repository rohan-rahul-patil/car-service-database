CREATE TABLE service_center(
service_center_id VARCHAR(100),
name VARCHAR(100) NOT NULL,
address VARCHAR(100),
phone_num VARCHAR(100),
CONSTRAINT service_center_pk PRIMARY KEY (service_center_id)
);

CREATE TABLE distributor( 
distributor_id VARCHAR(100) NOT NULL,
distributor_name VARCHAR(100) NOT NULL,
CONSTRAINT distributor_pk PRIMARY KEY (distributor_id)
);

CREATE TABLE customer(
customer_id INT,
name VARCHAR(100) NOT NULL,
address VARCHAR(100),
phone_num VARCHAR(100),
email VARCHAR(100),
service_center_id VARCHAR(100),
CONSTRAINT customer_pk PRIMARY KEY(customer_id),
CONSTRAINT customer_servicecenter_fk FOREIGN KEY (service_center_id) REFERENCES service_center(service_center_id) ON DELETE CASCADE
);

CREATE TABLE vehicle(
license_plate_num  VARCHAR(100),
make VARCHAR(100),
model VARCHAR(100),
year INT,
purchase_date DATE,
last_mileage INT NOT NULL,
type_of_last_service VARCHAR(100) NOT NULL,
date_of_last_service DATE,
CONSTRAINT vehicle_pk PRIMARY KEY(license_plate_num)
);

CREATE TABLE parts(
part_name VARCHAR(100),
vehicle_make VARCHAR(100),
price int NOT NULL,
warranty int,
CONSTRAINT parts_pk PRIMARY KEY (part_name, vehicle_make)
);

CREATE TABLE inventory(
part_name VARCHAR(100), 
vehicle_make VARCHAR(100), 
service_center_id VARCHAR(100), 
current_qty int NOT NULL, 
min_inventory_threshold int NOT NULL, 
min_order_threshold int NOT NULL, 
CONSTRAINT inventory_pk PRIMARY KEY (part_name, vehicle_make, service_center_id), 
CONSTRAINT inventory_parts_fk FOREIGN KEY (part_name, vehicle_make) REFERENCES parts(part_name, vehicle_make) ON DELETE CASCADE,
CONSTRAINT inventory_servicecenter_fk FOREIGN KEY (service_center_id) REFERENCES service_center(service_center_id) ON DELETE CASCADE
);

CREATE TABLE manager ( 
employee_id varchar (100) NOT NULL,
name varchar(100),
address varchar(100),
email varchar(100),
phone_num varchar(100),
start_date date,
monthly_salary int,
center_id varchar(100) NOT NULL,
CONSTRAINT manager_works_at FOREIGN KEY (center_id) REFERENCES service_center (service_center_id) ON DELETE CASCADE,
CONSTRAINT manager_pk PRIMARY KEY (employee_id)
);

CREATE TABLE receptionist ( 
employee_id varchar (100) NOT NULL,
name varchar(100),
address varchar(100),
email varchar(100),
phone_num varchar(100),
start_date date,
monthly_salary int,
center_id varchar(100) NOT NULL,
CONSTRAINT receptionist_works_at FOREIGN KEY (center_id) REFERENCES service_center (service_center_id) ON DELETE CASCADE,
CONSTRAINT receptionist_pk PRIMARY KEY (employee_id)
);

CREATE TABLE mechanic( 
employee_id varchar (100) NOT NULL,
name varchar(100),
address varchar(100),
email varchar(100),
phone_num varchar(100),
start_date date,
hourly_salary int,
center_id varchar(100) NOT NULL,
CONSTRAINT mechanic_works_at FOREIGN KEY (center_id) REFERENCES service_center (service_center_id) ON DELETE CASCADE,
CONSTRAINT mechanic_pk PRIMARY KEY (employee_id)
);

CREATE TABLE basic_services(
service_name varchar (1000) NOT NULL,
part_name varchar(100),
charge_rate int,
time float,
CONSTRAINT basic_service_pk PRIMARY KEY(service_name)
);

CREATE TABLE vehicle_services(
service_name varchar (1000) NOT NULL,
vehicle_make varchar (100) NOT NULL,
vehicle_model varchar (100),
quantity int,
CONSTRAINT vehicle_service_pk PRIMARY KEY(service_name, vehicle_make, vehicle_model)
);

CREATE TABLE repairs(
problem varchar (100) NOT NULL,
diagnosis varchar(100),
diagnostic_fee int,
CONSTRAINT repairs_pk PRIMARY KEY (problem)
);

CREATE TABLE supplies(
distributor_id VARCHAR(100) NOT NULL,
part_name VARCHAR(100) NOT NULL,
vehicle_make VARCHAR(100) NOT NULL,
delivery_window INT, 
CONSTRAINT supplies_pk PRIMARY KEY (distributor_id , part_name, vehicle_make),
CONSTRAINT distributor_supplies_fk FOREIGN KEY (distributor_id) REFERENCES distributor (distributor_id) ON DELETE CASCADE,
CONSTRAINT part_supplies_fk FOREIGN KEY (part_name, vehicle_make) REFERENCES parts (part_name, vehicle_make) ON DELETE CASCADE
);


CREATE TABLE maintainance(
service_name varchar (1000) NOT NULL,
vehicle_make varchar (100) NOT NULL,
vehicle_model varchar (100) NOT NULL,
service_type varchar2(5) NOT NULL,
miles int NOT NULL,
CONSTRAINT maintenance_pk PRIMARY KEY (vehicle_make, vehicle_model, service_name),
CONSTRAINT service_maintainance_fk FOREIGN KEY(service_name, vehicle_make, vehicle_model) REFERENCES vehicle_services (service_name, vehicle_make, vehicle_model) ON DELETE CASCADE
);

CREATE TABLE repair_services( 
service_name varchar(1000)  NOT NULL,
problem varchar(100) NOT NULL,
CONSTRAINT repair_pk PRIMARY KEY (service_name,problem),
CONSTRAINT rs_basicservices_fk FOREIGN KEY (service_name) REFERENCES basic_services(service_name) ON DELETE CASCADE,
CONSTRAINT repairservices_repairs_fk FOREIGN KEY (problem) REFERENCES repairs(problem) ON DELETE CASCADE
);

CREATE TABLE owns( 
license_plate_num VARCHAR(50) NOT NULL,
customer_id int NOT NULL,
CONSTRAINT owns_pk PRIMARY KEY (license_plate_num),
CONSTRAINT owns_vehicle_fk FOREIGN KEY (license_plate_num) REFERENCES vehicle (license_plate_num) ON DELETE CASCADE,
CONSTRAINT owns_customer_fk FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);


CREATE TABLE orders(
order_id int NOT NULL,
placed_date date NOT NULL,
expected_date date NOT NULL,
actual_date date,
origin varchar(100) NOT NULL,
destination varchar(100) NOT NULL,
status varchar(100) NOT NULL,
part_name varchar(100) NOT NULL,
vehicle_make varchar(100) NOT NULL,
quantity int NOT NULL,
CONSTRAINT order_pk PRIMARY KEY(order_id),
CONSTRAINT order_serv_cent_1 FOREIGN KEY(destination) REFERENCES
service_center(service_center_id),
CONSTRAINT order_part FOREIGN KEY(part_name, vehicle_make) REFERENCES 
parts(part_name, vehicle_make)
);


CREATE TABLE login_details(
username varchar(100) NOT NULL,
password varchar(100) NOT NULL,
account_type varchar(100) NOT NULL,
id INT,
CONSTRAINT login_pk PRIMARY KEY (username)
);


CREATE TABLE notification(
delivery_date date NOT NULL,
service_center_id varchar(100),
message varchar(100),
CONSTRAINT not_pk PRIMARY KEY(delivery_date, service_center_id, message),
CONSTRAINT not_serv_fk FOREIGN KEY(service_center_id) REFERENCES
service_center(service_center_id)
);


CREATE TABLE appointment(
appointment_date_time timestamp NOT NULL,
service_type varchar(100) NOT NULL,
invoice_amount int NOT NULL,
preferred_mechanic_id VARCHAR(100) NOT NULL,
license_plate_num VARCHAR(100) NOT NULL,  
customer_id int NOT NULL,
CONSTRAINT appointment_pk PRIMARY KEY (license_plate_num, appointment_date_time),
CONSTRAINT appointment_mechanic_fk FOREIGN KEY (preferred_mechanic_id) REFERENCES mechanic (employee_id),
CONSTRAINT appointment_customer_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
CONSTRAINT appointment_vehicle_fk FOREIGN KEY (license_plate_num) REFERENCES vehicle(license_plate_num)
);
