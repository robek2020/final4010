<!DOCTYPE html>
<html>
<head>
<title>Tabulous View</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
</head>

<body><center>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		     url="jdbc:mysql://localhost/cs4010"
		     user="cs4010"  password="cs4010"/>
		 
<sql:query dataSource="${snapshot}" var="result">
	<% int id = (Integer) Integer.parseInt(request.getParameter("id")); %>
	SELECT * FROM krobe_tabs WHERE tab_id='<%= id %>';
</sql:query>
<c:forEach var="row" items="${result.rows}">
		<h1><c:out value="${row.artist_name}"/> - <c:out value="${row.song_name}"/></h1>
		<c:set var="filename">${row.filename}</c:set>
		<div style="width:1000px; text-align:left">
		<%
            String jspPath = "/classes/Java/j-robe/tomcat/WEB-INF/tabs/";
            String fileName = (String) pageContext.getAttribute("filename");
            String txtFilePath = jspPath + fileName;
            BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            //BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String line;
			sb.append("<code>");
            while((line = reader.readLine())!= null){
                sb.append(line+"<br />");
            }
            sb.append("</code>");
            out.println(sb.toString()); 
        %>
        </div>
</c:forEach>

</center>
</body>
</html>

