<%@ page import="edu.iiita.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
<%
	if(request.getSession(false)==null||(session.getAttribute("islogin")==null)||"false".equals((String)session.getAttribute("isadmin")))
	{
		request.setAttribute("notlogin_msg","Sorry, Login first for classified");
%>
		<jsp:forward page="admin.jsp"></jsp:forward>
<%
	}
%>
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
	
	<div id="page" style="text-align: center;">
<%
	ArrayList<User> users=User.getUnApprovedUsers();
	if(users.size()>0)
	{
		out.println("<form method='post'  name='form'  action='approveprocess.jsp'/>");
		out.println("<table style='background-color:33ccff'; border='1' cellpadding='1' width='100%' cellspacing='1'>");
		out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Address</th><th>Country</th><th>Approve</th></tr>");
		for(User user:users)
		{
			out.println("<tr><td>"+user.getId()+"</td><td>"+user.getName()+"</td><td>"+user.getEmail()+"</td><td> "+user.getAddress()+"</td><td> "+user.getCountry()+"</td><td><input type='checkbox' name='users' value='"+user.getId()+"'/></td></tr>");
		}
		out.println("</table></br>");
		out.println("<input type='submit' value='Submit'>");
		out.println("<input type='reset' value='Cancel'>");
		out.println("</form>");
	}
	else
	{
		out.println("Cool!!! You approved all the registered advertisers");
	}
%>
		</div>
		<!-- end #content -->
		
	
	<!-- end #page --> 

<jsp:include page="footer.html"></jsp:include>
<!-- end #footer --></body></html>