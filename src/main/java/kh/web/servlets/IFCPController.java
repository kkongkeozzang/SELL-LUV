package kh.web.servlets;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;

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
import kh.web.dto.Review_CpDTO;
import kh.web.dto.Review_IfDTO;
import kh.web.statics.IFCPStatics;
import kh.web.statics.PageStatics;


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

				LinkedHashMap<Profile_IfDTO,InfluencerDTO> list = influencerDAO.selectByBound(start, end);

				for (Entry<Profile_IfDTO, InfluencerDTO> entrySet : list.entrySet()) {
					System.out.println(entrySet.getKey().getSeq_if()+ " : " + entrySet.getValue());
				}

				String navi = influencerDAO.getPageNavi(currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("/resources/ifcp/influencerList.jsp").forward(request, response);

				//인플루언서 목록 출력 끝..
				//====================================================================================================================================
				//기업기본 목록 출력...
			}else if(cmd.equals("/companyList.ifcp")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));

				if(currentPage < 1) {currentPage = 1;}


				int start = currentPage * IFCPStatics.RECORD_COUNT_PER_PAGE- (IFCPStatics.RECORD_COUNT_PER_PAGE-1);;
				int end = currentPage * IFCPStatics.RECORD_COUNT_PER_PAGE;

				LinkedHashMap<Board_CpDTO,CompanyDTO> list = companyDAO.selectByBound(start,end);

				String navi = companyDAO.getPageNavi(currentPage);


				for (java.util.Map.Entry<Board_CpDTO, CompanyDTO> entrySet : list.entrySet()) {
					System.out.println(entrySet.getKey() + " : " + entrySet.getValue());
				}

				String loginID = (String) request.getSession().getAttribute("loginID"); // 버튼 숨기기 구분.
				List<CompanyDTO> hideBtn = companyDAO.searchById(loginID);
				if(hideBtn.size()!=0) {
					String cp = hideBtn.get(0).getId();
					request.setAttribute("cp", cp);
					request.setAttribute("list", list);
					request.setAttribute("navi", navi);
					request.getRequestDispatcher("/resources/ifcp/companyList.jsp").forward(request, response);
				}else {
					request.setAttribute("list", list);
					request.setAttribute("navi", navi);
					request.getRequestDispatcher("/resources/ifcp/companyList.jsp").forward(request, response);
				}
				//====================================================================================================================================
				//기업 목록 출력 끝..


				//====================================================================================================================================
				// 상세페이지 이동.
			}else if(cmd.equals("/companyBoard.ifcp")) { // 기업 페이지로 리뷰보내기.
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println(seq);
				
				if(currentPage < 1) { 
					currentPage = 1;
				}else if(currentPage > companyDAO.getifCardPageTotalCount()) {
					currentPage = companyDAO.getifCardPageTotalCount();
				}

				int start = currentPage * PageStatics.RECORD_COUNT_PER_PAGE - (PageStatics.RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * PageStatics.RECORD_COUNT_PER_PAGE;

				List<Review_IfDTO> list1 = companyDAO.ifCardBoundary(start, end);

				String navi = companyDAO.getifCardPageNavi(currentPage,seq); 
				request.setAttribute("navi", navi);
				request.setAttribute("list", list1); 

				int ifCard = companyDAO.getIfCardCount();
				request.setAttribute("ifCard", ifCard);
				

				LinkedHashMap<Board_CpDTO,CompanyDTO> list = companyDAO.getCompanyBoardDetail(seq);


				for (java.util.Map.Entry<Board_CpDTO, CompanyDTO> entrySet : list.entrySet()) {
					System.out.println(entrySet.getKey() + " : " + entrySet.getValue());
				}

				List<Review_IfDTO> ifRvList = companyDAO.ifReview();

				request.setAttribute("cpList", list);
				request.setAttribute("ifRvList", ifRvList);
				request.getRequestDispatcher("/resources/ifcp/companyDetail.jsp").forward(request, response);

			}else if(cmd.equals("/influencerProfile.ifcp")) { // 인플루언서 페이지로 리뷰보내기.
//				int currentPage = Integer.parseInt(request.getParameter("cpage"));
//
//				if(currentPage < 1) { 
//					currentPage = 1;
//				}else if(currentPage > influencerDAO.getifCardPageTotalCount()) {
//					currentPage = influencerDAO.getifCardPageTotalCount();
//				}
//
//				int start = currentPage * PageStatics.RECORD_COUNT_PER_PAGE - (PageStatics.RECORD_COUNT_PER_PAGE-1);
//				int end = currentPage * PageStatics.RECORD_COUNT_PER_PAGE;
//
//				List<Profile_IfDTO> list1 = influencerDAO.ifCardBoundary(start, end);
//
//				String navi = influencerDAO.getifCardPageNavi(currentPage); 
//				request.setAttribute("navi", navi);
//				request.setAttribute("list", list1); 
//
//				int ifCard = influencerDAO.getIfCardCount();
//				request.setAttribute("ifCard", ifCard);
//				

				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println(seq);

				LinkedHashMap<Profile_IfDTO,InfluencerDTO> list = influencerDAO.getIfProfile(seq);

				for (Entry<Profile_IfDTO, InfluencerDTO> entrySet : list.entrySet()) {
					System.out.println(entrySet.getKey() + " : " + entrySet.getValue());
				}

				List<Review_CpDTO> cpRvList = influencerDAO.cpReview();

				request.setAttribute("ifList", list);
				request.setAttribute("cpRvList", cpRvList);
				request.getRequestDispatcher("/resources/ifcp/ifProfileDetail.jsp").forward(request, response);



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
					String loginID = (String) request.getSession().getAttribute("loginID");
					String title = multi.getParameter("title");
					String intro = multi.getParameter("intro");
					String condition = multi.getParameter("condition");

					int seq = companyDAO.cpSearchById(loginID);

					companyDAO.writeIntro(seq,title, intro, condition);
					response.sendRedirect("/companyList.ifcp?cpage=1");
				}else { // 사진까지 올리기.
					companyDAO.insertPhoto(new Photo_ListDTO(0,oriName,sysName,0));

					String loginID = (String) request.getSession().getAttribute("loginID");
					String title = multi.getParameter("title");
					String intro = multi.getParameter("intro");
					String condition = multi.getParameter("condition");

					int seq = companyDAO.cpSearchById(loginID);

					companyDAO.writeIntro(seq, title, intro, condition);
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