package com.lec.jdbc.vo;

public class PageInfo {

	private int currentPage;
	private int totalPages;
	private int startPage;
	private int endPage;
	private int totalCount;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", totalPages=" + totalPages + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", totalCount=" + totalCount + "]";
	}	
}
