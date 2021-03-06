
/*_______________________________________________random_____________________________________________*/

CREATE FUNCTION
hello_world(hi in varchar)
RETURN varchar
IS
BEGIN
	return(hi);
END;


create or replace type login_record as object (
  username varchar2(50),
  password varchar2(50),
  account_type varchar2(50),
  id number(38)  
);
/

create or replace type login_table as table of login_record;
/

create or replace function get_login_details(p_user_id varchar2, p_password varchar2)
return login_table as
    v_ret   login_table;
begin

    select login_record(username, password, account_type, id)
    bulk collect into
      v_ret
    from 
      login_details
    where
      username = p_user_id and password = p_password;
  
    return v_ret;
  
end get_login_details;
/

/*select *from table(get_login_details('lovestory', 'lovestory123'));*/

/*__________________________________________________darshana_________________________________________________*/

/*1*/
CREATE OR REPLACE FUNCTION 
authenticate_login( un in varchar2, pw in varchar2) 
RETURN int
AS
x int := 0;
begin 
	select count(*) into x  from login_details where username=un and password = pw;
	commit;
	return(x);
END authenticate_login;


CREATE OR REPLACE FUNCTION
get_user_details( un in varchar2, nm OUT varchar, ph OUT varchar, em OUT varchar, id OUT int, ad OUT varchar)
RETURN varchar2
AS
atype varchar2(50);
userid int :=0;
begin
	select account_type into atype from login_details where username =  un;
	select id into userid from login_details where username =  un;
	id := userid;
	if atype = 'manager' then
		select name, address, phone_num, email into nm, ad, ph, em from manager where employee_id = userid;
	elsif atype = 'receptionist' then
		select name, address, phone_num, email into nm, ad, ph, em from receptionist where employee_id = userid;
	elsif atype = 'customer' then 
		select name, address, phone_num, email into nm, ad, ph, em from customer where customer_id = userid;
	end if;
	commit;
	return(atype);
END get_user_details;

/*2*/
CREATE OR REPLACE FUNCTION
register_new_user(pw in varchar2, cid int, nm in varchar2, ad in varchar2, ph in varchar2, em in varchar2, sc varchar2)
RETURN int
AS
x int := 0;
y int := 0;
begin
	insert into login_details(username, password, account_type, id) values (em, pw, 'customer', cid);
	insert into customer values(cid, nm, ad, ph, em,  sc);
	select count(*) into x from login_details where username = em;
	select count(*) into y from customer where customer_id = cid;
	commit;
	if (x+y = 2) then
		return(1);
	else
		return(0);
	end if;
END register_new_user;

/*3*/
create or replace type vehicle_record as object (
	license_plate_num VARCHAR(100),
	make VARCHAR(100),
	model VARCHAR(100),
	year INT,
	purchase_date DATE,
	last_mileage INT,
	type_of_last_service VARCHAR(100),
	date_of_last_service DATE
);
/

create or replace type vehicle_table as table of vehicle_record;
/

create or replace function get_vehicles(p_customer_id varchar)
return vehicle_table as
    v_ret   vehicle_table;
begin

    select vehicle_record(vehicle.license_plate_num, vehicle.make, vehicle.model, vehicle.year, vehicle.purchase_date, vehicle.last_mileage, vehicle.type_of_last_service, vehicle.date_of_last_service)
    bulk collect into
      v_ret
    from 
      owns, vehicle
    where
      p_customer_id = owns.customer_id and owns.license_plate_num = vehicle.license_plate_num;
    commit;
    return v_ret; 
  
end get_vehicles;
/

/*select *from table(get_vehicles('1001'));*/

/*4*/
CREATE OR REPLACE FUNCTION
update_customer_profile(cid in int, nm in varchar, ad in varchar, ph in varchar, pw in varchar2)
RETURN int
AS
x int:=0;
begin
	update customer set name = nm, address = ad, phone_num = ph where customer_id=cid;
	update login_details set password = pw where id = cid;
	x := 1;
	commit;
	return(x);
end update_customer_profile;

/*5*/
CREATE OR REPLACE FUNCTION
registerCar(cid in int, lic in varchar2, p_date in date, mk in varchar2, md in varchar2, yr in int, miles in int, s_date in date)
RETURN int
AS
x int := 0;
y int := 0;
begin
	insert into vehicle (license_plate_num, make, model, year, purchase_date, last_mileage, date_of_last_service) values(lic, mk, md, yr, p_date, miles, s_date);
	insert into owns values(lic, cid);
	select count(*) into x from vehicle where license_plate_num = lic;
	select count(*) into y from owns where license_plate_num = lic;
	commit;
	if (x+y = 2) then
		return(1);
	else
		return(0);
	end if;
END registerCar;

