<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page isErrorPage="true" %>
<!-- This error page is for JSP errors. -->
<html>
<head><title> ���ܻ�Ȳ ó�� </title></head>
<body>
<center>
<HR size="1" noshade="noshade">
<h1> �����޼��� ó�� ����� �����ִ� �����Դϴ�.</h4>
<h4> ���� : ���������� ��� ������ �ʹ� ������ HTTP 500 ������ ������ �ִ�ϴ�.</h4>
<h4> �ٽ��ѹ� ���� : HTTP 500 ������ ���� ��� ������ �÷� �ּ���.</h4>
<br><br><br>
<h4> ������ ���� ������ �߻��Ͽ����ϴ�.</h4>
<HR size="1" noshade="noshade">
<H2>
����Ÿ��  : <%=exception.toString() %> <br>
�����޼���:<B> <%= exception.getMessage()%></B>
</H2>
</center>
</body>
</html>