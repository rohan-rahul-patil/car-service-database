#Table Creation Scripts
#Entities 
#1 Orders        	
CREATE TABLE orders (
order_id int NOT NULL,
order_date date NOT NULL,
order_qty int NOT NULL,
supplier_service_centre_id int DEFAULT NULL,
distributer_id int DEFAULT NULL,
status varchar(100) NOT NULL,
CONSTRAINT order_pk PRIMARY KEY (order_id)
);

#2 Parts
CREATE TABLE parts (
part_id int NOT NULL,
current_qty int NOT NULL,
unit_price int NOT NULL,
min_qty_threshold int NOT NULL,
min_order_threshold int NOT NULL,
CONSTRAINT parts_pk PRIMARY KEY (part_id)
);


#3 Service_Center
CREATE TABLE service_center(
center_id INT,
name VARCHAR(100) NOT NULL,
address VARCHAR(100),
phone_num NUMBER(10),
CONSTRAINT service_center_pk PRIMARY KEY(center_id)
);

#4 Manager
CREATE TABLE manager ( 
manager_id int NOT NULL,
name varchar(100) NOT NULL,
address varchar(100) NOT NULL,
phone_num number(10) NOT NULL,
start_date date NOT NULL,
frequency int NOT NULL,
wage int NOT NULL,
monthly_salary int NOT NULL,
center_id int NOT NULL,
CONSTRAINT works_at FOREIGN KEY (center_id) REFERENCES service_center (center_id),
CONSTRAINT manager_pk PRIMARY KEY (manager_id)
);

#5 Receptionist
CREATE TABLE receptionist (
receptionist_id int NOT NULL,
name varchar(100) NOT NULL,
address varchar(100) NOT NULL,
phone_num number(10) NOT NULL,
start_date date NOT NULL,
frequency int NOT NULL,
wage int NOT NULL,
monthly_salary int NOT NULL,
center_id int NOT NULL,
CONSTRAINT works_at_fk FOREIGN KEY (center_id) REFERENCES service_center (center_id),
CONSTRAINT receptionist_pk PRIMARY KEY (receptionist_id)
);

#6 Mechanic 
CREATE TABLE mechanic (
mechanic_id int NOT NULL,
name varchar(100) NOT NULL,
address varchar(100) NOT NULL,
phone_num number(10) NOT NULL,
start_date date NOT NULL,
frequency int NOT NULL,
wage int NOT NULL,
hourly_salary int NOT NULL,
hours_worked int NOT NULL,
center_id int NOT NULL,
CONSTRAINT works_at_m_fk FOREIGN KEY (center_id) REFERENCES service_center (center_id),
CONSTRAINT mechanic_pk PRIMARY KEY (mechanic_id)
);




#7 Customer
CREATE TABLE customer(
customer_id INT,
name VARCHAR(100) NOT NULL,
address VARCHAR(100),
phone_num NUMBER(10),
email VARCHAR(100),
CONSTRAINT customer_pk PRIMARY KEY(customer_id)
);

#8 Vehicle
CREATE TABLE vehicle(
licence_plate_num  VARCHAR(50),
last_milage INT NOT NULL,
make VARCHAR(100),
year INT,
model VARCHAR(100),
purchase_date DATE,
type_of_last_service VARCHAR(100) NOT NULL,
date_of_last_service DATE NOT NULL,
CONSTRAINT vehicle_pk PRIMARY KEY(licence_plate_num)
);


#9 VehicleTypes 
CREATE TABLE vehicle_types(	
vehicle_model varchar2(50) NOT NULL,
manufacturer varchar2(50),
CONSTRAINT vehicel_types_pk PRIMARY KEY(vehicle_model)
);

