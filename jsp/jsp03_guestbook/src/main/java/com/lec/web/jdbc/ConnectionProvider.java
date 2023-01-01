package com.lec.web.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// ConnectionProvider 커넥션풀 중에 비어있고 사용가능한 커넥션 하나를 호출한다.
public class ConnectionProvider {

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:apache:commons:dbcp:guestbook");
	}
}
