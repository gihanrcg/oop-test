<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@include file="/Header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/adminCss.css">

<title>Admin Panel</title>

</head>
<body>
<div style="min-height: 70%">

<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if((session.getAttribute("name")==null) ||(!session.getAttribute("type").equals("admin") ))
	{
		response.sendRedirect("login.jsp");
	}
	else
	{%>
	<form method="post" action="logoutVal">
		<div class="loginArea" align="right" style="position: fixed;top : 10px;right: 20px">
		Welcome Back!<br> <%=session.getAttribute("name") %><a href="login.jsp"><br><button class="button button1">Logout</button></a>
		</div>
	</form>
		
<%
	}
%>

	<div class="main" align="center">
  		<h1>Admin Panel</h1><hr>
  	</div>
 
	<div  id="mySidenav"  class="sidenav" >
	  <a href="manageAllAds.jsp" id="about">Manage Ads</a>
	  <a href="manageAllRequests.jsp" id="blog">Manage Requests</a>
	  <a href="adminPanel.jsp" id="projects">Manage Users</a>
	</div>

	<div>
			<h2 align="center"><font><strong>Manage All Ads</strong></font></h2>
			<table id="customers" align="center" Style="width: 70%; text-align:center">
			<tr>
			
			</tr>
			<tr bgcolor="#4CAF50" >
			<th Style="text-align:center"><b>Ad ID</b></th>
			<th Style="text-align:center"><b>Name</b></th>
			<th Style="text-align:center"><b>Location</b></th>
			<th Style="text-align:center"><b>Size</b></th>
			<th Style="text-align:center"><b>Price</b></th>
			<th Style="text-align:center"><b>Date and Time</b></th>
			<th Style="text-align:center"><b>User ID</b></th>
			
			<th text-align="center"><b></b></th>
			</tr>
			
		<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from advertisement");
				while(db.rs.next())
				{
		%>
		
			<tr>
			<td><%=db.rs.getString("adId") %> </td>
				<td><%=db.rs.getString("name") %> </td>
				<td><%=db.rs.getString("location") %> </td>
				<td><%=db.rs.getString("size") %> <%=db.rs.getString("unit") %></td>
				<td><%=db.rs.getString("price") %> </td>
				<td><%=db.rs.getString("dateTime") %> </td>
				<td><%=db.rs.getString("userId") %> </td>
				<td>
					<form action="deletead" method="post">
						<input type = "hidden" name="mad" value="admin">
						<input type = "hidden" name="id" value="<%=db.rs.getString("adId") %>">
						<input class="button button3" type = "submit" value = "Delete">
					</form>
				</td>			 		
			 </tr>
			<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
	</table>
	</div>
	</div>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
	
</html>