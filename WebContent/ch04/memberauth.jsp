<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<HTML>
<HEAD>
<TITLE>���尴ü ���� </TITLE>
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
ȸ�� ������ ó���Ǿ����ϴ�.<BR>
<%= session.getAttribute("member_id") %> ȸ���� !!<BR>  
<%
   }else {		  
%>   
      ȸ�� ������ �����Ͻ� �ʿ䰡 �����ϴ�!!<BR>
	  ȸ�� ������ �̹� �����ϼ̽��ϴ�.<BR>
	  <%= session.getAttribute("member_id") %>ȸ���� !!<BR>  
<%
	}
} else if (request.getMethod().equals("GET")) {
	if (session != null && session.getAttribute("member_id") != null) {
       session.invalidate();
       out.print("ȸ�� ������ �����Ǿ����ϴ� !!");
    } else {
       out.print("���� ������ ���°� �ƴմϴ� !!");   
    }
}
%>
</BODY>
</HTML>