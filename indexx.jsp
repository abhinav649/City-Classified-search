<%@ page import="java.sql.*" %>
<%@ page import="edu.iiita.*" %>
<%
String email=request.getParameter("val");
boolean status=User.isUserExists(email);
if(status)
	out.println("Invalid user! userName already exists");
else
	out.println("Valid user");
%>