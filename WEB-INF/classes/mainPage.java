import java.io.*;
import java.net.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

 
public class mainPage extends HttpServlet{
	@Override
        public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException{
			 //HttpSession sesh = request.getSession(false);
			 //PrintWriter out = response.getWriter();
			 //if (sesh == null) {
				 //String id = (String) sesh.getAttribute("id");
				 //out.println("test5");
				 //out.println(id);
				 //if (id != null) {
				 	//out.println("test4");
					 RequestDispatcher dis = request.getRequestDispatcher("mainPage.jsp");
					 dis.forward(request, response);
				 //}
				 //else {
				 	//out.println("test3");
					 //response.sendRedirect("/servlet/j-robe/login");
				 //}
				 
			 //}
			 //else {
				//response.sendRedirect("/servlet/j-robe/login");
			 //}
        }
 }