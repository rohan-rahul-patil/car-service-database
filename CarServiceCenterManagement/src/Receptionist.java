import java.sql.Date;

public class Receptionist extends Employee{
	public int displayLandingPage()
	{
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Profile \n2.View Customer Profile \n3.Register Car\n4.Service History\n5.Schedule Service\n6.Reschedule Service\n7.Invoices\n8.Daily Task-Update Inventory\n9.Daily Task-Record Deliveries\n10.Logout ");
		int optionSelected =in.nextInt(); 
		return optionSelected;
	}
	public void registerCar()
	{
		System.out.println("Please enter Customer email address");
		String customerEmail=in.next();
		System.out.println("Please enter licence plate number");
		String licencePlate=in.next();
		System.out.println("Please enter purchase date");
		String purchaseDate=in.next();
		System.out.println("Please enter make");
		String make=in.next();
		
		System.out.println("Please enter one of the choices below:");
		System.out.println("1.Register \n2.Cancel");
		int optionSelected =in.nextInt(); 
		if(optionSelected==1)
		{
			//TODO: call a stored procedure registerCar with the above details
		}
	}
}