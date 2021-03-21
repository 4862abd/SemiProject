package com.kr.semiProject.book.model;

public interface BookDAO {
	public int insBook(
			String bookDate, String bookTime,
			String drName, String bookItem,
			String userId);
	
	public BookVO getBook(
			String bookDate, String bookTime,
			String drName);
	
	public BookVO getBookById(String userId);
	
	public int bookUpd(
			String bookDate, String bookTime,
			String drName, String bookItem,
			String userId);
}
