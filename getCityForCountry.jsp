<%@ page import="edu.iiita.*" %>
<%@ page import="java.util.*" %>

<%
	if(request.getSession(false)==null||(session.getAttribute("islogin")==null)){
%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%
	}
	String country = request.getParameter("country");
	if(country!=null)
	{
		ArrayList<City> cities=City.getCityForCountry(country);
	    if(cities.size()>0)
	    {
	    	out.println("<select name='city' onchange='sendInfo()'>");
	    	for(City city:cities)
	    	{
	    		out.println("<option value='"+city.getName()+"'>"+city.getName()+"</option>");
	    	}
	    	out.println("</select>");
	    }
	    else
	    {
	    	out.println("No city found");
	    }
	}
%>