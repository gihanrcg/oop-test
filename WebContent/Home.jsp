<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@include file="/Header.jsp" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/Slideshow.css">
<link rel="stylesheet" type="text/css" href="CSS/Styles.css">
<link rel="stylesheet" type="text/css" href="CSS/adminCss.css">
<script src="scripts/scripts.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		
		if((session.getAttribute("name")==null) ||(!session.getAttribute("type").equals("admin")) && (!session.getAttribute("type").equals("user")))
		{%>
			
			<div class="loginArea" align="right" style="position: fixed;top : 10px;right: 20px">
			<a href="login.jsp"><button class="button button1">Login</button></a>
			</div>
		
		<% 
		}
		else{
	%>
	
	<form method="post" action="logoutVal">
			<div class="loginArea" align="right" style="position: fixed;top : 10px;right: 20px">
			Welcome Back!<br> <%=session.getAttribute("name") %><a href="login.jsp"><br><button class="button button1">Logout</button></a>
			</div>
		</form>
			
	<%
		}
	%>
	
	
	
	<div style="min-height: 0%">	
		
		
	
	<div>
    <div class="slideshow">

        <div class="Slides fade">
            <img src="images/slide1.jpg" style="width:100%">
        </div>

        <div class="Slides fade">
            <img src="images/slide2.jpg" style="width:100%">
        </div>

        <div class="Slides fade">
            <img src="images/slide3.jpg" style="width:100%">
        </div>

        <div class="Slides fade">
            <img src="images/slide4.jpg" style="width:100%">
        </div>

    </div>
    <br>

    <div style="text-align:center">
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </div>
</div>

<br>

<script>
   		 var slideIndex = 0;
  	 	 showSlides();
	</script>

<div align="center">

	<br>
		<a href="Add.jsp" > <img  src="images/request2.jpg" style="width:100%" ></a>
		
		<br>
		<a href="addRequest.jsp" ><img  src="images/request.jpg" style="width:100%"></a>
	
</div>

	</div>

	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>