package kh.sellLuv.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.admin")
public class AdminController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		System.out.println(cmd);
		
		try {
			if(cmd.equals("/adminMain.admin")) { // 관리자 메인
				response.sendRedirect("/resources/admin/adminMain.jsp");
				
			}else if(cmd.equals("/adminCard.admin")) { // 관리자 카드 관리
				response.sendRedirect("/resources/admin/adminCard.jsp");
				
			}else if(cmd.equals("/adminBoard.admin")) { // 관리자 자유게시판 관리
				response.sendRedirect("/resources/admin/adminBoard.jsp");
				
			}else if(cmd.equals("/adminMember.admin")) { // 관리자 회원 관리
				response.sendRedirect("/resources/admin/adminMember.jsp");
				
			}else if(cmd.equals("/adminLogout.admin")) { // 메인으로
				request.getSession().removeAttribute("logInId"); //아이디 어트리뷰트 삭제
				response.sendRedirect("/index.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
