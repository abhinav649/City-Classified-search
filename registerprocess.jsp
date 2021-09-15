<%@ page import="edu.iiita.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>City Search</title>
<link href="http://fonts.googleapis.com/css?family=Arvo" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="jquery/jquery.gallerax-0.2.js"></script>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1><a href="#">city search</a></h1>
		</div>
	</div>
	<!-- end #header -->
	<div id="menu">
	
<%@ include file="header.jsp"  %>

	</div>
	
	<div id="banner"><img src="images/img03.jpg" width="1000" height="361" alt="" /></div>
	<div id="welcome">	
	<%@ include file="coockie.jsp"  %>
		<jsp:include page="sitemotto.html"></jsp:include>	
	</div>
	
	</div>

	
	<div id="three-columns">
		<div id="column1">
			<h2>Top Category</h2>
			<p><jsp:include page="left.html"></jsp:include></p>
		</div>
		<div id="column2">

<%
	String username=request.getParameter("username");
	String userpass=request.getParameter("userpass");
	String useremail=request.getParameter("useremail");
	String useraddress=request.getParameter("useraddress");
	String usercountry=request.getParameter("usercountry");
	String usercontact=request.getParameter("usercontact");
	User user=new User();
	user.setName(username);
	user.setEmail(useremail);
	user.setPassword(userpass);
	user.setCountry(usercountry);
	user.setContact(usercontact);
	user.setAddress(useraddress);
	if(user.register())
	{
		out.println("<h3><center>you are successfully registered....<br/>To view your profile and post classified <br/>");
		out.print("</h3></center><br/>");
	}
	else
	{
		out.println("Sorry some problem occured. Please try to register again!<br/>if you have already an account <br/>");
	}
%>
<jsp:include page="login.html"></jsp:include>
	</div>
		<div id="column3">
			<h2>Top City</h2> 
			<p><jsp:include page="right.html"></jsp:include></p>
		</div>
	</div>
	
	<div id="page">
		<jsp:include page="content.html"></jsp:include>
		<!-- end #content -->
		<jsp:include page="sidebar.html"></jsp:include>
	</div>
	<!-- end #page --> 
</div>
<jsp:include page="footer.html"></jsp:include>
<!-- end #footer -->
</body></html>