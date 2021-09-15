<%
	HttpSession sessionHeader = request.getSession(false);
	if(sessionHeader!=null)
	{
		String islogin=(String)session.getAttribute("islogin");
		String isadmin=(String)session.getAttribute("isadmin");
		if(islogin!=null)
		{
			if(isadmin!=null&&"true".equals(isadmin))
			{
			%>
				<%@ include file="header2.html"%>
			<%
			}
			else
			{
			%>
				<%@ include file="header1.html"%>
			<%
			}
		}
		else
		{
		%>
			<%@ include file="header.html"  %>
		<%
		}
	}
	else
	{
	%>
		<%@ include file="header.html"  %>
	<%
	}
%>