<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*,java.util.*, java.text.*" %> 

<HTML>
<HEAD><TITLE>P D S</TITLE>
<link href="pds.css" rel="stylesheet" type="text/css">
<SCRIPT language="javascript">
function check()
{
	with(document.msgsearch){
	
		if(sval.value.length == 0){
			alert("�˻�� �Է��� �ּ���!!");
			sval.focus();
			return false;
		}
			
		document.msgsearch.submit();
	}
}
function rimgchg(p1,p2) {
    if (p2==1) 
       document.images[p1+1].src= "image/open.gif";
    else
       document.images[p1+1].src= "image/arrow.gif";
}

function imgchg(p1,p2) {
    if (p2==1) 
       document.images[p1+1].src= "image/open.gif";
    else
      document.images[p1+1].src= "image/close.gif";
}
</SCRIPT>
</HEAD>
<BODY>
<P>
<P align=center><img src=image/pds.jpg></P> 
<P>
<CENTER>
<TABLE border=0 width=800 cellpadding=4 cellspacing=0>
<tr align="center"> 
	<td colspan="6" height="1" bgcolor="#1F4F8F"></td>
</tr>
  <tr align="center" bgcolor="#87E8FF"> 
   <td width="38" bgcolor="#8EA2FF"><font size="2">��ȣ</font></td>
   <td width="259" bgcolor="#8EA2FF"><font size="2">����</font></td>
   <td width="65" bgcolor="#8EA2FF"><font size="2">�����</font></td>
   <td width="51" bgcolor="#8EA2FF"><font size="2">��¥</font></td>
   <td width="111" bgcolor="#8EA2FF"><font size="2">÷������</font></td>
   <td width="26" bgcolor="#8EA2FF"><font size="2">��ȸ</font></td>
  </tr>
 <tr align="center"> 
 	<td colspan="6" bgcolor="#1F4F8F" height="1"></td>
 </tr>
 
<% 
  Vector name=new Vector();
  Vector inputdate=new Vector();
  Vector email=new Vector();
  Vector subject=new Vector();
  Vector rcount=new Vector();
  Vector keyid=new Vector();
  Vector step=new Vector();
  Vector fname=new Vector();
  Vector fsize=new Vector();
  String finame=null;
  String fisize=null;

  int where=1;
  
  int totalgroup=0;
  int maxpages=2;
  int startpage=1;
  int endpage=startpage+maxpages-1;
  int wheregroup=1;
  
  if (request.getParameter("go") != null) {
	  where = Integer.parseInt(request.getParameter("go"));
	  wheregroup = (where-1)/maxpages + 1;
	  startpage=(wheregroup-1) * maxpages+1;  
	  endpage=startpage+maxpages-1; 
	 } else if (request.getParameter("gogroup") != null) {
	  wheregroup = Integer.parseInt(request.getParameter("gogroup"));
	  startpage=(wheregroup-1) * maxpages+1;  
	  where = startpage ; 
	  endpage=startpage+maxpages-1; 
	}
  
  int nextgroup=wheregroup+1;
  int priorgroup= wheregroup-1;
  
  int nextpage=where+1;
  int priorpage = where-1;
  int startrow=0;
  int endrow=0;
  int maxrows=5;
  int totalrows=0;
  int totalpages=0;
  
  int id=0;
  
  String em=null;
  Statement st =null;
  ResultSet rs =null;
  %>

  <%@ include file="db_connect.jsp" %>

  <%
 
