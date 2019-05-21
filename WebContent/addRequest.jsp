<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WANTED</title>

</head>
<body>

	<jsp:include page="Header.jsp"></jsp:include>

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
		<div class="loginArea" align="right"
			style="position: fixed; top: 10px; right: 20px">
			Welcome Back!<br>
			<%=session.getAttribute("name") %><a href="login.jsp"><br>
			<button class="button button1">Logout</button></a>
		</div>
	</form>


	<form method="POST" action="addwanted" encrypt="multipart/form-data">
		<h1>Request Form</h1>
		<table align="center" class="texts">

			<tr>
				<td>Select the property you want: <br>
				</td>
				<td>
					<input type="radio" name="property" value="new developments" checked>New Developments <br>
					<input type="radio" name="property" value="Land"> Land<br>
					<input type="radio" name="property" value="Houses"> Houses<br>
					<input type="radio" name="property" value="Apartments">Apartments<br>
				</td>
			</tr>
			<tr>
				<td>Description: <br>
				</td>
				<td><textarea style="text-align: left" class="input button1" placeholder="Description here..." name="description" rows="5" cols="25" required></textarea><br></td>
			</tr>
			<tr>
				<td>Budget: <br>
				</td>
				<td><input type="text" name="budget" pattern="^[0-9.9]+" required><br></td>
			</tr>
			<tr>
				<td>Location: <br>
				</td>
				<td><input type="text" name="Location" required><br></td>
			</tr>
			<tr>
				<td>Contact no: <br>
				</td>
				<td>
					<input type="text" name="Contact" pattern="^[0-9]{10}$" required><br> 
					<input type="hidden" name="user" value="<%=session.getAttribute("userId")%>">
				</td>
			</tr>
			<tr>
				<td>
					<input class="button button1" type="Submit" value="Submit">
					<br>
				</td>
			</tr>
		</table>
		<%
		}
	%>
	</form>

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>


