<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%>
<html>
<head>
<title>Sign-In</title>
</head>
<body>
<%
String email = request.getParameter("email");
String pass = request.getParameter("pass");
%>

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost/project"
user = "root" password = ""/>

<sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from login WHERE email = '<%=email%>' and password = '<%=pass%>';
</sql:query>
<c:choose>
<c:when test="${result.rowCount == 0}">
<%
	request.setAttribute("errorMessage","Invalid User-Id or Password");
	response.sendRedirect("login.html");
	
%>
</c:when>
<c:otherwise>

<%
	String site = new String("../Quiz/home.html");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
%>
</c:otherwise>
</c:choose>
</body>
</html>