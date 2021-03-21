package com.kr.semiProject.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kr.semiProject.book.model.BookDAOImpl;
import com.kr.semiProject.book.model.BookVO;

@WebServlet("/bookCheckCon.do")
public class BookCheckController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		bookCheck(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		bookCheck(request, response);
	}

	protected void bookCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// 세션으로 예약시 필요한 정보 구하기
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("id");
		
		// 사용할 bean 선언
		BookVO bookVO = null;
		
		// 로그인 되어 있지 않을 경우 로그인 페이지로 이동
		if(userId == null) {
			response.sendRedirect("/semiProject_Final/login.jsp");
		// 로그인 상태일 시 기존 예약 상태를 forward방식으로 보내줌
		}else {
			BookDAOImpl bookDAO = new BookDAOImpl();
			bookVO = new BookVO();
			bookVO = bookDAO.getBookById(userId);
			if(bookVO == null) {
				response.sendRedirect("/semiProject_Final/Book.jsp");
			}else {
				request.setAttribute("bookCheck", bookVO);
				RequestDispatcher dispatcher = request.getRequestDispatcher("BookCheck.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