/*6*/
CREATE OR REPLACE type appointment_record as object(
	appointment_date_time timestamp,
	service_type varchar2(100),
	preferred_mechanic_id int,
	license_plate_num varchar2(100)
);

CREATE OR REPLACE type appointment_table as table of appointment_record;

CREATE OR REPLACE FUNCTION
view_service_history(cid in int)
RETURN appointment_table 
AS
v_ret appointment_table;
begin
	select appointment_record(appointment_date_time, service_type, preferred_mechanic_id, license_plate_num) bulk collect into v_ret from appointment where customer_id = cid;
	commit;
	return(v_ret);
end view_service_history;

/*7*/
CREATE OR REPLACE FUNCTION
schedule_maintainance_service(cid in int, lic in varchar, m in int, mech in varchar, d in timestamp)
RETURN int
AS
mk varchar(100) ;
md varchar(100);
s_type varchar2(100);
mech_id int;
begin
	select make, model into mk, md from vehicle where license_plate_num = lic;
	select distinct max(service_type) into s_type from maintainance where vehicle_make = mk and vehicle_model = md and  miles <= m;
	select employee_id  into mech_id from mechanic where name = mech;
	insert into appointment values(d, s_type, null,  mech_id, lic, cid);
	commit;
	return(1);
END schedule_maintainance_service;
	
/*8*/
CREATE OR REPLACE FUNCTION
schedule_repair_service(cid in int, lic in varchar, prob in varchar, m in int, mech in varchar, d in timestamp)
RETURN int
AS
mech_id int;
begin
	select employee_id  into mech_id from mechanic where name = mech;
	insert into appointment values(d, prob, null,  mech_id, lic, cid);
	commit;
	return(1);
END schedule_repair_service;

/*9*/
CREATE OR REPLACE type part_record as object(
	part_name varchar2(100)
);
/
CREATE OR REPLACE type part_table as table of part_record;
/
CREATE OR REPLACE FUNCTION
diagnostic_report(prob in varchar)
RETURN part_table
AS
v_ret part_table;
begin
	select part_record(part_name) bulk collect into v_ret from basic_services bs, repair_services rs where rs.service_name = bs.service_name and rs.problem = prob;
	commit;
	return(v_ret);
end diagnostic_report;
/*select * from table(diagnostic_report('Engine knock'));*/	


/*10*/
CREATE OR REPLACE type part_price_record as object(
	part_name varchar2(100),
	price int
);

CREATE OR REPLACE type part_price_table as table of part_price_record;

CREATE OR REPLACE FUNCTION
get_service_parts_prices(dt in timestamp)
RETURN part_price_table
AS
v_ret part_price_table;
s_type varchar2(100);
lic varchar2(100);
mk varchar(100);
md varchar(100);
begin
	select service_type, license_plate_num into s_type, lic from appointment where appointment_date_time=dt;
	select make, model into mk, md from vehicle where license_plate_num = lic;
	if s_type = 'A' then
		select part_price_record(p.part_name, p.price) bulk collect into v_ret from basic_services bs, maintainance m, parts p where  m.vehicle_make = mk and m.vehicle_model = md and m.service_name = bs.service_name and m.service_type = 'A' and bs.part_name = p.part_name and p.vehicle_make = m.vehicle_make;
	elsif s_type = 'B' then
		select part_price_record(p.part_name, p.price) bulk collect into v_ret from basic_services bs, maintainance m, parts p where  m.vehicle_make = mk and m.vehicle_model = md and m.service_name = bs.service_name and m.service_type = 'B' and bs.part_name = p.part_name and p.vehicle_make = m.vehicle_make;
	elsif s_type = 'C' then
		select part_price_record(p.part_name, p.price) bulk collect into v_ret from basic_services bs, maintainance m, parts p where  m.vehicle_make = mk and m.vehicle_model = md and m.service_name = bs.service_name and m.service_type = 'C' and bs.part_name = p.part_name and p.vehicle_make = m.vehicle_make;
	else
		select part_price_record(p.part_name, p.price) bulk collect into v_ret from basic_services bs, repair_services rs, parts p where  rs.service_name = bs.service_name and bs.part_name = p.part_name and p.vehicle_make = mk and rs.problem = s_type;
	end if;
	return(v_ret);
	commit;
end get_service_parts_prices;


