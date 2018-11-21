package com;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import oracle.jdbc.OracleTypes;

public class Receptionist extends Employee{
	public static BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
	public void displayLandingPage() throws IOException, ParseException, SQLException 
	{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Profile \n2.View Customer Profile \n3.Register Car\n4.Service History\n5.Schedule Service\n6.Reschedule Service\n7.Invoices\n8.Daily Task-Update Inventory\n9.Daily Task-Record Deliveries\n10.Logout ");
		int optionSelected =in.nextInt(); 
		switch(optionSelected)
		{
		case 1: viewProfile();
		case 2: viewCustomerProfile();
		case 3: registerCar();
		case 4: serviceHistory();
		case 5: scheduleService();
		case 6: rescheduleServicePage1();
		case 7:invoices();
		case 8:dailyTaskUpdateInventory();
		}
	}
	public void registerCar() throws IOException, ParseException, SQLException
	{
		System.out.println("Please enter Customer email address");
		String customerEmail=in.next();
		
		System.out.println("\nEnter license plate number :");
		String license_plate_num = stdin.readLine();
		System.out.println("\nEnter purchase date :");
		String purchase_date = stdin.readLine();
		System.out.println("\nEnter make :");
		String make = stdin.readLine();
		System.out.println("\nEnter model :");
		String model = stdin.readLine();
		System.out.println("\nEnter year :");
		String year = stdin.readLine();
		System.out.println("\nEnter Current Mileage :");
		int current_mileage = in.nextInt();
		String last_service_date;
		System.out.println("\nDo you want to enter last service date? 1. Yes  2. No\n");
		String ch = stdin.readLine();
		if(ch.equals("1"))
		{
			System.out.println("\nEnter last service date :");
			last_service_date = stdin.readLine();
		}
		else
		{
			last_service_date = null;
		}
		
		System.out.println("\n1. Register Car \n2. Cancel \n");
		System.out.println("Enter Choice (1-2) : ");
		
		ch = stdin.readLine();
		if(ch.equals("1"))
		{
			//Stored Procedure to save all vehicle details
			
			sqlQuery = "{? = call registerCar (?,?,?,?,?,?,?,?)}";
			cstmt=conn.prepareCall(sqlQuery);
			
			cstmt.registerOutParameter(1, OracleTypes.INTEGER);
			String sqlQuery1 = "select customer_id from customer where email = '"+customerEmail+"'";
			PreparedStatement pstmt1 = conn.prepareStatement(sqlQuery1);
			ResultSet rs1 = pstmt1.executeQuery();
			int customer_id=rs1.getInt(1);
			
			cstmt.setInt(2, customer_id);
			cstmt.setString(3, license_plate_num);
			
			Date dp = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(purchase_date);
			Date date_purchase = new java.sql.Date(dp.getTime());
			cstmt.setDate(4,  date_purchase);
			
			cstmt.setString(5, make);
			cstmt.setString(6, model);
			cstmt.setString(7, year);
			cstmt.setInt(8, current_mileage);
			
			
			Date dls =  (Date) new SimpleDateFormat("dd/MM/yyyy").parse(last_service_date);
			Date date_lastService = new java.sql.Date(dls.getTime());
			cstmt.setDate(9,  date_lastService);
			
			cstmt.executeUpdate();
			
			int registerCarSuccess = cstmt.getInt(1);
			
			if(registerCarSuccess == 1)
			{
				System.out.println("\nCar Registered Successfully!\n");
				displayLandingPage();
			}
			else
			{
				System.out.println("\nCould not register car. Try again\n");
				registerCar();
			}
		}
		else if(ch.equals("2"))
		{
			
			displayLandingPage();
		}
		else
		{
			System.out.println("Invalid Input!");
			displayLandingPage();
		}
	}
	public void serviceHistory() throws IOException, ParseException, SQLException
	{
		System.out.println("Please enter Customer email address");
		String customerEmail=in.next();
        //TODO: call a stored proc to get customer id from email address
		//TODO: copy paste code from customerViewServiceHistoryPage()
		
		int optionSelected=-1;
		while(optionSelected!=1)
		{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Go Back");
		optionSelected =in.nextInt(); 
		if(optionSelected==1)
			displayLandingPage();
		else
			System.out.println("Please enter valid choice.");
		}
	}
	
