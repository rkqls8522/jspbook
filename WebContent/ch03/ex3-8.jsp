<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String str = "hycu - ";
for(int i=1;i < 10;i++) { %>
     사용계정은 <%= str + i %> 입니다.<br>
<% }
%>