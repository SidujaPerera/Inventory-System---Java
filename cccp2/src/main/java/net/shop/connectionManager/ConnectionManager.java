package net.shop.connectionManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/cb008484?useSSL=false";
	private String JdbcUsername = "root";
	private String jdbcPassword = "02Nov2002@";

	//create connection
	public Connection getConnection(){
		
		Connection connection =null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL,JdbcUsername,jdbcPassword);
		}
		catch(SQLException e) {
			e.printStackTrace();
		
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		
		}
		return connection;

	}

}
