<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html><body> 
<%! 
  private String title="주소록"; 
  private String[] Name=new String[]{"이름","종헌","한구","한수"}; 
  private String[] Addr=new String[]{"주소","대전","경기","미국"}; 
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