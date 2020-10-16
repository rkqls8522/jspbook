<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="myBean" class="jspbook.ch05.SampleBean"/>
<html>
<body>
<jsp:setProperty name="myBean" property="name" value="HYCU Bean" />

The name of myBean is [
<jsp:getProperty name="myBean" property="name" /> ].
</body>
</html>