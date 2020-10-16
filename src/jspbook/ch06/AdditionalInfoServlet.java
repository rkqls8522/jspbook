package jspbook.ch06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AdditionalInfoServlet")
public class AdditionalInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        PrintWriter out;
        res.setContentType("text/html; charset=EUC-KR");
    out = res.getWriter ();
    out.println("<html>");
    out.println("<head><title>Request Servlet</title></head>");
    out.println("<body>");
    out.println("<h3>추가적인 요청정보</h3>");
    out.println("<pre>");
    out.println("Request Method : "+ req.getMethod()); // GET or POST
    out.println("Servlet Path : "+ req.getServletPath()); // /AdditionalInfoServlet
    out.println("ContextPath : "+ req.getContextPath()); // /jspbook
    out.println("RequestURL : "+ req.getRequestURL()); //http://localhost:8080/jspbook/AdditionalInfoServlet
    out.println("RequestURI : "+ req.getRequestURI()); 
    // /jspbook/AdditionalInfoServlet
    out.println("Query String : "+ req.getQueryString()); // ? ������ String
    out.println("Content Length : "+ req.getContentLength());
    // Content ����
    out.println("</pre>");
    out.println("</body></html>");
    } 
}