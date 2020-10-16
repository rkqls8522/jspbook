package jspbook.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class H202043014Servlet
 */
@WebServlet("/H202043014Servlet")
public class H202043014Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD><TITLE>노가빈의 더 특별한 자기소개</TITLE>"
				+ "<style>\r\n" + 
				"    h1{\r\n" + 
				"        color : white;\r\n" + 
				"        background-color: aquamarine;\r\n" + 
				"        border : solid 5px black;\r\n" + 
				"        margin : 20px;\r\n" + 
				"        padding : 20px;\r\n" + 
				"        font-weight : bold;\r\n" +
				"	 }\r\n" + 
				"    ul.mylist li{\r\n" + 
				"        list-style : none;\r\n" + 
				"        margin : 10px;\r\n" + 
				"        padding : 10px;\r\n" + 
				"        width : 700px;\r\n" + 
				"        height : 20px;\r\n" + 
				"        background-color: aquamarine;\r\n" + 
				"        font-weight : bold;\r\n" + 
				"    }\r\n" + 
				"    </style>"
				+ "</HEAD>");
		out.println("<BODY><h1>노가빈 더 특별한 자기소개</h1>"
				+ "<ul class=\"mylist\">\r\n" + 
				"            <li>name : Gabin Noh</li>\r\n" + 
				"            <li>sex : female</li>\r\n" + 
				"            <li>age : 20</li>\r\n" + 
				"            <li>student_number : 20</li>\r\n" + 
				"            <li>juso : sung nam</li>\r\n" + 
				"            <li>school : hycu</li>\r\n" + 
				"            <li>height : 160</li>\r\n" + 
				"            <li>weight : 47</li>\r\n" + 
				"            <li>favorite_subject : math</li>\r\n" + 
				"            <li>favorite_language : any</li>\r\n" + 
				"            <li>favorite_food : cheese</li>\r\n" + 
				"            <li>favorite_color : blue</li>\r\n" + 
				"            <li>favorite_animal : panda</li>\r\n" +  
				"        </ul>"
				+ "</BODY>");
		out.println("</HTML>");
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
