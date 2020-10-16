<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page language="java" import="java.sql.*, java.text.*,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ include file="pds_config.jsp" %>
<%
ServletContext context = getServletContext();
try{
  MultipartRequest multi = null;

  DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
  multi = new MultipartRequest(request,filePath,Maxsize,encType,policy);
  String na = multi.getParameter("name");
  String em = multi.getParameter("email");
  String sub= multi.getParameter("subject"); 
  String cont = multi.getParameter("content");
  String pw = multi.getParameter("password");

  int id =1;
  int pos=0;
  if (cont.length()==1) {
      cont = cont+ " ";
   } else { 
   while ((pos=cont.indexOf("\'", pos)) != -1) {
     String left=cont.substring(0, pos);
     String right=cont.substring(pos, cont.length());
     cont = left + "\'" + right;
     pos += 2;
     }
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
   sql = "select max(id) from pds";
   rs = st.executeQuery(sql);
   if (!(rs.next())) {
     id=1;
   } else {
   id= rs.getInt(1) + 1 ;
   rs.close();
   }     
Enumeration files = multi.getFileNames();
String filename = "";
String name = (String)files.nextElement();
filename = (String)multi.getFilesystemName(name);

File file = multi.getFile(name);
if(filename!=null){
String original = multi.getOriginalFileName(name);
String type = multi.getContentType(name);

sql = "insert into pds(id,name,password,email,subject," +   
          "content,inputdate,masterid,readcount,replynum,step,filename,"+
          " filesize) values(" +id + ", '" +  na + "','" + pw + "','"+ em 
          + "','" + sub + "','" + cont + "','" + ymd + "'," +id+","  
          + "0,0,0,'"+filename+"',"+file.length()+")";

} else
   sql = "insert into pds(id,name,password,email,subject," +   
          "content,inputdate,masterid,readcount,replynum,step,filename,"+
          " filesize) values(" +id + ", '" +  na + "','" + pw + "','"+ em 
          + "','" + sub + "','" + cont + "','" + ymd + "'," +id+","  
          + "0,0,0,'',0)";
   // insert 문을 이용하여 데이터를 추가 시킨다.
  cnt = st.executeUpdate(sql); 
  if (cnt >0) {
     	response.sendRedirect("pds_list.jsp");
   } else { 
       out.println("글을 올리지 못했습니다.");
     }  
   
  
  st.close();
  con.close();
  
} catch (SQLException e) {
 out.println(e);
  
}
} catch (IOException ioe) {
 out.println(ioe);
  
}
%>
<br>
<A href="pds_list.jsp">[자료실 목록으로]</A> &nbsp;
<A href="pds_write.jsp">[글 올리는 곳으로]</A>
