package com.lec.board.service;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
import com.lec.db.JDBCUtility;

public class BoardWriteService {

	public boolean registerBoard(BoardBean board) {
		
		boolean isWriteSuccess = false;
		// System.out.println("글쓰기 서비스 ==> " + board.toString());
		
		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int insertCount = boardDAO.insertBoard(board);
		
		if(insertCount>0) {
			JDBCUtility.commit(conn);
			JDBCUtility.close(conn, null, null);
			isWriteSuccess = true;
		} else {
			JDBCUtility.rollback(conn);
		}
		return isWriteSuccess;
	}
}
