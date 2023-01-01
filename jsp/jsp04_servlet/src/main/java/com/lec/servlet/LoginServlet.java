package com.lec.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pw= req.getParameter("pw");
		String[] hobbies= req.getParameterValues("hobbies");
		String majors= req.getParameter("majors");
		String protocol= req.getParameter("protocol");
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=res.getWriter();
		
		writer.print("<html>");
		writer.print("<head><title>Login Servlet!!</title></head>");
		writer.print("<body>");
		writer.print("아이디=" + id + "<br>");
		writer.print("비밀번호=" + pw + "<br>");
		writer.print("취미=" + Arrays.toString(hobbies) + "<br>");
		writer.print("전공=" + majors + "<br>");
		writer.print("프로토콜=" + protocol + "<br>");
		writer.print("</body>");
		writer.print("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
	}
}
