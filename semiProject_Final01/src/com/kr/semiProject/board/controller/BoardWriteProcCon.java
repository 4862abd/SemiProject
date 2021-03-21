package com.kr.semiProject.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kr.semiProject.board.model.BoardDAO;
import com.kr.semiProject.board.model.BoardVO;

@WebServlet("/boardWriteProcCon.do")
public class BoardWriteProcCon extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		
		//빈클래스로 데이터를 읽어 드림
		BoardVO boardVO = new BoardVO();
		boardVO.setWrite(request.getParameter("write"));
		boardVO.setSubject(request.getParameter("subject"));
		
		HttpSession session = request.getSession();
		String password = (String)session.getAttribute("password");
		boardVO.setPassword(password);
		boardVO.setContent(request.getParameter("content"));

		//데이터 베이스 쪽으로 빈 클래스를 넘겨줌
		BoardDAO bdao = new BoardDAO();

		//데이터 저장 메소드를 호출
		bdao.insertBoard(boardVO);

		RequestDispatcher dispatcher = request.getRequestDispatcher("boardListCon.do");
		dispatcher.forward(request ,response);
	}
}
