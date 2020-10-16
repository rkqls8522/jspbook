 <%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page language="java" import="java.io.*,java.sql.*,java.util.*" %> 
 <HTML>
 <HEAD>
 <SCRIPT language="javascript">
 function check()
 {
	with(document.msgdel){		
		if(password.value.length == 0){
			alert("비밀번호를 입력해 주세요!!");
			password.focus();
			return false;
		}	
		document.msgdel.submit();
	}
 }
 </SCRIPT> 
 <link href="bbs.css" rel="stylesheet" type="text/css">
 </HEAD>
 <BODY>
 <br><br><br><br><br><br>
 <CENTER> 
  <FORM name="msgdel" method=post action=bbs_deldb.jsp>
 <input type="hidden" name="id" value="<%=request.getParameter("id")%>"  >
 <input type="hidden" name="page" value="<%=request.getParameter("page")%>"  >
 <table width="50%" cellspacing="0" cellpadding="2">         
 <tr>                                                              
   <td colspan="2" bgcolor="#1F4F8F" height="1"></td>                      
 </tr>                                                             
 <tr>                                                               
 <td colspan="2" bgcolor="#8EA2FF" height="20" class="notice"><b>글 삭제하기</b></td>                                                                   
 </tr>                                                             
 <tr>                                                              
   <td colspan="2" bgcolor="#1F4F8F" height="1"></td>             
 </tr>                                                            
 <tr>                                                               
   <td width="124" height="30" bgcolor="#f4f4f4" align='center' class='style2'>비밀번호</td>  
   <td width="494"> 
     <input type="password" name=password class='input_style1'>
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
     <table width="100%" border="0" cellpadding="4" cellspacing="4">        
       <tr>                                                          
         <td width="84%">&nbsp;</td>                                             
 <td width="8%"><a href="#" onClick="check();"><img src="image/del.gif" width="46" height="19" border="0"></a></td>                                      
  <td width="8%"><a href="bbs_list.jsp?go=<%=request.getParameter("page")%> "><img src="image/list.gif" width="48" height="19" border="0"></a></td>
       </tr>                                                      
     </table>                                                      
   </td>                                                          
 </tr>                                                            
 </table>   
 </form>
 </center>
 </BODY>
 </HTML>
