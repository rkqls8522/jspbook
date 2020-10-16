package jspbook.ch05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShareServelt
 */
@WebServlet("/ShareServelt")
public class ShareServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	   public void doGet(HttpServletRequest req, HttpServletResponse res) 
               throws ServletException,
IOException {
res.setContentType("text/html; charset=EUC-KR");
PrintWriter out = res.getWriter();
Object obj = getServletContext().getAttribute("objapp");
CountBean countobj = null;
if (obj != null) {
countobj = (CountBean)obj;
} else {
countobj = new CountBean();
getServletContext().setAttribute("objapp", countobj);
}
out.println("<H4>Servlet ���� ����� ���</H4>");
out.println("������� ������ �� : " + countobj.getCount() + "<BR>");
out.println("<HR>");
out.println("100 �߰� ==><BR>");
countobj.setCount(100);
out.println("����� : " + countobj.getCount() + "<BR>");			  
}

}