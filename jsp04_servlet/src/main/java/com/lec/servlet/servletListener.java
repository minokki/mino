package com.lec.servlet;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class servletListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// 개발자가 초기화 하고 싶은 로직 구현
		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// listner가 종료될때 개발자가 구현할 로직을 작성
		
	}
}
