package com;


import java.io.BufferedReader;
import java.io.Console;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import oracle.jdbc.OracleTypes;
//import oracle.jdbc.driver.OracleTypes;
import oracle.jdbc.oracore.OracleType;

public class Login_Menu {

	public static Scanner sc = new Scanner(System.in);
	
	public static BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
	
	public static String ch, username="", password, user_type="";
	public static int validUser = 0, registerSuccess = 0;
	
	public static int user_id;
	public static String user_name, user_address, user_phoneNum, user_password, user_email;
		
	public static String newUser_email, newUser_name, newUser_passwd, newUser_address, newUser_phone_number, newUser_serviceCentreId;
	public static int newUser_cId = 1004;
	
	public static Connection conn;
	public static CallableStatement cstmt;
	public static String sqlQuery;
	
	public static PreparedStatement pstmt;
	public static ResultSet rs;
	
	public static void main(String[] args) throws SQLException
	{
		Employee e=new Employee(950932130);
		Manager m=new Manager();
		//m.inventory();
		//m.orderHistory();
		//m.notifications();
		//m.carServiceDetails();
		//m.notificationsDetail();
		m.serviceHistory();
		//e.updateProfile();
		//e.viewCustomerProfile();
		e.conn.close();
		e.mc.endConnection(e.conn);
	}
	/*
	public static void main(String[] args) throws SQLException {
		
		try
		{
		//Connecting to Database
		
		MyConnection mc = new MyConnection();
		
		conn = mc.getConnection();
		
		System.out.println("\nConnected to Database!\n");
		
		homePage();	
		
		//Close Database Connection
		MyConnection.endConnection(conn);	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	*/
	public static void homePage() throws SQLException, IOException
	{
		System.out.println("Home Page");
		System.out.println("\n1. Login \n2. Sign Up \n3. Exit \n");
		System.out.println("Enter Choice (1-3) : ");
		ch = stdin.readLine();
		
		if(ch.equals("1"))
		{
			loginPage();	
		}
		else if(ch.equals("2"))
		{
			signUpPage();
		}
		else if(ch.equals("3"))
		{
			System.out.println("Exiting Program.\n");
			return;
		}
		else
		{
			System.out.println("Invalid Input!");
			homePage();
		}
	}
	
	public static void loginPage() throws SQLException, IOException
	{		
		System.out.println("Login Page");
		
		System.out.println("\nEnter username :");
		username = stdin.readLine();
		System.out.println("\nEnter password :");
		password = stdin.readLine();
		
		System.out.println("\nEntered username : "+username+"\tEntered Password : "+password);
		
		System.out.println("\n1. Sign In \n2. Go Back \n");
		System.out.println("Enter Choice (1-2) : ");
		
		ch = stdin.readLine();
		
		if(ch.equals("1"))
		{
			//Stored Procedure to validate credentials
			sqlQuery = "{? = call authenticate_login (?,?)}";
			cstmt = conn.prepareCall(sqlQuery);
			
			cstmt.registerOutParameter(1, OracleTypes.INTEGER);
			
			cstmt.setString(2, username);
			cstmt.setString(3, password);

			cstmt.executeUpdate();
			
			validUser = cstmt.getInt(1);
			
			if(validUser==1)
			{
				System.out.println("\n Valid user! Getting details");
				
				//Stored Procedure to get user details
				sqlQuery = "{? = call get_user_details (?, ?, ?, ?, ?, ?)}";
				cstmt = conn.prepareCall(sqlQuery);
				
				cstmt.registerOutParameter(1, OracleTypes.VARCHAR);
				
				cstmt.setString(2, username);
				
				cstmt.registerOutParameter(3, OracleTypes.VARCHAR);
				cstmt.registerOutParameter(4, OracleTypes.VARCHAR);
				cstmt.registerOutParameter(5, OracleTypes.VARCHAR);
				cstmt.registerOutParameter(6, OracleTypes.INTEGER);
				cstmt.registerOutParameter(7, OracleTypes.VARCHAR);
				
				cstmt.executeUpdate();
									
				user_type = cstmt.getString(1);
				
				user_name = cstmt.getString(3);
				user_phoneNum = cstmt.getString(4);
				user_email = cstmt.getString(5);
				user_id = cstmt.getInt(6);
				user_address = cstmt.getString(7);
				
				if(user_type.equals("customer"))
				{
					//Give argument cid otained from above stored procedure
					
					System.out.println("\nUser is customer.\n");
					
					Customer cus = new Customer(conn, user_id, user_name, user_address, user_email, user_phoneNum, user_password);
					cus.customerLandingPage();
					cus = null;
					System.out.println("\nBack to Home Page\n");
					homePage();
				}
				else if(user_type.equals("manager"))
				{
					
				}
				else if(user_type.equals("receptionist"))
				{
					
				}
				else
				{
					System.out.println("Invalid User Type");
					homePage();
				}
			}
			else
			{
				System.out.println("\nIncorrect Login Credentials. Try Again.\n");
				loginPage();
			}
			
		}
		else if(ch.equals("2"))
		{
			homePage();
		}
		else
		{
			System.out.println("Invalid Input!");
			loginPage();
		}

	}
	
	public static void signUpPage() throws SQLException, IOException
	{
		System.out.println("Signup Page");
		
		System.out.println("\nEnter email address :");
		newUser_email = stdin.readLine();
		System.out.println("\nEnter password :");
		newUser_passwd = stdin.readLine();
		System.out.println("\nEnter name :");
		newUser_name = stdin.readLine();
		System.out.println("\nEnter address :");
		newUser_address = stdin.readLine();
		System.out.println("\nEnter phone number :");
		newUser_phone_number = stdin.readLine();
		
		System.out.println("\n1. Sign Up \n2. Go Back \n");
		System.out.println("Enter Choice (1-2) : ");
		
		ch = stdin.readLine();
		if(ch.equals("1"))
		{
			//Stored Procedure for inserting customer info into database
			
			sqlQuery = "{? = call register_new_user(?, ?, ?, ?, ?, ?, ?)}";
			cstmt = conn.prepareCall(sqlQuery);
			
			cstmt.registerOutParameter(1, OracleTypes.INTEGER);
			
			cstmt.setString(2, newUser_passwd);
			
			newUser_cId++;
			cstmt.setInt(3, newUser_cId);
			cstmt.setString(4, newUser_name);
			cstmt.setString(5, newUser_address);
			cstmt.setString(6, newUser_phone_number);
			cstmt.setString(7, newUser_email);
			
			if(newUser_address.contains("Raleigh"))
			{
				newUser_serviceCentreId = "S0001";
			}
			else if(newUser_address.contains("Charlotte"))
			{
				newUser_serviceCentreId = "S0002";
			}
			else
			{
				System.out.println("\nInvalid address. Try again\n");
				signUpPage();
			}
			
			cstmt.setString(8, newUser_serviceCentreId);
			
			cstmt.executeUpdate();
			
			registerSuccess = cstmt.getInt(1);
			
			if(registerSuccess == 1)
			{
				System.out.println("\nSign Up completed! Account created!\n");
				loginPage();
			}
			else
			{
				System.out.println("\nCould not Sign Up. Please try again.\n");
				signUpPage();
			}			
		}
		else if(ch.equals("2"))
		{
			homePage();
		}
		else
		{
			System.out.println("Invalid Input!");
			signUpPage();
		}
	}
	
	
	
}
