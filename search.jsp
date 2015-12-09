<!DOCTYPE html>
<html>
<head>
<title>Tabulous Search</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

</head>

<body><center>
<%
        String artist_name = (String) request.getParameter("artist_name");
        String song_name = (String) request.getParameter("song_name");
        if (artist_name != "" || song_name != "") {
    %>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/cs4010"
     user="cs4010"  password="cs4010"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM krobe_tabs WHERE 
<% if (artist_name != "") { %>
	artist_name='<%= artist_name %>'
	<% if (song_name != "") { %>
	AND song_name='<%= song_name %>';
	<% } else { %>
	;
	<% } %>
<% } else { %>
	song_name='<%= song_name %>';
<% } %>


</sql:query>
<h1>Tabulous Search Results</h1><hr />
		
		<table border="1" width="100%">
		<tr>
		   <th>Song Name</th>
		   <th>Artist Name</th>
		   <th>Tab Link</th>
		   <th>Public/Private</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
		<tr>
		   <td><c:out value="${row.song_name}"/></td>
		   <td><c:out value="${row.artist_name}"/></td>
		   <td><a href="/servlet/j-robe/view?id=<c:out value="${row.tab_id}"/>"><c:out value="${row.filename}"/></a></td>
		   <td>
			   <c:choose>
				  <c:when test="${1 == 1}">Public</c:when>
				  <c:otherwise>Private</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
		</table>

<% } else { %>
<h1>Tabulous Search Results</h1>
<em style="color:red">Please enter at least one search term to search correctly.</em>

<% } %>
</center>
</body>
</html>