	public void scheduleService() throws IOException, ParseException, SQLException
	{
		System.out.println("Please enter Customer email address");
		String customerEmail=in.next();
        //TODO: call a stored proc to get customer id from email address
		//TODO: copy paste code from customerViewServiceHistoryPage()
		
		System.out.println("\nEnter license plate number :");
		String license_plate_num = in.next();
		System.out.println("\nEnter current mileage :");
		int current_mileage = in.nextInt();
		
		System.out.println("\nDo you want to enter preffered mechanic name? 1. Yes  2. No\n");
		String ch = in.next();
		String mechanic_name=null;
		if(ch.equals("1"))
		{
			System.out.println("\nEnter preffered mechanic name :");
			mechanic_name = in.next();
		}
		
		
		System.out.println("\n1. Schedule Maintenance \n2. Schedule Repair \n3. Go Back \n");
		System.out.println("Enter Choice (1-3) : ");
		int optionSelected=in.nextInt();
		if(optionSelected==1)
			scheduleMaintenancePage1(customerEmail,license_plate_num, current_mileage, mechanic_name);
		else if(optionSelected==2)
			scheduleRepairPage1(customerEmail,license_plate_num, current_mileage, mechanic_name);
		else
			displayLandingPage();
	}
	public void scheduleMaintenancePage1(String customerEmail,String license_plate_num, int current_mileage, String mechanic_name) throws IOException, ParseException, SQLException
	{
		System.out.println("\n1. Find Service Date \n2. Go Back \n");
		System.out.println("Enter Choice (1-2) : ");
		int optionSelected=in.nextInt();
		if(optionSelected==1)
		{
			boolean f1 = true;
			//TODO: stored procedure for finding the earliest available service dates
			//date1, date2 findMaintenanceServiceDates(l_plate_num, curr_mileage, mech_name)
			
			if(f1)
			{
				//TODO: uncomment this: scheduleMaintenancePage1(customerEmail,license_plate_num, current_mileage, mechanic_name, date1, date2);
			}
			else
			{
				//stored procedure for finding latest date after which appointments are available
				//date findNextAvailaibleMaintenanceAppointment(l_plate_num, curr_mileage, mech_name)
				
				System.out.println("\nYou can book an appointment after returned date\n");
				
				scheduleService();
			}
			
		}
		else if(optionSelected==2)
		{
			scheduleService();
		}
		else
		{
			System.out.println("Invalid Input!");
			scheduleMaintenancePage1(customerEmail,license_plate_num, current_mileage, mechanic_name);
		}
	}
	
	public void scheduleMaintenancePage2(String customerEmail, String l_plate_num, int curr_mileage, String mech_name, String date1, String date2) throws IOException, ParseException, SQLException
	{
		System.out.println("\nPreffered Mecanic : "+mech_name);
		System.out.println("\nAvailable Dates : 1. "+date1+"  2. "+date2+"\n");
		
		System.out.println("\n1. Schedule on "+date1+" \n2. Schedule on "+date2+" \n3. Go Back \n");
		System.out.println("Enter Choice (1-3) : ");
		String ch = in.next();
		
		if(ch.equals("1"))
		{
			//stored procedure for scheduling a maintenance service on given date for given vehicle
			//boolean scheduleService(l_plate_num, curr_mileage, mech_name, date1)
			
			scheduleService();
		}
		else if(ch.equals("2"))
		{
			//stored procedure for scheduling a maintenance service on given date for given vehicle
			//boolean scheduleService(l_plate_num, curr_mileage, mech_name, date2)
			
			scheduleService();
		}
		else if(ch.equals("3"))
		{
			scheduleMaintenancePage1(customerEmail,l_plate_num, curr_mileage, mech_name);
		}
		else
		{
			System.out.println("Invalid Input!");
			scheduleMaintenancePage2(customerEmail,l_plate_num, curr_mileage, mech_name, date1, date2);
		}

	}
	
