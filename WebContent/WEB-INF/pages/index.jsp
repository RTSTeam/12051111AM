<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Railway</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!--mobile version-->
	<meta name="viewpoint" content="width=device-width, initial-scale=1.0">
	<link href = "css/bootstrap.min.css" rel="stylesheet">
	<!-- search css -->
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

</head>

<body>
	<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
      <div class="container">

        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          
          <a class="navbar-brand" href="http://zhengjunli.com">Railway Trading System</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
	        	
          <form class="navbar-form navbar-right" role="form" action="<c:url value='j_spring_security_check'/>" method="POST" id="login-form">

            <div class="form-group">
              <input type="text" name="j_username" id="j_username" placeholder="Username" class="form-control"/>
            </div>

            <div class="form-group">
              <input type="password" name="j_password" id="j_password" placeholder="Password" class="form-control"/>
            </div>
            
			<button id="signin" type="submit" class="btn btn-success">Sign In</button>
			
			<div class="form-group">
			  <label for="rememberme" style="color: white">Remember me:</label>
              <input type="checkbox" name="_spring_security_remember_me" id="rememberme"/>
            </div>
          </form>
        </div><!--/.navbar-collapse -->

      </div><!--container-->
    </nav>

	<!-- wrong info -->
	    <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
	      <font color="red">
	        Invalid Id or Password <br/><br/>
	      </font>
    	</c:if>
			
    <div class="jumbotron">
      <div class="container">
        <h1>Hello, world!</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <p><a class="btn btn-primary btn-lg" href="http://localhost:8080/RTSProject/registration.html" role="button">Sign up &raquo;</a></p>
      </div>
    </div>
    
		<footer>
        	<p style="color:white">&copy; Jack, Andy, Charlie 2014</p>
      	</footer>

	</div>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/login.js"></script>
	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	
	<!-- search js -->
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.tpl.min.js"></script>


</body>
</html>