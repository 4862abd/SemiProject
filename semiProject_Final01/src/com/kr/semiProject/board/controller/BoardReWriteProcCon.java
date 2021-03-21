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
import com.kr.semiProject.user.model.UserDAOImpl;


@WebServlet("/boardReWriteProcCon.do")
public class BoardReWriteProcCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		
		// 게시글 bean 생성 후 들어갈 값 구하기
		BoardVO bean= new BoardVO();
		bean.setWrite(request.getParameter("write"));
		bean.setSubject(request.getParameter("subject"));
		bean.setEmail(request.getParameter("email"));
		String pass = request.getParameter("password");
		bean.setPassword(pass);
		
		// 글 작성, 수정에 필요한 세션가져오기
		HttpSession session = request.getSession();
		String realPass = (String) session.getAttribute("password");
		String realId = (String) session.getAttribute("id");

		// 사용자의 권한(일반, 관리자)을 확인하기
		UserDAOImpl userDAO = new UserDAOImpl();
		int realRole = userDAO.checkRole(realId);
		
		// 본인인지 확인 및 권한에 따른 답변 권한 부여
		if(pass.equals(realPass) || realRole == 1) {
			bean.setContent(request.getParameter("content"));
			
			bean.setRef(Integer.parseInt(request.getParameter("ref")));
			bean.setRe_stop(Integer.parseInt(request.getParameter("re_stop")));
			bean.setRe_level(Integer.parseInt(request.getParameter("re_level")));
			
			//데이터 베이스 객체 생성
			BoardDAO bdao = new BoardDAO();
			bdao.reWriteBoard(bean);
			
			RequestDispatcher dis = request.getRequestDispatcher("boardListCon.do");
			dis.forward(request ,response);
		}else {						// 비밀번호가 다르거나 회원 코드가 1(의사)가 아닌 경우
			RequestDispatcher dis = request.getRequestDispatcher("BoardFailed.jsp");
			dis.forward(request ,response);
		}
	}

}
