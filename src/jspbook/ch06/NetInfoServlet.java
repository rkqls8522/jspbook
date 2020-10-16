package jspbook.ch06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/NetInfoServlet")
public class NetInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

public void doGet (HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {
PrintWriter out;
res.setContentType("text/html; charset=EUC-KR");
out = res.getWriter ();
out.println("<html>");
out.println("<head><title>Request 정보 출력 Servlet</title></head>");
out.println("<body>");
out.println("<h3>네트워크 관련 요청정보</h3>");
out.println("<pre>");
out.println("Request Scheme : "+ req.getScheme()); // http
out.println("Server Name : "+ req.getServerName()); // localhost
out.println("Server Address : "+ req.getLocalAddr()); // 127.0.0.1
out.println("Server Port : "+ req.getServerPort()); // 8080
out.println("Client Address : "+ req.getRemoteAddr()); // 127.0.0.1
out.println("Client Host : "+ req.getRemoteHost()); // 127.0.0.1
out.println("Client Port : "+ req.getRemotePort()); // 59611(상황에 따라 다름)
out.println("</pre>");
out.println("</body></html>");
}
}