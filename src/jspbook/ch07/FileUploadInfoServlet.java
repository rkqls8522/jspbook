package jspbook.ch07;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/FileUploadInfoServlet")
public class FileUploadInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
        public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    res.setContentType("text/html; charset=UTF-8");
    PrintWriter out = res.getWriter();
    out.println("<HTML>");
    out.println("<BODY>");
    out.println("<HEAD>");
    out.println("<TITLE>파일 업로드 테스트</TITLE>");
    out.println("</HEAD>");
    out.println("<BODY>");
    out.println("<H3>파일 올리기 성공</H3>");
    out.println("업로드 문서 타입 정보: ["+req.getContentType()+"]<BR>");
    out.println("업로드 문서 타입 길이: ["+req.getContentLength()+"]<BR>");
    out.println("<FONT color=blue>");
    InputStreamReader isr =
    new InputStreamReader(req.getInputStream(), "EUC-KR");
    BufferedReader br = new BufferedReader(isr);
    for(String line;(line=br.readLine())!=null;) {
        out.println(line+"<BR>");
    }
    out.println("</FONT>"); 
    out.println("</BODY>");
    out.println("</HTML>");
    out.close();
  }
}