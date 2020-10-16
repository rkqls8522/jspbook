<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<HTML>
<HEAD>
<TITLE>내장객체 예제 </TITLE>
</HEAD>
<BODY>
<H3>out 활용 예제 </H3>
<%  
   int total = out.getBufferSize();
   out.print("이부분은 출력되지 않을 것입니다.  ");
   out.clearBuffer();
   out.print("출력 버퍼의 크기 :" + total + "<BR>");
   out.print("사용되지 않은 버퍼의 크기 :" +out.getRemaining()+"<BR>");
   out.flush();
   out.print("flush 후 사용되지 않은 버퍼의 크기 :" +out.getRemaining());
%>
<HR>
<H5>오버 로딩된 println 살펴보기 </H5>
<PRE>
<% 
out.println(100);
out.println(true);
out.println(3.14);
out.println("TEST");
out.println('가');
out.println(new java.io.File("\\"));
out.print("사용되지 않은 버퍼의 크기 :" +out.getRemaining());
%>
</PRE>
</BODY>
</HTML>