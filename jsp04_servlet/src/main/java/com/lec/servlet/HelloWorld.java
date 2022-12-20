package com.lec.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet(description = "처음으로 만드는 서블릿", urlPatterns = { "/HelloWorld" })
//@WebServlet(urlPatterns = { "/HelloWorld" })
//@WebServlet({ "/HelloWorld", "/hello", "/xxx" })
//@WebServlet("/hello")
//localhost:8088/jsp04_servlet/hello
public class HelloWorld extends HttpServlet {


	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter(); 
		
		out.println("<!DOCTYPE html>");
		out.println("<head><title>현재시간</title></head>");
		out.println("<body>");
		
		out.println("<h1>안녕하세요? JSP/Servlet</h1>");
		out.println("<h2>doGet()메서드 호출!!!</h2>");
		out.println("<hr>");
		out.println("<h1>현재시간?</h1>");
		out.println("<h3>" + new Date() + "</h3>");
				
		out.println("</body>");
	    out.println("</html>");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doGet(req, res);
	}

}
