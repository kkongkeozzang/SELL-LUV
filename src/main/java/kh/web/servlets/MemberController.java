package kh.web.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.web.dao.CompanyDAO;
import kh.web.dao.InfluencerDAO;
import kh.web.dto.CompanyDTO;
import kh.web.dto.InfluencerDTO;
import kh.web.web.SHA512;


@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8");  // get방식 한글 깨짐 방지

		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length());
		System.out.println("사용자가 요청한 기능 : " + cmd);		

		InfluencerDAO influencerDAO = new InfluencerDAO();
		CompanyDAO companyDAO = new CompanyDAO();
		
		SHA512 sha512 = new SHA512();
		
		try {
			if(cmd.equals("/influencerLogin.mem")) { //인플루언서 로그인 부분...
				
				String id = request.getParameter("id_if");
				String pw = sha512.generate(request.getParameter("pw_if"));
				
				boolean result = influencerDAO.login(id, pw);
				int result2 = influencerDAO.findSeq(id,pw);
				String seq = String.valueOf(result2);
				
				System.out.println(id+pw+seq);
				
				if(result) {
					
					HttpSession session = request.getSession();
					session.setAttribute("loginID", id);
					session.setAttribute("IDseq", seq);
					
					System.out.println("logged in!");
		
					response.sendRedirect("/index.jsp");
					
				}else if(!result) {
					
					String errorMessage = "정확한 정보를 입력하세요..";

					request.setAttribute("errorMessage", errorMessage);
					RequestDispatcher rd =request.getRequestDispatcher("/resources/login/login.jsp");  
					rd.forward(request, response);
				}





			}else if(cmd.equals("/companyLogin.mem")) { //기업 로그인 부분...

				String id = request.getParameter("id_cp");
				String pw = sha512.generate(request.getParameter("pw_cp"));

				boolean result = companyDAO.login(id, pw);

				String idResult = String.valueOf(result);
	
				int result2 = companyDAO.findSeq(id,pw);
				String seq = String.valueOf(result2);
				
				System.out.println(id+pw+"   "+seq);

				if(result) {
					HttpSession session = request.getSession();
					session.setAttribute("loginID", id);
					session.setAttribute("IDseq", seq);
					System.out.println( id + " " + seq + "logged in!");
					response.sendRedirect("/index.jsp");

				}else if(!result) {
					System.out.println( id+ "로그인실패..");
					String errorMessage = "정확한 정보를 입력하세요..";

					request.setAttribute("errorMessage", errorMessage);
					RequestDispatcher rd =request.getRequestDispatcher("/resources/login/login.jsp");  
					rd.forward(request, response);
					

					

				}


			}else if(cmd.equals("/logout.mem")) {
				request.getSession().removeAttribute("loginID");
				response.sendRedirect("/index.jsp");
				
			}else if(cmd.equals("/loginCheck.mem")) {

				response.sendRedirect("/index.jsp");

			// 로그인 페이지로 이동	
			}else if(cmd.equals("/login.mem")) {
				response.sendRedirect("/resources/login/login.jsp");
			}else if(cmd.equals("/CPSubmit.mem")) {

				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String photo = request.getParameter("photo");
				String name = request.getParameter("name");
				String crunumber = request.getParameter("crunumber");
				String zipcode = request.getParameter("zipcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				String rpt_cp = request.getParameter("rpt_cp");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String sales = request.getParameter("sales");
				String grade = request.getParameter("grade");
				String pwAsk = request.getParameter("pwAsk");
				String pwAnswer = request.getParameter("pwAnswer");

				int result = companyDAO.insert(id, sha512.generate(pw), photo, name, crunumber, zipcode, address1, address2, rpt_cp, phone, email, sales, grade, pwAsk, pwAnswer);

				response.sendRedirect("/resources/login/login.jsp");
				
			}else if(cmd.equals("/CPidCheck.mem")) {

				String id = request.getParameter("id");
				boolean result = companyDAO.isIdExist(id);
				response.getWriter().append(String.valueOf(result));
			// 비밀번호 찾기 이동
			}else if(cmd.equals("/findpw.mem")) {
				response.sendRedirect("/resources/login/findpw.jsp");
			// 기업멤버 맞는지 확인
			}else if(cmd.equals("/isCPMember.mem")) {
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String text = request.getParameter("text");
				String answer = request.getParameter("answer");
				boolean result = companyDAO.isMember(id, name, text, answer);
				response.getWriter().append(""+result);
			// 기업 비밀번호 찾기 
			}else if(cmd.equals("/companyFindpw.mem")) {
				String id = request.getParameter("id_cp");
				String name = request.getParameter("name_cp");
				String text = request.getParameter("check-text-cp");
				String answer = request.getParameter("answer-cp");
				CompanyDTO dto = companyDAO.findMember(id, name, text, answer);
				System.out.println("회원 정보 검색 결과 : "+ dto.getId());
				request.setAttribute("cpdto", dto);
				request.getRequestDispatcher("/resources/login/findcppwDetail.jsp").forward(request, response);
			// 기업 비밀번호 재설정 	
			}else if(cmd.equals("/resetCPpw.mem")) {
				String pw = sha512.generate(request.getParameter("pw_cp"));
				String id = request.getParameter("id");
				System.out.println(id + "의 재설정한 비밀번호 : "+pw);
				int result = companyDAO.updateNewPW(id, pw);
				System.out.println("비밀번호 재설정 결과 : "+result);
				response.sendRedirect("/resources/login/login.jsp");
			// 인플루언서멤버 맞는지 확인
			}else if(cmd.equals("/isIFMember.mem")) {
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String text = request.getParameter("text");
				String answer = request.getParameter("answer");
				boolean result = influencerDAO.isMember(id, name, text, answer);
				response.getWriter().append(""+result);
			// 인플루언서 비밀번호 찾기
			}else if(cmd.equals("/influencerFindpw.mem")) {
				String id = request.getParameter("id_if");
				String name = request.getParameter("name_if");
				String text = request.getParameter("check-text-if");
				String answer = request.getParameter("answer-if");
				InfluencerDTO dto = influencerDAO.findMember(id, name, text, answer);
				System.out.println("회원 정보 검색 결과 : "+ dto.getId());
				request.setAttribute("ifdto", dto);
				request.getRequestDispatcher("/resources/login/findifpwDetail.jsp").forward(request, response);
			// 인플루언서 비밀번호 재설정
			}else if(cmd.equals("/resetIFpw.mem")) {
				String pw = sha512.generate(request.getParameter("pw_if"));
				String id = request.getParameter("id");
				System.out.println(id + "의 재설정한 비밀번호 : "+pw);
				int result = influencerDAO.updateNewPW(id, pw);
				System.out.println("비밀번호 재설정 결과 : "+result);
				response.sendRedirect("/resources/login/login.jsp");
			// 아이디 찾기 이동
			}else if(cmd.equals("/findid.mem")) {
				response.sendRedirect("/resources/login/findid.jsp");
			// 기업 아이디 맞는지 확인	
			}else if(cmd.equals("/isCPidExist.mem")) {
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				String text = request.getParameter("text");
				String answer = request.getParameter("answer");
				CompanyDTO dto = companyDAO.findId(email, name, text, answer);
				System.out.println("기업 아이디는 : " + dto.getId());
				response.getWriter().append(dto.getId());
			// 인플루언서 아이디 맞는지 확인
			}else if(cmd.equals("/isIFidExist.mem")) {
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				String text = request.getParameter("text");
				String answer = request.getParameter("answer");
				System.out.println(email+":"+name+":"+text+":"+answer);
				InfluencerDTO dto = influencerDAO.findId(email, name, text, answer);
				System.out.println("인플루언서 아이디는 : " + dto.getId());
				response.getWriter().append(dto.getId());
			}else if(cmd.equals("/IFSubmit.mem")) {

				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String photo = request.getParameter("photo");
				String name = request.getParameter("name");
				String nickName = request.getParameter("nickName");
				String zipcode = request.getParameter("zipcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				String sns = request.getParameter("sns");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String grade = request.getParameter("grade");
				String pwAsk = request.getParameter("pwAsk");
				String pwAnswer = request.getParameter("pwAnswer");
				
				String favorite1 = request.getParameter("favorite1");
				String favorite2 = request.getParameter("favorite2");
				String favorite3 = request.getParameter("favorite3");
				String favorite4 = request.getParameter("favorite4");

				int result = influencerDAO.insert(id, sha512.generate(pw), photo, name, nickName, zipcode, address1, address2, sns, phone, email, grade, pwAsk, pwAnswer, favorite1 +":"+ favorite2 +":"+ favorite3 +":"+ favorite4);

				response.sendRedirect("/resources/login/login.jsp");
				
			}else if(cmd.equals("/IFidCheck.mem")) {

				String id = request.getParameter("id");
				boolean result = influencerDAO.isIdExist(id);
				response.getWriter().append(String.valueOf(result));
			
			}else if(cmd.equals("/IFnickCheck.mem")) {

				String nickName = request.getParameter("nickName");
				boolean result = influencerDAO.nickNameExist(nickName);
				response.getWriter().append(String.valueOf(result));
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}



	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
