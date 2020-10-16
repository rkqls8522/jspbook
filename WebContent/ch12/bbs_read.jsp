<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*,java.util.*" %> 

<HTML>
<HEAD><TITLE>글 읽기</TITLE>
 
<link href="bbs.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<CENTER>
<%
String sql=null;
PreparedStatement st =null;
ResultSet rs =null;

int id = Integer.parseInt(request.getParameter("id"));

%>

<%@ include file="db_connect.jsp" %>

<%
  
 // 쿼리를 실행한다.
try {
  
   sql = "select * from bbs where id=? ";
   st = con.prepareStatement(sql);
   st.setInt(1, id);

   rs = st.executeQuery();
   
   if (!(rs.next()))  {
      out.println("해당 내용이 없습니다");
   } else {
      String em=rs.getString("email");
      if ((em != null) && (!(em.equals(""))) ) 
           em = "<A href=mailto:" +em + ">" + rs.getString("name")+"</A>";
      else
           em = rs.getString("name");
    out.println("<table width='600' cellspacing='0' cellpadding='2'>");
   	out.println("<tr>");
	  out.println("<td height='22'>&nbsp;</td></tr>");
  	out.println("<tr align='center'>");
  	out.println("<td height='1' bgcolor='#1F4F8F'></td>");
  	out.println("</tr>");
  	out.println("<tr align='center' bgcolor='#8EA2FF'>");
  	out.println("<td class='button' bgcolor='#8EA2FF'>"); 
  	out.println("<div align='left'><font size='2'>"+rs.getString("subject") + "</div> </td>");
  	out.println("</tr>");
  	out.println("<tr align='center' bgcolor='#FFFFFF'>");
  	out.println("<td align='center' bgcolor='#F4F4F4'>"); 
  	out.println("<table width='100%' border='0' cellpadding='0' cellspacing='4' height='1'>");
  	out.println("<tr bgcolor='#F4F4F4'>");
  	out.println("<td width='13%' height='7'></td>");
  	out.println("<td width='51%' height='7'>글쓴이 : "+ em +"</td>");
  	out.println("<td width='25%' height='7'></td>");
  	out.println("<td width='11%' height='7'></td>");
  	out.println("</tr>");
  	out.println("<tr bgcolor='#F4F4F4'>");
  	out.println("<td width='13%'></td>");
  	out.println("<td width='51%'>작성일 : " + rs.getString("inputdate") + "</td>");
  	out.println("<td width='25%'>조회 : "+rs.getInt("readcount")+"</td>");
  	out.println("<td width='11%'></td>");
  	out.println("</tr>");
  	out.println("</table>");
  	out.println("</td>");
  	out.println("</tr>");
  	out.println("<tr align='center'>");
  	out.println("<td bgcolor='#1F4F8F' height='1'></td>");
  	out.println("</tr>");
  	out.println("<tr align='center'>");
  	out.println("<td style='padding:10 0 0 0'>");
  	out.println("<div align='left'><br>");
  	out.println("<font size='3' color='#333333'><PRE>"+rs.getString("content") + "</PRE></div>");
  	out.println("<br>");
  	out.println("</td>");
  	out.println("</tr>");
  	out.println("<tr align='center'>");
  	out.println("<td class='button' height='1'></td>");
  	out.println("</tr>");
  	out.println("<tr align='center'>");
  	out.println("<td bgcolor='#1F4F8F' height='1'></td>");
  	out.println("</tr>");
  	out.println("</table>");
%>
<table width="600" border="0" cellpadding="0" cellspacing="5">
 <tr> 
   <td width="56"><A href="bbs_upd.jsp?id=<%=request.getParameter("id")%>&page=<%=request.getParameter("page")%>"><img src="image/edit.gif" width="66" height="21" border=0></A></td>
   <td width="56"><A href="bbs_del.jsp?id=<%=request.getParameter("id")%>&page=<%=request.getParameter("page")%>"><img src="image/del.gif" width="66" height="21" border=0></A></td>
   <td width="66"><A href="bbs_rwrite.jsp?id=<%=request.getParameter("id")%>&page=<%=request.getParameter("page")%>"><img src="image/reply.gif" width="66" height="21" border=0></A></td>
   <td width="406">&nbsp;</td>
   <td width="16"><A href="bbs_list.jsp?go=<%=request.getParameter("page")%>"><img src="image/list.gif" width="66" height="21" border=0></a></td>
 </tr>

 </tr>
</table>
<%    
     sql = "update bbs set readcount= readcount + 1 where id= ?" ;
     st = con.prepareStatement(sql);
     st.setInt(1, id);
     st.executeUpdate();
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
