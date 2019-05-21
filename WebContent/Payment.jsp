<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="util.DBConnect"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<link rel="stylesheet" type="text/css" href="CSS/adminCss.css">
<title>Payment</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<div style="height: 53% ">	
	
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

	<div align="center">
	<h1>Pay for your advertisement</h1>
	<br>
	<br>
	
	
	<table align="center" id="customers"  style="text-align: center; width: 60%" >
	<tr>
	
	</tr>
	<tr style="background-color:#4CAF50; color:white">

	<td><b>Property ID</b></td>
	<td><b>Property Name</b></td>
	<td><b>Property Location</b></td>
	<td><b>Property size</b></td>
    <td><b>Sale price/in Rs</b></td>
    <td></td>
  
	
	</tr>
	
	
	<%
		try{
			String uid = session.getAttribute("userId").toString();
			double total = 0;
			
			DBConnect db = new DBConnect();
			db.rs = db.st.executeQuery("select * from advertisement where userId = "+uid+" and payment = 'unpaid'");
		while(db.rs.next()){
			%>
			
			<tr>
				
				<td><%=db.rs.getString("adId") %> </td>
				<td><%=db.rs.getString("name") %> </td>d
				<td><%=db.rs.getString("location") %> </td>
				<td><%=db.rs.getString("size") %> </td>
				<td><%=db.rs.getString("price") %> </td>
				<%
				
				total = total + 500.00; %>
				<td>
					<form method ="POST" action="PaymentMethods.jsp" encrypt="multipart/form-data">
						<input type = "hidden" name="aid" value="<%=db.rs.getString("adId") %>">
						<input type = "hidden" name="price" value="500">
						<input class="button button1" type="submit" name="pay" value="Pay">
					</form>
				</td>
								
			 </tr>
			 
			<% 
			
		}%>
		<div align="center" style="font-size: 25px">
			Total Amount: Rs.<%=total%>
			<br>
		</div>
		<%
		}catch(Exception e){
			
		}
	
	%>
	</table>
	
	
</div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>