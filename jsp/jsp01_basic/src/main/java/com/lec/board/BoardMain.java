package com.lec.board;

import java.util.ArrayList;

public class BoardMain {

	public static void main(String[] args) {
		
		BoardList bl = new BoardList();
		ArrayList<Board> board_list = bl.getBoardList();
		
		for(Board board:board_list) {
			System.out.println(board.toString());
		}
	}
}
