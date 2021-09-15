<%@ page import="edu.iiita.*" %>
<%@ page import="java.sql.*" %>

<%
	if(request.getSession(false)==null||(session.getAttribute("islogin")==null)||"false".equals((String)session.getAttribute("isadmin"))){
	request.setAttribute("notlogin_msg","Sorry, Login first for classified");
%>
	<jsp:forward page="admin.jsp"></jsp:forward>
<%
	}
	String userIds[] = request.getParameterValues("users");
	if(userIds!=null)
	{
		User.approveUsers(userIds);
	}
%>
<%@ include file="viewuser.jsp"%> 