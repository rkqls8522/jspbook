<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<HTML>
<HEAD>
<TITLE>���尴ü Ȱ�� ����</TITLE>
</HEAD>
<BODY>
<H1> pageContext Ȱ�� ���� </H1>
<%! 
public void work(String s, PageContext pc) {
   try {
      JspWriter out = pc.getOut();
      if (s == null)
    	  out.println("��û�� �Ű������� comm=include �� comm=forward �� �Է��ؾ� �մϴ�.");
      else if (s.equals("include")) {
         out.print("include �ϱ� ��....<BR>");
         pc.include("copyright.jsp");
         out.print("include �� ����....<BR>");
      } else if 	(s.equals("forward")) {
         out.print("forward �ϱ� ��....<BR>");
         pc.forward("copyright.jsp");
         out.print("forward �� ����....<BR>");
      } else
         out.println("comm�� include �� forward�� �����մϴ�.");
   } catch(Exception e) {
      System.out.println("���� �߻�!!!");
   }  
} 
%>
<% 
if (request.getMethod().equals("GET")) {
   String command = request.getParameter("comm");
   work(command, pageContext);
} else {
   out.println("<H3>GET ������� ��û�ϼž� �մϴ�!!</H3>");
} 
%>
</BODY>
</HTML>