package com.kr.semiProject.book.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kr.semiProject.book.model.BookDAOImpl;

@WebServlet("/bookIns.do")
public class BookInsController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String date = request.getParameter("bookDate");
		String time = request.getParameter("bookTime");
		String drName = request.getParameter("drName");
		String item = request.getParameter("bookItem");
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		BookDAOImpl bookDAO = new BookDAOImpl();
		int result = bookDAO.insBook(date, time, drName, item, userId);
		request.setAttribute("result", result);
		
		if(userId == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('예약에 실패했습니다.');");
			script.println("alert('로그인이 필요한 서비스 입니다.');");
			script.println("location.href='/semiProject_Final/login.jsp';");
			script.println("</script>");
		}else if(result == 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('예약에 성공했습니다!');");
			script.println("alert('" + date + ", "
					+ time + "에 "
					+ drName +" 선생님과 뵙겠습니다.');");
			script.println("location.href='/semiProject_Final/main.jsp';");
			script.println("</script>");
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('예약에 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
		}
	}
}
