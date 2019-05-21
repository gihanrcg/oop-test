<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="/Header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/adminCss.css">

<title>Admin Panel</title>

</head>
<body>
	<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if((session.getAttribute("name")==null) ||(!session.getAttribute("type").equals("admin") ))
	{
		response.sendRedirect("login.jsp");
	}
	else
	{%>
	<form method="post" action="logoutVal">
		<div class="loginArea" align="right"
			style="position: fixed; top: 10px; right: 20px">
			Welcome Back!<br>
			<%=session.getAttribute("name") %><a href="login.jsp"><br>
			<button class="button button1">Logout</button></a>
		</div>
	</form>

	<%
	}
%>

	<div class="main" align="center">
		<h1>Admin Panel</h1>
		<hr>
	</div>

	<div id="mySidenav" class="sidenav">
		<a href="manageAllAds.jsp" id="about">Manage Ads</a>
	  <a href="manageAllRequests.jsp" id="blog">Manage Requests</a>
	  <a href="adminPanel.jsp" id="projects">Manage Users</a>
	</div>

	<div style=""">
		<h2 align="center">
			<font><strong>Manage All Users</strong></font>
		</h2>
		<table id="customers" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#4CAF50">
				<th><b>ID</b></th>
				<th><b>User Name</b></th>
				<th><b>Phone</b></th>
				<th><b>Email</b></th>
				<th><b>Type</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>

			<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from user");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("userId") %></td>
				<td><%=db.rs.getString("name") %></td>
				<td><%=db.rs.getString("phone") %></td>
				<td><%=db.rs.getString("email") %></td>
				<td><%=db.rs.getString("type") %></td>
				<td><a href="adminUpdate.jsp?u=<%=db.rs.getString("userId") %>"><input
						class="button button1" type="button" value="Update"></a></td>
				<td>
					<form action="deleteU" method="post">
						<input type="hidden" name="id"
							value="<%=db.rs.getString("userId") %>"> <input
							class="button button3" type="submit" value="Delete">
					</form>
				</td>
			</tr>
			<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
			</div>
</body>
</html>