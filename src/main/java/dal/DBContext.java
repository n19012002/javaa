package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	private static Connection conn;
	
	public static Connection getConnection() throws SQLException {
		String userName = "root";
		String pass = "19012002";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bangiay"
												,userName,pass);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	// public static void main(String[] args) {
	// 	try {
	// 		if(getConnection()!=null) {
	// 			System.out.println("Ket noi thanh cong");
	// 		}else {
	// 			System.out.println("Ket noi that bai");
	// 		}
			
	// 	} catch (SQLException e) {
	// 		// TODO Auto-generated catch block
	// 		e.printStackTrace();
	// 	}
	// }
}
