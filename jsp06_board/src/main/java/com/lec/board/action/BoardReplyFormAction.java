package com.lec.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.action.Action;
import com.lec.board.service.BoardDetailService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;

public class BoardReplyFormAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ActionFoward forward = new ActionFoward();
		
		int board_num = Integer.parseInt(req.getParameter("board_num"));
		String p = req.getParameter("p");
		
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean board = boardDetailService.getBoard(board_num);
		req.setAttribute("p", p);
		req.setAttribute("board", board);
		forward.setPath("/board/board_reply.jsp");
		return forward;
	}

}
