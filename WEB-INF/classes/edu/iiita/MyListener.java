package edu.iiita;
import javax.servlet.*;
import java.sql.*;

public class MyListener implements ServletContextListener{

	public void contextInitialized(ServletContextEvent arg0) {
		
		Connection con=null;
		PreparedStatement ps=null,ps2=null,ps4=null,ps5=null;
		try{
			con=Database.getConnection();
			ps=con.prepareStatement("CREATE TABLE CITY_DETAILS(ID NUMBER,NAME VARCHAR2(100),COUNTRY VARCHAR2(100),PINCODE NUMBER,PRIMARY KEY (ID))");
			ps.executeUpdate();
		
			ps=con.prepareStatement("CREATE SEQUENCE CITY_DETAILS_SEQ MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER NOCYCLE");
			ps.executeUpdate();
			
			
			ps2= con.prepareStatement("CREATE SEQUENCE CITY_CLASSIFIED_SEQ MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER NOCYCLE");
			ps2.executeUpdate();
			
			ps4=con.prepareStatement("CREATE TABLE  CITY_CLASSIFIED(ID NUMBER,CATEGORY VARCHAR2(100),TITLE VARCHAR2(100),DESCRIPTION VARCHAR2(1000),SDATE DATE,EDATE DATE,CONTACT NUMBER,CITYID NUMBER,USERID NUMBER,PRIMARY KEY (ID))");
			ps4.executeUpdate();		
			
			
			ps2= con.prepareStatement("CREATE SEQUENCE CITY1_USER_SEQ MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER NOCYCLE");
			ps2.executeUpdate();
			
		 	ps5 = con.prepareStatement("CREATE TABLE  CITY1_USER(ID NUMBER,NAME VARCHAR2(100),PASSWORD VARCHAR2(100),EMAIL VARCHAR2(100),ADDRESS VARCHAR2(1000),COUNTRY VARCHAR2(100),CONTACT NUMBER,isadmin number check (isadmin>=0 and isadmin<=1),approved number check (approved>=0 and approved<=1), PRIMARY KEY (ID))");		
			ps5.executeUpdate();
			
		}
		
	    catch(Exception e){
	    	e.printStackTrace();	
	    }
	    finally
	    {
	    	Database.closePreparedStatement(ps);
	    	Database.closePreparedStatement(ps2);
	    	Database.closePreparedStatement(ps4);
	    	Database.closePreparedStatement(ps5);
	    	Database.closeConnection(con);
	    }
	}
	    public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("project undeployed");
		
	}
}
