package com.kr.semiProject.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kr.semiProject.user.model.UserDAOImpl;
import com.kr.semiProject.user.model.UserVO;



@WebServlet("/userInsUpdateCon.do")
public class UserInsUpdateCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		
		
		//해당 아이디
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		//String userid = "${sessionScope.id}";
		//데이터 베이스에서 아이디에 대한 모든 정보를 호출
		UserDAOImpl udao = new UserDAOImpl();
		UserVO bean = udao.getUser(userId);

		request.setAttribute("bean", bean);//무슨뜻
		
		RequestDispatcher dis = request.getRequestDispatcher("userInsUpdate.jsp");
		dis.forward(request ,response);
	}
	
}
