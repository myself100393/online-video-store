package team6.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	private static String url = "jdbc:mysql://localhost:3306/cmpe273_project";
	private static String user = "root";
	private static String password = "";
	private static Connection conn;

	public static Connection getInstance() {
		if (conn == null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

}
