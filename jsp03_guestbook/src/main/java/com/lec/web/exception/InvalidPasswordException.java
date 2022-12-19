package com.lec.web.exception;

public class InvalidPasswordException extends ServiceException {
	
	public InvalidPasswordException(String msg) {
		super(msg);
	}
}