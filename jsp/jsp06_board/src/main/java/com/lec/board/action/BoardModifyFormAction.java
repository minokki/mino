package com.lec.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardDetailService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;

public class BoardModifyFormAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {


		
		ActionFoward forward = new ActionFoward();
		
		int board_num = Integer.parseInt(req.getParameter("board_num"));
		String p = (String) req.getParameter("p");
		String f = (String) req.getParameter("f");
		String q = (String) req.getParameter("q");
		
		
	
		
		BoardDetailService boardDetailService = new BoardDetailService();	
		BoardBean board = boardDetailService.getBoard(board_num);
		req.setAttribute("board", board);
		
		
		forward.setPath("/board/board_modify.jsp?p=" + p + "&f=" + f + "&q=" + q);
		return forward;
	}

}
