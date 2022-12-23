package com.lec.board.vo;

public class ActionFoward {
	
	private boolean isRedirect = false;
	private String path = null; // 다음으로 이동할 화면
	
	public boolean isRedirect() {
		return isRedirect;
	}
	
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	public String getPath() {
		return path;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
}



// 페이지 이동을 처리하기 위한 클래스
