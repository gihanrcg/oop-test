<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<link rel="stylesheet" type="text/css" href="CSS/adminCss.css">
<title>Payment methods</title>
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

		<div align="center">
			<h1>Payment Methods</h1>

			<table align="center" id="customers"
				style="text-align: center; width: 50%">
				<tr>

				</tr>
				<tr style="background-color: #4CAF50; color: white">

					<td><b>Card Type</b></td>
					<td><b>Card Number</b></td>
					<td></td>
					<td></td>

				</tr>


				<%
					try {
						String uid = session.getAttribute("userId").toString();
						DBConnect db = new DBConnect();
						db.rs = db.st.executeQuery("select * from paymentmethod where userId = " + uid + "");
						while (db.rs.next()) {
				%>

				<tr>

					<td><%=db.rs.getString("cardType")%></td>
					<td><%=db.rs.getString("cardNumber")%></td>
					<td><a
						href="updateCard.jsp?p=<%=db.rs.getString("pmId")%>&aid=<%=request.getParameter("aid")%>"><input
							class="button button1" type="button" value="Update"></a></td>
					<td>
						<form method="POST" action="deleteCard" encrypt="multipart/form-data">
							<input type="hidden" name="id" value="<%=db.rs.getString("pmId")%>"> 
							<input type="hidden" name="aid" value=<%=request.getParameter("aid")%>>
							<input class="button button3" type="submit" name="action" value="Remove">
						</form>
					</td>

					<%
						if (!request.getParameter("aid").equals("null")) {
					%>
					<td>
						<form method="POST" action="pay" encrypt="multipart/form-data">
							<input type="hidden" name="id" value="<%=db.rs.getString("pmId")%>"> 
							<input type="hidden" name="aid" value=<%=request.getParameter("aid")%>>
							<input type="hidden" name="uid" value=<%=session.getAttribute("userId")%>> 
							<input type="hidden" name="price" value="500"> 
							<input class="button button1" type="submit" name="action" value="Pay">
						</form>
					</td>
					<%
						} else {
								}
					%>


				</tr>
				<%
					}

					} catch (Exception e) {

					}
				%>
			</table>

			<br>

			<form action="AddCard.jsp" method="post">
				<input type="hidden" name="aid" value=<%=request.getParameter("aid")%>> 
				<input type="hidden" name="uid" value=<%=session.getAttribute("userId")%>>
				<input class="button button1" type="submit" name="addcard" value="Add New Card">
			</form>

		</div>

	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>