<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page isErrorPage="true" %>
<!-- This error page is for JSP errors. -->
<html>
<head><title> 예외상황 처리 </title></head>
<body>
<center>
<HR size="1" noshade="noshade">
<h1> 에러메세지 처리 방법을 보여주는 예제입니다.</h4>
<h4> 주의 : 이페이지의 출력 내용이 너무 적으면 HTTP 500 에러가 날수도 있답니다.</h4>
<h4> 다시한번 주의 : HTTP 500 에러가 나면 출력 내용을 늘려 주세요.</h4>
<br><br><br>
<h4> 다음과 같은 에러가 발생하였습니다.</h4>
<HR size="1" noshade="noshade">
<H2>
에러타입  : <%=exception.toString() %> <br>
에러메세지:<B> <%= exception.getMessage()%></B>
</H2>
</center>
</body>
</html>