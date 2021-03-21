package com.kr.semiProject.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kr.semiProject.user.model.UserDAOImpl;

@WebServlet("/userInsUpdateProcCon.do")
public class UserInsUpdateProcCon extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();
		
		String userId = request.getParameter("userid_hidden");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
		String userBirth = request.getParameter("userBirth");
		String userPhone = request.getParameter("userPhone");
		String userAddr = request.getParameter("userAddr");
		String userEmail = request.getParameter("userEmail");
		
		
		//데이터 베이스에서 하나의 게시글에 대한 정보를 리턴 메소드 호출 
		UserDAOImpl udao = new UserDAOImpl();
		
		
		int a = udao.doUserUpdate(userId,userPw,userName,userGender,userBirth, userPhone, userAddr, userEmail);
		//request.setAttribute("a", a);
		
		//String path = "userInsUpdateCon.do?userId="+userId; 
		
		//수정이 완료 되었다면 메인페이지로 이동 
		if(a == 1) {
			script.println("<script>");
			script.println("alert('회원 정보 수정이 완료되었습니다!');");
			script.println("location.href='/semiProject_Final/main.jsp'");
			script.println("</script>");
		}else {
			script.println("<script>");
			script.println("alert('회원 정보 수정에 실패했습니다!');");
			script.println("alert('다시 확인하여 기입 해주세요.');");
			script.println("history.back();");
			script.println("</script>");
		}

		//RequestDispatcher dis = request.getRequestDispatcher(path);
		//dis.forward(request ,response);
	}

}
