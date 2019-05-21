<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
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
		String id  = request.getParameter("u");
	
	try{
		DBConnect db = new DBConnect();
		db.rs = db.st.executeQuery("select * from request where rId = '"+id+"'");
	while(db.rs.next()){
	
	
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<form method = "POST" action ="addUpdate" encrypt= "multipart/form-data">
	<h1>Update Property</h1>
		<table align = "center" class="texts">
	
		<tr>
		<td>
		Select the property you want to update:
		<br>
		</td>		
		<td>
		<input type= "radio" name = "property" value = "new developments" <%=(db.rs.getString("name").equals("new developments"))?"checked":""%>>New Developments <br>
		<input type= "radio" name = "property" value = "Land" <%=(db.rs.getString("name").equals("Land"))?"checked":"" %>> Land<br>
		<input type= "radio" name = "property" value = "Houses" <%=(db.rs.getString("name").equals("Houses"))?"checked":"" %>> Houses<br>
		<input type= "radio" name = "property" value = "Apartments" <%=(db.rs.getString("name").equals("Apartments"))?"checked":"" %>>Apartments <br>
		</td>
		</tr>
		<tr>
		<td>
		Description:
		<br>
		</td>
		<td>
		<textarea class="input button1" placeholder="Description here..." name = "description" rows="5" cols="25"><%=db.rs.getString("description")%></textarea> 
		<br>
		</td>
		</tr>
		<tr>
		<td>
		Budget:
		<br>
		</td>
		<td>
		<input type= "text" name = "budget" value="<%=db.rs.getString("price") %>"><br>
		</td>
		</tr>
		<tr>
		<td>
		Location:
		<br>
		</td>
		<td>
		<input type= "text" name = "Location" value="<%=db.rs.getString("location") %>"> <br>
		</td>
		</tr>
		<tr>
		<td>
		Contact no:
		<br>
		</td>
		<td>
		<input type= "text" name="Contact" value ="<%=db.rs.getString("contact") %>"> <br>
		</td>
		 </tr>
		 <tr>
		 <td>
		 <input type = "hidden" name= "rId" value ="<%=db.rs.getString("rId") %>">
		 <a href = "viewRequests.jsp"><input class="button button1" type = "button" name ="back" value ="Back"></a>
		 <input class="button button1" type="Submit" value= "Submit">
		<br>
		</td>
		</tr>
		
		</table>
			
	</form>
	<%}
			
		}catch(Exception e){
			
		}
	
		%>
		<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>