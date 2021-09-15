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
<script>
	var request;
	function sendInfo()
	{
	    var country=document.myform.country.value;
	    var city=document.myform.name.value;
	    if(city!="")
	    {
	    	var url="cityexist.jsp?country="+country+"&name="+city;
		    if(window.XMLHttpRequest)
		    {
		        request=new XMLHttpRequest();
		    }
		    else if(window.ActiveXObject)
		    {
		        request=new ActiveXObject("Microsoft.XMLHTTP");
		    }
		    try
		    {
		        request.onreadystatechange=getInfo;
		        request.open("GET",url,true);
		        request.send();
		    }
		    catch(e)
		    {
		        alert("Unable to connect to server");
		    }
	    }
	    else
	    {
	    	document.getElementById('location').innerHTML="";
	    }
	}
	function getInfo()
	{
	    if(request.readyState==4)
	    {
	        var val=request.responseText;
	        document.getElementById('location').innerHTML=val;
	    }
	}
</script>
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
	<div id="three-columns">
		<div id="column1">
			<h2>Top Category</h2>
			<p><jsp:include page="left.html"></jsp:include></p>
		</div>
		<div id="column2">
			<%
			if(request.getAttribute("Success")!=null)
			{
				out.println("<h3>"+request.getAttribute("Success")+"</h3>");
			}
			else if(request.getAttribute("Error")!=null)
			{
				out.println("<h3>"+request.getAttribute("Error")+"</h3>");
			}
			%>
			<h1>Post City</h1>
			<form method="post"  name="myform" autocomplete="off" action="processpostcity.jsp"/>
			<table width="397" border="0" height="208">
			<tbody>
				<tr>
				<td>&nbsp;Country:</td>
				<td>&nbsp;
					<select name="country">
						<option value="India">India</option>
					    <option value="Africa">Africa</option>
					    <option value="Argentina">Argentina</option>
					    <option value="Australia">Australia</option>
					    <option value="Austria">Austria</option>
					    <option value="Belgium">Belgium</option>
					    <option value="Brazil">Brazil</option>
					    <option value="Bulgaria">Bulgaria</option>
					    <option value="Canada">Canada</option>
					    <option value="Caribbean">Caribbean</option>
					    <option value="Central America">Central America</option>
					    <option value="Chile">Chile</option>
					    <option value="China">China</option>
					    <option value="Colombia">Colombia</option>
					    <option value="Costa Rica">Costa Rica</option>
					    <option value="Croatia">Croatia</option>
					    <option value="Czech Republic">Czech Republic</option>
					    <option value="Denmark">Denmark</option>
					    <option value="Dominican Republic">Dominican Republic</option>
					    <option value="Estonia">Estonia</option>
					    <option value="Finland">Finland</option>
					    <option value="France">France</option>
					    <option value="Germany">Germany</option>
					    <option value="Greece">Greece</option>
					    <option value="Guatemala">Guatemala</option>
					    <option value="Hong Kong">Hong Kong</option>
					    <option value="Hungary">Hungary</option>
					    <option value="Indonesia">Indonesia</option>
					    <option value="Ireland">Ireland</option>
					    <option value="Israel">Israel</option>
					    <option value="Italy">Italy</option>
					    <option value="Japan">Japan</option>
					    <option value="Korea">Korea</option>
					    <option value="Latvia">Latvia</option>
					    <option value="Lithuania">Lithuania</option>
					    <option value="Malaysia">Malaysia</option>
					    <option value="Mexico">Mexico</option>
					    <option value="Middle East">Middle East</option>
					    <option value="Morocco">Morocco</option>
					    <option value="Netherlands">Netherlands</option>
					    <option value="New Zealand">New Zealand</option>
					    <option value="Norway">Norway</option>
					    <option value="Panama">Panama</option>
					    <option value="Peru">Peru</option>
					    <option value="Philippines">Philippines</option>
					    <option value="Poland">Poland</option>
					    <option value="Portugal">Portugal</option>
					    <option value="Puerto Rico">Puerto Rico</option>
					    <option value="Romania">Romania</option>
					    <option value="Russian Federation">Russian Federation</option>
					    <option value="Singapore">Singapore</option>
					    <option value="Slovakia">Slovakia</option>
					    <option value="Slovenia">Slovenia</option>
					    <option value="South Africa">South Africa</option>
					    <option value="Spain">Spain</option>
					    <option value="Sweden">Sweden</option>
					    <option value="Switzerland">Switzerland</option>
					    <option value="Taiwan">Taiwan</option>
					    <option value="Thailand">Thailand</option>
					    <option value="Turkey">Turkey</option>
					    <option value="Ukraine">Ukraine</option>
					    <option value="United Kingdom">United Kingdom</option>
					    <option value="United States">United States</option>
					    <option value="Venezuela">Venezuela</option>
					    <option value="Vietnam">Vietnam</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>&nbsp;Name:</td>
				<td>&nbsp;<input type="text" name="name" required onkeyup="sendInfo()"><span id="location"></span></td>
			</tr>
			<tr>
			<td>&nbsp;Pincode:<br></td>
			<td>&nbsp;<input type="text" required name="pincode"/></td></tr><tr><td valign="top"></td>
			</tr>
			<tr>
			<td valign="top" align="center">
				<input type="submit" value="register" name="button1" onclick="sendInfo()">
				<input type="reset" value="Reset">
			</td>
			</tr>
			</tbody>
			</table>
			</form>
		</div>
		<div id="column3">
			<h2>Top Category</h2>
			<p><jsp:include page="right.html"></jsp:include></p>
		</div>
	</div>
	<!-- end #content --> 

<jsp:include page="footer.html"></jsp:include>
<!-- end #footer --></body></html>