// ������ �����Ѵ�.
try {
   st = con.createStatement();
   String sql = "select * from pds order by" ;
   sql = sql + " masterid desc, replynum, step, id" ;
   rs = st.executeQuery(sql);

   if (!(rs.next()))  {
      out.println("�ڷ�ǿ� �ø� ���� �����ϴ�");
   } else {
         do {
         	keyid.addElement(new Integer(rs.getInt("id")));
            name.addElement(rs.getString("name"));
            email.addElement(rs.getString("email"));
            String idate = rs.getString("inputdate");
            idate = idate.substring(0,8);
            inputdate.addElement(idate);
            subject.addElement(rs.getString("subject"));
            rcount.addElement(new Integer(rs.getInt("readcount")));
            step.addElement(new Integer(rs.getInt("step")));
            fname.addElement(rs.getString("filename"));
            fsize.addElement(rs.getString("filesize"));
           }while(rs.next());
         totalrows = name.size();
         totalpages = (totalrows-1)/maxrows +1;
         startrow = (where-1) * maxrows;
         endrow = startrow+maxrows-1  ;
         if (endrow >= totalrows)
             endrow=totalrows-1;
      
        totalgroup = (totalpages-1)/maxpages +1;
        if (endpage > totalpages) 
             endpage=totalpages;
 
        for(int j=startrow;j<=endrow;j++) {
          String temp=(String)email.elementAt(j);
          if ((temp == null) || (temp.equals("")) ) 
             em= (String)name.elementAt(j); 
          else
             em = "<A href=mailto:" + temp + ">" + name.elementAt(j) + "</A>";
             
         finame=(String)fname.elementAt(j);
         fisize=(String)fsize.elementAt(j);
         Integer iSize = Integer.parseInt(fisize);
         Double dfSize = iSize/1024.0;
         DecimalFormat df = new DecimalFormat("#,##0.000");
         if(finame.length() != 0)
           finame = "<A href='pds_down.jsp?file="+finame+"'>"+finame+"</A> ("+df.format(dfSize)+" KB)";            

          id= totalrows-j;
          if(j%2 == 0){
         	out.println("<TR bgcolor='#FFFFFF' onMouseOver=\" bgColor= '#DFEDFF'\" onMouseOut=\"bgColor=''\">");	
          } else {
        	out.println("<TR bgcolor='#F4F4F4' onMouseOver=\" bgColor= '#DFEDFF'\" onMouseOut=\"bgColor='#F4F4F4'\">");
          } 
          out.println("<TD align=center>");
          out.println(id+"</TD>");
          out.println("<TD>");
 	      int stepi= ((Integer)step.elementAt(j)).intValue();
        int imgcount = j-startrow; 
        if (stepi > 0 ) {
              for(int count=0; count < stepi; count++)
               out.print("&nbsp;&nbsp;");
               out.println("<IMG name=icon"+imgcount+ " src=image/arrow.gif>");
               
               out.print("<A href=pds_read.jsp?id=");
               out.print(keyid.elementAt(j) + "&page=" + where );
               out.print(" onmouseover=\"rimgchg(" + imgcount + ",1)\"");
               out.print(" onmouseout=\"rimgchg(" + imgcount + ",2)\">");
        } else {
               out.println("<IMG name=icon"+imgcount+ " src=image/close.gif>");
               out.print("<A href=pds_read.jsp?id=");
               out.print(keyid.elementAt(j) + "&page=" + where );
               out.print(" onmouseover=\"imgchg(" + imgcount + ",1)\"");
               out.print(" onmouseout=\"imgchg(" + imgcount + ",2)\">");
       }
           out.println(subject.elementAt(j) + "</TD>");	       
           out.println("<TD align=center>");
           out.println(em+ "</TD>");
           out.println("<TD align=center>");
           out.println(inputdate.elementAt(j)+ "</TD>");
           out.println("<TD>");
           out.println(finame + "</TD>");
           out.println("<TD align=center>");
           out.println(rcount.elementAt(j)+ "</TD>");
           out.println("</TR>"); 
         }
      rs.close();
      }
      out.println("</TABLE>");
      
      st.close();
      con.close();
   } catch (java.sql.SQLException e) {
     out.println(e);
   } 
 
if (wheregroup > 1) {
        out.println("[<A href=pds_list.jsp?gogroup=1>ó��</A>]"); 
        out.println("[<A href=pds_list.jsp?gogroup="+priorgroup +">����</A>]");
} else {
        out.println("[ó��]") ;
        out.println("[����]") ;
}
if (name.size() !=0) { 
  for(int jj=startpage; jj<=endpage; jj++) {
     if (jj==where) 
        out.println("["+jj+"]") ;
     else
        out.println("[<A href=pds_list.jsp?go="+jj+">" + jj + "</A>]") ;
  } 
}
if (wheregroup < totalgroup) {
   out.println("[<A href=pds_list.jsp?gogroup="+ nextgroup+ ">����</A>]");
   out.println("[<A href=pds_list.jsp?gogroup="+ totalgroup + ">������</A>]");
} else {
         out.println("[����]");
         out.println("[������]");
}
out.println ("��ü �ۼ� :"+totalrows); 
%>
<FORM method="post" name="msgsearch" action="pds_search.jsp">
<TABLE border=0 width=600 cellpadding=0 cellspacing=0>
<TR>
    <TD align=right width="241"> 
      <SELECT name=stype >
        <OPTION value=1 >�̸�
        <OPTION value=2 >����
        <OPTION value=3 >����
        <OPTION value=4 >�̸�+����
        <OPTION value=5 >�̸�+����
        <OPTION value=6 >����+����
        <OPTION value=7 >�̸�+����+����
      </SELECT>
    </TD>
    <TD width="127" align="center">
      <INPUT type=text size="17" name="sval" >
    </TD>
    <TD width="115">&nbsp;<a href="#" onClick="check();"><img src="image/search.gif" width="56" height="21" border="0" align='absmiddle'></A> 
    </TD>
    <TD align=right valign=bottom width="117"><A href="pds_write.jsp"><img src="image/write.gif" width="54" height="19" border="0"></A> 
    </TD>
  </TR>
</TABLE>
</FORM>
</BODY>
</HTML>
