<!DOCTYPE html>
<html>
<head>
<title>File Upload</title>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true" %>
</head>

<body><center>
<h1>Tabulous Upload</h1><hr />
<% String filename = (String) request.getAttribute("filename");
		   String artist_name = (String) request.getParameter("artist_name");
		   String song_name = (String) request.getParameter("song_name");
		   String privacy = (String) request.getParameter("privacy");
		   int id = 1;
		%>
<c:choose>
    <c:when test="${requestScope.failed == '1'}">
        <div style="padding:5px; border:1px solid red; max-width:300px;"><p>Your file could not be uploaded.</p></div>
    </c:when>
    <c:otherwise>
    	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		     url="jdbc:mysql://localhost/cs4010"
		     user="cs4010"  password="cs4010"/>
		 
		<sql:update dataSource="${snapshot}" var="result">
		
		INSERT INTO krobe_tabs (filename, artist_name, song_name, owner, public) values ('<%= filename %>', '<%= artist_name %>', '<%= song_name %>', 1, '<%= privacy %>');
		</sql:update>
		<div>
			Successfully uploaded the file with the following characteristics:
			<br />
			File name: <%= filename %>
			<br />
			Artist name: <%= artist_name %>
			<br />
			Song name: <%= song_name %>
			<br />
			Privacy: <% out.println((privacy == "1" ? "Public" : "Private")); %>
		</div>
		<a href="/servlet/j-robe/main">Return Home</a>
    </c:otherwise>
</c:choose>

</center>
</body>
</html>

