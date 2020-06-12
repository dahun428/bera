package com.br.utils;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 데이터베이스와의 연결을 담당하는 Connection객체를 제공하는 유틸리티 클래스
 * 
 * @author naru057
 *
 */
public class ConnectionUtil {
	/**
	 * 클래스 로딩시 JDBC드라이버를 JVM의 드라이버 레지스트리에등록한다.
	 */
	static {
		try {
			String driver = "oracle.jdbc.OracleDriver";
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	/**
	 * 
	 * @return DB연결, SQL전송에 필요한 Connection객체
	 * @throws SQLException 데이터베이스 URL, 계정정보등이 올바르지 않은 경우 발생.
	 */
	public static Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@192.168.10.30:1521:ORCL";
		String user = "br";
		String password = "br";
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
	
	public static void close(Connection connection, PreparedStatement pstmt, ResultSet rs) throws SQLException{
		if(!connection.isClosed()) {
		connection.close();
		}
		if(!pstmt.isClosed()) {
			pstmt.close();
		}
		if(rs != null && !rs.isClosed()) {
			rs.close();
		}
	}
	public static void close(Connection connection, PreparedStatement pstmt) throws SQLException{
		close(connection, pstmt, null);
	}
}
