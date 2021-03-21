package com.kr.semiProject.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kr.semiProject.board.model.BoardDAO;
import com.kr.semiProject.board.model.BoardVO;


@WebServlet("/boardInfoControl.do")
public class BoardInfoControl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num").trim());//공백 제거후 정수형으로 바뀜
		
		//데이터 베이스 접근
		BoardDAO bdao = new BoardDAO();
		
		//boardbean타입으로 하나의 게시글을 리턴
		BoardVO boardVO  = bdao.getOneBoard(num);
		
		request.setAttribute("bean", boardVO);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardInfo.jsp");
		dis.forward(request ,response);
	}

}
