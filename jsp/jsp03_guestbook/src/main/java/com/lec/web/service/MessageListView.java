package com.lec.web.service;

import java.util.List;

import com.lec.web.model.Message;

public class MessageListView {
	// 1. Java Beans or (VO, DTO)
	private List<Message> messageList;
	
	// 2. 페이징
	private int totalCount;     // 전체레코드수
	private int currentPage;    // 현재페이지
	private int perPage;        // 한 페이지당 출력할 레코드 건수
	private int start;          // 시작 레코드
	private int end;            // 종료 레코드
	private int pageTotalCount; // 총페이지수 = totalCount / perPage	
	
	// 3. 생성자	
	public MessageListView(List<Message> messageList, int totalCount, int currentPage, int perPage,
			int start, int end) {

		super();
		this.messageList = messageList;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.perPage = perPage;
		this.start = start;
		this.end = end;
		calculateTotalCount();
	}
	
	// setter
	private void calculateTotalCount() {
		
		if(totalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = totalCount / perPage;
			if(totalCount % perPage > 0) pageTotalCount++;
		}
		
	}

	public boolean isEmpty() {
		return totalCount == 0;
	}

	// getter
	public List<Message> getMessageList() {
		return messageList;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}
}

