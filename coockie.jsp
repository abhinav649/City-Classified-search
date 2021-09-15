<%
	HttpSession sessionCookie = request.getSession(false);
	if(sessionCookie!=null)
	{
		String login=(String)session.getAttribute("islogin");
		if(login!=null)
		{
			Cookie cks[]=request.getCookies();
			if(cks!=null)
			{
				for(Cookie ck:cks)
				{
					if("uname".equals(ck.getName()))
					{
						out.print("<h3>you are logged as:"+ck.getValue());
						out.print("</h3>");
						break;
					}
				}
			}
		}
	}
%><br/>