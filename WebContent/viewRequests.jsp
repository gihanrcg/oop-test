
<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<link rel="stylesheet" type="text/css" href="CSS/adminCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Requests</title>
</head>
<body>

	<jsp:include page="Header.jsp"></jsp:include>
	<div style="min-height: 53%">
		<%
			response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

			if (session.getAttribute("name") == null) {
				response.sendRedirect("login.jsp");
			} else {
		%>
		<form method="post" action="logoutVal">
			<div class="loginArea" align="right"
				style="position: fixed; top: 10px; right: 20px">
				Welcome Back!<br>
				<%=session.getAttribute("name")%><a href="login.jsp"><br>
				<button class="button button1">Logout</button></a>
			</div>
		</form>

		<%
			}
		%>

		
			<h1 align="center">
				<font><strong>Property Requests</strong></font>
			</h1>
			<table align="center" id="customers"
				style="text-align: center; width: 65%">
				<tr>
				</tr>
				<tr style="background-color: #4CAF50; color: white">
					<td><b>Request Id</b></td>
					<td><b>Property</b></td>
					<td><b>Description</b></td>
					<td><b>Budget (Rs)</b></td>
					<td><b>Location</b></td>
					<td><b>Contact No</b></td>
					<td></td>
					<td></td>
				</tr>

				<%
					try {
						String uid = session.getAttribute("userId").toString();
						DBConnect db = new DBConnect();
						db.rs = db.st.executeQuery("select * from request where userId = " + uid + "");
						while (db.rs.next()) {
				%>

				<tr>
					<td><%=db.rs.getString("rId")%></td>
					<td><%=db.rs.getString("name")%></td>
					<td><%=db.rs.getString("description")%></td>
					<td><%=db.rs.getString("price")%></td>
					<td><%=db.rs.getString("location")%></td>
					<td><%=db.rs.getString("contact")%></td>
					<td>		
						<a href="updateRequest.jsp?u=<%=db.rs.getString("rId")%>"><input class="button button1" type="button" value="Update"></a>
					</td>
					<td>
					<form method="POST" action="deleteRequest" >
						<input type = "hidden" name="mr" value="user">
						<input type="hidden" name="rId" value="<%=db.rs.getString("rId")%>"> 
						<input class="button button3" type="submit" value="Delete">
					</form>
					</td>
				</tr>
				<%
					}

					} catch (Exception e) {

					}
				%>

			</table>
		


	</div>

	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>