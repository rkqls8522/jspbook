<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="jspbook.ch14.User" %>
<%
	User user = (User)request.getAttribute("user");
%>
<html>
<body>
<font color="blue"><%=user.getName()%></font>���� ������ ȯ���մϴ�.<br>
<font color="blue"><%=user.getName()%></font>���� ������ ������ �����ϼ̽��ϴ�. <br>
<hr>
�α��� ���̵� : <font color="red"><%=user.getLoginid()%></font><br>
��й�ȣ  : <font color="red"><%=user.getPassword()%></font><br>
���� : <% if(user.getSex()==1){ %>
		<font color="red">����</font>
	  <% }else if(user.getSex()==2){ %>
		<font color="red">����</font>
	  <% } %>
	  <br>
�ּ� : <font color="red"><%=user.getAddress()%></font><br>
��ȭ��ȣ : <font color="red"><%=user.getTel()%></font><br>
<hr>
<br>[<A href="ch14/ex14-1.jsp"> ȸ����� ȭ������ </A>]<br>
</body>
</html> 