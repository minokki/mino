package com.lec.board.service;

import java.sql.Connection;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
import com.lec.db.JDBCUtility;

public class BoardDetailService {

	public BoardBean getBoard(int board_num) {
		
		BoardBean board = null;
		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int updateCount = boardDAO.updateReadCount(board_num);
		if(updateCount>0) JDBCUtility.commit(conn); else JDBCUtility.rollback(conn);
		board = boardDAO.selectBoard(board_num);
		JDBCUtility.close(conn, null, null);
		return board;
	}

}
