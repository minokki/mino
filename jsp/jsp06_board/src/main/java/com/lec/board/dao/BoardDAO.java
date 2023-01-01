package com.lec.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

	// 글갯수구하기
	// select count(*) from board where board_title = '검색어';
	public int selectListCount(String f, String q) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select count(*) from board where " + f + " like ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + q + "%");
			rs = pstmt.executeQuery();
			if(rs.next()) listCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtility.close(null, pstmt, rs);
		}
		return listCount;
	}

	// 글목록조회
	// select * from board order by board_num desc limit 0, 10
	//  wehre board_name ='홍길동';
	public ArrayList<BoardBean> selectBoardList(int p, int limit, String f, String q) {
		
		ArrayList<BoardBean> boardList = new ArrayList<>();
		BoardBean board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where " + f + " like ? " 
		           + "  order by board_re_ref desc, board_re_seq asc limit ?, " + limit;
		int startRow = (p-1) * limit;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + q + "%");
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new BoardBean();
				board.setBoard_num(rs.getInt("board_num"));
				board.setBoard_name(rs.getString("board_name"));
				board.setBoard_subject(rs.getString("board_subject"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_file(rs.getString("board_file"));
				board.setBoard_re_ref(rs.getInt("board_re_ref"));
				board.setBoard_re_lev(rs.getInt("board_re_lev"));
				board.setBoard_re_seq(rs.getInt("board_re_seq"));
				board.setBoard_readcount(rs.getInt("board_readcount"));
				board.setBoard_date(rs.getDate("board_date"));
				boardList.add(board);
			}
		} catch (Exception e) {
			System.out.println("게시글 조회 실패!! : " + e.getMessage());
		} finally {
			JDBCUtility.close(null, pstmt, rs);
		}
		return boardList;
	}

	// 글 조회수 증가
	public int updateReadCount(int board_num) {

		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		String sql = "update board set board_readcount = board_readcount + 1 "
				   + " where board_num = " + board_num;
		
		try {
			pstmt = conn.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 조회수 업데이트 실패!!! : " + e.getMessage());
		} finally {
			JDBCUtility.close(null, pstmt, null);
		}		
		return updateCount;
	}

	// 글 내용보기
	public BoardBean selectBoard(int board_num) {
		// select * from board where board_num = 1;
		
		BoardBean board = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where board_num = " + board_num;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardBean();
				board.setBoard_num(rs.getInt("board_num"));
				board.setBoard_name(rs.getString("board_name"));
				board.setBoard_subject(rs.getString("board_subject"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_file(rs.getString("board_file"));
				board.setBoard_re_ref(rs.getInt("board_re_ref"));
				board.setBoard_re_lev(rs.getInt("board_re_lev"));
				board.setBoard_re_seq(rs.getInt("board_re_seq"));
				board.setBoard_readcount(rs.getInt("board_readcount"));
				board.setBoard_date(rs.getDate("board_date"));				
			}
		} catch (Exception e) {
			System.out.println("게시글 조회 실패!! : " + e.getMessage());
		} finally {
			JDBCUtility.close(null, pstmt, rs);
		}
		return board;
	}
	
	// 글작성자확인
	public boolean isBoardWriter(int board_num, String pass) {
		
		boolean isWriter = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where board_num = " + board_num;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			if(pass.equals(rs.getString("board_pass"))) isWriter = true;
		} catch (Exception e) {
			System.out.println("글 작성자의 비밀번호가 틀립니다. 다시 입력하세요!! " + e.getMessage());
		} finally {
			JDBCUtility.close(null, pstmt, rs);
		}
		return isWriter;
	}

	// 글 수정하기
	public int updateBoard(BoardBean board) {
		
		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		String sql = "update board set board_subject=?, board_content=?, board_file=? "
				   + " where board_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBoard_subject());
			pstmt.setString(2, board.getBoard_content());
			pstmt.setString(3, board.getBoard_file());
			pstmt.setInt(4, board.getBoard_num());
			updateCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 수정이 실패했습니다!! " + e.getMessage());
		} finally {
			JDBCUtility.close(null, pstmt, null);
		}
		return updateCount;
	}

	// 글 삭제하기
	public int deleteBoard(int board_num) {
		
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
		String sql = "delete from board where board_num = " + board_num;
		
		try {
			pstmt = conn.prepareStatement(sql);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 삭제에 실패 했습니다!! : " + e.getMessage());
		} finally {
			JDBCUtility.close(null, pstmt, null);
		}
		return deleteCount;
	}

	// 댓글 쓰기
	public int insertReplyBoard(BoardBean board) {
		
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update board set board_re_seq = board_re_seq + 1 "
				   + " where board_re_ref = ? and board_re_seq > ?";
		
		int num = 0;
		int re_ref = board.getBoard_re_ref();
		int re_lev = board.getBoard_re_lev();
		int re_seq = board.getBoard_re_seq();
		
		try {
			pstmt = conn.prepareStatement("select max(board_num) from board");
			rs = pstmt.executeQuery();
			if(rs.next()) num = rs.getInt(1) + 1; else num = 1;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			int updateCount = pstmt.executeUpdate();
			if(updateCount>0) JDBCUtility.commit(conn);
			
			// 댓글등록
			re_lev += 1;
			re_seq += 1;
			sql = "insert into board(board_num, board_name, board_pass, board_subject, board_content, "
				       + "            board_file, board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date) "
					   + "       values(?,?,?,?,?,?,?,?,?,?, now())";	
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBoard_name());
			pstmt.setString(3, board.getBoard_pass());
			pstmt.setString(4, board.getBoard_subject());
			pstmt.setString(5, board.getBoard_content());
			pstmt.setString(6, "");
			pstmt.setInt(7, re_ref);
			pstmt.setInt(8, re_lev);
			pstmt.setInt(9, re_seq);
			pstmt.setInt(10, 0);
			insertCount = pstmt.executeUpdate();			
		} catch (Exception e) {
			System.out.println("댓글쓰기 실패!! : " + e.getMessage());
		} finally {
			JDBCUtility.close(null, pstmt, rs);
		}
		return insertCount;
	}

	
}














