package com.lec.basic;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	
	// localhost:8088/basic/hello.do
	public HelloServlet() {
		System.out.println("==> HelloServlet 생성자 호출");
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		System.out.println("doGet() 메서드 호출");
	}
	

	
	
}
