package edu.iiita;
import java.sql.*;
import java.util.*;
public class User
{
	public int id;
	public String name;
	public String address;
	private String email;
	private String password;
	public String country;
	public String contact;
	public int isAdmin;
	public int approved;
	public User()
	{

	}
	public User(ResultSet rs) throws Exception
	{
		setId(rs.getInt("id"));
		setName(rs.getString("name"));
		setEmail(rs.getString("email"));
		setAddress(rs.getString("address"));
		setCountry(rs.getString("country"));
		setContact(rs.getString("contact"));
		setIsAdmin(rs.getInt("isAdmin"));
		setApproved(rs.getInt("approved"));		
	}
	public int getId()
	{
		return this.id;
	}
	public String getName()
	{
		return this.name;
	}
	public String getAddress()
	{
		return this.address;
	}
	public String getEmail()
	{	
		return this.email;
	}
	public String getPassword()
	{
		return this.password;
	}
	public String getCountry()
	{
		return this.country;
	}
	public String getContact()
	{
		return this.contact;
	}
	public int getIsAdmin()
	{
		return this.isAdmin;
	}
	public int getApproved()
	{
		return this.approved;
	}

	public void setId(int id)
	{
		this.id=id;
	}
	public void setName(String name)
	{
		this.name=name;
	}
	public void setAddress(String address)
	{
		this.address=address;
	}
	public void setEmail(String email)
	{	
		this.email=email;
	}
	public void setPassword(String password)
	{
		this.password=password;
	}
	public void setCountry(String country)
	{
		this.country=country;
	}
	public void setContact(String contact)
	{
		this.contact=contact;
	}
	public void setIsAdmin(int isAdmin)
	{
		this.isAdmin=isAdmin;
	}
	public void setApproved(int approved)
	{
		this.approved=approved;
	}
	public boolean register()
	{
		Connection con=null;
		PreparedStatement ps=null;
		boolean toRet=false;
		try
		{
			con=Database.getConnection();
			String query="insert into CITY1_USER(name,password,email,address,country,contact) values(?,?,?,?,?,?)";
			ps=con.prepareStatement(query);
			ps.setString(1,getName());
			ps.setString(2,getPassword());
			ps.setString(3,getEmail());
			ps.setString(4,getAddress());
			ps.setString(5,getCountry());
			ps.setString(6,getContact());
			int status=ps.executeUpdate();
			toRet=status>0;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			Database.closePreparedStatement(ps);
			Database.closeConnection(con);
		}
		return toRet;
	}
	public static boolean isUserExists(String email)
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		boolean toRet=false;
		try
		{
			con=Database.getConnection();
			ps=con.prepareStatement("select * from city1_user where email=?");
			ps.setString(1,email);
			rs=ps.executeQuery();
			toRet=rs.next();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			Database.closeResultSet(rs);
			Database.closePreparedStatement(ps);
			Database.closeConnection(con);
		}
		return toRet;
	} 
	public static User getUser(String email,String pass)
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try
		{
			con=Database.getConnection();
			ps=con.prepareStatement("select * from city1_user where email=? and password=?");
			ps.setString(1,email);
			ps.setString(2,pass);
			rs=ps.executeQuery();
			if(rs.next())
			{
				User user=new User(rs);
				return user;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			Database.closeResultSet(rs);
			Database.closePreparedStatement(ps);
			Database.closeConnection(con);
		}
		return null;
	}
	public static User getAdmin(String name,String pass)
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try
		{
			con=Database.getConnection();
			ps=con.prepareStatement("select * from city1_user where name=? and password=? and isadmin=1 and APPROVED=1");
			ps.setString(1,name);
			ps.setString(2,pass);
			rs=ps.executeQuery();
			if(rs.next())
			{
				User user=new User(rs);
				return user;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			Database.closeResultSet(rs);
			Database.closePreparedStatement(ps);
			Database.closeConnection(con);
		}
		return null;
	}
	public static ArrayList<User> getUnApprovedUsers()
	{
		Connection con=null;
		Statement smt=null;
		ResultSet rs=null;
		ArrayList<User> users=new ArrayList<>();	
		try
		{
			con=Database.getConnection();
			smt=con.createStatement();
			String query="select * from CITY1_USER where approved=0";
			rs=smt.executeQuery(query);
			if(rs.next())
			{
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
				user.setCountry(rs.getString("country"));
				users.add(user);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			Database.closeResultSet(rs);
			Database.closeStatement(smt);
			Database.closeConnection(con);
		}
		return users;
	}
	public static void approveUsers(String userIds[])
	{
		Connection con=null;
		PreparedStatement ps=null;
		try 
		{
			con=Database.getConnection();
			ps = con.prepareStatement("update city1_user set approved=1 where id=?");
			for(String s:userIds)
			{
				ps.setInt(1,Integer.parseInt(s));
				ps.addBatch();
			}
			ps.executeBatch();
		}  
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			Database.closePreparedStatement(ps);
			Database.closeConnection(con);
		}
	}
}