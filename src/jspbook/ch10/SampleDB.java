package jspbook.ch10;
import java.sql.*;

public class SampleDB {
public static void main(String[] args) {
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String jdbc_driver = "com.mysql.cj.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost:3306/jsp_db?serverTimezone=UTC&useSSL=false";
try {
    try {
        Class.forName(jdbc_driver);
    } catch (ClassNotFoundException e) {
        // TODO Auto-generated catch block
    e.printStackTrace();
}
conn = DriverManager.getConnection(jdbc_url, "hycu", "Hycu-001");
stmt = conn.createStatement();

String sql = "select id, name, sex, address from mem";
rs = stmt.executeQuery(sql);
while (rs.next()) {
    System.out.println(rs.getString(1) + "-" + rs.getString(2) + "-" + rs.getString(3) + "-" + rs.getString(4));
    }
rs.close();
stmt.close();
conn.close();
} catch (SQLException e) {
    System.out.println(e.toString());
}
}
}