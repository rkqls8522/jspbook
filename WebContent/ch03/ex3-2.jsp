<%@ page language="java" contentType="text/html; charset=EUC-KR" import="java.util.*" %>

<HTML>
<HEAD>
<TITLE>예제</TITLE>
</HEAD>
<BODY>
<P><b>서버와 클라이언트 정보 알아보기</b></p>
*** HTML 형식에 JSP 스크립트가 내포되어서 출력되는 모습 ***<br>
서버명 : <%= request.getServerName()%><br>
서버포트 : <%= request.getServerPort()%><br>
클라이언트 주소 : <%= request.getRemoteAddr()%><br>
클라이언트 호스트명 : <%= request.getRemoteHost()%><br><p>
<%
out.println("*** JSP 스크립트 안에서 HTML 태그가 함께 출력되는 모습 ***<br>");
out.println("서버명 : " + request.getServerName() + "<br>");
out.println("서버포트 : " + request.getServerPort() + "<br>");
out.println("클라이언트 주소 : " + request.getRemoteAddr() + "<br>");
out.println("클라이언트 호스트명 : " + request.getRemoteHost() + "<br><p>");
%>
</BODY>
</HTML>