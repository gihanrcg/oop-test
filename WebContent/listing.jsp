<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listings</title>
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
	
	<h1>Property Listings</h1>
	
	<br><br>
	
	<table align="center" id="grid" style="text-align: left; width: 90%">
	<tr>
	<%
		try{
			
			int i = 0;
		
			DBConnect db = new DBConnect();
			db.rs = db.st.executeQuery("select * from advertisement where payment = 'paid'");
	
			
		while(db.rs.next()){
			
			if(i % 5 == 0){
			%>
				<tr>
				<td align="center" style="border: 3px solid #4CAF50; width:20%; padding: 10px">
					<img style="width: 150px; height: auto" src="images/<%=db.rs.getString("image")%>"> <br>
					<p><b><%=db.rs.getString("name") %></b></p>
					<p><span style="font-size: 15px">Location: </span><%=db.rs.getString("location") %></p>
					<p><span style="font-size: 15px">Size: </span><%=db.rs.getString("size") %> <%=db.rs.getString("unit") %></p>
					<p><span style="font-size: 15px">Price:</span><span style="color:red; font-size: 20px"> Rs.<%=db.rs.getString("price") %>.00</span></p>
					<a href="propertyDetails.jsp?a=<%=db.rs.getString("adId")%>"><input type="button" value="View More"></a>
					<br>
				</td>
				
				
			<% 
				
				i++;
			}
			else{
				if(i%5 == 5){%>
				</tr>
				<td align="center" style="border: 3px solid #4CAF50; width:20%; padding: 10px">
					<img style="width: 150px; height: auto" src="images/<%=db.rs.getString("image")%>"> <br>
					<p><b><%=db.rs.getString("name") %></b></p>
					<p><span style="font-size: 15px">Location: </span><%=db.rs.getString("location") %></p>
					<p><span style="font-size: 15px">Size: </span><%=db.rs.getString("size") %> <%=db.rs.getString("unit") %></p>
					<p><span style="font-size: 15px">Price:</span><span style="color:red; font-size: 20px"> Rs.<%=db.rs.getString("price") %>.00</span></p>
					<a href="propertyDetails.jsp?a=<%=db.rs.getString("adId")%>"><input type="button" value="View More"></a>
					<br>
				</td>
			<%
				}
				else{
				%>
				
				<td align="center" style="border: 3px solid #4CAF50; width:20%; padding: 10px">
					<img style="width: 150px; height: auto" src="images/<%=db.rs.getString("image")%>"> <br>
					<p><b><%=db.rs.getString("name") %></b></p>
					<p><span style="font-size: 15px">Location: </span><%=db.rs.getString("location") %></p>
					<p><span style="font-size: 15px">Size: </span><%=db.rs.getString("size") %> <%=db.rs.getString("unit") %></p>
					<p><span style="font-size: 15px">Price:</span><span style="color:red; font-size: 20px"> Rs.<%=db.rs.getString("price") %>.00</span></p>
					<a href="propertyDetails.jsp?a=<%=db.rs.getString("adId")%>"><input type="button" value="View More"></a>
					<br>
				</td>
				<% }
				i++;
				
			}
			}
		 
		}catch(Exception e){
			
		}
			%>
	
	</tr>
	
	
	</table>	
</div>	

<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>