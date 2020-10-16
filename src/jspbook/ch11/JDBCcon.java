package jspbook.ch11;
import java.sql.*;

public class JDBCcon {
	private String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	private String dbUrl="jdbc:mysql://localhost:3306/jsp_db?serverTimezone=UTC&useSSL=false";
	private String userName="hycu";	
	private String userPW= "Hycu-001";	
		
	public Connection getConnection(){
		try{
			Class.forName(jdbc_driver);
		}catch(ClassNotFoundException CNFE){
			CNFE.printStackTrace();	
			return null;
		}

		try{
			Connection con=DriverManager.getConnection(dbUrl,userName,userPW);
System.out.println("connected : " + con);
			return con;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}					
	}
}