package jspbook.ch06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
* Servlet implementation class Output
*/
@WebServlet("/Output")
public class Output extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest req, HttpServletResponse 
    res)throws ServletException, IOException {
    // 응답되는 내용이 HTML 형식의 내용이며
    // KSC5601 로 변환하여 출력하도록 charset을 설정
 res.setContentType("text/html; charset=EUC-KR");
 PrintWriter out = res.getWriter();
 out.println("<HTML><HEAD><TITLE>Response Exemple</TITLE>");
 out.println("</HEAD><BODY><H1>한양사이버대학입니다.</H1>");
 out.println("Current charset : " + res.getCharacterEncoding());
 out.println("</BODY></HTML>");
 // 출력 객체를 close 하면 출력 버퍼의 내용을 브라우저로 전송한다. 
 out.close();
 }
}