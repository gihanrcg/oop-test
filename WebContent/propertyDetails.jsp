<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Property Details</title>
</head>
<body>

	<jsp:include page="Header.jsp"></jsp:include>

	<div style="min-height: 60%">	

	<%			
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		
		if(session.getAttribute("name")==null) 
		{%>
			<div class="loginArea" align="right" style="position: fixed;top : 10px;right: 20px">
			<a href="login.jsp"><button class="button button1">Login</button></a>
			</div>
			<% 
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
	
	<h1>Property Details</h1>
	
	<br><br>
<%
		try{
			String aid = request.getParameter("a");
			
			DBConnect db = new DBConnect();
			db.rs = db.st.executeQuery("select * from advertisement where adId = '"+aid+"'");
	
			
		while(db.rs.next()){
			%>
				<div align="center">
				<p><b><%=db.rs.getString("name") %></b></p>
				<img style="width:600px; height: auto" src="images/<%=db.rs.getString("image")%>"><br>
	
				<p><span style="font-size: 15px">Location: </span><%=db.rs.getString("location") %></p>
				<p><span style="font-size: 15px">Size: </span><%=db.rs.getString("size") %> <%=db.rs.getString("unit") %></p>
				<p><span style="font-size: 15px">Price: </span><%=db.rs.getString("price") %></p>
				<div style="width: 60%; text-align:justify"><p><%=db.rs.getString("description") %></p></div>
				<br>
				<p><span style="font-size: 15px">Contact: </span><%=db.rs.getString("contact") %></p>
				<br>
				</div>
		<% }
		 
		}catch(Exception e){
			
		}
			%>

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>