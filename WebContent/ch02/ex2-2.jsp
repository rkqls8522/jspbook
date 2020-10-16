<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<jsp:directive.page import="java.util.Calendar" />
<jsp:declaration> String defaultUser = "hycu" ; 
public String getUser(String user)
{
    return user==null ? defaultUser : user ;
}
</jsp:declaration>
<html>
<body>
<jsp:scriptlet> String user = getUser(request.getParameter("name")) ; 
Calendar cal = Calendar.getInstance();
</jsp:scriptlet>

<h1> 안녕하세요 <jsp:expression>user</jsp:expression>! (XML기반 태그를 이용한 JSP 예제)<br>
지금은 <jsp:expression>cal.get(Calendar.MONTH) +1 </jsp:expression> 월 <jsp:expression>cal.get(Calendar.DATE) </jsp:expression>일 <jsp:expression>cal.get(Calendar.HOUR_OF_DAY) </jsp:expression>시 
<jsp:expression>cal.get(Calendar.MINUTE) </jsp:expression>분 입니다.
</h1>
</body>
</html>