CREATE TABLE service_center(
service_center_id VARCHAR(100),
name VARCHAR(100) NOT NULL,
address VARCHAR(100),
phone_num VARCHAR(100),
CONSTRAINT service_center_pk PRIMARY KEY(service_center_id)
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
CONSTRAINT customer_servicecenter_fk FOREIGN KEY (service_center_id) REFERENCES service_center(service_center_id)
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

CREATE TABLE inventory(
part_name VARCHAR(100),
vehicle_type VARCHAR(100),
service_center_id VARCHAR(100),
price int NOT NULL,
warranty int,
current_qty int NOT NULL,
min_inventory_threshold int NOT NULL,
min_order_threshold int NOT NULL,
CONSTRAINT inventory_pk PRIMARY KEY (part_name, vehicle_type, service_center_id),
CONSTRAINT inventory_servicecenter_fk FOREIGN KEY (service_center_id) REFERENCES service_center(service_center_id)
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
CONSTRAINT manager_works_at FOREIGN KEY (center_id) REFERENCES service_center (service_center_id),
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
CONSTRAINT receptionist_works_at FOREIGN KEY (center_id) REFERENCES service_center (service_center_id),
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
CONSTRAINT mechanic_works_at FOREIGN KEY (center_id) REFERENCES service_center (service_center_id),
CONSTRAINT mechanic_pk PRIMARY KEY (employee_id)
);

CREATE TABLE basic_services(
service_name varchar (1000) NOT NULL,
vehicle_make varchar (100) NOT NULL,
vehicle_model varchar (100),
part_name varchar(100),
quantity int,
charge_rate int,
time float,
CONSTRAINT basic_service_pk PRIMARY KEY(service_name, vehicle_make, vehicle_model)
);

CREATE TABLE repairs(
problem varchar (100) NOT NULL,
diagnosis varchar(100),
diagnostic_fee int,
CONSTRAINT repairs_pk PRIMARY KEY (problem)
);


CREATE TABLE supplies(
distributor_id INT NOT NULL,
part_id  INT NOT NULL,
delivery_window INT NOT NULL, 
CONSTRAINT supplies_pk PRIMARY KEY (distributor_id , part_id),
CONSTRAINT distributor_supplies_fk FOREIGN KEY (distributor_id ) REFERENCES distributor (distributor_id ) ON DELETE CASCADE,
CONSTRAINT parts_supplies_fk FOREIGN KEY (part_id) REFERENCES parts (part_id) 
ON DELETE CASCADE
);

CREATE TABLE maintenance( 
licence_plate_number VARCHAR(50) NOT NULL,
service_name varchar2(50) NOT NULL,
type varchar2(5) NOT NULL,
miles int NOT NULL,
CONSTRAINT maintenance_pk PRIMARY KEY (licence_plate_number, service_name),
CONSTRAINT maintenance_vehicle_fk FOREIGN KEY (licence_plate_number) REFERENCES vehicle(licence_plate_num),
CONSTRAINT maintenance_basicservices_fk FOREIGN KEY (service_name) REFERENCES basic_services(service_name)
);

CREATE TABLE repair( 
service_name varchar2(50) NOT NULL,
problem varchar2(50) NOT NULL,
CONSTRAINT repair_pk PRIMARY KEY (service_name,problem),
CONSTRAINT reapir_basicservices_fk FOREIGN KEY (service_name) REFERENCES basic_services(service_name)
);

CREATE TABLE owns( 
licence_plate_number VARCHAR(50) NOT NULL,
customer_id int NOT NULL,
CONSTRAINT owns_pk PRIMARY KEY (licence_plate_number),
CONSTRAINT owns_vehicle_fk FOREIGN KEY (licence_plate_number)
REFERENCES vehicle (licence_plate_num),
CONSTRAINT owns_customer_fk FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
);