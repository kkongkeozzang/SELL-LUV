package kh.web.servlets;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.web.dao.CompanyDAO;
import kh.web.dao.InfluencerDAO;
import kh.web.dto.Board_CpDTO;
import kh.web.dto.CompanyDTO;
import kh.web.dto.InfluencerDTO;
import kh.web.dto.Photo_ListDTO;
import kh.web.dto.Profile_IfDTO;
import kh.web.statics.IFCPStatics;


@WebServlet("*.ifcp")
public class IFCPController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf8");  // get방식 한글 깨짐 방지
		
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String cmd = uri.substring(ctx.length());
		System.out.println("사용자가 요청한 기능 : " + cmd);
		
		InfluencerDAO influencerDAO = new InfluencerDAO();
		CompanyDAO companyDAO = new CompanyDAO();
		
		try {
			//====================================================================================================================================
			//인플루언서 기본 목록 출력..
			if(cmd.equals("/influencerList.ifcp")) {
				
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				
				if(currentPage < 1) {currentPage = 1;}
				
				int start = currentPage * IFCPStatics.RECORD_COUNT_PER_PAGE- (IFCPStatics.RECORD_COUNT_PER_PAGE-1);;
				int end = currentPage * IFCPStatics.RECORD_COUNT_PER_PAGE;
				
				ArrayList<InfluencerDTO> list = influencerDAO.selectByBound(start,end);
				
				String navi = companyDAO.getPageNavi(currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("/resources/ifcp/list.jsp").forward(request, response);
				
				//인플루언서 목록 출력 끝..
				//====================================================================================================================================
				//기업기본 목록 출력...
			}else if(cmd.equals("/companyList.ifcp")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				
				if(currentPage < 1) {currentPage = 1;}

				
				int start = currentPage * IFCPStatics.RECORD_COUNT_PER_PAGE- (IFCPStatics.RECORD_COUNT_PER_PAGE-1);;
				int end = currentPage * IFCPStatics.RECORD_COUNT_PER_PAGE;
				
				ArrayList<CompanyDTO> list = companyDAO.selectByBound(start,end);
			
				String navi = companyDAO.getPageNavi(currentPage);
				
				String cp = "cp";
				
				request.setAttribute("cp", cp);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("/resources/ifcp/list.jsp").forward(request, response);
				//====================================================================================================================================
				//기업 목록 출력 끝..
				
				//====================================================================================================================================
				//등급별 조회..
			}else if(cmd.equals("/listSortByGrade.ifcp")){
				
				String object = request.getParameter("object");
				System.out.println(object);
				
				if(object.contains("Influencer")) {
					System.out.println("influencer");
					response.sendRedirect("/influencerList.ifcp?cpage=1");
				}else if(object.contains("Company")) {
					System.out.println("company");
					response.sendRedirect("/companyList.ifcp?cpage=1");
				}
				
				//====================================================================================================================================
				// 상세페이지 이동.
			}else if(cmd.equals("/searchDetail.ifcp")) {
				String object = request.getParameter("object");
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println(object);
				System.out.println(seq);
				
				if(object.contains("Influencer")) {
					System.out.println("influencer");
					
					List<Profile_IfDTO> list = influencerDAO.ifCardSearch(seq);

					request.setAttribute("ifList", list);
					request.getRequestDispatcher("/resources/ifcp/ifSearchDetail.jsp").forward(request, response);

				}else if(object.contains("Company")) {
					System.out.println("company");
					
					List<Board_CpDTO> list = companyDAO.cpCardSearch(seq);
					
					request.setAttribute("cpList", list);
					request.getRequestDispatcher("/resources/ifcp/cpSearchDetail.jsp").forward(request, response);
				}
				
				//====================================================================================================================================
				// 작성페이지 이동.
			}else if(cmd.equals("/write.ifcp")) {
				HttpSession session = request.getSession();
				String loginId = (String) session.getAttribute("loginID");
				List<CompanyDTO> list = companyDAO.searchById(loginId);
				System.out.print(list);
				request.setAttribute("cpList", list);
				request.getRequestDispatcher("/resources/ifcp/writeCompanyDetail.jsp").forward(request, response);

				//====================================================================================================================================
				// 작성시 파일첨부하여 글작성.			
			}else if(cmd.equals("/upload.ifcp")) {
				int maxSize = 1024*1024*10;
				String savePath = request.getServletContext().getRealPath("files");
				File filePath = new File(savePath);
				if(!filePath.exists()) {
					filePath.mkdir();
				}

				System.out.println(savePath);
				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8", new DefaultFileRenamePolicy());

				String oriName = multi.getOriginalFileName("file");
				String sysName = multi.getFilesystemName("file");
				
				if(oriName==null) { // 사진 안올릴시 작성글만 올리기.
					String title = multi.getParameter("title");
					String intro = multi.getParameter("intro");
					String condition = multi.getParameter("condition");
					companyDAO.writeIntro(title, intro, condition);
					response.sendRedirect("/companyList.ifcp?cpage=1");
				}else { // 사진까지 올리기.
					companyDAO.insertPhoto(new Photo_ListDTO(0,oriName,sysName,0));
					
					String title = multi.getParameter("title");
					String intro = multi.getParameter("intro");
					String condition = multi.getParameter("condition");
					companyDAO.writeIntro(title, intro, condition);
					response.sendRedirect("/companyList.ifcp?cpage=1");
				}
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
