package com.lec.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
	JNDI(Java Naming and Directory Interface)
	
	디렉토리서비스에서 제공하는 데이터 및 객체를 검색하기위하 API이다.
	즉, 쉽게 이야기하면 외부에 있는 객체를 내부로 가져오기 위한 기법이다.
	
	tomcat서버와 같은 WAS는 특정폴더에 데이터소스(라이브러리)등을 사용하기
	위해서 JNDI기술을 이용해서 정보를 가져오는 기법을 말한다.
*/
public class JDBCUtility {

	public static Connection getConnection() {

		Connection conn = null;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/Board");
			conn = ds.getConnection();
			conn.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			// dummy
		}
	}
	
	public static void commit(Connection conn) {
		try { if(conn != null) conn.commit(); } catch (Exception e) {}
	}
	
	public static void rollback(Connection conn) {
		try { if(conn != null) conn.rollback(); } catch (Exception e) {}
	}
}
