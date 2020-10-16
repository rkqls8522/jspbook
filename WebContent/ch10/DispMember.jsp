<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String jdbc_driver = "com.mysql.cj.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost:3306/jsp_db?serverTimezone=UTC&useSSL=false";
try {
Class.forName(jdbc_driver);
conn = DriverManager.getConnection(jdbc_url, "hycu", "Hycu-001");
stmt = conn.createStatement();
String sql = "select id, name, sex, address from mem";
rs = stmt.executeQuery(sql);
while (rs.next()) {
    out.println(rs.getString(1) + "-" + rs.getString(2) + "-" + rs.getString(3) + "-" + rs.getString(4)+"<br>");
}

rs.close();
stmt.close();
conn.close();
} catch (SQLException e) {
    out.println(e.toString());
}
%>