<%@ page language="java" contentType="text/html; charset=EUC-KR" import="java.util.*" %>

<HTML>
<HEAD>
<TITLE>����</TITLE>
</HEAD>
<BODY>
<P><b>������ Ŭ���̾�Ʈ ���� �˾ƺ���</b></p>
*** HTML ���Ŀ� JSP ��ũ��Ʈ�� �����Ǿ ��µǴ� ��� ***<br>
������ : <%= request.getServerName()%><br>
������Ʈ : <%= request.getServerPort()%><br>
Ŭ���̾�Ʈ �ּ� : <%= request.getRemoteAddr()%><br>
Ŭ���̾�Ʈ ȣ��Ʈ�� : <%= request.getRemoteHost()%><br><p>
<%
out.println("*** JSP ��ũ��Ʈ �ȿ��� HTML �±װ� �Բ� ��µǴ� ��� ***<br>");
out.println("������ : " + request.getServerName() + "<br>");
out.println("������Ʈ : " + request.getServerPort() + "<br>");
out.println("Ŭ���̾�Ʈ �ּ� : " + request.getRemoteAddr() + "<br>");
out.println("Ŭ���̾�Ʈ ȣ��Ʈ�� : " + request.getRemoteHost() + "<br><p>");
%>
</BODY>
</HTML>