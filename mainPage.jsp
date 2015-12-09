<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true" %>
 
<html>
<head>
<title>Tabulous Home</title>
</head>
<body>
<center>
 
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/cs4010"
     user="cs4010"  password="cs4010"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from krobe_tabs WHERE owner=1;
</sql:query>
<h1>Tabulous Tab Repository</h1>
<div style="max-width:1000px; width:1000px">
	<div width="500" style="float:left;">
		<h3>Search Tabs</h3>
		<em>At least one term must be included for the search to function</em>
		<form method="get" action="/servlet/j-robe/search">
			Song Name:  <input type="text" name="song_name"><br/>
			Artist Name:  <input type="text" name="artist_name"><br />
			
			<input type="submit" value="Search">
		</form>
	</div>
	<div width="500" style="float:right">
		<h3>Upload Tab</h3>
		<form action="/servlet/j-robe/upload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" size="50" />
		<br />
		Artist Name:  <input type="text" name="artist_name" />
		<br />
		Song Name:  <input type="text" name="song_name" />
		<br />
		Public:  <input type="radio" name="privacy" value="1" />Private: <input type="radio" name="privacy" value="0" />
		<br />
		<input type="submit" value="Upload File" />
		</form>
	</div>
	<div style="clear:both;">
		<h3>Your Tabs</h3>
		
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
	</div>
</div>
<a href="/servlet/j-robe/info">Source Information</a>
</center>
</body>
</html>