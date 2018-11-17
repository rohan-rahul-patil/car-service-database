INSERT INTO service_center VALUES ('S0001','Downtown Auto Care','437 Fayetteville St., Raleigh, NC 27601','1.800.899.9999');
INSERT INTO service_center VALUES ('S0002','Express Auto Shop','201 N Tryon St, Charlotte, NC 28202','1.704.333.1555');

INSERT INTO distributor VALUES ('D0001','D1');
INSERT INTO distributor VALUES ('D0002','D2');

INSERT INTO customer VALUES (1001,'Tom Cruise','203, Park St, Raleigh, NC â€“ 27603','1234567890','ethanhunt@gmail.com','S0001');
INSERT INTO customer VALUES (1002,'Robert Downey Jr.','12-A, High St, Raleigh, NC â€“ 27605','9989877791','jarvis@gmail.com','S0001');
INSERT INTO customer VALUES (1003,'Taylor Swift','2A, 3rd Ave, Charlotte, NC â€“ 28134','8179827199','lovestory@gmail.com','S0002');
INSERT INTO customer VALUES (1004,'Serena Williams','90, Gorman St, Charlotte, NC â€“ 28201','8714791879','venus@gmail.com','S0002');

INSERT INTO vehicle VALUES ('XYZ-5643','Honda','Civic',2009,'24-Dec-09',90452,'C','10-sep-18');
INSERT INTO vehicle VALUES ('AHS-3132','Toyota','Prius',2007,'02-Jan-11',65452,'Battery does not hold charge','06-Aug-2018');
INSERT INTO vehicle VALUES ('IRM-1212','Nissan','Altima',2001,'07-Sep-02',210452,'A','11-Feb-18');
INSERT INTO vehicle VALUES ('TSW-3462','Honda','Accord',2015,'09-Dec-15',NULL,NULL,NULL);
INSERT INTO vehicle VALUES ('DEL-8888','Nissan','Rogue',2014,'11-May-16',31209,'A','11-Feb-18');
INSERT INTO vehicle VALUES ('P11-212A','Honda','Accord',2009,'14-Apr-10',60452,'B','01-Sep-17');
INSERT INTO vehicle VALUES ('WIM-BLE5','Toyota','Prius',2013,'01-Mar-14',19876,'A','11-Nov-16');
			
