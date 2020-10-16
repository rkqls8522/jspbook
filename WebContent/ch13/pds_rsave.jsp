<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page language="java" import="java.sql.*, java.text.*,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
  int mid = Integer.parseInt(multi.getParameter("mid"));
  int rnum=Integer.parseInt(multi.getParameter("rnum"));
  int step = Integer.parseInt(multi.getParameter("step")) + 1;
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
  //Statement 객체 생성
  st = con.createStatement();
  sql = "select max(id) from pds";
  rs = st.executeQuery(sql);
  if (!(rs.next())) 
    id=1;
  else {
    id= rs.getInt(1) + 1 ;
    rs.close();
  }       
  if (step == 1) {
     sql = "select max(replynum) from pds where masterid="+mid;
     rs=st.executeQuery(sql);
     if (!(rs.next())) 
       rnum=1;
     else 
       rnum=rs.getInt(1)+1;
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
        + "','" + sub + "','" + cont + "','" + ymd + "'," +mid+","  
        + "0,"+rnum+ "," + step+",'"+filename+"',"+file.length()+")";

	} else
  sql = "insert into pds(id,name,password,email,subject," +   
        "content,inputdate,masterid,readcount,replynum,step,filename,"+
        " filesize) values(" +id + ", '" +  na + "','" + pw + "','"+ em 
        + "','" + sub + "','" + cont + "','" + ymd + "'," +mid+","  
         + "0,"+rnum+ ","+  step+",'',0)";

   // insert 문을 이용하여 데이터를 추가 시킨다.
   cnt = st.executeUpdate(sql); 
   if (cnt >0) {
   if(filename!=null) 
      out.println("데이터가 성공적으로 입력되었습니다.");
   else
      out.println("업로드된 파일은 없지만 글은 올렸습니다.");
   }else { 
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
response.sendRedirect("pds_list.jsp?go="+request.getParameter("page"));
%>
