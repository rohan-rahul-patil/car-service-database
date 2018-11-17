import java.sql.*;

public class MyConnection {

	String jdbcURL = "jdbc:oracle:thin:@orca.csc.ncsu.edu:1521:orcl01";
	String user = "mdeshpa4"; 
	String passwd = "dbms123"; 
	
	public Connection getConnection()
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(jdbcURL, user, passwd);
			return conn;
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	static void endConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (Throwable whatever) {
			}
		}
	}
	
	public static void main(String[] args) throws SQLException {
		
		MyConnection mc = new MyConnection();
		Connection conn;
		conn = mc.getConnection();
		
		/*String query = "select table_name from user_tables";
		ResultSet rs = null;
		Statement stmt = null;
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		while(rs.next()){
			System.out.println("\n"+rs.getString("TABLE_NAME"));
			
				
		}
		*/
}
}
