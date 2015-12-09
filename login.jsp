<!DOCTYPE html>
<html>
<head>
<title>Tabulous</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>

<body><center>
<c:choose>
    <c:when test="${requestScope.failed == '1'}">
        <div style="padding:5px; border:1px solid red; max-width:300px;"><p>Your username or password are incorrect.</p></div>
    </c:when>
</c:choose>
<h1>Tabulous Login</h1><hr />
<font size="+3">
<form method="post" action="http://hoare.cs.umsl.edu/servlet/j-robe/dologin" target="_blank">
Username: <input type="text" name="user"><br>
Password: <input type="password" name="pass"<br>
  <input type="submit" value="Login">
</form>
<br>
</font>
</center>
</body>
</html>

