package com.lec.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import com.lec.board.vo.BoardBean;
import com.lec.db.JDBCUtility;

public class BoardDAO {

	private BoardDAO() {}
	private static BoardDAO boardDAO;
	public static BoardDAO getInstance() { 
		if(boardDAO == null) boardDAO = new BoardDAO();
		return boardDAO; 
	}
	
	Connection conn = null;
	DataSource ds = null;
	
	// DB커넥션
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	// 글쓰기
	public int insertBoard(BoardBean board) {
		// System.out.println("===> insertBoard!!!" + board.toString());
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into board(board_num, board_name, board_pass, board_subject, board_content, "
			       + "            board_file, board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date) "
				   + "       values(?,?,?,?,?,?,?,?,?,?, now())";
		
		
		int insertCount = 0;
		int bno = 0;
		
		try {
			pstmt = conn.prepareStatement("select max(board_num) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) bno = rs.getInt(1) + 1; else bno = 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, board.getBoard_name());
			pstmt.setString(3, board.getBoard_pass());
			pstmt.setString(4, board.getBoard_subject());
			pstmt.setString(5, board.getBoard_content());
			pstmt.setString(6, board.getBoard_file());
			pstmt.setInt(7, bno);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 등록 실패!!! : " + e.getMessage());
		} finally {
			JDBCUtility.close(null, pstmt, rs);
		}
		return insertCount;
	}

	// 글갯수
	// 글목록조회
	// 글 조회수 증가
	// 글 내용보기
	// 글 수정하기
	// 글 삭제하기
	// 댓글 쓰기
	
}
