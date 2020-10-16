<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<HTML>
<HEAD>
<TITLE>객체공유</TITLE>
</HEAD>
<BODY>
<H4>객체 공유 점검 예제 1 - application</H4>
<jsp:useBean id="objapp" scope="application" class="jspbook.ch05.CountBean" />
현재까지 누적된 값 :  <BR>
<jsp:getProperty name="objapp" property="count" /><BR> 
<HR>
1 추가 ==><BR>
<jsp:setProperty name="objapp" property="count" value="1" />
<HR>
결과값 :  
<jsp:getProperty name="objapp" property="count" /><BR>
</BODY>
</HTML>