package com.lec.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardReplyService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;

public class BoardReplyAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ActionFoward forward = null;
		BoardBean board = new BoardBean();
		
		String p = req.getParameter("p");
		board.setBoard_num(Integer.parseInt(req.getParameter("p")));
		board.setBoard_name(req.getParameter("board_name"));
		board.setBoard_pass(req.getParameter("board_pass"));
		board.setBoard_subject(req.getParameter("board_subject"));
		board.setBoard_content(req.getParameter("board_content"));
		board.setBoard_re_ref(Integer.parseInt(req.getParameter("board_re_ref")));
		board.setBoard_re_lev(Integer.parseInt(req.getParameter("board_re_lev")));
		board.setBoard_re_seq(Integer.parseInt(req.getParameter("board_re_seq")));
	
		BoardReplyService boardReplyService = new BoardReplyService();
		boolean isReplySuccess = boardReplyService.replyBoard(board);
		
		if(isReplySuccess) {
			forward = new ActionFoward();
			forward.setRedirect(true);			
			forward.setPath("boardList.bo?p=" + p);
		} else {
			res.setContentType("text/html; charset=UTF-8" );
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("   alert('댓글 쓰기에 실패했습니다!!')");
			out.println("   history.back();");
			out.println("</script>");			
		}
		return forward;
	}
}
