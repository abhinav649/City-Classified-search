package edu.iiita;
import java.sql.*;
import java.util.*;
public class City
{
	public int id;
	public String name;
	public String country;
	public String pincode;
	public City()
	{

	}
	public int getId()
	{
		return this.id;
	}
	public String getName()
	{
		return this.name;
	}
	public String getCountry()
	{
		return this.country;
	}
	public String getPincode()
	{
		return this.pincode;
	}

	public void setId(int id)
	{
		this.id=id;
	}
	public void setName(String name)
	{
		this.name=name;
	}
	public void setCountry(String country)
	{
		this.country=country;
	}
	public void setPincode(String pincode)
	{
		this.pincode=pincode;
	}
	public boolean addCity()
	{
		Connection con=null;
		PreparedStatement ps=null;
		boolean ret=false;
		try
		{
			con=Database.getConnection();
			ps=con.prepareStatement("insert into CITY_DETAILS(NAME,COUNTRY,PINCODE) values(?,?,?)");
			ps.setString(1,getName());
			ps.setString(2,getCountry());
			ps.setString(3,getPincode());
			ret=ps.executeUpdate()>0;	
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
		return ret;
	}
	public static ArrayList<String> getDistinctCountry()
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<String> country=new ArrayList<>();
		try
		{
			con=Database.getConnection();
			ps=con.prepareStatement("select distinct(country) from CITY_DETAILS");
			rs=ps.executeQuery();	
			while(rs.next())
			{
				country.add(rs.getString(1));
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
		return country;
	}
	public static boolean isCityExists(String country, String city)
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		boolean toRet=false;
		try
		{
			con=Database.getConnection();
			ps=con.prepareStatement("select * from CITY_DETAILS where country=? and name=?");
			ps.setString(1,country);
			ps.setString(2,city);
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
	public static ArrayList<City> getCityForCountry(String country)
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<City> cities=new ArrayList<>();
		try
		{
			con=Database.getConnection();
			if(country!=null)
			{
				ps=con.prepareStatement("select id,name,country,pincode from CITY_DETAILS where country=?");
				ps.setString(1,country);
			}
			else
			{
				ps=con.prepareStatement("select id,name,country,pincode from CITY_DETAILS");	
			}
			rs=ps.executeQuery();	
			while(rs.next())
			{
				City city=new City();
				city.setId(rs.getInt("id"));
				city.setName(rs.getString("name"));
				city.setCountry(rs.getString("country"));
				city.setPincode(rs.getString("pincode"));
				cities.add(city);
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
		return cities;
	}
	public static ArrayList<City> getCityForCountry()
	{
		return getCityForCountry(null);
	}
	public static HashMap<Integer,City> getCitiesAsKeyValue()
	{
		 ArrayList<City> cities=getCityForCountry();
		 HashMap<Integer,City> h=new HashMap<>();
		 for(City c:cities)
		 {
		 	h.put(c.getId(),c);
		 }
		 return h;
	}
}