#10 ServiceSchedule
CREATE TABLE service_schedule(
vehicle_model varchar2(50) NOT NULL,
service_A_milage real,
service_B_milage real,
service_C_milage real,
CONSTRAINT service_schedule_pk PRIMARY KEY(vehicle_model),
CONSTRAINT service_schedule_fk FOREIGN KEY (vehicle_model) REFERENCES vehicle_types (vehicle_model)
);

 
#11 MaintenanceService
CREATE TABLE maintenance( 
service_name varchar2(50) NOT NULL,
hours int NOT NULL,
labour_charge_rate int NOT NULL,
warranty_upto DATE,
type varchar2(5) NOT NULL,
CONSTRAINT maintenance_pk PRIMARY KEY (service_name)
);

#12 RepairService
CREATE TABLE repair( 
service_name varchar2(50) NOT NULL,
hours int NOT NULL,
labour_charge_rate int NOT NULL,
warranty_upto DATE,
problem_reported varchar2(50) NOT NULL,
labour_fee int NOT NULL,
diagnostic_service_fee int,
part_fee int,
report varchar2(100),
CONSTRAINT repair_pk PRIMARY KEY (service_name)
);
 
#13 Distributor
CREATE TABLE distributor( 
distributor_id int NOT NULL,
delivery_window int NOT NULL,
CONSTRAINT distributor_pk PRIMARY KEY (distributor_id)
);

#14 Appointment
CREATE TABLE appointment(
date_time TIMESTAMP NOT NULL,
service_type varchar2(50) NOT NULL,
invoice_amount int NOT NULL,
preferred_mechanic int NOT NULL,
licence_plate_num varchar(50) NOT NULL,  
service_center_id int NOT NULL,
customer_id int NOT NULL,
CONSTRAINT appointment_pk PRIMARY KEY (date_time, service_center_id),
CONSTRAINT appointment_mechanic_fk FOREIGN KEY (preferred_mechanic) REFERENCES mechanic (mechanic_id),
CONSTRAINT appointment_customer_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
CONSTRAINT appointment_service_center_fk FOREIGN KEY (service_center_id) REFERENCES service_center(center_id),
CONSTRAINT appointment_vehicle_fk FOREIGN KEY (licence_plate_num) REFERENCES vehicle(licence_plate_num)
);

#15 Login Details
CREATE TABLE login_details(
username varchar2(50) NOT NULL,
password varchar2(50) NOT NULL,
account_type varchar2(50) NOT NULL,
id INT,
CONSTRAINT login_pk PRIMARY KEY (username)
);



#Relations
#16 Order_Part
CREATE TABLE order_part( 
order_id INT NOT NULL,
part_id  INT,
CONSTRAINT order_part_pk PRIMARY KEY (order_id),
CONSTRAINT orders_fk FOREIGN KEY (order_id) REFERENCES orders (order_id) 
ON DELETE CASCADE,
CONSTRAINT parts_fk FOREIGN KEY (part_id) REFERENCES parts (part_id) 
ON DELETE CASCADE
);

#17 Placed
CREATE TABLE placed (
order_id INT NOT NULL,
center_id INT,
CONSTRAINT placed_pk PRIMARY KEY(order_id),
CONSTRAINT order_placed_fk FOREIGN KEY (order_id) REFERENCES orders (order_id) 
ON DELETE CASCADE,
CONSTRAINT center_placed_fk FOREIGN KEY (center_id) REFERENCES service_center (center_id) ON DELETE CASCADE 
);

#18 Inventory
CREATE TABLE inventory(
center_id INT NOT NULL,
part_id  INT NOT NULL,
CONSTRAINT inventory_pk PRIMARY KEY (center_id, part_id),
CONSTRAINT center_inventory_fk FOREIGN KEY (center_id) REFERENCES service_center (center_id) ON DELETE CASCADE,
CONSTRAINT parts_inventory_fk FOREIGN KEY (part_id) REFERENCES parts (part_id) 
ON DELETE CASCADE
);


#19 Supplies 
CREATE TABLE supplies(
distributor_id INT NOT NULL,
part_id  INT NOT NULL,
CONSTRAINT supplies_pk PRIMARY KEY (distributor_id , part_id),
CONSTRAINT distributor_supplies_fk FOREIGN KEY (distributor_id ) REFERENCES distributor (distributor_id ) ON DELETE CASCADE,
CONSTRAINT parts_inventory_sup_fk FOREIGN KEY (part_id) REFERENCES parts (part_id) 
ON DELETE CASCADE
);

