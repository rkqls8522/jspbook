<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
<HEAD><TITLE>�� �����ϱ�</TITLE>
  <link href="bbs.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
 [<a href="bbs_list.jsp?go=<%=request.getParameter("page")%>">
   �Խ��� ������� </a>]
<%
String sql=null;
PreparedStatement st =null;
ResultSet rs =null;
int cnt=0;

int id = Integer.parseInt(request.getParameter("id"));

%>

<%@ include file="db_connect.jsp" %>

<%
  
 // ������ �����Ѵ�.
try {
  
  sql = "select * from bbs where id=? ";
  st = con.prepareStatement(sql);
  st.setInt(1, id);
 
  rs = st.executeQuery();
  
  if (!(rs.next()))  {
      out.println("�ش� ������ �����ϴ�");
  } else {
     String pwd= rs.getString("password"); 
     if (pwd.equals(request.getParameter("password"))) {
          sql = "delete from bbs where id=?";
          st = con.prepareStatement(sql);
          st.setInt(1, id);
          cnt = st.executeUpdate(); 
          if (cnt >0) {
           	String url = "bbs_list.jsp?go=" + request.getParameter("page");
           	response.sendRedirect(url);
          }
          else 
            out.println("�������� �ʾҽ��ϴ�.");
     } else {
            out.println("��й�ȣ�� Ʋ���ϴ�.");
    }
  } 
  rs.close();
  st.close();
  con.close();
} catch (SQLException e) {
  out.println(e);
} 
%>
</BODY>
</HTML>  

