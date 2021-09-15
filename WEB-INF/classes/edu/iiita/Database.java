package edu.iiita;
import java.sql.*;
public class Database
{
	public static final String HOST="localhost";
	public static final int PORT=1521;
	public static final String VERSION="10.2";
	public static final String USERNAME="system";
	public static final String PASSWORD="MSRmvkrPD07";
	public static final String DRIVER="oracle.jdbc.driver.OracleDriver";
	public static String getHost()
	{
		return HOST;
	}
	public static int getPort()
	{
		return PORT;
	}
	public static String getVersion()
	{
		return VERSION;
	}
	public static String getUserName()
	{
		return USERNAME;
	}
	public static String getPassword()
	{
		return PASSWORD;
	}
	public static String getConnectionURL()
	{
		return "jdbc:oracle:thin:@"+HOST+":"+PORT+":xe";
	}
	public static String getDriver()
	{
		return DRIVER;
	}
	public static void closeConnection(Connection con)
	{
		try
		{
			if(con!=null)
			{
				con.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void closeStatement(Statement st)
	{
		try
		{
			if(st!=null)
			{
				st.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void closePreparedStatement(PreparedStatement ps)
	{
		try
		{
			if(ps!=null)
			{
				ps.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void closeResultSet(ResultSet rs)
	{
		try
		{
			if(rs!=null)
			{
				rs.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws Exception
	{
		Class.forName(Database.DRIVER);
		return DriverManager.getConnection(Database.getConnectionURL(),Database.USERNAME,Database.PASSWORD);
	}
}