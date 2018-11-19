package com;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import oracle.jdbc.driver.OracleTypes;
import oracle.jdbc.oracore.OracleType;

public class Customer {
	
	int customer_id;
	
	public static Scanner sc = new Scanner(System.in);
	public static BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
	
	String ch;
	
	String name, address, email, phone_number, password;

	String license_plate_num, purchase_date, make, model, year, last_service_date;
	int current_mileage;
	String mechanic_name;
	
	String date1, date2;
	
	String[] repair_problems = {"Engine Knock", "Car drifts in a particular direction", "Battery does not hold charge","Black/Unclean Exhaust","A/C Heater not working","Head Lamp/Tail Lamp not working","Check Engine Light"};

	public static Connection conn;
	public static CallableStatement cstmt;
	public static PreparedStatement pstmt;
	public static String sqlQuery;
	public static ResultSet rs;
	
	public static int updateSuccess = 0, registerCarSuccess = 0;
	
	public Customer(Connection conn, int customer_id, String name, String address,String email, String phone_number, String password) {
		super();
		Customer.conn = conn;
		this.customer_id = customer_id;
		this.name = name;
		this.address = address;
		this.email = email;
		this.phone_number = phone_number;
		this.password = password;
	}
	
	public void customerLandingPage()
	{
		try
		{
			System.out.println("Customer Landing Page");
			System.out.println("\n1. Profile \n2. Register Car \n3. Service \n4. Invoices \n5. Logout \n");
			System.out.println("Enter Choice (1-5) : ");
			ch = stdin.readLine();
			
			if(ch.equals("1"))
			{
				customerProfilePage();
			}
			else if(ch.equals("2"))
			{
				 customerRegisterCarPage();
			}
			else if(ch.equals("3"))
			{
				customerServicePage();
			}
			else if(ch.equals("4"))
			{
				customerInvoicePage();
			}
			else if(ch.equals("5"))
			{
				System.out.println("Logging Out.\n");
				return;
			}
			else
			{
				System.out.println("Invalid Input!");
				customerLandingPage();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void customerProfilePage() throws IOException, SQLException
	{
		System.out.println("Customer Profile Page");
		System.out.println("\n1. View Profile \n2. Update Profile \n3. Go Back \n");
		System.out.println("Enter Choice (1-3) : ");
		
		ch = stdin.readLine();
		
		if(ch.equals("1"))
		{
			customerViewProfilePage();
		}
		else if(ch.equals("2"))
		{
			 customerUpdateProfilePage();
		}
		else if(ch.equals("3"))
		{
			customerLandingPage();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerProfilePage();
		}
		
	}
	
	public void customerViewProfilePage() throws IOException, SQLException
	{
		System.out.println("\nCustomer View Profile Page : \n");
		
		System.out.println("\nCustomer ID : "+this.customer_id);
		System.out.println("Customer Name : "+this.name);
		System.out.println("Customer Address : "+this.address);
		System.out.println("Customer Email : "+this.email);
		System.out.println("Customer Phone Number : "+this.phone_number);	
		
		//Stored Procedure to get vehicles owned by customer
		
		sqlQuery = "select * from table(get_vehicles("+Integer.toString(this.customer_id)+"))";
		pstmt = conn.prepareStatement(sqlQuery);
		
		rs = pstmt.executeQuery(sqlQuery);
		
		System.out.println("ResultSet for get_vehicles : "+rs+"\n");
		
		System.out.println("Vehicles owned by customer : ");
		System.out.println("License Plate \tMake \tModel \tYear \tPurchase Date \t\tLast Mileage \tType of Last Service \tDate of Last Service");
		while(rs.next())
		{
			System.out.println(rs.getString(1)+"\t"+rs.getString(2)+"\t"+rs.getString(3)+"\t"+rs.getInt(4)+"\t"+rs.getTimestamp(5)+"\t"+rs.getInt(6)+"\t\t"+rs.getString(7)+"\t\t\t"+rs.getTimestamp(5));
		}
		
		System.out.println("\n1. Go Back \n");
		System.out.println("Enter Choice (1) : ");
		
		ch = sc.next();
		
		if(ch.equals("1"))
		{
			customerProfilePage();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerViewProfilePage();
		}
	}

	public void customerUpdateProfilePage() throws IOException, SQLException
	{
		System.out.println("Customer Update Profile Page");
		System.out.println("\n1. Name \n2. Address \n3. Phone Number \n4. Password \n5. Go Back \n");
		System.out.println("Choose 1-4 to enter a new value : ");
		ch = stdin.readLine();
		
		if(ch.equals("1"))
		{
			System.out.println("\nEnter new name : ");
			this.name = stdin.readLine();
			customerUpdateProfilePage();
		}
		else if(ch.equals("2"))
		{
			System.out.println("\nEnter new address : ");
			this.address = stdin.readLine();
			customerUpdateProfilePage();
		}
		else if(ch.equals("3"))
		{
			System.out.println("\nEnter new phone number : ");
			this.phone_number = stdin.readLine();
			customerUpdateProfilePage();
		}
		else if(ch.equals("4"))
		{
			System.out.println("\nEnter new password : ");
			this.password = stdin.readLine();
			customerUpdateProfilePage();
		}
		else if(ch.equals("5"))
		{
			System.out.println("\nCustomer Profile Updated! ");
			
			//Stored Procedure for updating customer profile
						
			sqlQuery = "{? = call update_customer_profile(?,?,?,?,?)}";
			cstmt = conn.prepareCall(sqlQuery);
			
			cstmt.registerOutParameter(1, OracleTypes.INTEGER);
			
			cstmt.setInt(2, this.customer_id);
			cstmt.setString(3, this.name);
			cstmt.setString(4, this.address);
			cstmt.setString(5, this.phone_number);
			cstmt.setString(6, this.password);
			
			cstmt.executeUpdate();
			
			updateSuccess = cstmt.getInt(1);
			
			if(updateSuccess == 1)
			{
				System.out.println("\nCustomer Profile Updated successfully!\n");
				customerProfilePage();
			}
			else
			{
				System.out.println("\nCould not update customer profile. Try again\n");
				customerUpdateProfilePage();
			}
			
		}
		else
		{
			System.out.println("Invalid Input!");
			customerUpdateProfilePage();
		}
	}
	
	public void customerRegisterCarPage() throws IOException, SQLException
	{
		System.out.println("Customer Register Car Page");
		
		System.out.println("\nEnter license plate number :");
		this.license_plate_num = stdin.readLine();
		System.out.println("\nEnter purchase date :");
		this.purchase_date = stdin.readLine();
		System.out.println("\nEnter make :");
		this.make = stdin.readLine();
		System.out.println("\nEnter model :");
		this.model = stdin.readLine();
		System.out.println("\nEnter year :");
		this.year = stdin.readLine();
		System.out.println("\nEnter Current Mileage :");
		this.current_mileage = sc.nextInt();
		
		System.out.println("\nDo you want to enter last service date? 1. Yes  2. No\n");
		ch = stdin.readLine();
		if(ch.equals("1"))
		{
			System.out.println("\nEnter last service date :");
			this.last_service_date = stdin.readLine();
		}
		else
		{
			this.last_service_date = null;
		}
		
		System.out.println("\n1. Register Car \n2. Cancel \n");
		System.out.println("Enter Choice (1-2) : ");
		
		ch = stdin.readLine();
		if(ch.equals("1"))
		{
			//Stored Procedure to save all vehicle details
			//customer id, license_plate_num, purchase_date, make, model, year, current_mileage, last_service_date
			
			/*
			 * String SQL = "{? = call get_user_details (?,?,?,?)}";
				cstmt = conn.prepareCall (SQL);
				
				cstmt.registerOutParameter(1, OracleTypes.VARCHAR);
				
				cstmt.setString(2, "lovestory");
						   
				cstmt.registerOutParameter(3, OracleTypes.VARCHAR);
				cstmt.registerOutParameter(4, OracleTypes.VARCHAR);
				cstmt.registerOutParameter(5, OracleTypes.VARCHAR);
				
				cstmt.executeUpdate();
				
				String result = cstmt.getString(1);
				
				System.out.println("\nResult : "+cstmt.getString(1)+"\t"+cstmt.getString(3)+"\t"+cstmt.getString(4)+"\t"+cstmt.getString(5));

			 * 
			 *  registerCar(cid in int, lic in varchar2, p_date in date, mk in varchar2, md in varchar2, yr in int, miles in int, s_date in date)
				return int [ 0 if not done and 1 if done ]

				Date d = new SimpleDateFormat("dd/MM/yyyy").parse(temp);
		System.out.println("date :"+d);
				
			 */
			
			sqlQuery = "{? = call registerCar (?,?,?,?,?,?,?,?)}";
			
			cstmt.registerOutParameter(1, OracleTypes.INTEGER);
			cstmt = conn.prepareCall (sqlQuery);
			
			if(registerCarSuccess == 1)
			{
				System.out.println("\nCar Registered Successfully!\n");
				customerLandingPage();
			}
			else
			{
				System.out.println("\nCould not register car. Try again\n");
				customerRegisterCarPage();
			}
		}
		else if(ch.equals("2"))
		{
			this.license_plate_num = null;
			this.purchase_date = null;
			this.make = null;
			this.model = null;
			this.year = null;
			this.current_mileage = 0;
			this.last_service_date = null;
			
			customerLandingPage();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerRegisterCarPage();
		}
	}
	
	public void customerServicePage() throws IOException
	{
		System.out.println("Customer Service Page");
		System.out.println("\n1. View Service History \n2. Schedule Service \n3. Reshecdule Service \n4. Go Back \n");
		System.out.println("Enter Choice (1-4) : ");
		ch = sc.next();
		
		if(ch.equals("1"))
		{
			customerViewServiceHistoryPage();
		}
		else if(ch.equals("2"))
		{
			 customerScheduleServicePage();
		}
		else if(ch.equals("3"))
		{
			customerRescheduleServicePage1();
		}
		else if(ch.equals("4"))
		{
			customerLandingPage();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerServicePage();
		}
	}
	
	public void customerInvoicePage() throws IOException
	{
		System.out.println("\nCustomer Invoice Page\n");
		
		//stored procedure for getting all completed appointment/service details of customer including License Plate, Service ID, Service Start Date, Service End Date, Service Type (Maintenance/Repair), Service Details(Service A/B/C or Problem), Mechanic Name, Total Service Cost	
		//getCompletedAppointments(customer id)
		
		System.out.println("\n1. View Invoice Details \n2. Go Back \n");
		System.out.println("Enter Choice (1-2) : ");
		ch = sc.next();
		
		if(ch.equals("1"))
		{
			customerViewInvoiceDetailsPage();
		}
		else if(ch.equals("2"))
		{
			customerLandingPage();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerInvoicePage();
		}
	}
	
	public void customerViewServiceHistoryPage() throws IOException
	{
		//stored procedure for viewing customer service history
		//Display Service ID, License Plate, Service Type, Mechanic Name, Service Start	Date/Time, Service End Date/Time(expected or actual, Service Status (Pending,Ongoing, or Complete)
		
		System.out.println("\n1. Go Back \n");
		System.out.println("Enter Choice (1) : ");
		
		ch = sc.next();
		
		if(ch.equals("1"))
		{
			customerServicePage();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerViewServiceHistoryPage();
		}
	}
	
	public void customerScheduleServicePage() throws IOException
	{
		System.out.println("Customer Schedule Service Page");
		
		System.out.println("\nEnter license plate number :");
		license_plate_num = sc.next();
		System.out.println("\nEnter current mileage :");
		current_mileage = sc.nextInt();
		
		System.out.println("\nDo you want to enter preffered mechanic name? 1. Yes  2. No\n");
		ch = sc.next();
		if(ch.equals("1"))
		{
			System.out.println("\nEnter preffered mechanic name :");
			mechanic_name = sc.next();
		}
		else if(ch.equals("2"))
		{
			mechanic_name = null;
		}
		
		System.out.println("\n1. Schedule Maintenance \n2. Schedule Repair \n3. Go Back \n");
		System.out.println("Enter Choice (1-3) : ");
		
		ch = sc.next();
		if(ch.equals("1"))
		{
			customerScheduleMaintenancePage1(license_plate_num, current_mileage, mechanic_name);
		}
		else if(ch.equals("2"))
		{
			customerScheduleRepairPage1(license_plate_num, current_mileage, mechanic_name);
		}
		else if(ch.equals("3"))
		{
			customerServicePage();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerScheduleServicePage();
		}
	}
	
	public void customerRescheduleServicePage1() throws IOException
	{
		String previousServiceDate="", serviceType="", lic_plate_num="";
		
		System.out.println("\nCustomer Reschedule Service Page\n");
		
		//stored procedure for getting all upcoming appointment details of customer including License Plate, Service ID, Service Date, Service Type (Maintenance/Repair), Service Details(Service A/B/C or Problem), Mechanic Name	
		//getUpcomingAppointments(customer id)
		
		System.out.println("\n1. Pick a Service \n2. Go Back \n");
		System.out.println("Enter Choice (1-2) : ");
		ch = sc.next();
		
		if(ch.equals("1"))
		{
			boolean f3 = true;
			//stored procedure for finding the earliest available service dates
			//date1, date2 findMaintenanceServiceDates(l_plate_num, curr_mileage, mech_name)
			
			if(f3)
			{
				customerRescheduleServicePage2(date1, date2, mechanic_name, previousServiceDate, serviceType, lic_plate_num);
			}
			else
			{				
				System.out.println("\nCannot Reschedule Appointment\n");
				
				customerServicePage();
			}
		}
		else if(ch.equals("2"))
		{
			customerServicePage();
		}
		
	}
	
	public void customerScheduleMaintenancePage1(String l_plate_num, int curr_mileage, String mech_name) throws IOException
	{
		System.out.println("Customer Schedule Maintenance Page 1");
		System.out.println("\n1. Find Service Date \n2. Go Back \n");
		System.out.println("Enter Choice (1-2) : ");
		ch = sc.next();
		
		if(ch.equals("1"))
		{
			boolean f1 = true;
			//stored procedure for finding the earliest available service dates
			//date1, date2 findMaintenanceServiceDates(l_plate_num, curr_mileage, mech_name)
			
			if(f1)
			{
				customerScheduleMaintenancePage2(l_plate_num, curr_mileage, mech_name, date1, date2);
			}
			else
			{
				//stored procedure for finding latest date after which appointments are available
				//date findNextAvailaibleMaintenanceAppointment(l_plate_num, curr_mileage, mech_name)
				
				System.out.println("\nYou can book an appointment after returned date\n");
				
				customerScheduleServicePage();
			}
			
		}
		else if(ch.equals("2"))
		{
			customerScheduleServicePage();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerScheduleMaintenancePage1(l_plate_num, curr_mileage, mech_name);
		}
	}
	
	public void customerScheduleRepairPage1(String l_plate_num, int curr_mileage, String mech_name) throws IOException
	{
		System.out.println("Customer Schedule Repair Page 1");
		System.out.println("\n1.Engine Knock \n2.Car drifts in a particular direction \n3.Battery does not hold charge \n4. Black/Unclean Exhaust \n5. A/C Heater not working \n6. Head Lamp/Tail Lamp not working \n7. Check Engine Light \n8. Go Back \n");
		System.out.println("Enter Choice (1-8) : ");
		ch = sc.next();
		
		if(ch.equals("1") || ch.equals("2") || ch.equals("3") || ch.equals("4") || ch.equals("5") || ch.equals("6") || ch.equals("7"))
		{
			//Stored Procedure for diagnostic report of causes and parts needed to resolve problems.
			//diagnosticReport(repair_problems[(Integer)ch-1])
			
			boolean f2 = true;
			//stored procedure for finding the earliest available repair serice dates
			//date1, date2 findRepairServiceDates(l_plate_num, curr_mileage, mech_name)
			
			if(f2)
			{
				customerScheduleRepairPage2(l_plate_num, curr_mileage, mech_name, date1, date2);
			}
			else
			{
				//stored procedure for finding latest date after which appointments are available
				//date findNextAvailaibleRepairAppointment(l_plate_num, curr_mileage, mech_name)
				
				System.out.println("\nYou can book an appointment after returned date\n");
				
				customerScheduleServicePage();
			}
		}
		else if(ch.equals("8"))
		{
			customerScheduleServicePage();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerScheduleRepairPage1(l_plate_num, curr_mileage, mech_name);
		}
	}
	
	public void customerScheduleMaintenancePage2(String l_plate_num, int curr_mileage, String mech_name, String date1, String date2) throws IOException
	{
		System.out.println("\nPreffered Mecanic : "+mech_name);
		System.out.println("\nAvailable Dates : 1. "+date1+"  2. "+date2+"\n");
		
		System.out.println("\n1. Schedule on Date 1 \n2. Schedule on Date 2 \n3. Go Back \n");
		System.out.println("Enter Choice (1-3) : ");
		ch = sc.next();
		
		if(ch.equals("1"))
		{
			//stored procedure for scheduling a maintenance service on given date for given vehicle
			//boolean scheduleService(l_plate_num, curr_mileage, mech_name, date1)
			
			customerScheduleServicePage();
		}
		else if(ch.equals("2"))
		{
			//stored procedure for scheduling a maintenance service on given date for given vehicle
			//boolean scheduleService(l_plate_num, curr_mileage, mech_name, date2)
			
			customerScheduleServicePage();
		}
		else if(ch.equals("3"))
		{
			customerScheduleMaintenancePage1(l_plate_num, curr_mileage, mech_name);
		}
		else
		{
			System.out.println("Invalid Input!");
			customerScheduleMaintenancePage2(l_plate_num, curr_mileage, mech_name, date1, date2);
		}

	}

	public void customerScheduleRepairPage2(String l_plate_num, int  curr_mileage, String  mech_name, String  date1, String  date2) throws IOException
	{
		System.out.println("\nPreffered Mecanic : "+mech_name);
		System.out.println("\nAvailable Dates : 1. "+date1+"  2. "+date2+"\n");
		
		System.out.println("\n1. Schedule on Date 1 \n2. Schedule on Date 2 \n3. Go Back \n");
		System.out.println("Enter Choice (1-3) : ");
		ch = sc.next();
		
		if(ch.equals("1"))
		{
			//stored procedure for scheduling a repair service on given date for given vehicle
			//boolean scheduleRepairService(l_plate_num, curr_mileage, mech_name, date1)
			
			customerScheduleServicePage();
		}
		else if(ch.equals("2"))
		{
			//stored procedure for scheduling a repair service on given date for given vehicle
			//boolean scheduleRepairService(l_plate_num, curr_mileage, mech_name, date2)
			
			customerScheduleServicePage();
		}
		else if(ch.equals("3"))
		{
			customerScheduleRepairPage1(l_plate_num, curr_mileage, mech_name);
		}
		else
		{
			System.out.println("Invalid Input!");
			customerScheduleRepairPage2(l_plate_num, curr_mileage, mech_name, date1, date2);
		}
	}
	
	public void customerRescheduleServicePage2(String date1, String date2, String mechanic_name, String previousServiceDate, String  serviceType, String lic_plate_num) throws IOException
	{
		System.out.println("\nPreffered Mecanic : "+mechanic_name);
		System.out.println("\nAvailable Dates : 1. "+date1+"  2. "+date2+"\n");
		
		System.out.println("\n1. Schedule on Date 1 \n2. Schedule on Date 2 \n3. Go Back \n");
		System.out.println("Enter Choice (1-3) : ");
		ch = sc.next();
		
		if(ch.equals("1"))
		{
			//stored procedure for rescheduling appointment
			//boolean rescheduleAppointment(customer_id, lic_plate_num, service_type, previous_service_date, new_service_date)
		}
		else if(ch.equals("2"))
		{
			//stored procedure for rescheduling appointment
			//rescheduleAppointment
		}
		else if(ch.equals("3"))
		{
			customerRescheduleServicePage1();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerRescheduleServicePage2(date1, date2, mechanic_name, previousServiceDate, serviceType, lic_plate_num);
		}
	}
	
	public void customerViewInvoiceDetailsPage() throws IOException
	{
		System.out.println("\nCustomer Invoice Details Page\n");
		
		//stored procedure for getting all completed appointment/service details of customer including License Plate, Service ID, Service Start Date, Service End Date, Service Type (Maintenance/Repair), Service Details(Service A/B/C or Problem), Mechanic Name, Total Service Cost	
		//getCompletedAppointments(customer id)
		
		System.out.println("\n1. View Invoice Details \n2. Go Back \n");
		System.out.println("Enter Choice (1-2) : ");
		ch = sc.next();
		
		if(ch.equals("1"))
		{
			System.out.println("\nChoose service to view detailed invoice :\n");
			
			//stored procedure for getting detailed invoice including License Plate, Service ID, Service Start Date, Service End Date, Service Type (Maintenance/Repair), Service Details(Service A/B/C or Problem), Mechanic Name, Total Service Cost, Parts used in service with cost of each part, total labour hours, labour wages per hour
			//getDetailedInvoice(service_id)
		}
		else if(ch.equals("2"))
		{
			customerInvoicePage();
		}
		else
		{
			System.out.println("Invalid Input!");
			customerViewInvoiceDetailsPage();
		}
	}

}
