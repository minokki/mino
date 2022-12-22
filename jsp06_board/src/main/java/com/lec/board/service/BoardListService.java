package com.lec.board.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.lec.board.dao.BoardDAO;
import com.lec.board.vo.BoardBean;
import com.lec.db.JDBCUtility;

public class BoardListService {

	public int getListCount(String f, String q) {
				
		int listCount = 0;
		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		listCount = boardDAO.selectListCount(f, q);
		JDBCUtility.close(conn, null, null);
		return listCount;
	}
	
	public ArrayList<BoardBean> getBoardList(int p, int limit, String f, String q) {
		
		ArrayList<BoardBean> boardList = null; 
		Connection conn = JDBCUtility.getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		boardList = boardDAO.selectBoardList(p, limit, f, q);
		JDBCUtility.close(conn, null, null);
		return boardList;
	}
}