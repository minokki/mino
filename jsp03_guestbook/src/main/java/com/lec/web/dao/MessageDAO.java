package com.lec.web.dao;

public class MessageDAO {
	//singleton
	
	private MessageDAO() {};
	private static MessageDAO messageDAO=new MessageDAO();
	public static MessageDAO getInstance() {return messageDAO;}	
	
	
	public void selectList() {}
	public void makeMessage() {}
	public void selectCount() {}
	public void insert() {}
	public void select() {}
	public void update() {}
	public void delete() {}
}
