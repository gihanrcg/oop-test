<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="/Header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="CSS/Styles.css">

<title>Your Profile</title>
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

	<%
		try {
			String email = null;
			DBConnect db = new DBConnect();
			email = session.getAttribute("email").toString();
			db.rs = db.st.executeQuery("select * from user where email ='" + email + "'");

			while (db.rs.next()) {
	%>

<div  id="mySidenav"  class="sidenav" >
	  <a href="viewads.jsp" id="about">Manage Ads</a>
	  <a href="viewRequests.jsp" id="blog">Manage Requests</a>
	  <a href="PaymentMethods.jsp?aid=null" id="projects">Manage Payment Methods</a>
	 
	</div>

<div style="min-height: 53%">

	<div style="background-color: transparent; color: black; font-family: 'Calibri Light'; padding-left: 30px">

	
		<table align="center">
			<tr>
				<td style="font-size: larger; color: black"><h3 align="center">Your
						Profile</h3></td>
			</tr>
			<tr>
				<td><hr width="700"></td>
			</tr>
			<tr>

				<td>
					<form name="updatecustomers" method="post" action="updateU">

						<table>
							<tr>
								<td><input type="hidden" name="id" value="<%=db.rs.getString("userId")%>"></td>
							</tr>
							<tr>
								<td></td>
							</tr>

							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Name</td>
								<td><input type="text" name="name" value="<%=db.rs.getString("name")%>" style="width: 400px; height: 25px;"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Password</td>
								<td><input type="password" name="password" value="<%=db.rs.getString("password")%>" style="width: 400px; height: 25px;"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Contact
									Number</td>
								<td><input type="tel" name="phoneNumber" value="<%=db.rs.getString("phone")%>" style="width: 400px; height: 25px;"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td><a href="Home.jsp"><input name="back" type="button" value="<- Back" class="button button1"></a></td>
								<td><input type="submit" name="updateCustomer" class="button button1" value="Update Details"></td>
							</tr>


						</table>
					</form>
				</td>
			</tr>
			<%
				}
				}
				catch (Exception e) 
				{
				}
			%>
		</table>
	
	</div>
	
</div>	
	
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
</body>
</html>