<%@ page import="edu.iiita.*" %>
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
<style type="text/css">
@import "gallery.css";
</style>
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

		</div>
		<div id="column3">
			<h2>Top City</h2> 
			<p><jsp:include page="right.html"></jsp:include></p>
		</div>
	</div>
	
	<div id="page" style="text-align: center;">
<%

ArrayList<Classified> classifieds=Classified.getAllClassified();
if(classifieds.size()>0)
{
	out.println("<table style='background-color:33ccff'; border='1' cellpadding='1' width='100%' cellspacing='1'>");
	out.print("<tr><th>Title</th><th>Description</th><th>Category</th><th>Contact</th><th>City Name</th><th>Country</th></tr>");
	for(Classified c:classifieds)
	{
		out.print("<tr><td>"+c.getTitle()+"</td><td>"+c.getDescription()+"</td><td>"+c.getCategory()+"</td><td>"+c.getContact()+"</td><td> "+c.getCityName()+"</td><td> "+c.getCountry()+"</td></tr>");
	}
	out.print("</table>");
}
else
{
	out.println("Ouch! No classifieds found");
}
%>
		</div>
		<!-- end #content -->
		
	
	<!-- end #page --> 

<jsp:include page="footer.html"></jsp:include>
<!-- end #footer --></body></html>