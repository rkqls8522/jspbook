<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<HTML>
<HEAD>
<TITLE>내장객체 활용 예제</TITLE>
</HEAD>
<BODY>
<H1> pageContext 활용 예제 </H1>
<%! 
public void work(String s, PageContext pc) {
   try {
      JspWriter out = pc.getOut();
      if (s == null)
    	  out.println("요청시 매개변수로 comm=include 나 comm=forward 를 입력해야 합니다.");
      else if (s.equals("include")) {
         out.print("include 하기 전....<BR>");
         pc.include("copyright.jsp");
         out.print("include 한 다음....<BR>");
      } else if 	(s.equals("forward")) {
         out.print("forward 하기 전....<BR>");
         pc.forward("copyright.jsp");
         out.print("forward 한 다음....<BR>");
      } else
         out.println("comm은 include 나 forward만 가능합니다.");
   } catch(Exception e) {
      System.out.println("오류 발생!!!");
   }  
} 
%>
<% 
if (request.getMethod().equals("GET")) {
   String command = request.getParameter("comm");
   work(command, pageContext);
} else {
   out.println("<H3>GET 방식으로 요청하셔야 합니다!!</H3>");
} 
%>
</BODY>
</HTML>