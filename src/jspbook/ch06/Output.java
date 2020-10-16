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
    // ����Ǵ� ������ HTML ������ �����̸�
    // KSC5601 �� ��ȯ�Ͽ� ����ϵ��� charset�� ����
 res.setContentType("text/html; charset=EUC-KR");
 PrintWriter out = res.getWriter();
 out.println("<HTML><HEAD><TITLE>Response Exemple</TITLE>");
 out.println("</HEAD><BODY><H1>�Ѿ���̹������Դϴ�.</H1>");
 out.println("Current charset : " + res.getCharacterEncoding());
 out.println("</BODY></HTML>");
 // ��� ��ü�� close �ϸ� ��� ������ ������ �������� �����Ѵ�. 
 out.close();
 }
}