#20 Requires_Maintenance 
CREATE TABLE requires_maintenance( 
part_id INT NOT NULL,
service_name varchar2(50) NOT NULL,
quantity int not null,
CONSTRAINT requires_m_pk PRIMARY KEY (part_id, service_name),
CONSTRAINT requires_m_parts_fk FOREIGN KEY (part_id)   REFERENCES parts (part_id),
CONSTRAINT requires_m_services_fk FOREIGN KEY (service_name)
REFERENCES maintenance (service_name)
);


#21 Requires_Repair
CREATE TABLE requires_repair( 
part_id INT NOT NULL,
service_name varchar2(50) NOT NULL,
quantity int not null,
CONSTRAINT requires_r_pk PRIMARY KEY (part_id, service_name),
CONSTRAINT requires_r_parts_fk FOREIGN KEY (part_id)   REFERENCES parts (part_id),
CONSTRAINT requires_r_services_fk FOREIGN KEY (service_name)
REFERENCES repair (service_name)
);


#22 Request_Maintenance_Service
CREATE TABLE request_maintainence_service(
license_plate_num varchar(50),
service_name varchar2(50),
CONSTRAINT req_maintain_pk PRIMARY KEY (license_plate_num, service_name),
CONSTRAINT req_maintain_lic_fk FOREIGN KEY (license_plate_num) REFERENCES vehicle(licence_plate_num),
CONSTRAINT req_maintain_fk FOREIGN KEY (service_name) REFERENCES maintenance (service_name)
);


#23 Request_RepairService
CREATE TABLE request_repair_service(
license_plate_num varchar(50),
service_name varchar2(50),
CONSTRAINT req_repair_pk PRIMARY KEY (license_plate_num, service_name),
CONSTRAINT req_repair_lic_fk FOREIGN KEY (license_plate_num) REFERENCES vehicle(licence_plate_num), 
CONSTRAINT req_repair_fk FOREIGN KEY (service_name) REFERENCES repair(service_name)   
);

#24 Owns
CREATE TABLE owns( 
licence_plate_number varchar(50) NOT NULL,
customer_id int NOT NULL,
CONSTRAINT owns_pk PRIMARY KEY (licence_plate_number),
CONSTRAINT owns_vehicle_fk FOREIGN KEY (licence_plate_number)
REFERENCES vehicle (licence_plate_num),
CONSTRAINT owns_customer_fk FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
);
        	
#25 Offers_Maintenance
CREATE TABLE offers_maintenance(
center_id INT NOT NULL,
service_name varchar2(50) NOT NULL,
CONSTRAINT offers_pk PRIMARY KEY (center_id, service_name),
CONSTRAINT offers_service_center_fk
FOREIGN KEY (center_id)   REFERENCES service_center (center_id),
CONSTRAINT offers_services_fk FOREIGN KEY (service_name)
REFERENCES maintenance (service_name)
);

#26 Offers_Repair
CREATE TABLE offers_repair(
center_id INT NOT NULL,
service_name varchar2(50) NOT NULL,
CONSTRAINT offers_r_pk PRIMARY KEY (center_id, service_name),
CONSTRAINT offers_r_service_center_fk
FOREIGN KEY (center_id)   REFERENCES service_center (center_id),
CONSTRAINT offers_r_services_fk FOREIGN KEY (service_name)
REFERENCES repair (service_name)
);

#27 Vehicle_Type_Relation
CREATE TABLE vehicle_type_relation(
license_plate_num varchar(50),
vehicle_model varchar2(50),
CONSTRAINT vehicle_type_pk PRIMARY KEY (license_plate_num),
CONSTRAINT vehicle_type_license_plate_fk FOREIGN KEY (license_plate_num) REFERENCES vehicle (licence_plate_num), 
CONSTRAINT vehicle_type_vehicle_model_fk FOREIGN KEY (vehicle_model) REFERENCES vehicle_types (vehicle_model)   
);