INSERT INTO inventory VALUES('Air Filter','Toyota','S0001',11,NULL,13,2,5);
INSERT INTO inventory VALUES('Air Filter','Toyota','S0002',11,NULL,26,5,6);
INSERT INTO inventory VALUES('Air Filter','Honda','S0001',59,NULL,43,20,5);
INSERT INTO inventory VALUES('Air Filter','Honda','S0002',59,NULL,46,35,6);
INSERT INTO inventory VALUES('Air Filter','Nissan','S0001',61,NULL,33,20,5);
INSERT INTO inventory VALUES('Air Filter','Nissan','S0002',61,NULL,16,5,6);
INSERT INTO inventory VALUES('Axel Rod','Toyota','S0001',123,2,18,5,7);
INSERT INTO inventory VALUES('Axel Rod','Toyota','S0002',123,2,27,6,10);
INSERT INTO inventory VALUES('Axel Rod','Honda','S0001',141,2,8,5,7);
INSERT INTO inventory VALUES('Axel Rod','Honda','S0002',141,2,7,6,10);
INSERT INTO inventory VALUES('Axel Rod','Nissan','S0001',241,3,38,5,7);
INSERT INTO inventory VALUES('Axel Rod','Nissan','S0002',241,3,17,6,10);
INSERT INTO inventory VALUES('Battery','Toyota','S0001',63,6,10,2,5);
INSERT INTO inventory VALUES('Battery','Toyota','S0002',63,6,24,2,3);
INSERT INTO inventory VALUES('Battery','Honda','S0001',79,3,20,20,5);
INSERT INTO inventory VALUES('Battery','Honda','S0002',79,3,64,52,3);
INSERT INTO inventory VALUES('Battery','Nissan','S0001',14,3,30,2,5);
INSERT INTO inventory VALUES('Battery','Nissan','S0002',14,3,14,5,3);
INSERT INTO inventory VALUES('Brake Fluid','Toyota','S0001',24,NULL,4,4,6);
INSERT INTO inventory VALUES('Brake Fluid','Toyota','S0002',24,NULL,25,3,3);
INSERT INTO inventory VALUES('Brake Fluid','Honda','S0001',75,NULL,14,4,6);
INSERT INTO inventory VALUES('Brake Fluid','Honda','S0002',75,NULL,15,3,3);
INSERT INTO inventory VALUES('Brake Fluid','Nissan','S0001',16,NULL,34,4,6);
INSERT INTO inventory VALUES('Brake Fluid','Nissan','S0002',16,NULL,15,3,3);
INSERT INTO inventory VALUES('Brake Shoes','Toyota','S0001',62,2,18,4,3);
INSERT INTO inventory VALUES('Brake Shoes','Toyota','S0002',62,2,20,3,5);
INSERT INTO inventory VALUES('Brake Shoes','Honda','S0001',41,3,8,4,3);
INSERT INTO inventory VALUES('Brake Shoes','Honda','S0002',41,3,20,3,5);
INSERT INTO inventory VALUES('Brake Shoes','Nissan','S0001',47,1,38,4,3);
INSERT INTO inventory VALUES('Brake Shoes','Nissan','S0002',47,1,10,3,5);
INSERT INTO inventory VALUES('Camshaft','Toyota','S0001',1428,3,12,2,5);
INSERT INTO inventory VALUES('Camshaft','Toyota','S0002',1428,3,22,2,6);
INSERT INTO inventory VALUES('Camshaft','Honda','S0001',511,2,22,20,5);
INSERT INTO inventory VALUES('Camshaft','Honda','S0002',511,2,42,42,6);
INSERT INTO inventory VALUES('Camshaft','Nissan','S0001',1295,2,32,20,5);
INSERT INTO inventory VALUES('Camshaft','Nissan','S0002',1295,2,12,4,6);
INSERT INTO inventory VALUES('Catalytic Converter','Toyota','S0001',801,1,11,1,5);
INSERT INTO inventory VALUES('Catalytic Converter','Toyota','S0002',801,1,29,4,5);
INSERT INTO inventory VALUES('Catalytic Converter','Honda','S0001',716,2,31,10,5);
INSERT INTO inventory VALUES('Catalytic Converter','Honda','S0002',716,2,29,24,5);
INSERT INTO inventory VALUES('Catalytic Converter','Nissan','S0001',589,1,31,10,5);
INSERT INTO inventory VALUES('Catalytic Converter','Nissan','S0002',589,1,19,4,5);
INSERT INTO inventory VALUES('Coolant','Toyota','S0001',63,NULL,13,2,4);
INSERT INTO inventory VALUES('Coolant','Toyota','S0002',63,NULL,21,2,4);
INSERT INTO inventory VALUES('Coolant','Honda','S0001',10,NULL,23,23,4);
INSERT INTO inventory VALUES('Coolant','Honda','S0002',10,NULL,21,12,4);
INSERT INTO inventory VALUES('Coolant','Nissan','S0001',39,NULL,33,23,4);
INSERT INTO inventory VALUES('Coolant','Nissan','S0002',39,NULL,11,2,4);
INSERT INTO inventory VALUES('Drive belt','Toyota','S0001',528,1,15,3,5);
INSERT INTO inventory VALUES('Drive belt','Toyota','S0002',528,1,20,3,4);
INSERT INTO inventory VALUES('Drive belt','Honda','S0001',1443,1,35,30,5);
INSERT INTO inventory VALUES('Drive belt','Honda','S0002',1443,1,30,23,4);
INSERT INTO inventory VALUES('Drive belt','Nissan','S0001',1084,3,35,30,5);
INSERT INTO inventory VALUES('Drive belt','Nissan','S0002',1084,3,10,3,4);
INSERT INTO inventory VALUES('Engine oil','Toyota','S0001',63,NULL,5,5,5);
INSERT INTO inventory VALUES('Engine oil','Toyota','S0002',63,NULL,26,20,5);
INSERT INTO inventory VALUES('Engine oil','Honda','S0001',27,NULL,15,5,5);
INSERT INTO inventory VALUES('Engine oil','Honda','S0002',27,NULL,26,10,5);
INSERT INTO inventory VALUES('Engine oil','Nissan','S0001',14,NULL,35,5,5);
INSERT INTO inventory VALUES('Engine oil','Nissan','S0002',14,NULL,16,10,5);
INSERT INTO inventory VALUES('Gears','Toyota','S0001',523,1,8,3,5);
INSERT INTO inventory VALUES('Gears','Toyota','S0002',523,1,20,7,5);
INSERT INTO inventory VALUES('Gears','Honda','S0001',1344,3,18,3,5);
INSERT INTO inventory VALUES('Gears','Honda','S0002',1344,3,70,7,5);
INSERT INTO inventory VALUES('Gears','Nissan','S0001',1176,3,38,3,5);
INSERT INTO inventory VALUES('Gears','Nissan','S0002',1176,3,10,7,5);
INSERT INTO inventory VALUES('Light assembly','Toyota','S0001',617,2,2,1,8);
INSERT INTO inventory VALUES('Light assembly','Toyota','S0002',617,2,28,6,3);
INSERT INTO inventory VALUES('Light assembly','Honda','S0001',1342,2,12,10,8);
INSERT INTO inventory VALUES('Light assembly','Honda','S0002',1342,2,8,6,3);
INSERT INTO inventory VALUES('Light assembly','Nissan','S0001',1367,2,32,10,8);
INSERT INTO inventory VALUES('Light assembly','Nissan','S0002',1367,2,18,6,3);
INSERT INTO inventory VALUES('Oil Filter','Toyota','S0001',36,NULL,1,1,4);
INSERT INTO inventory VALUES('Oil Filter','Toyota','S0002',36,NULL,21,4,5);
INSERT INTO inventory VALUES('Oil Filter','Honda','S0001',42,NULL,11,4,4);
INSERT INTO inventory VALUES('Oil Filter','Honda','S0002',42,NULL,31,24,5);
INSERT INTO inventory VALUES('Oil Filter','Nissan','S0001',61,NULL,31,4,4);
INSERT INTO inventory VALUES('Oil Filter','Nissan','S0002',61,NULL,11,4,5);
INSERT INTO inventory VALUES('Piston','Toyota','S0001',1256,1,15,4,2);
INSERT INTO inventory VALUES('Piston','Toyota','S0002',1256,1,21,3,5);
INSERT INTO inventory VALUES('Piston','Honda','S0001',1145,1,55,48,2);
INSERT INTO inventory VALUES('Piston','Honda','S0002',1145,1,81,73,5);
INSERT INTO inventory VALUES('Piston','Nissan','S0001',1341,3,35,18,2);
INSERT INTO inventory VALUES('Piston','Nissan','S0002',1341,3,11,7,5);
INSERT INTO inventory VALUES('Power Steering Fluid','Toyota','S0001',17,NULL,2,1,5);
INSERT INTO inventory VALUES('Power Steering Fluid','Toyota','S0002',17,NULL,27,6,4);
INSERT INTO inventory VALUES('Power Steering Fluid','Honda','S0001',24,NULL,12,7,5);
INSERT INTO inventory VALUES('Power Steering Fluid','Honda','S0002',24,NULL,17,6,4);
INSERT INTO inventory VALUES('Power Steering Fluid','Nissan','S0001',20,NULL,32,7,5);
INSERT INTO inventory VALUES('Power Steering Fluid','Nissan','S0002',20,NULL,17,6,4);
INSERT INTO inventory VALUES('Spark plug','Toyota','S0001',64,2,15,4,5);
INSERT INTO inventory VALUES('Spark plug','Toyota','S0002',64,2,20,2,4);
INSERT INTO inventory VALUES('Spark plug','Honda','S0001',50,2,45,42,5);
INSERT INTO inventory VALUES('Spark plug','Honda','S0002',50,2,50,32,4);
INSERT INTO inventory VALUES('Spark plug','Nissan','S0001',11,1,35,12,5);
INSERT INTO inventory VALUES('Spark plug','Nissan','S0002',11,1,10,2,4);
INSERT INTO inventory VALUES('Suspension fluid','Toyota','S0001',70,NULL,3,1,5);
INSERT INTO inventory VALUES('Suspension fluid','Toyota','S0002',70,NULL,25,6,6);
INSERT INTO inventory VALUES('Suspension fluid','Honda','S0001',77,NULL,13,11,5);
INSERT INTO inventory VALUES('Suspension fluid','Honda','S0002',77,NULL,15,6,6);
INSERT INTO inventory VALUES('Suspension fluid','Nissan','S0001',32,NULL,33,11,5);
INSERT INTO inventory VALUES('Suspension fluid','Nissan','S0002',32,NULL,15,6,6);
INSERT INTO inventory VALUES('Valve','Toyota','S0001',1338,1,12,7,5);
INSERT INTO inventory VALUES('Valve','Toyota','S0002',1338,1,11,3,6);
INSERT INTO inventory VALUES('Valve','Honda','S0001',1261,2,12,7,5);
INSERT INTO inventory VALUES('Valve','Honda','S0002',1261,2,11,3,6);
INSERT INTO inventory VALUES('Valve','Nissan','S0001',1013,1,32,7,5);
INSERT INTO inventory VALUES('Valve','Nissan','S0002',1013,1,11,3,6);
INSERT INTO inventory VALUES('Wiper Fluid','Toyota','S0001',28,NULL,12,5,5);
INSERT INTO inventory VALUES('Wiper Fluid','Toyota','S0002',28,NULL,16,13,5);
INSERT INTO inventory VALUES('Wiper Fluid','Honda','S0001',56,NULL,12,5,5);
INSERT INTO inventory VALUES('Wiper Fluid','Honda','S0002',56,NULL,16,13,5);
INSERT INTO inventory VALUES('Wiper Fluid','Nissan','S0001',31,NULL,12,5,5);
INSERT INTO inventory VALUES('Wiper Fluid','Nissan','S0002',31,NULL,16,13,5);

