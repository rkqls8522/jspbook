<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*, java.io.*"%> 
<%@ include file="pds_config.jsp" %>

<HTML>
<HEAD><TITLE>�� �����ϱ�</TITLE>
  <link href="pds.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
[<a href="pds_list.jsp?go=<%=request.getParameter("page")%>">
  �ڷ�� ������� </a>]<br>

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
  
  sql = "select * from pds where id=? ";
  st = con.prepareStatement(sql);
  st.setInt(1, id);
 
  rs = st.executeQuery();
  
  if (!(rs.next()))  {
      out.println("�ش� ������ �����ϴ�");
  } else {
     String pwd= rs.getString("password"); 
     String subject= rs.getString("subject"); 
     String filename= rs.getString("filename"); 
     if (pwd.equals(request.getParameter("password"))) {
          sql = "delete from pds where id=?";
          st = con.prepareStatement(sql);
          st.setInt(1, id);
          cnt = st.executeUpdate(); 
          if (cnt >0) {
        	  if( filename != "")
        	  {
        	  File   file      = new File( filePath + "/" + filename );  // ���� ��ü����
        	  if( file.exists() ) 
        		  if ( file.delete() )
        			  out.println("���������� ����[" + filename + "]�� �����Ǿ����ϴ�.<br>");
        		  else
        			  out.println("����[" + filename + "] ������ ������ �߻��Ǿ����ϴ�.<br>");
        	  }
            out.println("�ڷ�ǿ��� [" + subject + "] �׸��� ���������� �����Ǿ����ϴ�.");
          }
          else 
            out.println("DB���� �������� �ʾҽ��ϴ�.");
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
