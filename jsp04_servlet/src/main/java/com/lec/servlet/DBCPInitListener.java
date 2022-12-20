package com.lec.servlet;

import java.io.IOException;
import java.io.StringReader;
import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.tomcat.dbcp.dbcp2.ConnectionFactory;
import org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory;
import org.apache.tomcat.dbcp.dbcp2.PoolableConnection;
import org.apache.tomcat.dbcp.dbcp2.PoolableConnectionFactory;
import org.apache.tomcat.dbcp.dbcp2.PoolingDriver;
import org.apache.tomcat.dbcp.pool2.impl.GenericObjectPool;
import org.apache.tomcat.dbcp.pool2.impl.GenericObjectPoolConfig;

public class DBCPInitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// DB접속로직
		// contextInitialized()메서드는 web.xml의 <context-param>태그의 정보를 가져온다.
		String poolConfig = sce.getServletContext().getInitParameter("dbConnect");
		// System.out.println(poolConfig);
		
		Properties prop = new Properties();
		
		try {
			prop.load(new StringReader(poolConfig));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		loadJDBCDriver(prop);
		initConnectionPool(prop);		
	}
	
	private void loadJDBCDriver(Properties prop) {
		String drv = prop.getProperty("jdbcDriver");
		try {
			Class.forName(drv);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("JDBC 드라이버 로딩 실패!!!");
		}
	}	
	
	private void initConnectionPool(Properties prop) {
		
		String url = prop.getProperty("url");
		String usr = prop.getProperty("user");
		String pwd = prop.getProperty("pass");
		
		ConnectionFactory cf = new DriverManagerConnectionFactory(url, usr, pwd);
		PoolableConnectionFactory pcf = new PoolableConnectionFactory(cf, null);
		pcf.setValidationQuery("select 1");
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig<>();
		poolConfig.setTimeBetweenEvictionRunsMillis(100l * 60l * 5l);
		poolConfig.setTestWhileIdle(true);
		poolConfig.setMinIdle(5);
		poolConfig.setMaxIdle(10);
		
		GenericObjectPool<PoolableConnection> cp = new GenericObjectPool<>(pcf, poolConfig);
		pcf.setPool(cp);
		
		try {
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			String poolName = prop.getProperty("poolName");
			driver.registerPool(poolName, cp);
		} catch (Exception e) {
			throw new RuntimeException("DB접속실패!!!");
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// dummy
	}
}
