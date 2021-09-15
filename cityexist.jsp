<%@ page import="java.sql.*" %>
<%@ page import="edu.iiita.*" %>
<%
String country=request.getParameter("country");
String city=request.getParameter("name");
boolean status=City.isCityExists(country,city);
if(status)
	out.println("Redundant city and country!");
else
	out.println("Valid city");
%>