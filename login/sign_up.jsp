<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%>
<html>
<head>
<title>Sign-Up</title>
</head>
<body>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String pass = request.getParameter("pass");
String pass1 = request.getParameter("pass1");
%>

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost:3306/project"
user = "root" password = ""/>

<sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from login WHERE email = '<%=email%>';
</sql:query>
    <c:choose>
        <c:when test="${result.rowCount == 0}">
		<sql:update dataSource = "${snapshot}" var = "result">
         INSERT INTO login VALUES ('<%=name%>','<%=email%>','<%=pass%>');
 </sql:update>
  <%
	String site = new String("../Quiz/home.html");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
%>
    
        </c:when>
        <c:otherwise>
            <%
	String site = new String("login.html");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
%>
        </c:otherwise>
    </c:choose>
</body>
</html>