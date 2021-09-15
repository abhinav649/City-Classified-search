<%@ page import="java.sql.*" %>
<%@ page import="edu.iiita.*" %>
<%
ResultSet rs=null;
PreparedStatement ps=null;
Connection con=null;
try
{
	Class.forName(Database.DRIVER);
	con=DriverManager.getConnection(Database.getConnectionURL(),Database.USERNAME,Database.PASSWORD);
	ps=con.prepareStatement("SELECT table_name FROM user_tables");
	rs=ps.executeQuery();
	while(rs.next())
	{
		out.println(rs.getString(1)+"<br/>");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
finally
{
	try{
		if(rs!=null)rs.close();
		if(ps!=null)ps.close();
		if(con!=null)con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
%>