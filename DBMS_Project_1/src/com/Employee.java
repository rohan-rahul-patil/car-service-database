package com;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import oracle.jdbc.OracleTypes;

public class Employee {
	private int employeeId;
	private String name;
	private String address;
	private String email;
	private String phoneNumber;
	private Date startDate;
	private int monthlySalary;
	private String centerId;
	private String userName;
	private String password;
	private boolean isManager;
	public static CallableStatement cstmt;
	public static String sqlQuery;  
	Scanner in =new Scanner(System.in);
	MyConnection mc = new MyConnection();
	Connection conn=mc.getConnection();  
	public static int current_employee_id;
	public void profile()
	{
	while(true)
	{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.View Profile \n2.Update Profile \n3.Go back");
		int optionSelected =in.nextInt();
		if(optionSelected==1||optionSelected==2||optionSelected==3)
		{
		switch(optionSelected)
		{
		case 1: viewProfile();break;
		case 2:updateProfile();break;
		//TODO:case 3
		}
		break;
		}
		else
		{
			System.out.println("Please enter one of the valid choices");
			System.out.println("1.View Profile \n2.Update Profile \n3.Go back");
			optionSelected =in.nextInt();
		}
	}
	}
	public Employee()
	{
		
	}
	public Employee(int id)
	{
		employeeId=id;
	}
	public void viewProfile()
	{
		String s = "select * from table(get_employee_profile('"+employeeId+"'))";
//950932130
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(s);
		
		ResultSet rs = ps.executeQuery(s);
		while(rs.next())
		{
			System.out.println("\nName:"+rs.getString(1)+"\tAddress: "+rs.getString(2)+"\tEmail: "+rs.getString(3)+"\tPhone number: "+rs.getString(4)+"\tStart Date: "+rs.getString(5)+"\tSalary: "+rs.getInt(6)+"\tService center Id: "+rs.getString(7)+"\t");
		}
		   System.out.println(" ResultSet : "+rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//TODO: call a stored procedure to get the profile of the employee and display the result of the stored proc on console
		int optionSelected=-1;
		while(optionSelected!=1)
		{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Go Back");
		optionSelected =in.nextInt(); 
		if(optionSelected==1)
			profile();
		else
			System.out.println("Please enter valid choice.");
		}
	}
	
	public void updateProfile()
	{
	System.out.println("Please enter one of the choices below:");
	System.out.println("1.Name \n2.Address \n3.Email Address \n4.Phone number \n5.Password \n6.Go back");
	int optionSelected =in.nextInt();
	while(optionSelected!=6)
	{
		System.out.println("Please enter new value:");
		String newValue=in.next();
		switch(optionSelected)
		{
		case 1: setName(newValue);break;
		case 2: setAddress(newValue);break;
		case 3: setEmail(newValue);break;
		case 4: setPhoneNumber(newValue);break;
		case 5: setPassword(newValue);break;
		default: System.out.println("The given choice is invalid"); break;
		}
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Name \n2.Address \n3.Email Address \n4.Phone number \n5.Password \n6.Go back");
		optionSelected =in.nextInt();
	}
	//TODO: Call a stored procedure to save employee profile
	try
	{
	sqlQuery = "{? = call update_employee_profile (?, ?, ?, ?, ?, ?)}";
	cstmt = conn.prepareCall(sqlQuery);
	
	cstmt.registerOutParameter(1, OracleTypes.INTEGER);
	
	cstmt.setInt(2, employeeId);
	cstmt.setString(3, name);
	cstmt.setString(4, address);
	cstmt.setString(5, email);
	cstmt.setString(6, phoneNumber);
	cstmt.setString(7, password);
	
	cstmt.executeUpdate();
						
	int success = cstmt.getInt(1);
	if(success==1)
		System.out.println("Employee profile is successfully updated.");
	}catch(SQLException ex)
	{
		ex.printStackTrace();
	}
	}
	
	public void viewCustomerProfile()
	{
		System.out.println("Please enter email address of the customer to view its complete profile:");
		String customerEmail=in.next();
		//TODO: call a stored procedure to get the profile of the customer and display the result of the stored proc on console
		int optionSelected=-1;
		while(optionSelected!=1)
		{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Go Back");
		optionSelected =in.nextInt(); 
		if(optionSelected==1)
			profile();
		else
			System.out.println("Please enter valid choice.");
		}
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public int getMonthlySalary() {
		return monthlySalary;
	}

	public void setMonthlySalary(int monthlySalary) {
		this.monthlySalary = monthlySalary;
	}

	public String getCenterId() {
		return centerId;
	}

	public void setCenterId(String centerId) {
		this.centerId = centerId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
