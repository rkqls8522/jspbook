package jspbook.ch14;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewUserServlet
 */
@WebServlet("/ViewUserServlet")
public class ViewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewUserServlet() {
        super();
    }           
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginid = (String)request.getSession().getAttribute("loginid");
        DBManager dbm = new DBManager();
        User user = dbm.getUser(loginid);
        request.setAttribute("user",user);
        getServletContext().getRequestDispatcher("/ch14/ex14-2.jsp").forward(request,response);
       }
}