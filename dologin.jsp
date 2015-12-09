<%@ page import="org.apache.commons.lang3.StringUtils.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		     url="jdbc:mysql://localhost/cs4010"
		     user="cs4010"  password="cs4010"/>
		 
<sql:query dataSource="${snapshot}" var="result">
	<% 
		String username = request.getParameter("user");
		String password = request.getParameter("pass");
		String thequery = "SELECT * FROM krobe_users WHERE username='" + username + "' AND password=MD5('" + password + "');";
		out.println(thequery);
		
 	%>
</sql:query>
<% String id = ""; %>
<c:forEach var="row" items="${result.rows}">
		<c:set var="id">${row.user_id}</c:set>
		<%
			id = (String)pageContext.getAttribute("id");
        %>
</c:forEach>


<%
	HttpSession sesh = request.getSession();
	if (id != "") {
    	sesh.setAttribute("id", id);
    	response.sendRedirect("http://hoare.cs.umsl.edu/servlet/j-robe/main");
    } else {
    	request.setAttribute("failed", "1");
    	response.sendRedirect("http://hoare.cs.umsl.edu/servlet/j-robe/login");
    }
%>