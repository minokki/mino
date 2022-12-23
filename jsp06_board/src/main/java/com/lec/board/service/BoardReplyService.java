package com.lec.board.service;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
import com.lec.db.JDBCUtility;

public class BoardReplyService {

	public boolean replyBoard(BoardBean board) {
		
		boolean isReplySuccess = false;

		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);				
		int insertCount = boardDAO.insertReplyBoard(board);
		
		if(insertCount>0) {
			JDBCUtility.commit(conn);
			JDBCUtility.close(conn, null, null);	
			isReplySuccess = true;
		} else {
			JDBCUtility.rollback(conn);
		}
		return isReplySuccess;
	}
	
}
