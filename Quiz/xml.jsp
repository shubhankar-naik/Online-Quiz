 <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%>
<html>
<head>
<meta charset="utf-8">
  <title>XML</title>
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
		 <div style="float:left;margin-left:1000px;font-size:15px;">Time left = <span id="timer"></span>
      </div>
    </header>
    <!-- end header -->
	
	<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost/questions"
user = "root" password = ""/>

<sql:query dataSource = "${snapshot}" var = "result">
         SELECT * FROM xml ORDER BY RAND ( ) LIMIT 5;
</sql:query>
<%
int n=1;
%>
<c:set var="i" value="${1}"/>
<form name="ques" action="xmlresult.jsp" method="POST">
<c:forEach var = "row" items = "${result.rows}">
<div class="card" style="width:60rem;border-style: inset;margin:10px 0px 20px 150px;padding-bottom:20px;">
  <div class="card-body">
    <p class="card-title" style="margin-left:150px;margin-top:20px;font-size:20px;">${i}.<c:out value = "${row.question}"/></p><br>
	<input type="radio" name="${i}que" value="${row.id}" style="margin-left:150px;font-size:18px;visibility: hidden;" checked="checked"><br>
	<input type="radio" name="${row.id}" style="margin-left:150px;font-size:18px;" value="${row.opt1}"><c:out value = "${row.opt1}"/><br>
	<input type="radio" name="${row.id}" style="margin-left:150px;font-size:18px;" value="${row.opt2}"><c:out value = "${row.opt2}"/><br>
	<input type="radio" name="${row.id}" style="margin-left:150px;font-size:18px;" value="${row.opt3}"><c:out value = "${row.opt3}"/><br>
	<input type="radio" name="${row.id}" style="margin-left:150px;font-size:18px;" value="${row.opt4}"><c:out value = "${row.opt4}"/><br>

  </div>
</div>
<%
n++;
%>
<c:set var="i" value="${i+1}"/>

</c:forEach>
<button onclick="document.ques.submit();" class="btn btn-rounded btn-large btn-info" style="margin-left:980px;">Submit</button>
<script type="text/javascript">
  window.onload=function(){ 
    window.setTimeout(function() { document.ques.submit(); }, 300000);
};
</script>
<script>
document.getElementById('timer').innerHTML =
  5 + ":" + 00;
startTimer();

function startTimer() {
  var presentTime = document.getElementById('timer').innerHTML;
  var timeArray = presentTime.split(/[:]+/);
  var m = timeArray[0];
  var s = checkSecond((timeArray[1] - 1));
  if(s==59){m=m-1}
  //if(m<0){alert('timer completed')}
  
  document.getElementById('timer').innerHTML =
    m + ":" + s;
  console.log(m)
  setTimeout(startTimer, 1000);
}

function checkSecond(sec) {
  if (sec < 10 && sec >= 0) {sec = "0" + sec}; // add zero in front of numbers < 10
  if (sec < 0) {sec = "59"};
  return sec;
}
</script>
</form>

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