insert into manager values ('950932130', 'Larry Cohen','1979 Henry Street, Raleigh, NC 27606','lacohen@acme.com','316-978-5494', '15-AUG-16', 11000,'S0001');
insert into manager values ('291056276', 'Roderick Phillips', '1133 Burton Avenue, Charlotte, NC 28201', 'rophillips@acme.com', '901-777-0492', '15-APR-17', 12000, 'S0002');

insert into receptionist values ('634622236','Willis Martin','465 Aviation Way, Raleigh, NC 27601','wimartin@acme.com','213-988-2011','04-DEC-2017',8000,'S0001');
insert into receptionist values ('911639633','Dena Holmes','1382 Whispering Pines Circle, Charlotte, NC 28205','deholmes@acme.com','972-353-3691','04-JAN-10',9000,'S0002');

insert into mechanic values('557279280', 'Jacob Gloss', '2014 Leverton Cove Road, Raleigh, NC 27560', 'jagloss@acme.com','413-335-9523','29-JUL-18', 30, 'S0001');
insert into mechanic values('183683346', 'Anthony Freeman', '1188 Summit Street, Raleigh, NC 27627', 'anfreeman@acme.com','563-496-7912','09-FEB-15', 40, 'S0001');
insert into mechanic values('557279281', 'Eric Fowler', '1114 Fincham Road, Raleigh, NC 27545', 'erfowler@acme.com','760-457-9846','01-MAY-16', 35, 'S0001');
insert into mechanic values('557279282', 'Roland Richmond', '1951 Little Acres Lane, Raleigh, NC 27513', 'rorichmond@acme.com','829843373', '28-DEC-17', 30, 'S0001');
insert into mechanic values('557279283', 'Peter Fitzpatrick', '4738 Buckhannan Avenue, Raleigh, NC 27625', 'pefitzpatrick@acme.com','315-485-1152','12-APR-17',34, 'S0001');
insert into mechanic values('590424694', 'Dustin Esparza', '3510 Hemlock Lane, Charlotte, NC 28202', 'duesparza@acme.com','956-444-0948','26-JAN-17',35, 'S0002');
insert into mechanic values('401671897', 'Charles Pudilo', '196 Park Boulevard, Charlotte, NC 28222', 'chpudilo@acme.com','641-752-9403','06-JUL-16', 40, 'S0002');
insert into mechanic values('310773348', 'James Rivera', '908 Alpha Avenue, Charlotte, NC 28130', 'jarivera@acme.com', '903-967-1809', '29-OCT-13', 40, 'S0002');
insert into mechanic values('983204784', 'Willis Morton', '404 Tenmile, Charlotte, NC 28134', 'wimorton@acme.com', '757-886-6330', '13-OCT-18', 30, 'S0002');
insert into mechanic values('187658163', 'Rickie Henderson', '1963 Chenoweth Drive, Charlotte, NC 28228', 'rihenderson@acme.com', '931-539-1294', '29-MAR-17', 30, 'S0002');

insert into repairs values('Engine knock', 'Timing issue', 75);
insert into repairs values('Car drifts in a particular direction', 'Wheel alignment issue', 50);
insert into repairs values('Battery does not hold charge', 'Battery needs replacement', 25);
insert into repairs values('Black/unclean exhaust', 'Bad catalytic convertor and filters', 75);
insert into repairs values('A/C-Heater not working', 'Drive belt damaged, coolant not enough, weak battery', 50);
insert into repairs values('Headlamps/Tail lamps not working', 'Light assembly damaged', 30);
insert into repairs values('Check engine light', 'Gearbox and Torque convertor issue', 100);

