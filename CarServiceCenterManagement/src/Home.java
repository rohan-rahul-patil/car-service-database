import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;

public class Home {
	
public static void main(String[] args)
{/*
	MyConnection mc = new MyConnection();
	Connection conn;
	conn = mc.getConnection();
	                    
	String s = "select * from table(get_employee_profile('950932130'))";

	PreparedStatement ps;
	try {
		ps = conn.prepareStatement(s);
	
	ResultSet rs = ps.executeQuery(s);

	while(rs.next())
	{
		System.out.println("\n"+rs.getString(1)+"\t"+rs.getString(2)+"\t"+rs.getString(3)+"\t"+rs.getString(4)+"\t"+rs.getString(5)+"\t"+rs.getInt(6)+"\t"+rs.getString(7)+"\t");
	}
	   System.out.println(" ResultSet : "+rs);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	MyConnection.endConnection(conn);*/
	Employee e=new Employee("950932130");
	e.viewProfile();
}
}
