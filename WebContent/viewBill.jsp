<%@page import="util.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<title>Bill</title>

<style type="text/css">
<!--

@media print
{
.noPrint {display:none;}
}

@media screen
{
...
}

-->
</style>

</head>
<body>
	
<div class="noPrint">
<jsp:include page="Header.jsp"></jsp:include>
</div>

<div style="height: 53% ">

<div class="noPrint">
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

<h1>Payment Successful!</h1>
<br>
</div>
<%
		String aid = request.getParameter("aid");		

		try{
			
			
			DBConnect db = new DBConnect();
			db.rs = db.st.executeQuery("select * from payment p, paymentmethod pm where adId = "+aid+" and p.pmId = pm.pmId");
			while(db.rs.next()){
			%>

<div align="center">
	<table>
			<th>Payment Receipt</th>
			<tr>
			<td>Payment ID : </td>
			<td> <%=db.rs.getString("payId")%></td>
			</tr>
			<tr>
			<td>Advertisement ID : </td>
			<td><%=db.rs.getString("adId")%></td>
			</tr>
			<tr>
			<td>Payment Method : </td>
			<td><%=db.rs.getString("cardType")%> Card <%=db.rs.getString("cardNumber")%></td>
			</tr>
			<tr>
			<td>Payment Date and Time : </td>
			<td><%=db.rs.getString("dateTime")%></td>
			</tr>
			<tr>
			<td>Amount : </td>
			<td>RS <%=db.rs.getString("amount")%></td>
			</tr>
			<tr class = "noPrint">
			<td></td>
			<td> <input type="button" onclick="window.print()" value="Print"> </td>
			</tr>
			
	</table>
	
</div>
		<%
			}
			
		}catch(Exception e){
			
		}
	
	%>
	


</div>

<div class="noPrint">


<jsp:include page="Footer.jsp"></jsp:include>
</div>
</body>
</html>