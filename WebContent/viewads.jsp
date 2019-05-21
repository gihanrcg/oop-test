<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<link rel="stylesheet" type="text/css" href="CSS/adminCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage advertisements</title>
</head>
<body>

<jsp:include page="Header.jsp"></jsp:include>

<div style="min-height: 53%">	

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

<h1 align="center"><font><strong>Property Advertisements</strong></font></h1>
	<table align="center" id="customers" style="text-align: center; width: 80%">
	<tr>
	
	</tr>
	<tr style="background-color:#4CAF50; color:white">
	<td><b>Property ID</b></td>
	<td><b>Property Name</b></td>
	<td><b>Property Location</b></td>
	<td><b>Property size</b></td>
    <td><b>Sale price/in Rs</b></td>
    <td><b>Date and Time</b></td>
    <td><b>Status</b></td>
    <td><b>Photo</b></td>
    <td></td>
    <td></td>
    
	</tr>
	
<%
		try{
			String uid = session.getAttribute("userId").toString();
			DBConnect db = new DBConnect();
			db.rs = db.st.executeQuery("select * from advertisement where userId = "+uid+"");
	
			
		while(db.rs.next()){
			%>
			
			<tr>
				<td><%=db.rs.getString("adId") %> </td>
				<td><%=db.rs.getString("name") %> </td>
				<td><%=db.rs.getString("location") %> </td>
				<td><%=db.rs.getString("size") %> <%=db.rs.getString("unit") %></td>
				<td><%=db.rs.getString("price") %> </td>
				<td><%=db.rs.getString("dateTime") %> </td>
				<td><%=db.rs.getString("payment") %> </td>
				<td style=""><img style="width: 45px; height: auto" src="images/<%=db.rs.getString("image") %> "></td>
				
				
				<td><a href = "update.jsp?x=<%=db.rs.getString("adId") %>"><input class="button button1" type = "button" value = "Update"></a></td>
				
			    <td>
			    <form action="deletead" method="POST">
			    
			    <input type = "hidden" name="id" value="<%=db.rs.getString("adId") %>">
			    <input type = "hidden" name="mad" value="user">
				<input class="button button3" type ="submit" value = "delete">      
			    </form>
			    </td> 
			    <%if (db.rs.getString("payment").equals("unpaid")) {%>
				<td><a href = "Payment.jsp"><input class="button button1" type = "button" value = "Pay"></a></td>
				
				<%} %>
			 </tr>
			 
			<%
			
		}
		
        }catch(Exception e){
			
		}
	
	%>

	</table>
	</form>
	

	</div>
	
	<jsp:include page="Footer.jsp"></jsp:include>
	
</body>
</html>