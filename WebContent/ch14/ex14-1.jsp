<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>ȸ�� ����</title>
</head>
<body>
<form action="/jspbook/RegistrationServlet" method="post">
<h1>ȸ�� ����</h1>
<br>
<hr>
<br>
<table>
<tr>
<td width="30%">�α��� ���̵�</td>
	<td><input type="text" name="loginid" size="30"></td>
</tr>
<tr>
	<td width="30%">��й�ȣ</td>
	<td><input type="password" name="password" size="30"></td>
</tr>
<tr>
	<td width="30%">�̸�</td>
	<td><input type="text" name="name" size="30"></td>
</tr>
<tr>
	<td width="30%">����</td>
	<td>���� <input type="radio" checked name="sex" value="1"> &nbsp; 
���� <input type="radio" name="sex" value="2"></td>
</tr>
<tr>
	<td width="30%">�ּ�</td>
	<td><input type="text" name="address" size="70"></td>
</tr>
<tr>
	<td width="30%">��ȭ��ȣ</td>
	<td><input type="text" name="tel" size="40"> 
( ���� : 02-0000-0000 )</td>
</tr>
</table>
<br>
<input type="submit" name="Submit" value="����"></form>
</body>
</html>

