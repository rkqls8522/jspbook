<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<HTML>
<TITLE>���尴ü Ȱ�� ����</TITLE>
<BODY>
<H3>application Ȱ�� ����</H3>
<H4>������ ���� ���� ����</H4>
���� �� : <%= application.getServerInfo() %><BR>
�����Ǵ� Servlet API ���� : <%= application.getMajorVersion() %>.
<%= application.getMinorVersion() %><BR>
<HR>
<H4>Web Application(/ch04) ���丮�� ���� ����Ʈ </H4>
<% 
java.util.Set list = application.getResourcePaths("/ch04");
if (list != null) {
   Object obj[] = list.toArray();
   for(int i=0; i < obj.length; i++) {
      out.print(obj[i]+"<BR>");
   }
}
%>
</BODY>
</HTML>