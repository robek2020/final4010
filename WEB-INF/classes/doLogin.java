import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import javax.sql.*;

public class doLogin extends HttpServlet {
	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
		
		RequestDispatcher dis = request.getRequestDispatcher("dologin.jsp");
		dis.forward(request, response);
				 
	} 
}
