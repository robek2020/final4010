import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class tabView extends HttpServlet {
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
		 //HttpSession sesh = request.getSession();
		 //int id = 0;
		 //id = (Integer) sesh.getAttribute("id");
		 //if (id != 0) {
			 RequestDispatcher dis = request.getRequestDispatcher("view.jsp");
			 dis.forward(request, response);
		 //}
		 //else {
			//RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			//dis.forward(request, response);
		 //}
		 
		 
         
    }
}
