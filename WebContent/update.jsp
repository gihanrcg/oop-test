<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@include file="/Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<meta charset="ISO-8859-1">
<title>Update</title>
<h1>Update your Advertisement</h1>
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

<div style="height: 53% ">	
      
      <%
		String id = request.getParameter("x");
		
		try
		{
			DBConnect db = new DBConnect();
			db.rs = db.st.executeQuery("select * from advertisement where adId='"+id+"'");
		while(db.rs.next()){
		
		%>

<div align="center" class="texts">

<form action="updateadd" method="POST">

  <input type = "hidden" name="id" value="<%=db.rs.getString("adId") %>">
  
  Property Name:<br>
  <input type="text" name="Property Name" value="<%=db.rs.getString("name") %>" required><br><br>
  
  Description:<br>
  <textarea style="text-align: left" class="input button1" placeholder="Description here..." name= "description" rows="7" cols="40"><%=db.rs.getString("description") %></textarea><br>
  
  Property Location:<br>
  <input type="text" name="Property loc" value="<%=db.rs.getString("location") %>" required><br><br>
  
  Property size:<br>
  <input type="text" name="psize" value="<%=db.rs.getString("size") %>" required>
  
  <select class="input button1" name="unit" >
  <option value="perch" <%=(db.rs.getString("unit").equals("perch"))?"selected":""%>>perches</option>
  <option value="sqf" <%=(db.rs.getString("unit").equals("sqf"))?"selected":""%>>sqft</option>
  <option value="ac" <%=(db.rs.getString("unit").equals("ac"))?"selected":""%>>arces</option>
  
  </select><br><br>
  
  Sale price/in Rs:<br>
  <input type="text" name="Sale price" value="<%=db.rs.getString("price") %>" required><br><br>
  
  Contact No:<br>
	  <input type="text" name="contactNo" value="<%=db.rs.getString("contact") %>" required><br><br>
  
  Image:<br>
	  <input class="input button1" type="file" name="image" accept="image/*" required>
	  <img style="width: 45px; height: auto" src="images/<%=db.rs.getString("image") %> ">
	  <br><br>
 
  <a href="viewads.jsp"><input class="button button1" type="button" value="Back"></a>	
  <input class="button button1" type="submit" value="Update">
  
</form>
</div>

    <%}
		}catch(Exception e)
		{
		}
	%>
	
<jsp:include page="Footer.jsp"></jsp:include>
</div>
</body>
</html>