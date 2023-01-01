package com.lec.board.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.board.service.BoardModifyService;
import com.lec.board.vo.ActionFoward;
import com.lec.board.vo.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardModifyAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// System.out.println("===> 글 수정하기");
		
		ActionFoward forward = null;
		BoardBean board = null;
		
		String saveFolder = "C:\\Users\\ezen\\Desktop\\mh_db\\99.temp\\";
		int fileSize = 1024*1024*5;
		
		ServletContext sct = req.getServletContext();
		MultipartRequest multi = new MultipartRequest(req, saveFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
		boolean isModifySuccess = false;
		String field = "";
		String query = "";
		
		int board_num = Integer.parseInt(multi.getParameter("board_num"));
		String p = req.getParameter("p");
		String f = req.getParameter("f");
		String q = URLEncoder.encode(req.getParameter("q"));
		String pass = multi.getParameter("board_pass");
		
		board = new BoardBean();
		BoardModifyService boardModifyService = new BoardModifyService();
		boolean isWriter = boardModifyService.isBoardWriter(board_num, pass);
		
		if(isWriter) {
			board.setBoard_num(board_num);
			board.setBoard_subject(multi.getParameter("board_subject"));
			board.setBoard_content(multi.getParameter("board_content"));
			board.setBoard_file(multi.getParameter("board_file"));
			isModifySuccess = boardModifyService.modifyBoard(board);
			
			if(isModifySuccess) {
				forward = new ActionFoward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?p=" + p + "&f=" + f + "&q=" + q);
			} else {
				res.setContentType("text/html; charset=UTF-8" );
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println("   alert('게시글 수정이 실패했습니다!!')");
				out.println("   history.back();");
				out.println("</script>");
			}
		} else {
			res.setContentType("text/html; charset=UTF-8" );
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("   alert('게시글을 수정할 권한이 없습니다!!')");
			out.println("   history.back();");
			out.println("</script>");			
		}
		return forward;
	}

}

















