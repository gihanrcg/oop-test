<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@include file="/Header.jsp" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="CSS/adminCss.css">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Register</title>
	
	<style>
    </style>

</head>
<body>
	<div class="loginArea" align="right" style="position: fixed;top : 10px;right: 20px">
		<a href="login.jsp"><button class="button button1">Login</button></a>
		<a href="register.jsp"><button class="button button1">Register</button></a>
	</div>

	<center>
		<h2>Create an Account</h2>
		
		<div>
		  <form method="post" action="addU">
		   
		    <input type="text" name="name" placeholder="Full Name" required><br><br>		
		    <input type="email" name="mail" placeholder="E-Mail" required><br><br>		    
		    <input type="tel" name="phoneNumber" placeholder="Phone Number" pattern="[0-9]{10}" required><br><br>		    
		    <input type="password" name="password" placeholder="Password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">><br><br>		    
		    <input type="password" name="cPassword" placeholder="Confirm Password" required><br><br>
		  
		    <input type="submit" value="Create" class="button button1">
		  </form>
		</div><br><br>
		
		Already have an account?<br><br>
		<a href="login.jsp"><input type="button" value="Login" class="button button1"></a>
		
	</center>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>