CREATE OR REPLACE FUNCTION
get_detailed_invoice(dt in timestamp, lic out varchar, s_type out varchar, s_det out varchar, mech_name out varchar, cost out int, hours out float)
RETURN int
AS
v_ret part_table;
mech_id int;
mech_wage int;
mk varchar(100);
md varchar(100);
begin
	select license_plate_num, service_type, preferred_mechanic_id into lic, s_det, mech_id from appointment where appointment_date_time = dt;
	select name, hourly_salary into mech_name, mech_wage from mechanic where employee_id = mech_id;
	select make, model into mk, md from vehicle where license_plate_num = lic;
	if s_det = 'A' then  
		s_type := 'maintainance';
		select sum(bs.time) into hours from basic_services bs, repair_services rs, maintainance m where m.vehicle_make = mk and m.vehicle_model = md and m.service_name = bs.service_name and m.service_type = 'A';
		select sum(bs.charge_rate) into cost from basic_services bs, repair_services rs, maintainance m where m.vehicle_make = mk and m.vehicle_model = md and m.service_name = bs.service_name and m.service_type = 'A';
		cost := cost + (mech_wage * hours);
	elsif s_det = 'B' then  
		s_type := 'maintainance';
		select sum(bs.time) into hours from basic_services bs, maintainance m where m.vehicle_make = mk and m.vehicle_model = md and m.service_name = bs.service_name and m.service_type = 'B';
		select sum(bs.charge_rate) into cost from basic_services bs, repair_services rs, maintainance m where m.vehicle_make = mk and m.vehicle_model = md and m.service_name = bs.service_name and m.service_type = 'B';
		cost := cost + (mech_wage * hours);
	elsif s_det = 'C' then  
		s_type := 'maintainance';
		select sum(bs.time) into hours from basic_services bs, maintainance m where m.vehicle_make = mk and m.vehicle_model = md and m.service_name = bs.service_name and m.service_type = 'C';
		select sum(bs.charge_rate) into cost from basic_services bs, repair_services rs, maintainance m where m.vehicle_make = mk and m.vehicle_model = md and m.service_name = bs.service_name and m.service_type = 'C';
		cost := cost + (mech_wage * hours);
	else 
		s_type := 'repair';
		select sum(bs.time) into hours from basic_services bs, repair_services rs where rs.service_name = bs.service_name and rs.problem = s_det;
		select sum(bs.charge_rate) into cost from basic_services bs, repair_services rs where rs.service_name = bs.service_name and rs.problem = s_det;
		cost := cost + (mech_wage * hours);
	end if; 
	commit;
	return(1);
end get_detailed_invoice;

/*select sum(bs.charge_rate) from basic_services bs, maintainance m where m.vehicle_make = 'Toyota' and m.vehicle_model = 'Corolla' and m.service_name = bs.service_name and m.service_type='A';*/

/*11*/
CREATE OR REPLACE FUNCTION
get_upcoming_appointments(cid in int, lic out varchar, dt out timestamp, s_type out varchar, s_det out varchar, m_name out varchar)
RETURN int
AS
mech_id int;
x int:=1;
begin
	select license_plate_num, appointment_date_time, service_type, preferred_mechanic_id into lic, dt, s_det, mech_id from appointment where appointment_date_time > sysdate;
	select name into m_name from mechanic where employee_id = mech_id;
	if s_det = 'A' or s_det = 'B' or s_det = 'C' then
		s_type := 'maintainance';
	else
		s_type := 'repair';
	end if;
	commit;
	return(x);
end get_upcoming_appointments;

/*12*/
CREATE OR REPLACE FUNCTION
get_completed_appointments(cid in int, lic out varchar, dt out timestamp, s_type out varchar, s_det out varchar, m_name out varchar)
RETURN int
AS
mech_id int;
x int:=1;
begin
	select license_plate_num, appointment_date_time, service_type, preferred_mechanic_id into lic, dt, s_det, mech_id from appointment where appointment_date_time < sysdate;
	select name into m_name from mechanic where employee_id = mech_id;
	if s_det = 'A' or s_det = 'B' or s_det = 'C' then
		s_type := 'maintainance';
	else
		s_type := 'repair';
	end if;
	commit;
	return(x);
end get_completed_appointments;

/*________________________________________________sayali____________________________________________________*/

/*1*/
create or replace type profile_record as object (
	name varchar(100),
	address varchar(100),
	email varchar(100),
	phone_num varchar(100),
	start_date date,
	salary int,
	center_id varchar(100)
);
/

create or replace type profile_table as table of profile_record;
/

create or replace function get_employee_profile(p_employee_id varchar)
return profile_table as
    v_ret   profile_table;
    employee_type varchar2(50);
begin

    select account_type into employee_type
    from login_details
    where id = p_employee_id;

    if employee_type = 'manager' then 
    	select profile_record(name, address, email, phone_num, start_date, monthly_salary, center_id)
    	bulk collect into
      	v_ret
    	from 
      	manager
    	where
     	p_employee_id = employee_id;
  
 
    elsif employee_type = 'receptionist' then
	select profile_record(name, address, email, phone_num, start_date, monthly_salary, center_id)
    	bulk collect into
      	v_ret
    	from 
      	receptionist
    	where
     	p_employee_id = employee_id;
    end if;
return v_ret;
end get_employee_profile;
/


/*select *from table(get_employee_profile('634622236'));*/


