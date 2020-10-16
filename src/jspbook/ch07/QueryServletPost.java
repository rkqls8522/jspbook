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
@WebServlet("/QueryServletPost")
public class QueryServletPost extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public void doPost (HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {
        res.setContentType("text/html; charset=UTF-8");
        PrintWriter out;
        req.setCharacterEncoding("UTF-8");
        out = res.getWriter();
        String name = req.getParameter("buyername");
        String addr = req.getParameter("buyeraddr");
         String item[] = req.getParameterValues("buyeritem");
         out.println("<html><body<font color=red><h2>입력 결과</h2></font><hr>");
         out.println("이름은"+ name +" 이고 주소는 " + addr + " 입니다.");
         if (item == null)
             out.println("<br>선택하신 상품이 없네요...");
          else {
              out.println("<pre>선택하신 상품은");
              for (int i=0;i < item.length; i++) 
                  out.print((i+1) + ". [" + item[i] + "]<br>");	
             out.println("\n입니다.</pre><br>");
          }
         out.println("<br>Post방식으로 전달된 Data Type : "+ req.getContentType());
         out.println("<br>Post방식으로 전달된 전체 Data Length : "+ req.getContentLength());
             out.println("</body></html>");
             out.close();
         }
     }