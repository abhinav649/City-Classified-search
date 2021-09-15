<%@ page import="edu.iiita.*" %>
<%@ page import="java.sql.*" %>

<%
	if(request.getSession(false)==null||(session.getAttribute("islogin")==null)||"false".equals((String)session.getAttribute("isadmin"))){
%>
	<jsp:forward page="admin.jsp"></jsp:forward>
<%
	}
	String name = request.getParameter("name");
	String country = request.getParameter("country");
	String pincode = request.getParameter("pincode");
	boolean status=false;
	if(name!=null&&country!=null&&pincode!=null)
	{
		City city=new City();
		city.setName(name);
		city.setCountry(country);
		city.setPincode(pincode);
		status=city.addCity();
	}
	if(status)
	{
		request.setAttribute("Success","Successfully added city");
	}
	else
	{
		request.setAttribute("Error","Sorry!!! Unable to add city");	
	}
%>
<jsp:forward page="postcity.jsp"></jsp:forward>