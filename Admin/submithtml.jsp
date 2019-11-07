
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%>
<html>
<head><title></title></head>
<body>
<%
String z = request.getParameter("id");	
String a = request.getParameter("que");
String b = request.getParameter("opt1");
String c = request.getParameter("opt2");
String d = request.getParameter("opt3");
String e = request.getParameter("opt4");
String f = request.getParameter("ans");
%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost/questions"
user = "root" password = ""/>
<sql:update dataSource = "${snapshot}" var = "result">
INSERT INTO html VALUES ('<%=z%>','<%=a%>','<%=b%>','<%=c%>','<%=d%>','<%=e%>','<%=f%>');
</sql:update>
<%
	String site = new String("add.jsp");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
%>
</body>
</html>