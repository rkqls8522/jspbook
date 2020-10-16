package jspbook.ch14;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public RegistrationServlet() {
		super();
	}   	 	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginid = request.getParameter("loginid");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        int sex = Integer.parseInt(request.getParameter("sex"));
        String address = request.getParameter("address");
        String tel = request.getParameter("tel");
        User user = new User(loginid,password,name,sex,address,tel);
        DBManager dbm = new DBManager();
        int nResult = dbm.regist(user);
        if (nResult != 1) {
        PrintWriter out;
	    response.setContentType("text/html; charset=EUC-KR");
	    out = response.getWriter ();
	    out.println("입력에 문제가 있습니다. id 중복 등을 체크해 보세요."); 
	    out.println("<hr><br><center></center>[<A href=# onClick=history.go(-1)> 이전 화면으로  </A>]<br>");
	    return;
        }
        request.getSession().setAttribute("loginid",loginid);
        getServletContext().getRequestDispatcher("/ViewUserServlet").forward(request,response);        
    }
}
