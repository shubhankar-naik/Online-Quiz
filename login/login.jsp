<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="login.css">
<script>
function signin()
{
	var e = document.forms["signin"]["email"].value;
	var p = document.forms["signin"]["pass"].value;
	<%
	String em = request.getParameter("email");
    String pa = request.getParameter("pass");
	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	String DB_URL = "jdbc:mysql://localhost/project";
	String USER = "root";
	String PASS = "";
	Connection conn = null;
    Statement stmt = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		stmt = conn.createStatement();
		String sql;
        sql = "SELECT * FROM login WHERE email="+em;
        ResultSet rs = stmt.executeQuery(sql);
		if(!rs.next()){
			%>
			alert("Invalid user Id");
			return false;
			<%
		
	}
	
	%>
}
</script>
</head>
<body>
<div class="cont">
<form name="signin" action="sign_in.jsp" method="POST" onsubmit="return signin()">
  <div class="form sign-in">
    <h2>Welcome back,</h2>
    <label>
      <span>Email</span>
      <input type="email" name="email" required/>
    </label>
    <label>
      <span>Password</span>
      <input type="password" name="pass" required/>
    </label>
    <button type="submit" class="submit">Sign In</button>
  </div>
  </form>
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2>New here?</h2>
        <p>Sign up and discover great amount of new opportunities!</p>
      </div>
      <div class="img__text m--in">
        <h2>One of us?</h2>
        <p>If you already has an account, just sign in. We've missed you!</p>
      </div>
      <div class="img__btn">
        <span class="m--up">Sign Up</span>
        <span class="m--in">Sign In</span>
      </div>
	  <script src="login.js"> </script>
    </div>
	<form action="sign_up.jsp" method="POST">
    <div class="form sign-up">
      <h2>Time to feel like home,</h2>
      <label>
        <span>Name</span>
        <input type="text" name="name" required/>
      </label>
      <label>
        <span>Email</span>
        <input type="email" name="email" required/>
      </label>
      <label>
        <span>Password</span>
        <input type="password" name="pass" required/>
      </label>
	  <label>
        <span>Re-enter Password</span>
        <input type="password" name="pass1" required/>
      </label>
      <button type="submit" class="submit">Sign Up</button>
    </div>
	</form>
  </div>
</div>

</body>
</html>