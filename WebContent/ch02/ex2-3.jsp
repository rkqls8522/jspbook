<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<jsp:useBean id="hello" class="jspbook.ch02.HelloBean"/>
<html>
<body>

<h1> �ȳ��ϼ���<jsp:getProperty name="hello" property="name"/> ! (�ڹٺ�� �̿��� JSP ����)<br>
������ <jsp:getProperty name="hello" property="month"/> ��<jsp:getProperty name="hello" property="date"/>�� <jsp:getProperty name="hello" property="hour"/>�� <jsp:getProperty name="hello" property="minute"/>�� �Դϴ�.
</h1>
</body>
</html>
