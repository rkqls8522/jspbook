<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page language="java" import="java.io.*,java.sql.*,java.util.*" %> 
<HTML>
<HEAD>
<SCRIPT language="javascript">
function check()
{
	with(document.msgrewrite){
	
		if(subject.value.length == 0){
			alert("������ �Է��� �ּ���!!");
			subject.focus();
			return false;
		}
		
		if(name.value.length == 0){
			alert("�̸��� �Է��� �ּ���!!");
			name.focus();
			return false;
		}
		
		if(password.value.length == 0){
			alert("��й�ȣ�� �Է��� �ּ���!!");
			password.focus();
			return false;
		}
		
		if(content.value.length == 0){
			alert("������ �Է����ּ���!!");
			content.focus();
			return false;
		}
		
		document.msgrewrite.submit();
	}
		
}
</SCRIPT> 
<link href="pds.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<P>
<%
String sqltext=null;
Statement st =null;
ResultSet rs =null;
int pos=0;
String sub=null;
String cont=null;
int step=0;
int rnum=0;
int mid=0;
int id = Integer.parseInt(request.getParameter("id"));

%>

<%@ include file="db_connect.jsp" %>

<%
  // ������ �����Ѵ�.
  try {
  
   sqltext = "select * from pds where id="+id ;
   st = con.createStatement();
   
   rs = st.executeQuery(sqltext);
   
   if (!(rs.next()))  {
      out.println("�ش� ������ �����ϴ�");
   } else {

      cont = ">" + rs.getString("content") ;
      while ((pos=cont.indexOf("\n", pos)) != -1) {
        String left=cont.substring(0, pos+1);
        String right=cont.substring(pos+1, cont.length());
        cont = left + "> " + right;
        pos += 2;
       }

       mid = rs.getInt("masterid");
       rnum = rs.getInt("replynum");
       step = rs.getInt("step");

%>

<FORM name="msgrewrite" method=post action="pds_rsave.jsp?id=<%=id%>&page=<%=request.getParameter("page")%>" enctype="multipart/form-data">
<CENTER>
<table width="600" cellspacing="0" cellpadding="2">
  <tr> 
    <td colspan="2" bgcolor="#1F4F8F" height="1"></td>
  </tr>
  <tr> 
    <td colspan="2" bgcolor="#8EA2FF" height="20" class="notice">&nbsp;&nbsp;<font size="2">�� �亯�ϱ�</font></td>
  </tr>
  <tr> 
    <td colspan="2" bgcolor="#1F4F8F" height="1"></td>
  </tr>
  <tr> 
    <td width="124" height="30" bgcolor="#f4f4f4" style="padding:0 0 0 14"> 
      <div align="center"><font size="2">�� ��</font></div>
    </td>
    <td width="494"  style="padding:0 0 0 10"> 
      <input type=text name=name>
    </td>
  </tr>
  <tr> 
    <td width="124"  bgcolor="#f4f4f4" style="padding:0 0 0 14"> 
      <div align="center"><font size="2">E-mail</font></div>
    </td>
    <td width="494" style="padding:0 0 0 10" height="25"> 
      <input type=text name=email>
    </td>
  </tr>
  <tr> 
    <td width="124"  bgcolor="#f4f4f4" style="padding:0 0 0 14"> 
      <div align="center"><font size="2">�� ��</font></div>
    </td>
    <td width="494" style="padding:0 0 0 10" height="25"> 
      <input type=text name=subject size="60" value="Re :<%=rs.getString("subject")%>">
    </td>
  </tr>
  <tr> 
    <td width="124" height="162" bgcolor="#f4f4f4" style="padding:7 0 0 14" valign="top"> 
      <div align="center"><font size="2">�� ��</font></div>
    </td>
    <td width="494" valign="top"  style="padding:5 0 5 10"> 
      <textarea cols="65" rows="10" name=content >
      
      
      
      
-----------------------------------------------------------------
<%=cont%>
      </textarea>
    </td>
  </tr>
  <tr>
    <td width="124"  bgcolor="#f4f4f4" style="padding:0 0 0 14">
      <div align="center">÷������</div>
    </td>
    <td width="494" style="padding:0 0 0 10" height="25">
      <input type="file" name="file" size=30>
    </td>
  </tr>
  <tr> 
    <td width="124"  bgcolor="#f4f4f4" style="padding:0 0 0 14"> 
      <div align="center"><font size="2">�� ȣ</font></div>
    </td>
    <td width="494" style="padding:0 0 0 10" height="25"> 
      <input type=password name=password><br>(��Ȯ�� ��й�ȣ�� �Է��ؾ߸� ������ �˴ϴ�.)
    </td>
  </tr>
  <tr> 
    <td colspan="2" height="1" class='button'></td>
  </tr>
    <tr> 
    <td colspan="2" height="1" bgcolor="#1F4F8F"></td>
  </tr>
  <tr> 
    <td colspan="2" height="10"></td>
  </tr>
  <tr> 
    <td colspan="2" align="right"> 
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="28%">&nbsp;</td>
          <td width="51%">&nbsp;</td>
          <td width="12%"><a href="#" onClick="check();"><img src="image/ok.gif" width="56" height="21" border="0"></a></td>
          <td width="9%"><a href="#" onClick="history.go(-1)"><img src="image/cancel.gif" width="56" height="21" border="0"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</CENTER>
<input type="hidden" name="page" value="<%=request.getParameter("page")%>">
<input type="hidden" name="step" value="<%=step%>">
<input type="hidden" name="mid" value="<%=mid%>">
<input type="hidden" name="rnum" value="<%=rnum%>">
</FORM>
<%
}
     rs.close();
     st.close();
     con.close();
  } catch (java.sql.SQLException e) {
    out.println(e);
  } 

%>
</BODY>
</HTML>
