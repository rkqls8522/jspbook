<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page errorPage="ex3-5.jsp" %>
<% String  param= request.getParameter("id");
if(param.equals("test") )
  param = " �Ķ���Ͱ� �ԷµǾ����ϴ�. (���� ��Ȳ�� �߻����� �ʾҽ��ϴ�.)";
%> 
<html>
<body>
<center>
<h4> <%=param%> </h4>
</center>
</body>
</html>