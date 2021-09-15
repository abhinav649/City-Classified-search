package edu.iiita;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

public class ClassifiedRemovalManager implements ServletContextListener {
	private ScheduledExecutorService scheduler;
	@Override
	public void contextInitialized(ServletContextEvent event) 
	{
	    scheduler = Executors.newSingleThreadScheduledExecutor();
	    scheduler.scheduleAtFixedRate(new Thread(){public void run(){Classified.deleteOldClassified();}}, 0, 1, TimeUnit.HOURS);
	}
	@Override
	public void contextDestroyed(ServletContextEvent event) 
	{
	    scheduler.shutdownNow();
	}
}