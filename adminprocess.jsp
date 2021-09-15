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
<%
String username=request.getParameter("username");
String userpass=request.getParameter("userpass");
if(username==null||userpass==null)
{
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<%	
}
	User user=User.getAdmin(username,userpass);
	if(user!=null)
	{
		int isadmin=1;
		session.setAttribute("username",username);
		session.setAttribute("islogin","true");
		session.setAttribute("isadmin","true");
		session.setAttribute("userid",user.getId());
		Cookie ck=new Cookie("uname",username);
		response.addCookie(ck);
%>
	<%@ include file="header2.html"  %>
	</div>
	
	<div id="banner"><img src="images/img03.jpg" width="1000" height="361" alt="" /></div>
	<div id="welcome">
		<jsp:include page="sitemotto.html"></jsp:include>
	</div>
	</div>	
	
	<div id="three-columns">
		<div id="column1">
			<h2>Top Category</h2>
			<p><jsp:include page="left.html"></jsp:include></p>
		</div>
		<div id="column2">
<% }
else{
out.print("Sorry username or  password error!");
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<%
}
%>

	</div>
		<div id="column3">
			<h2>Top City</h2> 
			<p><jsp:include page="right.html"></jsp:include></p>
		</div>
	</div>
		
	<div id="page">
		<div id="content">
			
			
				<div id="content">
					<img src ="images/admin.jpg" onclick="admin.jsp"/><br/>
					<marquee>THIS IS ADMIN PAGE</marquee>
				
			</div>
		</div>
		<!-- end #content -->
		<jsp:include page="sidebar.html"></jsp:include>
	</div>
	<!-- end #page --> 
</div>
<jsp:include page="footer.html"></jsp:include>
<!-- end #footer --></body></html>