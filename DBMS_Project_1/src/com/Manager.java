package com;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import oracle.jdbc.OracleTypes;

public class Manager extends Employee{
	public void displayLandingPage()
	{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Profile \n2.View Customer Profile \n3.Add new employees\n4.Payroll\n5.Inventory\n6.Orders\n7.Notifications\n8.New car model\n9.Car Service Details\n10.Service History\n11.Invoices\n12.Logout ");
		int optionSelected =in.nextInt(); 
		switch(optionSelected)
		{
		case 1: viewProfile(); break;
		case 2: viewCustomerProfile(); break;
		case 3: addEmployee();break;
		case 4: payroll();break;
		case 5: inventory();break;
		case 6: orders();break;
		case 7: notifications();break;
		case 8: newCarModel();break;
		case 9: carServiceDetails();break;
		case 10:serviceHistory();break;
		case 11: invoices();break;
		default: displayLandingPage();break;
		}
	}
	public void addEmployee()
	{
		System.out.println("Please enter Employee name");
		String name=in.next();
		System.out.println("Please enter address");
		String address=in.next();
		System.out.println("Please enter email address");
		String emailAddress=in.next();
		System.out.println("Please enter phone number");
		String phoneNumber=in.next();
		System.out.println("Please enter role");
		String role=in.next();
		System.out.println("Please enter start date in MM-DD-YYYY");
		String startDate=in.next();
		try {
		java.util.Date dp=new SimpleDateFormat("dd/MM/yyyy").parse(startDate);
		Date dateStart=new java.sql.Date(dp.getTime());
		
		System.out.println("Please enter compensation");
		int compensation=in.nextInt();
		
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Add \n2.Go Back");
		int optionSelected =in.nextInt(); 
		if(optionSelected==1)
		{
			try
			{
			sqlQuery = "{? = call add_employee (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
			cstmt = conn.prepareCall(sqlQuery);
			
			cstmt.registerOutParameter(1, OracleTypes.INTEGER);
			current_employee_id=current_employee_id+1;
			cstmt.setInt(2, current_employee_id);
			cstmt.setString(3, name);
			cstmt.setString(4, address);
			cstmt.setString(5, emailAddress);
			cstmt.setString(6, phoneNumber);
			cstmt.setString(7, "12345678");
			cstmt.setString(8, role);
			cstmt.setDate(9, dateStart);
			cstmt.setInt(10, compensation);
			cstmt.setString(11, this.getCenterId());
			
			cstmt.executeUpdate();
								
			int success = cstmt.getInt(1);
			if(success==1)
				System.out.println("Employee profile is successfully updated.");
			}catch(SQLException ex)
			{
				ex.printStackTrace();
			}
		}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		displayLandingPage();
	}
	public void payroll()
	{
		System.out.println("Please enter employee id");
		String employeeId=in.next();
		//TODO: write remaining portion
	}
	public void inventory()
	{
		//TODO: Call a stored procedure to get details of all parts in the inventory and display all the details
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
	public int orders()
	{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Order History \n2.New Order \n3.Go back ");
		int optionSelected =in.nextInt(); 
		return optionSelected;
	}
	public void orderHistory()
	{
		//TODO: Call a stored procedure to get details of all orders and display all the details
		int optionSelected=-1;
		while(optionSelected!=1)
		{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Go Back");
		optionSelected =in.nextInt(); 
		if(optionSelected==1)
			orders();
		else
			System.out.println("Please enter valid choice.");
		}
	}
	public void newOrder()
	{
		System.out.println("Please enter Part name");
		String partName=in.next();
		System.out.println("Please enter quantity");
		int quantity=in.nextInt();
		
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Place Order \n2.Go back");
		int optionSelected =in.nextInt(); 
		if(optionSelected==1)
		{
			//TODO: Call a stored procedure to create a new order with the above details and display confirmation
			//message on the screen with the order ID and estimated date of fulfillment
		}
		else
		{
			orders();
		}
	}
	public void notifications()
	{
		//TODO: Call a stored procedure to get notifications and display
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Order ID \n2.Go back");
		int optionSelected =in.nextInt();
		if(optionSelected==1)
		{
			notificationsDetail();
		}
		else
		{
			displayLandingPage();
		}
	}
	public void notificationsDetail()
	{
		System.out.println("Please enter order id");
		int orderId=in.nextInt();
		//TODO: Call a stored procedure to get details of the selected order and display
		int optionSelected=-1;
		while(optionSelected!=1)
		{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Go Back");
		optionSelected =in.nextInt(); 
		if(optionSelected==1)
			notifications();
		else
			System.out.println("Please enter valid choice.");
		}
	}
	public void newCarModel()
	{
		System.out.println("Please enter make");
		String make=in.next();
		System.out.println("Please enter model");
		String model=in.next();
		System.out.println("Please enter year");
		String year=in.next();
		System.out.println("Please enter miles for service A");
		int milesA=in.nextInt();
		System.out.println("Please enter months for service A");
		String monthsA=in.next();
		System.out.println("Please enter parts list for service A");
		String partsListA=in.next();
		System.out.println("Please enter miles for service B");
		int milesB=in.nextInt();
		System.out.println("Please enter months for service B");
		String monthsB=in.next();
		System.out.println("Please enter additional for service B-Please input only parts that are different from service A");
		String partsListB=in.next();
		System.out.println("Please enter miles for service C");
		int milesC=in.nextInt();
		System.out.println("Please enter months for service C");
		String monthsC=in.next();
		System.out.println("Please enter additional parts for service C-Please input only parts that are different from services B and A");
		String partsListC=in.next();
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Add Car \n2.Go Back");		
		int optionSelected =in.nextInt(); 
		if(optionSelected==1)
		{
			//TODO: Call a stored procedure to add a new car model in the database with the above parameters.Display confirmation message on the screen.
		}
		displayLandingPage();
	}
	public void carServiceDetails()
	{
		//TODO: Call a stored procedure to get details of all car models
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
	public void serviceHistory()
	{
		//TODO: Call a stored procedure to get service history
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
	public void invoices()
	{
		//TODO: Call a stored procedure to get invoice details
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
