package com.lec.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardDetailService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;

public class BoardDetailAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		int board_num = Integer.parseInt(req.getParameter("board_num"));
		String p = req.getParameter("p");
		String f = req.getParameter("f");
		String q = req.getParameter("q");
		
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean board = boardDetailService.getBoard(board_num);
		
		ActionFoward forward = new ActionFoward();
		req.setAttribute("board", board);
		forward.setPath("/board/board_detail.jsp?p=" + p + "&f=" + f + "&q=" + q);
		return forward;
	}

}
