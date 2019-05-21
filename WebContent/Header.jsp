<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">

</head>
<body>

	
	<div class="" align="left">
		<a href="Home.jsp"> <img class="logo" src="LOGOS/NSPKLogo.jpg">
		</a>
		<div class="search" align="center">
			<form method="post" action="Search.jsp" encrypt="multipart/form-data">
				<input name="search" type="text" size="50" maxlength="50" placeholder="Search..."  class="input button1"/>
				<input type="submit" name="submit" value="Search"  class="button button1"/>
			</form>
		</div>


	</div>
	<br>
	<br>
	<div class="topnav" align="center">
		<a class="active" href="Home.jsp">Home</a> 
		<a href="listing.jsp">View Ads</a> 
		<a href="requestListing.jsp">View Requests</a>
		<a href="Add.jsp">Sell</a> 
		<a href="addRequest.jsp">Request</a> 
		<a href="profile.jsp">View Profile</a>
	</div>



</body>
</html>