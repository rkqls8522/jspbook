<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<% String  param= request.getParameter("id");
if(param.equals("test") )
  param = " 파라미터가 입력되었습니다. (예외 상황이 발생하지 않았습니다.)";
%> 
<html>
<body>
<center>
<h4> <%=param%> </h4>
</center>
</body>
</html>