<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<HTML>
<HEAD>
<TITLE>��ü����</TITLE>
</HEAD>
<BODY>
<H4>��ü ���� ���� ���� 1 - application</H4>
<jsp:useBean id="objapp" scope="application" class="jspbook.ch05.CountBean" />
������� ������ �� :  <BR>
<jsp:getProperty name="objapp" property="count" /><BR> 
<HR>
1 �߰� ==><BR>
<jsp:setProperty name="objapp" property="count" value="1" />
<HR>
����� :  
<jsp:getProperty name="objapp" property="count" /><BR>
</BODY>
</HTML>