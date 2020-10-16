<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<HTML>
<HEAD>
<TITLE>내장객체 예제 </TITLE>
</HEAD>
<BODY>
<%
if (request.getMethod().equals("POST")) {
   if (session.isNew() || session.getAttribute("member_id") == null ) {
      String name = request.getParameter("membername");
      String passwd = request.getParameter("memberpassword");
      session.setAttribute("member_id", name);  
      session.setAttribute("member_passwd", passwd);  
      session.setMaxInactiveInterval(60);
%>
회원 인증이 처리되었습니다.<BR>
<%= session.getAttribute("member_id") %> 회원님 !!<BR>  
<%
   }else {		  
%>   
      회원 인증을 수행하실 필요가 없습니다!!<BR>
	  회원 인증을 이미 수행하셨습니다.<BR>
	  <%= session.getAttribute("member_id") %>회원님 !!<BR>  
<%
	}
} else if (request.getMethod().equals("GET")) {
	if (session != null && session.getAttribute("member_id") != null) {
       session.invalidate();
       out.print("회원 인증이 해제되었습니다 !!");
    } else {
       out.print("현재 인증된 상태가 아닙니다 !!");   
    }
}
%>
</BODY>
</HTML>