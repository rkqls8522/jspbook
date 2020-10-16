<%@ page contentType="text/html; charset=EUC-KR" %>  
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%
String na = request.getParameter("name");
String em = request.getParameter("email");
String sub = request.getParameter("subject"); 
String cont = request.getParameter("content");
String pw = request.getParameter("password");
int id =1;
int pos=0;
if (cont.length()==1) 
     cont = cont+" "  ;

while ((pos=cont.indexOf("\'", pos)) != -1) {
  String left=cont.substring(0, pos);
  String right=cont.substring(pos, cont.length());
  cont = left + "\'" + right;
  pos += 2;
} 
java.util.Date yymmdd = new java.util.Date() ;
SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
String ymd=myformat.format(yymmdd);

String sql=null;
Statement st=null; 
ResultSet rs=null;  
int cnt=0; 
 
%>

<%@ include file="db_connect.jsp" %>

<%

// db와의 연결
try {
  // Statement 객체 생성
 st = con.createStatement();
 
 sql = "select max(id) from  bbs";
 rs = st.executeQuery(sql);
  if (!(rs.next())) 
    id=1;
  else {
    id= rs.getInt(1) + 1 ;
    rs.close();
  }       
  sql= "insert into bbs(id,name,password,email,subject," ;
  sql= sql + "content,inputdate,masterid,readcount,replynum,step)" ; 
  sql= sql + " values(" +id + ", '" +  na + "','" + pw + "','"+ em  ;
  sql= sql + "','" + sub + "','" + cont + "','" + ymd + "'," +id+"," ;
  sql= sql + "0,0,0)";
      
  // insert 문을 이용하여 데이터를 추가한다.
  cnt = st.executeUpdate(sql); 
//   if (cnt >0) 
//      out.println("데이터가 성공적으로 입력되었습니다.");
//   else  
//      out.println("데이터가 입력되지 않았습니다. ");
      
   st.close();
  con.close();
 } catch (SQLException e) {
 out.println(e);
}
%>
<jsp:forward page="bbs_list.jsp" />

