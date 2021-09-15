package edu.iiita;
import java.sql.*;
import java.util.*;
import java.text.*;
public class Classified
{
	public int id;
	public String category;
	public String title;
	public String description;
	public String sdate;
	public String edate;
	public String contact;
	public String cityId;
	public String cityName;
	public String country;
	public String userId;
	public Classified()
	{

	}
	public void setId(int id)
	{
		this.id=id;
	}
	public void setCategory(String category)
	{
		this.category=category;
	}
	public void setTitle(String title)
	{
		this.title=title;
	}
	public void setDescription(String description)
	{
		this.description=description;
	}
	public void setSdate(String sdate)
	{
		this.sdate=sdate;
	}
	public void setEdate(String edate)
	{
		this.edate=edate;
	}
	public void setContact(String contact)
	{
		this.contact=contact;
	}
	public void setCityId(String cityId)
	{
		this.cityId=cityId;
	}
	public void setCityName(String cityName)
	{
		this.cityName=cityName;
	}
	public void setCountry(String country)
	{
		this.country=country;
	}
	public void setUserId(String userId)
	{
		this.userId=userId;
	}
	public int getId()
	{
		return this.id;
	}
	public String getCategory()
	{
		return this.category;
	}
	public String getTitle()
	{
		return this.title;
	}
	public String getDescription()
	{
		return this.description;
	}
	public String getSdate()
	{
		return this.sdate;
	}
	public String getEdate()
	{
		return this.edate;
	}
	public String getContact()
	{
		return this.contact;
	}
	public String getCityId()
	{
		return this.cityId;
	}
	public String getCityName()
	{
		return this.cityName;
	}
	public String getCountry()
	{
		return this.country;
	}
	public String getUserId()
	{
		return this.userId;
	}
	public boolean addClassified()
	{
		Connection con=null;
		PreparedStatement ps=null;
		boolean ret=false;
		try
		{
			con=Database.getConnection();
			ps=con.prepareStatement("insert into city_classified(CATEGORY,TITLE,DESCRIPTION,SDATE,EDATE,CONTACT,CITYID,USERID) values(?,?,?,?,?,?,?,?)");
			ps.setString(1,getCategory());
			ps.setString(2,getTitle());
			ps.setString(3,getDescription());
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			ps.setDate(4,new java.sql.Date(format.parse(getSdate()).getTime()));
			ps.setDate(5,new java.sql.Date(format.parse(getEdate()).getTime()));
			ps.setString(6,getContact());
			ps.setString(7,getCityId());
			ps.setString(8,getUserId());
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

	public static ArrayList<Classified> getAllClassified(Integer cityId, String category)
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<Classified> classifieds=new ArrayList<>();
		HashMap<Integer,City> cities=City.getCitiesAsKeyValue();
		try
		{
			con=Database.getConnection();
			String query="select * from city_classified where sDate<=(select CURRENT_DATE from dual) and eDate>=(select CURRENT_DATE from dual)";
			if(cityId!=null)
			{
				query+=" and CITYID=?";
			}
			if(category!=null)
			{
				query+=" and category=?";
			}
			ps=con.prepareStatement(query);
			if(cityId!=null&&category!=null)
			{
				ps.setInt(1,cityId.intValue());
				ps.setString(2,category);
			}
			else if(cityId!=null)
			{
				ps.setInt(1,cityId.intValue());
			}
			else if(category!=null)
			{
				ps.setString(1,category);
			}
			rs=ps.executeQuery();	
			while(rs.next())
			{
				Classified classified=new Classified();
				classified.setId(rs.getInt("ID"));
				classified.setCategory(rs.getString("category"));
				classified.setTitle(rs.getString("title"));
				classified.setDescription(rs.getString("description"));
				classified.setContact(rs.getString("contact"));
				if(cities.get(rs.getInt("cityId"))!=null)
				{
					classified.setCityName(cities.get(rs.getInt("cityId")).getName());
					classified.setCountry(cities.get(rs.getInt("cityId")).getCountry());
				}
				else
				{
					classified.setCityName(null);
					classified.setCountry(null);	
				}
				classifieds.add(classified);
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
		return classifieds;
	}
	public static ArrayList<Classified> getAllClassified(Integer cityId)
	{
		return getAllClassified(cityId,null);
	}
	public static ArrayList<Classified> getAllClassified(String category)
	{
		return getAllClassified(null,category);
	}
	public static ArrayList<Classified> getAllClassified()
	{
		return getAllClassified(null,null);
	}
	public static void deleteOldClassified()
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try
		{
			con=Database.getConnection();
			ps=con.prepareStatement("delete from city_classified where eDate<=(select CURRENT_DATE from dual)");
			ps.executeUpdate();
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
	}
}