package com.lec.board.service;

import java.util.List;

import com.lec.board.vo.BoardVO;
import com.lec.board.vo.PageInfo;

public interface BoardService {

	void insertBoard(BoardVO board);
	void deleteBoard(int seq);
	void updateBoard(BoardVO board);
	BoardVO selectBoard(int seq);
	void cntBoard(int cnt);
	List<BoardVO> getBoardList(int currentPage,int perPage);
	PageInfo getPageInfo(int currentPage,int perPage);

	
	
}
