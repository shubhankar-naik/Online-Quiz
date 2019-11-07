 <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%>
<html>
<head>
<meta charset="utf-8">
  <title>Result</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Your page description here" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Handlee|Open+Sans:300,400,600,700,800" rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet" />
  <link href="css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="css/flexslider.css" rel="stylesheet" />
  <link href="css/prettyPhoto.css" rel="stylesheet" />
  <link href="css/camera.css" rel="stylesheet" />
  <link href="css/jquery.bxslider.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />

  <!-- Theme skin -->
  <link href="color/default.css" rel="stylesheet" />

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="img/logo.jpg" />
  <style>
	p{font-size:25px;margin-left:600px;margin-top:50px;}
  </style>
</head>
<body>
<div id="wrapper">
  <!-- start header -->
    <header>
      <div class="container">


        <div class="row nomargin">
          <div class="span4">
            <div class="logo">
              <a href="index.html"><img src="img/logo.jpg" alt="" height="90" width="120"/></a>
            </div>
          </div>
        </div>
      </div>
    </header>
	<button type="submit" onclick="window.location.href='home.html'" style="padding:10px 10px 10px 30px;">Return</button>
    <!-- end header -->
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost/questions"
user = "root" password = ""/>
	<%
	int n=1,i,c=0;
	String[] res=new String[5];
	String[] name=new String[5];
	for(i=0;i<5;i++)
	{
		String var=String.valueOf(n)+"que";
		name[i] = request.getParameter(var);
		res[i]= request.getParameter(name[i]);
		n++;
	}
	for(i=0;i<5;i++)
	{
	%>
	<sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from datastruct WHERE id = '<%=name[i]%>' and ans = '<%=res[i]%>';
</sql:query>
<c:choose>
<c:when test="${result.rowCount == 0}">
</c:when>
<c:otherwise>
<%
 c+=1; %>
 </c:otherwise>
</c:choose>
	<%}%>
<p>Total Questions = 5<br></p><p>Correct = <%=c%><br></p>
	
	
	
	
	
	
	<div id="sub-footer" style="margin-top:170px;">
        <div class="container">
          <div class="row">
            <div class="span6">
              <div class="copyright">
                <p><span>&copy; Group-7. All right reserved</span></p>
              </div>

            </div>
          </div>
        </div>
      </div>
  </div>

  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="js/jquery.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/bootstrap.js"></script>

  <script src="js/modernizr.custom.js"></script>
  <script src="js/toucheffects.js"></script>
  <script src="js/google-code-prettify/prettify.js"></script>
  <script src="js/jquery.bxslider.min.js"></script>
  <script src="js/camera/camera.js"></script>
  <script src="js/camera/setting.js"></script>

  <script src="js/jquery.prettyPhoto.js"></script>
  <script src="js/portfolio/jquery.quicksand.js"></script>
  <script src="js/portfolio/setting.js"></script>

  <script src="js/jquery.flexslider.js"></script>
  <script src="js/animate.js"></script>
  <script src="js/inview.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="js/custom.js"></script>



</body>

</html>
