package com.kr.semiProject.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookDAOImpl implements BookDAO{

	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/pool01");
		return ds.getConnection();
	}
	
	@Override
	public int insBook(
			String bookDate, String bookTime,
			String drName, String bookItem,
			String userId) 
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO SEMI_BOOK VALUES(?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookDate);
			pstmt.setString(2, bookTime);
			pstmt.setString(3, drName);
			pstmt.setString(4, bookItem);
			pstmt.setString(5, userId);
			
			result = pstmt.executeUpdate();
			if(result == 1) {
				return 1;
			}else if(result == 0){
				return 0;
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return -1;
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -2;
	}

	@Override
	public BookVO getBook(
			String bookDate, String bookTime,
			String drName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BookVO bookVO = null;
		String query = "SELECT * FROM SEMI_BOOK WHERE BOOK_DATE=? AND BOOK_TIME=? AND DR_NAME=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookDate);
			pstmt.setString(2, bookTime);
			pstmt.setString(3, drName);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				bookVO = new BookVO();
				bookVO.setBookDate(rset.getString("BOOK_DATE"));
				bookVO.setBookTime(rset.getString("BOOK_TIME"));
				bookVO.setDrName(rset.getString("DR_NAME"));
				bookVO.setBookItem(rset.getString("BOOK_ITEM"));
				bookVO.setUserId(rset.getString("USER_ID"));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rset != null) rset.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return bookVO;
	}

	@Override
	public BookVO getBookById(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BookVO bookVO = null;
		String query = "SELECT * FROM SEMI_BOOK WHERE USER_ID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bookVO = new BookVO();
				bookVO.setBookDate(rset.getString("BOOK_DATE"));
				bookVO.setBookTime(rset.getString("BOOK_TIME"));
				bookVO.setDrName(rset.getString("DR_NAME"));
				bookVO.setBookItem(rset.getString("BOOK_ITEM"));
				bookVO.setUserId(rset.getString("USER_ID"));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rset != null) rset.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bookVO;
	}

	@Override
	public int bookUpd(
			String bookDate, String bookTime,
			String drName, String bookItem,
			String userId)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE SEMI_BOOK SET BOOK_DATE=?, BOOK_TIME=?,"
				+ " DR_NAME=?, BOOK_ITEM=? WHERE USER_ID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookDate);
			pstmt.setString(2, bookTime);
			pstmt.setString(3, drName);
			pstmt.setString(4, bookItem);
			pstmt.setString(5, userId);
			result = pstmt.executeUpdate();
			
			return result;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			
		}
		return -1;
	}

}
