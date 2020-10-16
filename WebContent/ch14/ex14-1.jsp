<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>회원 가입</title>
</head>
<body>
<form action="/jspbook/RegistrationServlet" method="post">
<h1>회원 가입</h1>
<br>
<hr>
<br>
<table>
<tr>
<td width="30%">로그인 아이디</td>
	<td><input type="text" name="loginid" size="30"></td>
</tr>
<tr>
	<td width="30%">비밀번호</td>
	<td><input type="password" name="password" size="30"></td>
</tr>
<tr>
	<td width="30%">이름</td>
	<td><input type="text" name="name" size="30"></td>
</tr>
<tr>
	<td width="30%">성별</td>
	<td>남자 <input type="radio" checked name="sex" value="1"> &nbsp; 
여자 <input type="radio" name="sex" value="2"></td>
</tr>
<tr>
	<td width="30%">주소</td>
	<td><input type="text" name="address" size="70"></td>
</tr>
<tr>
	<td width="30%">전화번호</td>
	<td><input type="text" name="tel" size="40"> 
( 형식 : 02-0000-0000 )</td>
</tr>
</table>
<br>
<input type="submit" name="Submit" value="가입"></form>
</body>
</html>

