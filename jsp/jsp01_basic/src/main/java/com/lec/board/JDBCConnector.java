package com.lec.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCConnector {

	public static Connection getConnection() {
		
		String DRV = "oracle.jdbc.OracleDriver";
		String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		String USR = "scott";
		String PWD = "tiger";
		
		try {
			Class.forName(DRV);
			return DriverManager.getConnection(URL, USR, PWD);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
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
}
