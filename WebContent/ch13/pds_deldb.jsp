<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*, java.io.*"%> 
<%@ include file="pds_config.jsp" %>

<HTML>
<HEAD><TITLE>글 삭제하기</TITLE>
  <link href="pds.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
[<a href="pds_list.jsp?go=<%=request.getParameter("page")%>">
  자료실 목록으로 </a>]<br>

<%
String sql=null;
PreparedStatement st =null;
ResultSet rs =null;
int cnt=0;

int id = Integer.parseInt(request.getParameter("id"));

%>

<%@ include file="db_connect.jsp" %>

<%
  
// 쿼리를 실행한다.
try {
  
  sql = "select * from pds where id=? ";
  st = con.prepareStatement(sql);
  st.setInt(1, id);
 
  rs = st.executeQuery();
  
  if (!(rs.next()))  {
      out.println("해당 내용이 없습니다");
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
        	  File   file      = new File( filePath + "/" + filename );  // 파일 객체생성
        	  if( file.exists() ) 
        		  if ( file.delete() )
        			  out.println("정상적으로 파일[" + filename + "]이 삭제되었습니다.<br>");
        		  else
        			  out.println("파일[" + filename + "] 삭제에 문제가 발생되었습니다.<br>");
        	  }
            out.println("자료실에서 [" + subject + "] 항목이 정상적으로 삭제되었습니다.");
          }
          else 
            out.println("DB에서 삭제되지 않았습니다.");
     } else {
            out.println("비밀번호가 틀립니다.");
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
