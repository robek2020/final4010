import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/upload")
@MultipartConfig
public class tabUpload extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession sesh = request.getSession();
		//int id = 0;
		//id = (Integer) sesh.getAttribute("id");
		//if (id != 0) {
		    Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
		    String fileName = getFileName(filePart) + "_" + System.currentTimeMillis();
		    InputStream fileContent = filePart.getInputStream();
		    File save = new File("/classes/Java/j-robe/tomcat/WEB-INF/tabs", fileName);
	        final String absolutePath = save.getAbsolutePath();
	        try {
	        	filePart.write(absolutePath);
	        } catch (IOException e) {
	        	request.setAttribute("failed", 1);
	        }
	        request.setAttribute("filename", fileName);
	        PrintWriter out = response.getWriter();
	        RequestDispatcher dis = request.getRequestDispatcher("uploaded.jsp");
	        dis.forward(request, response);
        //}
        //else {
			//RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			//dis.forward(request, response);
		//}
        
	}
	
	private String getFileName(final Part part) {
	    for (String content : part.getHeader("content-disposition").split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(
	                    content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}
}