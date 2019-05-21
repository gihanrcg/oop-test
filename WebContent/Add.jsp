<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">

<meta charset="ISO-8859-1">
<title>Post Advertisement</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

<div style="min-height: 100% ">	

<%			
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		
		if(session.getAttribute("name")==null) 
		{
			response.sendRedirect("login.jsp");
		}
		else
		{
	%>
		<form method="post" action="logoutVal">
			<div class="loginArea" align="right" style="position: fixed;top : 10px;right: 20px">
			Welcome Back!<br> <%=session.getAttribute("name") %><a href="login.jsp"><br><button class="button button1">Logout</button></a>
			</div>
		</form>
			
	

<div align="center" class="texts">
	<h1>Post your Advertisement...</h1>
	
	<form action="addprop"  method="POST">
	
	<h3>Property Details</h3>
	 
	  
	  Property Name:<br>
	  <input type="text" name="PropertyName" value=""  required><br><br>
	  
	  Description:<br>
	  <textarea style="text-align: left" class="input button1" placeholder="Description here..." name= "description" rows="7" cols="40"></textarea><br>
	  
	  Property Location:<br>
	  <input type="text" name="PropertyLoc" value="" required><br><br>
	
	  Property size:<br>
	  <input type="text" name="psize" value="" pattern="^[0-9.9]+$" required>
	  
	  <select class="input button1" name="unit">
	  <option value="perch" selected>perches</option>
	  <option value="sqf">sqft</option>
	  <option value="ac">arces</option>
	  
	  </select><br><br>
	  
	  Sale price/in Rs:<br>
	  <input type="text" name="SalePrice" value="" pattern="^[0-9.9]+$" required><br><br>
	  
	  Contact No:<br>
	  <input type="text" name="contactNo" value="" pattern="^[0-9]{10}$" required><br><br>
	  
	  Image:<br>
	  <input class="input button1" type="file" name="image" accept="image/*" required><br><br>
	  
		<input type="hidden" name="user" value="<%=session.getAttribute("userId")%>">
	  <input class="button button1" type="submit" value="Post Ad">
	  
	</form>
	
	<%
		}
	%>
</div>

</div>	
<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>