	public void scheduleRepairPage1(String customerEmail, String l_plate_num, int curr_mileage, String mech_name) throws IOException, ParseException, SQLException
	{
		System.out.println("\n1.Engine Knock \n2.Car drifts in a particular direction \n3.Battery does not hold charge \n4. Black/Unclean Exhaust \n5. A/C Heater not working \n6. Head Lamp/Tail Lamp not working \n7. Check Engine Light \n8. Go Back \n");
		System.out.println("Enter Choice (1-8) : ");
		String ch = in.next();
		
		if(ch.equals("1") || ch.equals("2") || ch.equals("3") || ch.equals("4") || ch.equals("5") || ch.equals("6") || ch.equals("7"))
		{
			//TODO:Stored Procedure for diagnostic report of causes and parts needed to resolve problems.
			//diagnosticReport(repair_problems[(Integer)ch-1])
			
			boolean f2 = true;
			//TODO:stored procedure for finding the earliest available repair serice dates
			//date1, date2 findRepairServiceDates(l_plate_num, curr_mileage, mech_name)
			
			if(f2)
			{
				//TODO: UNCOMMENT THIS: scheduleRepairPage2(l_plate_num, curr_mileage, mech_name, date1, date2);
			}
			else
			{
				//TODO:stored procedure for finding latest date after which appointments are available
				//date findNextAvailaibleRepairAppointment(l_plate_num, curr_mileage, mech_name)
				
				System.out.println("\nYou can book an appointment after returned date\n");
				
				scheduleService();
			}
		}
		else if(ch.equals("8"))
		{
			scheduleService();
		}
		else
		{
			System.out.println("Invalid Input!");
			scheduleRepairPage1(customerEmail,l_plate_num, curr_mileage, mech_name);
		}
	}
	public void scheduleRepairPage2(String customerEmail, String l_plate_num, int  curr_mileage, String  mech_name, String  date1, String  date2) throws IOException, ParseException, SQLException
	{
		System.out.println("\nPreffered Mecanic : "+mech_name);
		System.out.println("\nAvailable Dates : 1. "+date1+"  2. "+date2+"\n");
		
		System.out.println("\n1. Schedule on "+date1+ "\n2. Schedule on "+date2 +"\n3. Go Back \n");
		System.out.println("Enter Choice (1-3) : ");
		String ch = in.next();
		
		if(ch.equals("1"))
		{
			//TODO: stored procedure for scheduling a repair service on given date for given vehicle
			//boolean scheduleRepairService(l_plate_num, curr_mileage, mech_name, date1)
			
			scheduleService();
		}
		else if(ch.equals("2"))
		{
			//stored procedure for scheduling a repair service on given date for given vehicle
			//boolean scheduleRepairService(l_plate_num, curr_mileage, mech_name, date2)
			
			scheduleService();
		}
		else if(ch.equals("3"))
		{
			scheduleRepairPage1(customerEmail,l_plate_num, curr_mileage, mech_name);
		}
		else
		{
			System.out.println("Invalid Input!");
			scheduleRepairPage2(customerEmail, l_plate_num, curr_mileage, mech_name, date1, date2);
		}
	}
	public void rescheduleServicePage1() throws IOException, ParseException, SQLException
	{
		String previousServiceDate="", serviceType="", lic_plate_num="";
		
		//TODO: stored procedure for getting all upcoming appointment details of customer including License Plate, Service ID, Service Date, Service Type (Maintenance/Repair), Service Details(Service A/B/C or Problem), Mechanic Name	
		//getUpcomingAppointments(customer id)
		
		System.out.println("\n1. Pick a Service \n2. Go Back \n");
		System.out.println("Enter Choice (1-2) : ");
		String ch = in.next();
		
		if(ch.equals("1"))
		{
			boolean f3 = true;
			//TODO:stored procedure for finding the earliest available service dates
			//date1, date2 findMaintenanceServiceDates(l_plate_num, curr_mileage, mech_name)
			
			if(f3)
			{
				//TODO: Uncomment this: rescheduleServicePage2(date1, date2, mechanic_name, previousServiceDate, serviceType, lic_plate_num);
			}
			else
			{				
				System.out.println("\nCannot Reschedule Appointment\n");
				
				displayLandingPage();
			}
		}
		else if(ch.equals("2"))
		{
			displayLandingPage();
		}
		
	}
	
	public void rescheduleServicePage2(String date1, String date2, String mechanic_name, String previousServiceDate, String  serviceType, String lic_plate_num) throws IOException, ParseException, SQLException
	{
		System.out.println("\nPreffered Mecanic : "+mechanic_name);
		System.out.println("\nAvailable Dates : 1. "+date1+"  2. "+date2+"\n");
		
		System.out.println("\n1. Schedule on "+date1+" \n2. Schedule on "+date2+" \n3. Go Back \n");
		System.out.println("Enter Choice (1-3) : ");
		String ch = in.next();
		
		if(ch.equals("1"))
		{
			//TODO: stored procedure for rescheduling appointment
			//boolean rescheduleAppointment(customer_id, lic_plate_num, service_type, previous_service_date, new_service_date)
		}
		else if(ch.equals("2"))
		{
			//TODO: stored procedure for rescheduling appointment
			//rescheduleAppointment
		}
		else if(ch.equals("3"))
		{
			rescheduleServicePage1();
		}
		else
		{
			System.out.println("Invalid Input!");
			rescheduleServicePage2(date1, date2, mechanic_name, previousServiceDate, serviceType, lic_plate_num);
		}
	}
	public void invoices() throws IOException, ParseException, SQLException
	{
		System.out.println("Please enter customer email address");
		String customerEmail=in.next();
		//TODO: call a stored procedure to get details of invoices and display
		int optionSelected=-1;
		while(optionSelected!=1)
		{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Go Back");
		optionSelected =in.nextInt(); 
		if(optionSelected==1)
			displayLandingPage();
		else
			System.out.println("Please enter valid choice.");
		}
	}

	public void dailyTaskUpdateInventory() throws IOException, ParseException, SQLException
	{
		//TODO: Call a stored procedure with the given tasks.
		int optionSelected=-1;
		while(optionSelected!=1)
		{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Go Back");
		optionSelected =in.nextInt(); 
		if(optionSelected==1)
			displayLandingPage();
		else
			System.out.println("Please enter valid choice.");
		}
	}
}
