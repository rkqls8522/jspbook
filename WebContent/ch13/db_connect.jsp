<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
Connection con= null;
//jdbc driver �� ����Ѵ�.
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
  } catch (ClassNotFoundException e ) {
 out.println(e);
}

//DB�� �����Ѵ�.
try{
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_db?serverTimezone=UTC&useSSL=false","hycu","Hycu-001");
} catch (SQLException e) {
out.println(e);
}
%>