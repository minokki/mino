package com.lec.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.action.Action;
import com.lec.board.action.BoardWriteAction;
import com.lec.board.vo.ActionFoward;

@WebServlet("*.bo")
public class BoardController extends HttpServlet{

	Action action = null;
	ActionFoward forward = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doProcess(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, res);
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {		
		
		req.setCharacterEncoding("utf-8");
		
		String p = req.getParameter("p");
		String f = req.getParameter("f");
		String q = req.getParameter("q");
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		// http://localhost:8088/jsp06_board/boardWriteForm.bo
		// System.out.println(requestURI + "\n" + contextPath + "\n" + command);
		
		if(command.equals("/boardWriteForm.bo")) {
			forward = new ActionFoward();
			forward.setPath("/board/board_write.jsp?p=" + p + "&f=" + f + "&q=" + q);
		} else if(command.equals("/boardWrite.bo")) {
			action = new BoardWriteAction();
			try { action.execute(req, res); } catch (Exception e) { e.printStackTrace(); }
			
			
			
			
			
			
			
			
			
			
		} else if(command.equals("/boardList.bo")) {
			System.out.println("글목록");
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				res.sendRedirect(forward.getPath());
			} else {				
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, res);
			}
		}
	}

}










