<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html><body> 
<%! 
  private String title="�ּҷ�"; 
  private String[] Name=new String[]{"�̸�","����","�ѱ�","�Ѽ�"}; 
  private String[] Addr=new String[]{"�ּ�","����","���","�̱�"}; 
  public String PrintAddr(int i){ 
    return Name[i]+" | "+ Addr[i];
  } 
%> 
<%= title %><p> 
<%  
  int a; 
  for(a=0; a<Name.length; a++){  
%> 
  <%=PrintAddr(a)%><br>
-----------<br>
<% } %> 
</body>
</html>