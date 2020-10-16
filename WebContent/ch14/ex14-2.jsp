<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="jspbook.ch14.User" %>
<%
	User user = (User)request.getAttribute("user");
%>
<html>
<body>
<font color="blue"><%=user.getName()%></font>님의 가입을 환영합니다.<br>
<font color="blue"><%=user.getName()%></font>님은 다음의 정보로 가입하셨습니다. <br>
<hr>
로그인 아이디 : <font color="red"><%=user.getLoginid()%></font><br>
비밀번호  : <font color="red"><%=user.getPassword()%></font><br>
성별 : <% if(user.getSex()==1){ %>
		<font color="red">남자</font>
	  <% }else if(user.getSex()==2){ %>
		<font color="red">여자</font>
	  <% } %>
	  <br>
주소 : <font color="red"><%=user.getAddress()%></font><br>
전화번호 : <font color="red"><%=user.getTel()%></font><br>
<hr>
<br>[<A href="ch14/ex14-1.jsp"> 회원등록 화면으로 </A>]<br>
</body>
</html> 