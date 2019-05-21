<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
 <%@include file="/Header.jsp" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="CSS/adminCss.css">
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

	<div class="loginArea" align="right" style="position: fixed;top : 10px;right: 20px">
		<a href="login.jsp"><button class="button button1">Login</button></a>
		<a href="register.jsp"><button class="button button1">Register</button></a>
	</div>
	<center>
		<h2>User Login</h2>
		<div>
			<form method="post" action="loginVal" >
		  		E-Mail:<br>
		  		<input type="text" name="uname" placeholder="Type Your E-Mail" class="input button1"><br><br>
		  		Password:<br>
		  		<input type="password" name="pass" placeholder="Enter Your Password" class="input button1"><br><br>
		  		<input type="submit" value="Login" class="button button1">
			</form><br>
			
			Don't have an account yet?<br><br>
			<a href="register.jsp"><input type="button" value="Sign Up" class="button button1"/></a>
		</div>
	</center>
	<br>


<jsp:include page="Footer.jsp"></jsp:include>


</body>
</html>