package com.lec.web.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

// 기본 설정을 해주는 함수를 구축

public class JDBCUtil {

	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			// dummy
		}
	}
	
	public static void rollback(Connection conn) {
		try { 
			if(conn != null) conn.rollback(); 
		} catch (Exception e) {
			// dummy			
		}
	}
}