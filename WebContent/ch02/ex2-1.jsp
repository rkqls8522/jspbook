<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.util.Calendar" %>
<%! String defaultUser = "hycu" ; 
public String getUser(String user)
{
    return user==null ? defaultUser : user ;
}
%>
<html>
<body>
<% String user = getUser(request.getParameter("name")) ; 
Calendar cal = Calendar.getInstance(); %> 
<h1> 안녕하세요 <%=user%> ! (스크립팅 요소를 이용한 JSP 예제)<br> 
지금은 <%=cal.get(Calendar.MONTH) +1 %> 월 
<%=cal.get(Calendar.DATE) %>일
<%=cal.get(Calendar.HOUR_OF_DAY) %>시 
<%=cal.get(Calendar.MINUTE) %>분 입니다. </h1>
</body>
</html>