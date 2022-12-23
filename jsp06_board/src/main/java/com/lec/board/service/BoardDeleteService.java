package com.lec.board.service;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.db.JDBCUtility;

public class BoardDeleteService {

	public boolean isBoardWriter(int board_num, String pass) {
		boolean isWriter = false;
		
		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		isWriter = boardDAO.isBoardWriter(board_num, pass);
		JDBCUtility.close(conn, null, null);
		return isWriter;
	}

	public boolean deleteBoard(int board_num) {
		
		boolean isDeleteSuccess = false;
		
		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int deleteCount = boardDAO.deleteBoard(board_num);
		
		if(deleteCount>0) {
			JDBCUtility.commit(conn);
			JDBCUtility.close(conn, null, null);
			isDeleteSuccess = true;
		} else {
			JDBCUtility.rollback(conn);
		}
		return isDeleteSuccess;
	}

}












