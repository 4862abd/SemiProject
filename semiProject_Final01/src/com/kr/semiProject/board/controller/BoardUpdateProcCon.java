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


@WebServlet("/boardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {
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

		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("password");
		if(password == null) {
			RequestDispatcher dis = request.getRequestDispatcher("boardListCon.do");
		}else {
			String pass = request.getParameter("pass");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			//password값과 pass값을 비교 해야합니다
			if(password.equals(pass)) {//패스워가 같다면 데이터를 수정
				BoardDAO bdao = new BoardDAO();
				bdao.updateBoard(num,subject,content);
				
				//수정이 완료 되었다면 전체 게시글 보기로 이동 
				request.setAttribute("msg","수정이 완료 되었습니다");
				
				RequestDispatcher dis = request.getRequestDispatcher("boardListCon.do");
				dis.forward(request ,response);
			}else {
				//비밀번호가 틀렸다면 이전 페이지로 이동
				request.setAttribute("msg","수정시 비밀번호가 맞지 않습니다");
				RequestDispatcher dis = request.getRequestDispatcher("BoardFailed.jsp");
				dis.forward(request ,response);
			}
		}
	}
}
