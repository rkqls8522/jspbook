<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="PI" class="jspbook.ch05.PI_Bean" scope="page"/>
<jsp:setProperty name="PI" property="radius" value="100"/>

원주율 :&nbsp;<jsp:getProperty name="PI" property="PI"/><br>
반지름 :&nbsp;<jsp:getProperty name="PI" property="radius"/>&nbsp;<br>
원의 면적은&nbsp;<%=PI.area()%>&nbsp;