insert into basic_services values('Air filter change', 'Toyota', 'Corolla', 'air filter', 1, 50, 0.25);
insert into basic_services values('Battery replacement', 'Toyota', 'Corolla', 'battery', 1, 50, 0.25);
insert into basic_services values('Brake check', 'Toyota', 'Corolla', 'brake fluid', 1, 50, 0.25);
insert into basic_services values('Brake repair', 'Toyota', 'Corolla', 'brake shoes', 4, 50, 0.5);
insert into basic_services values('Camshaft replacement', 'Toyota', 'Corolla', 'camshaft', 1, 65, 1);
insert into basic_services values('Catalytic convertor replacement', 'Toyota', 'Corolla', 'catalytic convertor', 1, 65, 1);
insert into basic_services values('Coolant recycle', 'Toyota', 'Corolla', 'coolant', 1, 50, 0.25);
insert into basic_services values('Drive belt replacement', 'Toyota', 'Corolla', 'drive belt', 1, 65, 1);
insert into basic_services values('Engine oil change', 'Toyota', 'Corolla', 'engine oil', 1, 50, 0.25);
insert into basic_services values('Gearbox repair', 'Toyota', 'Corolla', 'gears', 6, 65, 1);
insert into basic_services values('Headlights replacement', 'Toyota', 'Corolla', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Oil filter change', 'Toyota', 'Corolla', 'oil filter', 1, 50, 0.25);
insert into basic_services values('Piston replacement', 'Toyota', 'Corolla', 'piston', 4, 65, 1);
insert into basic_services values('Power steering check', 'Toyota', 'Corolla', 'power steering fluid', 1, 50, 0.25);
insert into basic_services values('Spark plugs replacement', 'Toyota', 'Corolla', 'spark plugs', 4, 50, 0.25);
insert into basic_services values('Suspension check', 'Toyota', 'Corolla', 'suspension fluid', 1, 50, 0.25);
insert into basic_services values('Tail lights replacement', 'Toyota', 'Corolla', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Turn lights replacement', 'Toyota', 'Corolla', 'light assemby', 4, 50, 0.5);
insert into basic_services values('Valve replacement', 'Toyota', 'Corolla', 'valves', 4, 65, 1);
insert into basic_services values('Wheel alignment', 'Toyota', 'Corolla', 'axel rod', 2, 65, 1);
insert into basic_services values('Wiper check', 'Toyota', 'Corolla', 'wiper fluid', 1, 50, 0.25);
insert into basic_services values('Air filter change', 'Toyota', 'Prius', 'air filter', 1, 50, 0.25);
insert into basic_services values('Battery replacement', 'Toyota', 'Prius', 'battery', 1, 50, 0.25);
insert into basic_services values('Brake check', 'Toyota', 'Prius', 'brake fluid', 1, 50, 0.25);
insert into basic_services values('Brake repair', 'Toyota', 'Prius', 'brake shoes', 4, 50, 0.5);
insert into basic_services values('Camshaft replacement', 'Toyota', 'Prius', 'camshaft', 1, 65, 1);
insert into basic_services values('Catalytic convertor replacement', 'Toyota', 'Prius', 'catalytic convertor', 1, 65, 1);
insert into basic_services values('Coolant recycle', 'Toyota', 'Prius', 'coolant', 1, 50, 0.25);
insert into basic_services values('Drive belt replacement', 'Toyota', 'Prius', 'drive belt', 1, 65, 1);
insert into basic_services values('Engine oil change', 'Toyota', 'Prius', 'engine oil', 1, 50, 0.25);
insert into basic_services values('Gearbox repair', 'Toyota', 'Prius', 'gears', 6, 65, 1);
insert into basic_services values('Headlights replacement', 'Toyota', 'Prius', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Oil filter change', 'Toyota', 'Prius', 'oil filter', 1, 50, 0.25);
insert into basic_services values('Piston replacement', 'Toyota', 'Prius', 'piston', 4, 65, 1);
insert into basic_services values('Power steering check', 'Toyota', 'Prius', 'power steering fluid', 1, 50, 0.25);
insert into basic_services values('Spark plugs replacement', 'Toyota', 'Prius', 'spark plugs', 4, 50, 0.25);
insert into basic_services values('Suspension check', 'Toyota', 'Prius', 'suspension fluid', 1, 50, 0.25);
insert into basic_services values('Tail lights replacement', 'Toyota', 'Prius', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Turn lights replacement', 'Toyota', 'Prius', 'light assemby', 4, 50, 0.5);
insert into basic_services values('Valve replacement', 'Toyota', 'Prius', 'valves', 4, 65, 1);
insert into basic_services values('Wheel alignment', 'Toyota', 'Prius', 'axel rod', 2, 65, 1);
insert into basic_services values('Wiper check', 'Toyota', 'Prius', 'wiper fluid', 1, 50, 0.25);
insert into basic_services values('Air filter change', 'Honda', 'Civic', 'air filter', 1, 50, 0.25);
insert into basic_services values('Battery replacement', 'Honda', 'Civic', 'battery', 1, 50, 0.25);
insert into basic_services values('Brake check', 'Honda', 'Civic', 'brake fluid', 1, 50, 0.25);
insert into basic_services values('Brake repair', 'Honda', 'Civic', 'brake shoes', 4, 50, 0.5);
insert into basic_services values('Camshaft replacement', 'Honda', 'Civic', 'camshaft', 1, 65, 1);
insert into basic_services values('Catalytic convertor replacement', 'Honda', 'Civic', 'catalytic convertor', 1, 65, 1);
insert into basic_services values('Coolant recycle', 'Honda', 'Civic', 'coolant', 1, 50, 0.25);
insert into basic_services values('Drive belt replacement', 'Honda', 'Civic', 'drive belt', 1, 65, 1);
insert into basic_services values('Engine oil change', 'Honda', 'Civic', 'engine oil', 1, 50, 0.25);
insert into basic_services values('Gearbox repair', 'Honda', 'Civic', 'gears', 12, 65, 1);
insert into basic_services values('Headlights replacement', 'Honda', 'Civic', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Oil filter change', 'Honda', 'Civic', 'oil filter', 1, 50, 0.25);
insert into basic_services values('Piston replacement', 'Honda', 'Civic', 'piston', 4, 65, 1);
insert into basic_services values('Power steering check', 'Honda', 'Civic', 'power steering fluid', 1, 50, 0.25);
insert into basic_services values('Spark plugs replacement', 'Honda', 'Civic', 'spark plugs', 4, 50, 0.25);
insert into basic_services values('Suspension check', 'Honda', 'Civic', 'suspension fluid', 1, 50, 0.25);
insert into basic_services values('Tail lights replacement', 'Honda', 'Civic', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Turn lights replacement', 'Honda', 'Civic', 'light assemby', 4, 50, 0.5);
insert into basic_services values('Valve replacement', 'Honda', 'Civic', 'valves', 4, 65, 1);
insert into basic_services values('Wheel alignment', 'Honda', 'Civic', 'axel rod', 2, 65, 1);
insert into basic_services values('Wiper check', 'Honda', 'Civic', 'wiper fluid', 1, 50, 0.25);
insert into basic_services values('Air filter change', 'Honda', 'Accord', 'air filter', 2, 50, 0.25);
insert into basic_services values('Battery replacement', 'Honda', 'Accord', 'battery', 1, 50, 0.25);
insert into basic_services values('Brake check', 'Honda', 'Accord', 'brake fluid', 1, 50, 0.25);
insert into basic_services values('Brake repair', 'Honda', 'Accord', 'brake shoes', 4, 50, 0.5);
insert into basic_services values('Camshaft replacement', 'Honda', 'Accord', 'camshaft', 1, 65, 1);
insert into basic_services values('Catalytic convertor replacement', 'Honda', 'Accord', 'catalytic convertor', 1, 65, 1);
insert into basic_services values('Coolant recycle', 'Honda', 'Accord', 'coolant', 1, 50, 0.25);
insert into basic_services values('Drive belt replacement', 'Honda', 'Accord', 'drive belt', 1, 65, 1);
insert into basic_services values('Engine oil change', 'Honda', 'Accord', 'engine oil', 1, 50, 0.25);
insert into basic_services values('Gearbox repair', 'Honda', 'Accord', 'gears', 7, 65, 1);
insert into basic_services values('Headlights replacement', 'Honda', 'Accord', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Oil filter change', 'Honda', 'Accord', 'oil filter', 1, 50, 0.25);
insert into basic_services values('Piston replacement', 'Honda', 'Accord', 'piston', 4, 65, 1);
insert into basic_services values('Power steering check', 'Honda', 'Accord', 'power steering fluid', 1, 50, 0.25);
insert into basic_services values('Spark plugs replacement', 'Honda', 'Accord', 'spark plugs', 4, 50, 0.25);
insert into basic_services values('Suspension check', 'Honda', 'Accord', 'suspension fluid', 1, 50, 0.25);
insert into basic_services values('Tail lights replacement', 'Honda', 'Accord', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Turn lights replacement', 'Honda', 'Accord', 'light assemby', 4, 50, 0.5);
insert into basic_services values('Valve replacement', 'Honda', 'Accord', 'valves', 4, 65, 1);
insert into basic_services values('Wheel alignment', 'Honda', 'Accord', 'axel rod', 2, 65, 1);
insert into basic_services values('Wiper check', 'Honda', 'Accord', 'wiper fluid', 1, 50, 0.25);
insert into basic_services values('Air filter change', 'Nissan', 'Altima', 'air filter', 1, 50, 0.25);
insert into basic_services values('Battery replacement', 'Nissan', 'Altima', 'battery', 1, 50, 0.25);
insert into basic_services values('Brake check', 'Nissan', 'Altima', 'brake fluid', 1, 50, 0.25);
insert into basic_services values('Brake repair', 'Nissan', 'Altima', 'brake shoes', 4, 50, 0.5);
insert into basic_services values('Camshaft replacement', 'Nissan', 'Altima', 'camshaft', 1, 65, 1);
insert into basic_services values('Catalytic convertor replacement', 'Nissan', 'Altima', 'catalytic convertor', 1, 65, 1);
insert into basic_services values('Coolant recycle', 'Nissan', 'Altima', 'coolant', 2, 50, 0.25);
insert into basic_services values('Drive belt replacement', 'Nissan', 'Altima', 'drive belt', 1, 65, 1);
insert into basic_services values('Engine oil change', 'Nissan', 'Altima', 'engine oil', 2, 50, 0.25);
insert into basic_services values('Gearbox repair', 'Nissan', 'Altima', 'gears', 7, 65, 1);
insert into basic_services values('Headlights replacement', 'Nissan', 'Altima', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Oil filter change', 'Nissan', 'Altima', 'oil filter', 1, 50, 0.25);
insert into basic_services values('Piston replacement', 'Nissan', 'Altima', 'piston', 6, 65, 1);
insert into basic_services values('Power steering check', 'Nissan', 'Altima', 'power steering fluid', 1, 50, 0.25);
insert into basic_services values('Spark plugs replacement', 'Nissan', 'Altima', 'spark plugs', 6, 50, 0.25);
insert into basic_services values('Suspension check', 'Nissan', 'Altima', 'suspension fluid', 1, 50, 0.25);
insert into basic_services values('Tail lights replacement', 'Nissan', 'Altima', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Turn lights replacement', 'Nissan', 'Altima', 'light assemby', 4, 50, 0.5);
insert into basic_services values('Valve replacement', 'Nissan', 'Altima', 'valves', 6, 65, 1);
insert into basic_services values('Wheel alignment', 'Nissan', 'Altima', 'axel rod', 2, 65, 1);
insert into basic_services values('Wiper check', 'Nissan', 'Altima', 'wiper fluid', 1, 50, 0.25);
insert into basic_services values('Air filter change', 'Nissan', 'Rogue', 'air filter', 3, 50, 0.25);
insert into basic_services values('Battery replacement', 'Nissan', 'Rogue', 'battery', 2, 50, 0.25);
insert into basic_services values('Brake check', 'Nissan', 'Rogue', 'brake fluid', 2, 50, 0.25);
insert into basic_services values('Brake repair', 'Nissan', 'Rogue', 'brake shoes', 4, 50, 0.5);
insert into basic_services values('Camshaft replacement', 'Nissan', 'Rogue', 'camshaft', 2, 65, 1);
insert into basic_services values('Catalytic convertor replacement', 'Nissan', 'Rogue', 'catalytic convertor', 1, 65, 1);
insert into basic_services values('Coolant recycle', 'Nissan', 'Rogue', 'coolant', 2, 50, 0.25);
insert into basic_services values('Drive belt replacement', 'Nissan', 'Rogue', 'drive belt', 1, 65, 1);
insert into basic_services values('Engine oil change', 'Nissan', 'Rogue', 'engine oil', 3, 50, 0.25);
insert into basic_services values('Gearbox repair', 'Nissan', 'Rogue', 'gears', 9, 65, 1);
insert into basic_services values('Headlights replacement', 'Nissan', 'Rogue', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Oil filter change', 'Nissan', 'Rogue', 'oil filter', 2, 50, 0.25);
insert into basic_services values('Piston replacement', 'Nissan', 'Rogue', 'piston', 8, 65, 1);
insert into basic_services values('Power steering check', 'Nissan', 'Rogue', 'power steering fluid', 1, 50, 0.25);
insert into basic_services values('Spark plugs replacement', 'Nissan', 'Rogue', 'spark plugs', 8, 50, 0.25);
insert into basic_services values('Suspension check', 'Nissan', 'Rogue', 'suspension fluid', 1, 50, 0.25);
insert into basic_services values('Tail lights replacement', 'Nissan', 'Rogue', 'light assemby', 2, 50, 0.5);
insert into basic_services values('Turn lights replacement', 'Nissan', 'Rogue', 'light assemby', 4, 50, 0.5);
insert into basic_services values('Valve replacement', 'Nissan', 'Rogue', 'valves', 8, 65, 1);
insert into basic_services values('Wheel alignment', 'Nissan', 'Rogue', 'axel rod', 2, 65, 1);
insert into basic_services values('Wiper check', 'Nissan', 'Rogue', 'wiper fluid', 1, 50, 0.25);



insert into owns values(‘XYZ-5643’, 1001);
insert into owns values(‘AHS-3132’, 1001);
insert into owns values(‘IRM-1212’, 1002);
insert into owns values(‘TSW-3462’, 1003);
insert into owns values(‘DEL-8888’, 1003);
insert into owns values(‘P11-212A’, 1004);
insert into owns values(‘WIM-BLE5’, 1004);


#Please change insert scripts for maintenance table according to new table definition
Insert into maintenance values (‘XYZ-5643’,’Suspension check’, ‘C’, 90452);
Insert into maintenance values (‘XYZ-5643’,’Power steering check’, ‘C’, 90452);
Insert into maintenance values (‘IRM-1212’, ‘Engine oil change’, ‘A’, 210452);
Insert into maintenance values (‘IRM-1212’,’Air filter change’, ‘A’, 210452);
Insert into maintenance values (‘IRM-1212’,’Oil filter change’, ‘A’, 210452);
Insert into maintenance values (‘IRM-1212’,’Coolant recycle’, ‘A’, 210452);
 
Insert into maintenance values (‘DEL-8888’,’Engine oil change’, ‘A’, 31209);
Insert into maintenance values (‘DEL-8888’,’Air filter change’, ‘A’, 31209);
Insert into maintenance values (‘DEL-8888’,’Power steering check’, ‘A’, 31209);
Insert into maintenance values (‘DEL-8888’,’Oil filter change’, ‘A’, 31209);
Insert into maintenance values (‘DEL-8888’,’Brake check’, ‘A’, 31209);
Insert into maintenance values (‘DEL-8888’,’Coolant recycle’, ‘A’, 31209);
 
Insert into maintenance values (‘P11-212A’,’Brake check’, ‘B’, 60452);
Insert into maintenance values (‘P11-212A’,’Wiper check’, ‘B’, 60452);
Insert into maintenance values (‘P11-212A’,’Spark plugs replacement’, ‘B’, 60452);
 
Insert into maintenance values (‘WIM-BLE5’,’Engine oil change’, ‘A’, 19876);
Insert into maintenance values (‘WIM-BLE5’,’Oil filter change’, ‘A’, 19876);
Insert into maintenance values (‘WIM-BLE5’,’Coolant recycle’, ‘A’, 19876);

Insert into repair_services values (‘Drive belt replacement’, ‘Engine knock’);
Insert into repair_services values (‘Spark plugs replacement’, ‘Engine knock’);
Insert into repair_services values (‘Camshaft replacement’, ‘Engine knock’);
Insert into repair_services values (‘Valve replacement’, ‘Engine knock’);
Insert into repair_services values (‘Wheel alignment’, ‘Car drifts in a particular direction’);
Insert into repair_services values (‘Battery replacement’, ‘Battery does not hold charge’);
Insert into repair_services values (‘Air filter change’, ‘Black/unclean exhaust’);
Insert into repair_services values (‘Oil filter change’, ‘Black/unclean exhaust’);
Insert into repair_services values (‘Catalytic convertor replacement’, ‘Black/unclean exhaust’);
Insert into repair_services values (‘Drive belt replacement’, ‘A/C-Heater not working’);
Insert into repair_services values (‘coolant recycle’, ‘A/C-Heater not working’);
Insert into repair_services values (‘Battery replacement’, ‘A/C-Heater not working’);
Insert into repair_services values (‘Headlights replacement’, ‘Headlamps/Tail lamps not working’);
Insert into repair_services values (‘Tail lights replacement’, ‘Headlamps/Tail lamps not working’);
Insert into repair_services values (‘Turn lights replacement’, ‘Headlamps/Tail lamps not working’);
Insert into repair_services values (‘Piston replacement’, ‘Check engine light’);
Insert into repair_services values (‘Gear box repair’, ‘Check engine light’);
Insert into repair_services values (‘Camshaft replacement’, ‘Check engine light’);
Insert into repair_services values (‘Valve replacement’, ‘Check engine light’);

#Honda  

insert into supplies values ( ‘D0001’, ‘Air Filter’,’Honda’,NULL);
insert into supplies values ( ‘D0002’, ‘Air Filter’, ’Honda’,3);
insert into supplies values ( ‘D0001’, ‘Axel Rod’, ’Honda’,5);
insert into supplies values ( ‘D0002’, ‘Axel Rod’, ’Honda’,NULL);
insert into supplies values ( ‘D0001’, ‘Battery’, ’Honda’,4);
insert into supplies values ( ‘D0002’, ‘Battery’, ’Honda’,NULL);
insert into supplies values ( ‘D0001’, ‘Brake Fluid’, ’Honda’,NULL);
insert into supplies values ( ‘D0002’, ‘Brake Fluid’, ’Honda’,4);

insert into supplies values ( ‘D0001’, ‘Brake Shoes’, ’Honda’,NULL);
insert into supplies values ( ‘D0002’, ‘Brake Shoes’, ’Honda’,5);

insert into supplies values ( ‘D0001’, ‘Camshaft’, ’Honda’,4);
insert into supplies values ( ‘D0002’, ‘Camshaft’, ’Honda’,NULL);

insert into supplies values ( ‘D0001’, ‘Catalytic converter’, ’Honda’,NULL);
insert into supplies values ( ‘D0002’, ‘Catalytic converter’, ’Honda’,3);

insert into supplies values ( ‘D0001’, ‘Coolant’, ’Honda’,NULL);
insert into supplies values ( ‘D0002’, ‘Coolant’, ’Honda’,4);

insert into supplies values ( ‘D0001’, ‘Drive belt’, ’Honda’,NULL);
insert into supplies values ( ‘D0002’, ‘Drive belt’, ’Honda’,2);

insert into supplies values ( ‘D0001’, ‘Engine oil’, ’Honda’,2);
insert into supplies values ( ‘D0002’, ‘Engine oil’, ’Honda’,NULL);

insert into supplies values ( ‘D0001’, ‘Gears’, ’Honda’,5);
insert into supplies values ( ‘D0002’, ‘Gears’, ’Honda’,NULL);

insert into supplies values ( ‘D0001’, ‘Light assembly’, ’Honda’,3);
insert into supplies values ( ‘D0002’, ‘Light assembly’, ’Honda’,NULL);

insert into supplies values ( ‘D0001’, ‘Oil Filter’, ’Honda’,4);
insert into supplies values ( ‘D0002’, ‘Oil Filter’, ’Honda’,NULL);

insert into supplies values ( ‘D0001’, ‘Piston’, ’Honda’,2);
insert into supplies values ( ‘D0002’, ‘Piston’, ’Honda’,NULL);

insert into supplies values ( ‘D0001’, ‘Power Steering Fluid’, ’Honda’,5);
insert into supplies values ( ‘D0002’, ‘Power Steering Fluid’, ’Honda’,NULL);

insert into supplies values ( ‘D0001’, ‘Spark plug’, ’Honda’,NULL);
insert into supplies values ( ‘D0002’, ‘Spark plug’, ’Honda’,5);

insert into supplies values ( ‘D0001’, ‘Suspension fluid’, ’Honda’,NULL);
insert into supplies values ( ‘D0002’, ‘Suspension fluid’, ’Honda’,3);

insert into supplies values ( ‘D0001’, ‘Valve’, ’Honda’,3);
insert into supplies values ( ‘D0002’, ‘Valve’, ’Honda’,NULL);

insert into supplies values ( ‘D0001’, ‘Wiper Fluid’, ’Honda’,NULL);
insert into supplies values ( ‘D0002’, ‘Wiper Fluid’, ’Honda’,3);

#Toyota

insert into supplies values ( ‘D0001’, ‘Air Filter’,’Toyota’,NULL);
insert into supplies values ( ‘D0002’, ‘Air Filter’, ’Toyota’,3);
insert into supplies values ( ‘D0001’, ‘Axel Rod’, ’Toyota’,5);
insert into supplies values ( ‘D0002’, ‘Axel Rod’, ’Toyota’,NULL);
insert into supplies values ( ‘D0001’, ‘Battery’, ’Toyota’,4);
insert into supplies values ( ‘D0002’, ‘Battery’, ’Toyota’,NULL);
insert into supplies values ( ‘D0001’, ‘Brake Fluid’, ’Toyota’,NULL);
insert into supplies values ( ‘D0002’, ‘Brake Fluid’, ’Toyota’,4);

insert into supplies values ( ‘D0001’, ‘Brake Shoes’, ’Toyota’,NULL);
insert into supplies values ( ‘D0002’, ‘Brake Shoes’, ’Toyota’,5);

insert into supplies values ( ‘D0001’, ‘Camshaft’, ’Toyota’,4);
insert into supplies values ( ‘D0002’, ‘Camshaft’, ’Toyota’,NULL);

insert into supplies values ( ‘D0001’, ‘Catalytic converter’, ’Toyota’,NULL);
insert into supplies values ( ‘D0002’, ‘Catalytic converter’, ’Toyota’,3);

insert into supplies values ( ‘D0001’, ‘Coolant’, ’Toyota’,NULL);
insert into supplies values ( ‘D0002’, ‘Coolant’, ’Toyota’,4);

insert into supplies values ( ‘D0001’, ‘Drive belt’, ’Toyota’,NULL);
insert into supplies values ( ‘D0002’, ‘Drive belt’, ’Toyota’,2);

insert into supplies values ( ‘D0001’, ‘Engine oil’, ’Toyota’,2);
insert into supplies values ( ‘D0002’, ‘Engine oil’, ’Toyota’,NULL);

insert into supplies values ( ‘D0001’, ‘Gears’, ’Toyota’,5);
insert into supplies values ( ‘D0002’, ‘Gears’, ’Toyota’,NULL);

insert into supplies values ( ‘D0001’, ‘Light assembly’, ’Toyota’,3);
insert into supplies values ( ‘D0002’, ‘Light assembly’, ’Toyota’,NULL);

insert into supplies values ( ‘D0001’, ‘Oil Filter’, ’Toyota’,4);
insert into supplies values ( ‘D0002’, ‘Oil Filter’, ’Toyota’,NULL);

insert into supplies values ( ‘D0001’, ‘Piston’, ’Toyota’,2);
insert into supplies values ( ‘D0002’, ‘Piston’, ’Toyota’,NULL);

insert into supplies values ( ‘D0001’, ‘Power Steering Fluid’, ’Toyota’,5);
insert into supplies values ( ‘D0002’, ‘Power Steering Fluid’, ’Toyota’,NULL);

insert into supplies values ( ‘D0001’, ‘Spark plug’, ’Toyota’,NULL);
insert into supplies values ( ‘D0002’, ‘Spark plug’, ’Toyota’,5);

insert into supplies values ( ‘D0001’, ‘Suspension fluid’, ’Toyota’,NULL);
insert into supplies values ( ‘D0002’, ‘Suspension fluid’, ’Toyota’,3);

insert into supplies values ( ‘D0001’, ‘Valve’, ’Toyota’,3);
insert into supplies values ( ‘D0002’, ‘Valve’, ’Toyota’,NULL);

insert into supplies values ( ‘D0001’, ‘Wiper Fluid’, ’Toyota’,NULL);
insert into supplies values ( ‘D0002’, ‘Wiper Fluid’, ’Toyota’,3);

#Nissan
insert into supplies values ( ‘D0001’, ‘Air Filter’,’Nissan’,NULL);
insert into supplies values ( ‘D0002’, ‘Air Filter’, ’Nissan’,3);
insert into supplies values ( ‘D0001’, ‘Axel Rod’, ’Nissan’,5);
insert into supplies values ( ‘D0002’, ‘Axel Rod’, ’Nissan’,NULL);
insert into supplies values ( ‘D0001’, ‘Battery’, ’Nissan’,4);
insert into supplies values ( ‘D0002’, ‘Battery’, ’Nissan’,NULL);
insert into supplies values ( ‘D0001’, ‘Brake Fluid’, ’Nissan’,NULL);
insert into supplies values ( ‘D0002’, ‘Brake Fluid’, ’Nissan’,4);

insert into supplies values ( ‘D0001’, ‘Brake Shoes’, ’Nissan’,NULL);
insert into supplies values ( ‘D0002’, ‘Brake Shoes’, ’Nissan’,5);

insert into supplies values ( ‘D0001’, ‘Camshaft’, ’Nissan’,4);
insert into supplies values ( ‘D0002’, ‘Camshaft’, ’Nissan’,NULL);

insert into supplies values ( ‘D0001’, ‘Catalytic converter’, ’Nissan’,NULL);
insert into supplies values ( ‘D0002’, ‘Catalytic converter’, ’Nissan’,3);

insert into supplies values ( ‘D0001’, ‘Coolant’, ’Nissan’,NULL);
insert into supplies values ( ‘D0002’, ‘Coolant’, ’Nissan’,4);

insert into supplies values ( ‘D0001’, ‘Drive belt’, ’Nissan’,NULL);
insert into supplies values ( ‘D0002’, ‘Drive belt’, ’Nissan’,2);

insert into supplies values ( ‘D0001’, ‘Engine oil’, ’Nissan’,2);
insert into supplies values ( ‘D0002’, ‘Engine oil’, ’Nissan’,NULL);

insert into supplies values ( ‘D0001’, ‘Gears’, ’Nissan’,5);
insert into supplies values ( ‘D0002’, ‘Gears’, ’Nissan’,NULL);

insert into supplies values ( ‘D0001’, ‘Light assembly’, ’Nissan’,3);
insert into supplies values ( ‘D0002’, ‘Light assembly’, ’Nissan’,NULL);

insert into supplies values ( ‘D0001’, ‘Oil Filter’, ’Nissan’,4);
insert into supplies values ( ‘D0002’, ‘Oil Filter’, ’Nissan’,NULL);

insert into supplies values ( ‘D0001’, ‘Piston’, ’Nissan’,2);
insert into supplies values ( ‘D0002’, ‘Piston’, ’Nissan’,NULL);

insert into supplies values ( ‘D0001’, ‘Power Steering Fluid’, ’Nissan’,5);
insert into supplies values ( ‘D0002’, ‘Power Steering Fluid’, ’Nissan’,NULL);

insert into supplies values ( ‘D0001’, ‘Spark plug’, ’Nissan’,NULL);
insert into supplies values ( ‘D0002’, ‘Spark plug’, ’Nissan’,5);

insert into supplies values ( ‘D0001’, ‘Suspension fluid’, ’Nissan’,NULL);
insert into supplies values ( ‘D0002’, ‘Suspension fluid’, ’Nissan’,3);

insert into supplies values ( ‘D0001’, ‘Valve’, ’Nissan’,3);
insert into supplies values ( ‘D0002’, ‘Valve’, ’Nissan’,NULL);

insert into supplies values ( ‘D0001’, ‘Wiper Fluid’, ’Nissan’,NULL);
insert into supplies values ( ‘D0002’, ‘Wiper Fluid’, ’Nissan’,3);


