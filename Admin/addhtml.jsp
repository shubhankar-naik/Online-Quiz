 <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%>
<html>
<head><title>Add Question</title>
<style>
body{background-color:#262936;color:White;font-size:30px;}
input{height:30px;width:360px;}
</style></head>
<body>
<div style="width:30rem;border-style: inset;margin:50px 0px 20px 550px;padding:30px;>
<form name="ques" action="submithtml.jsp" method="Post">
Id: <input type="text" name="id" style="width:30px;"><br>
Question: <input type="text" name="que" ><br>
Option 1: <input type="text" name="opt1"><br>
Option 2: <input type="text" name="opt2"><br>
Option 3: <input type="text" name="opt3"><br>
Option 4: <input type="text" name="opt4"><br>
Answer:<br> <input type="text" name="ans"><br><br>
<button type="submit" onclick="window.location.href='index.html'">Back</button><button type="submit" style="margin-left:280px;">Add</button>
</form>
</div>
</body>
</html>