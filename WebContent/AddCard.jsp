<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/adminCss.css">
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Card</title>
</head>
<body>

	<jsp:include page="Header.jsp"></jsp:include>
	
	<div style="min-height: 54% ">	
	
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
		
		
	
	<form  method ="POST" action = "addCard" encrypt="multipart/form-data">
		<table align="center" style="padding-top: 50px" class="texts">
			<th><h2>Enter Card Details</h2></th>
			<tr>
			<td>
			Card type :
			</td>
			<td>
			<input type="radio" name="cardType" value="Visa" checked>Visa
			<input type="radio" name="cardType" value="Master">Master
			</td>
			</tr>
			<tr>
			<td>
			Card Number : 
			</td>
			<td>
			<input type="text" name="cardNumber" placeholder="16 digit number" pattern="^[0-9]{16}$" title="16 digit number" required>
			</td>
			</tr>
			<tr>
			<td>
			Expires : 
			</td>
			<td>
			<input class="input button1" type="number" min="0" max="12" name="expMonth" placeholder="MM" required>
			<input class="input button1" type="number" min="2018" max="9999" name="expYear" placeholder="YYYY" required>
			</td>
			</tr>
			<tr>
			<td>
			CVV : 
			</td>
			<td>
			<input type="text" name="securityCode" placeholder="3 digit number" pattern="^[0-9]{3}$" title="3 digits" required>
			</td>
			</tr>
			<tr>
			<td>
			</td>
			<td>
			<input type = "hidden" name="aid" value="<%=request.getParameter("aid") %>">
			<input type = "hidden" name="uid" value="<%=session.getAttribute("userId") %>">
			<input type = "hidden" name="price" value="500">
			
			<a href="PaymentMethods.jsp?aid=<%=request.getParameter("aid")%>"><input class="button button1" type="button" name="back" value="Back"></a>
			<input class="button button1" type="submit" value="Add Card" >
			</td>
			</tr>
				<%
		}
	%>
		
		</table>
	
	</form>
	</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>