package com.kr.semiProject.book.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.kr.semiProject.book.model.BookDAOImpl;
import com.kr.semiProject.book.model.BookVO;

@WebServlet("/booksData.do")
public class BooksAjaxController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String bookDate = request.getParameter("uDate");
		String bookTime = request.getParameter("uTime");
		String drName = request.getParameter("uDr");
		
		BookDAOImpl bookDAO = new BookDAOImpl();
		BookVO bookVO = bookDAO.getBook(bookDate, bookTime, drName);
		
		JSONObject jsonData = new JSONObject();
		
		if(bookVO == null) {
			jsonData.put("bookDup", "okay");
		}else {
			jsonData.put("bookDup", "dup");
		}
		
		response.getWriter().append(jsonData.toJSONString());
	}
}
