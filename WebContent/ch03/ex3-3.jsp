<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
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