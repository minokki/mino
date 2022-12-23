package com.lec.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardDeleteService;
import com.lec.board.vo.ActionFoward;

public class BoardDeleteAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ActionFoward forward = null;
		boolean isDeleteSuccess = false;
		
		int board_num = Integer.parseInt(req.getParameter("board_num"));
		String p = req.getParameter("p");
		String f = req.getParameter("f");
		String q = req.getParameter("q");
		
		BoardDeleteService boardDeleteService = new BoardDeleteService();
		boolean isWriter = boardDeleteService.isBoardWriter(board_num, req.getParameter("board_pass"));
		
		if(isWriter) {
			isDeleteSuccess = boardDeleteService.deleteBoard(board_num);
			
			if(isDeleteSuccess) {
				forward = new ActionFoward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?p=" + p + "&f=" + f + "&q=" + q);
			} else {
				res.setContentType("text/html; charset=UTF-8" );
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println("   alert('게시글 삭제에 실패했습니다!!')");
				out.println("   history.back();");
				out.println("</script>");				
			}
		} else {
			res.setContentType("text/html; charset=UTF-8" );
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("   alert('게시글을 삭제할 권한이 없습니다!!')");
			out.println("   history.back();");
			out.println("</script>");				
		}
		return forward;
	}
}
