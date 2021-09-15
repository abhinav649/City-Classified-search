package edu.iiita;
import java.sql.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
public class Trigger implements ServletContextListener{

	public void contextInitialized(ServletContextEvent arg0) {
		
		Connection con=null;
		Statement stmt=null;
		try{
		
			Class.forName(Database.DRIVER);
			con=DriverManager.getConnection(Database.getConnectionURL(),Database.USERNAME,Database.PASSWORD);
			stmt=con.createStatement();
			stmt.executeUpdate("CREATE or replace TRIGGER BI_CITY_CLASSIFIED before insert on CITY_CLASSIFIED for each row begin select CITY_CLASSIFIED_SEQ.nextval into :NEW.ID from dual;end;");
			stmt.executeUpdate("CREATE or replace TRIGGER  BI_CITY before insert on CITY_DETAILS for each row begin select CITY_DETAILS_SEQ.nextval into :NEW.ID from dual;end;");
			stmt.executeUpdate("CREATE or replace TRIGGER BI_CITY1_USER before insert on CITY1_USER for each row begin select CITY1_USER_SEQ.nextval into :NEW.ID from dual;select 0 into :NEW.isadmin from dual;select 0 into :NEW.approved from dual;end;");
		}
	    catch(Exception e){
	   		e.printStackTrace();	
	    }
	    finally
	    {
	    	Database.closeStatement(stmt);
	    	Database.closeConnection(con);	
	    }	    
	}
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("project undeployed");	
	}
}