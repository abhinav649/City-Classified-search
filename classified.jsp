<%@ page import="edu.iiita.*" %>
<%@ page import="java.util.*" %>
<html >
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
    var url="getCityForCountry.jsp?country="+country;
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

function getInfo()
{
    if(request.readyState==4)
    {
        var val=request.responseText;
        document.getElementById('city').innerHTML=val;
    }
}
</script>
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
		<%@include file="header.jsp" %> 
	</div>
	
	<div id="banner"><img src="images/img03.jpg" width="1000" height="361" alt="" /></div>
		<div id="welcome">
		<%@include file="coockie.jsp" %>
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
String slogin=(String)session.getAttribute("islogin");
if(slogin==null){
request.setAttribute("notlogin_msg","Sorry, Login first for classified");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>
 
<h1>Post classified!</h1>
<%
ArrayList<String> al=City.getDistinctCountry();
if(al.size()>0)
{
%>
<form action="classifiedprocess.jsp" method="post" name="myform" autocomplete="off">
	<table>
		<tr>
			<td>Category</td>
			<td>
				<select name="category">
					<option value="Bank">Bank</option>
					<option value="Mall">Shopping Mall</option>
					<option value="School">School</option>
					<option value="Hospital">Hospital</option>
					<option value="College">College/University</option>
					<option value="Rentals">Rentals</option>
					<option value="Company">Company</option>
					<option value="Hotel">Hotel</option>		
				</select>
			</td>
		</tr>
		<tr>
			<td>Title</td>
			<td><input type="text" name="title" required /></td>
		</tr>
		<tr>
			<td>Description</td>
			<td><textarea name="description" rows="10" cols="30" required></textarea></td>
		</tr>
		<tr>
			<td>Start Date</td>
			<td><input type="date" name="sdate" required /></td>
		</tr>
		<tr>
			<td>End Date</td>
			<td><input type="date" name="edate" required /></td>
		</tr>
		<tr>
			<td>Contact number</td>
			<td><input type="text" name="contact" required /></td>
		</tr>
		<tr>
			<td>Country</td>
			<td>
				<%
			    	out.println("<select name='country' onchange='sendInfo()'>");
			    	for(String s:al)
			    	{
			    		out.println("<option value='"+s+"'>"+s+"</option>");
			    	}
			    	out.println("</select>");
				%>
			</td>
		</tr>
		<tr>
			<td>City</td>
			<td id='city'>
				<%
					if(al.size()>0)
					{
						ArrayList<City> cities=City.getCityForCountry(al.get(0));
					    if(cities.size()>0)
					    {
					    	out.println("<select name='cityId'>");
					    	for(City city:cities)
					    	{
					    		out.println("<option value='"+city.getId()+"'>"+city.getName()+"</option>");
					    	}
					    	out.println("</select>");
					    }
					    else
					    {
					    	out.println("No city found");
					    }
					}
					else
					{
						out.println("No city found");
					}
				%>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="Post Feed" align="right"/></td>
			<td><input type="reset" value="Reset" align="left"/></td>
		</tr>
	</table>
</form>
<%
}
else
{
	out.println("<h3>No country found!!! Ask admin to add atleast ppt</h3>");
}
%>
<br/><br/>
	</div>
		<div id="column3">
			<h2>Top City</h2> 
			<p><jsp:include page="right.html"></jsp:include></p>
		</div>
	</div>
</div>
<jsp:include page="footer.html"></jsp:include>
<!-- end #footer --></body></html>

