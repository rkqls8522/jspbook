<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<HTML>
<TITLE>내장객체 활용 예제</TITLE>
<BODY>
<H3>application 활용 예제</H3>
<H4>서버에 대한 대한 정보</H4>
서버 명 : <%= application.getServerInfo() %><BR>
지원되는 Servlet API 버전 : <%= application.getMajorVersion() %>.
<%= application.getMinorVersion() %><BR>
<HR>
<H4>Web Application(/ch04) 디렉토리의 파일 리스트 </H4>
<% 
java.util.Set list = application.getResourcePaths("/ch04");
if (list != null) {
   Object obj[] = list.toArray();
   for(int i=0; i < obj.length; i++) {
      out.print(obj[i]+"<BR>");
   }
}
%>
</BODY>
</HTML>