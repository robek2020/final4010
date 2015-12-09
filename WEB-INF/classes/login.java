import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class login extends HttpServlet {
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException{
		 //HttpSession sesh = request.getSession();
		 //String name = (String) sesh.getAttribute("name");
		 //if (name != null) {
			 //response.sendRedirect("/servlet/j-robe/main");
		 //}
		 //else {
			 RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			 dis.forward(request, response);
		 //}
		 
		 
         
    }
}
