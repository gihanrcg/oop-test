<%@ page import = "util.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update card details</title>
</head>
<body>

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
		
			<%
		}
	%>

<div style="min-height: 82% ">	

<%
		String pid = request.getParameter("p");
	
		try
		{
			DBConnect db = new DBConnect();
			db.rs = db.st.executeQuery("select * from paymentmethod where pmId='"+pid+"'");
		while(db.rs.next()){
			
		
		%>
		
	<jsp:include page="Header.jsp"></jsp:include>
	
	<form  method ="POST" action = "UpdateCard" encrypt="multipart/form-data">
		<table align="center" style="padding-top: 50px" class="texts">
			<th><h2>Update Card Details</h2></th>	
			<tr>
			<td>
			Card type :
			</td>
			<td>	
			<input type="radio" name="cardType" value="Visa" <%=(db.rs.getString("cardType").equals("Visa"))?"checked":""%> >Visa
			<input type="radio" name="cardType" value="Master" <%=(db.rs.getString("cardType").equals("Master"))?"checked":""%> >Master
			</td>
			</tr>
			<tr>
			<td>
			Card Number : 
			</td>
			<td>
			<input type="text" name="cardNumber" placeholder="16 digit number" value="<%=db.rs.getString("cardNumber") %>">
			</td>
			</tr>
			<tr>
			<td>
			Expires : 
			</td>
			<td>
			
			<input class="input button1" type="number" min="0" max="12" name="expMonth" placeholder="MM" value="<%=db.rs.getString("expMonth") %>" required>
			<input class="input button1" type="number" min="2018" max="9999" name="expYear" placeholder="YYYY" value="<%=db.rs.getString("expYear") %>" required>
			</td>
			</tr>
			<tr>
			<td>
			CVV : 
			</td>
			<td>
			<input type="text" name="securityCode" placeholder="3 digit number" value="<%=db.rs.getString("secCode") %>">
			</td>
			</tr>
			<tr>
			<td>
			</td>
			<td>
			<input type = "hidden" name="id" value="<%=db.rs.getString("pmId") %>">
			<input type = "hidden" name="aid" value="<%=request.getParameter("aid")%>">
			<a href="PaymentMethods.jsp?aid=<%=request.getParameter("aid") %>"><input class="button button1" type="button" name="back" value="Back"></a>
			<input class="button button1" type="submit" value="Submit" >
			</td>
			</tr>
			
		</table>
	
	</form>
	
	<%}
		}catch(Exception e)
		{
		}
	%>
	
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>