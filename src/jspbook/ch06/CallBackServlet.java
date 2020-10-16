package jspbook.ch06;

import javax.servlet.ServletConfig;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/CallBackServlet")
public class CallBackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void init(ServletConfig sc) {
    System.out.println("init() 호출");
    }
 
    public void service(ServletRequest reg, ServletResponse res) {
    System.out.println("service() 호출");
    }

}