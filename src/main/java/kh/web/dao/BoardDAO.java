package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.BoardDTO;
import kh.web.dto.Review_IfDTO;
import kh.web.statics.BoardStatics;
import kh.web.statics.IFCPStatics;

public class BoardDAO  {
	
private static BoardDAO instance = null;
	
	public static BoardDAO getInstance() {
		if(instance==null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	public BoardDAO() {}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insert(BoardDTO dto) throws Exception {
		String sql = "INSERT INTO freeboard VALUES (freeboard_seq.nextval,?,?,?,DEFAULT,DEFAULT)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getContents());
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int modify(int seq, String title, String contents) throws Exception {
		String sql = "UPDATE freeboard SET title=?, contents=? WHERE seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, title);
			pstat.setString(2, contents);
			pstat.setInt(3, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int delete(int seq) throws Exception {
		String sql = "DELETE FROM freeboard WHERE seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	// 조회수 올리기
	public int addViewCount(int seq) throws Exception {
		String sql = "UPDATE freeboard SET view_count = view_count + 1 WHERE seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public List<BoardDTO> selectAll() throws Exception {
		String sql = "SELECT * FROM freeboard ORDER BY 1 DESC";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<BoardDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				Timestamp write_date = rs.getTimestamp("write_date");
				int view_count = rs.getInt("view_count");
				String profileName = rs.getString("member_name");
				list.add(new BoardDTO(seq,writer,title,contents,write_date,view_count,profileName));
			}
			return list;
			}
	}
	
	public List<BoardDTO> selectByBound(int start, int end) throws Exception {
		String sql = "SELECT * FROM (SELECT ROWNUM rn, freeboard.* FROM freeboard ORDER BY seq DESC) a JOIN \r\n"
				+ "(SELECT c.id_cp , c.name_cp member_name FROM company c UNION SELECT  i.id_if, i.nickname_if FROM influencer i)\r\n"
				+ "ON a.writer = id_cp WHERE a.rn BETWEEN ? AND ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(ResultSet rs = pstat.executeQuery();){
				List<BoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					String profileName = rs.getString("member_name");
					list.add(new BoardDTO(seq,writer,title,contents,write_date,view_count,profileName));
				}
				return list;
				}
			}
	}
	
	public List<BoardDTO> selectByBoundSearch(int start, int end, String select, String keyword) throws Exception {
		String sql = "SELECT * FROM (SELECT b.*, row_number() OVER(ORDER BY seq DESC) rn FROM (SELECT * FROM(SELECT * FROM (SELECT freeboard.* FROM freeboard) a\r\n"
				+ "JOIN \r\n"
				+ "(SELECT id_cp , name_cp FROM company UNION SELECT  id_if, nickname_if FROM influencer) \r\n"
				+ "ON a.writer = id_cp WHERE "+select+" LIKE ?)) b) WHERE rn BETWEEN ? AND ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, "%"+keyword+"%");
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			try(ResultSet rs = pstat.executeQuery();){
				List<BoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					String profileName = rs.getString("name_cp");
					list.add(new BoardDTO(seq,writer,title,contents,write_date,view_count,profileName));
				}
				return list;
				}
			}
	}
	
	public BoardDTO selectBySeq(int seq) throws Exception {
		String sql = "SELECT * FROM (SELECT ROWNUM rn, freeboard.* FROM freeboard ORDER BY seq DESC) a JOIN \r\n"
				+ "(SELECT c.id_cp , c.name_cp member_name FROM company c UNION SELECT  i.id_if, i.nickname_if FROM influencer i)\r\n"
				+ "ON a.writer = id_cp WHERE seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				BoardDTO dto = null;
				while(rs.next()) {
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					int view_count = rs.getInt("view_count");
					String profileName = rs.getString("member_name");
					dto = new BoardDTO(seq,writer,title,contents,write_date,view_count,profileName);
				}
				return dto;
				}
			}
	}
	
	public int getPageTotalCount() throws Exception {
		int recordTotalCount = this.getRecordCount();

		// 총 몇 개의 페이지가 나오는지 계산할 수 있다.
		int pageTotalCount = 0;
		if(recordTotalCount % BoardStatics.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / BoardStatics.RECORD_COUNT_PER_PAGE;
		}else {
			pageTotalCount = recordTotalCount / BoardStatics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}
	

	private int getRecordCount() throws Exception {
		String sql = "SELECT COUNT(*) FROM freeboard";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);
		}
	}
	
	private int getRecordCountSearch(String select, String keyword) throws Exception {
		String sql = "SELECT count(*) FROM (SELECT b.*, row_number() OVER(ORDER BY seq DESC) rn FROM (SELECT * FROM(SELECT * FROM (SELECT freeboard.* FROM freeboard) a\r\n"
				+ "JOIN \r\n"
				+ "(SELECT id_cp , name_cp FROM company UNION SELECT  id_if, nickname_if FROM influencer) \r\n"
				+ "ON a.writer = id_cp WHERE "+select+" LIKE ?)) b)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, "%"+keyword+"%");
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	public String getPageNavi(int cpage) throws Exception {
		
		// 변수 설정
		int recordTotalCount = this.getRecordCount();
		int recordCountPerPage = BoardStatics.RECORD_COUNT_PER_PAGE;
		int naviCountPerPage = BoardStatics.NAVI_PER_PAGE;
		int pageTotalCount = 0;
		
		// pageTotalCount 계산
		if(recordTotalCount % recordCountPerPage == 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage +1;
		}
		
		// 네비 시작, 끝 정해주기
		int startNavi = (cpage-1)/naviCountPerPage * naviCountPerPage +1;
		int endNavi = startNavi + (naviCountPerPage - 1);
		
		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi==1) {
			needPrev = false;
		}
		if(endNavi==pageTotalCount) {
			needNext = false;
		}
		
		String navi ="";
		navi+= "<nav><ul class='pagination mb-5 justify-content-center'>";
		if(needPrev) {
			navi += "<li class=page-item><a class=page-link href='/boardList.board?cpage="+(startNavi-1)+"' data-abc=true style=color:black;>"+"«"+"</a></li>";
		}
		for(int i=startNavi;i<=endNavi;i++) {
			navi += "<li class=page-item><a class=page-link href='/boardList.board?cpage="+i+"' data-abc=true style=color:black;>"+i+"</a></li>";
		}
		if(needNext) {
			navi += "<li class=page-item><a class=page-link href='/boardList.board?cpage="+(endNavi+1)+"' data-abc=true style=color:black;>"+"»"+"</a></li>";
		}
		navi+="</ul></nav>";
		
//		 System.out.println("startNavi : "+startNavi);
//		 System.out.println("endNavi : "+endNavi);
//		 System.out.println("recordTotalCount : "+recordTotalCount);
//		 System.out.println("pageTotalCount : "+pageTotalCount);
		 
		
		return navi;
	}
	
public String getPageNaviSearch(int cpage, String select, String keyword) throws Exception {
		
		// 변수 설정
		int recordTotalCount = this.getRecordCountSearch(select, keyword);
		int recordCountPerPage = BoardStatics.RECORD_COUNT_PER_PAGE;
		int naviCountPerPage = BoardStatics.NAVI_PER_PAGE;
		int pageTotalCount = 0;
		
		// pageTotalCount 계산
		if(recordTotalCount % recordCountPerPage == 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage +1;
		}
		
		// 네비 시작, 끝 정해주기
		int startNavi = (cpage-1)/naviCountPerPage * naviCountPerPage +1;
		int endNavi = startNavi + (naviCountPerPage - 1);
		
		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi==1) {
			needPrev = false;
		}
		if(endNavi==pageTotalCount) {
			needNext = false;
		}
		
		String navi ="";
		navi+= "<nav><ul class='pagination mb-5 justify-content-center'>";
		if(needPrev) {
			navi += "<li class=page-item><a class=page-link href='/search.board?cpage="+(startNavi-1)+"' data-abc=true>"+"«"+"</a></li>";
		}
		for(int i=startNavi;i<=endNavi;i++) {
			navi += "<li class=page-item><a class=page-link href='/search.board?cpage="+i+"' data-abc=true>"+i+"</a></li>";
		}
		if(needNext) {
			navi += "<li class=page-item><a class=page-link href='/search.board?cpage="+(endNavi+1)+"' data-abc=true>"+"»"+"</a></li>";
		}
		navi+="</ul></nav>";
		
//		 System.out.println("startNavi : "+startNavi);
//		 System.out.println("endNavi : "+endNavi);
//		 System.out.println("recordTotalCount : "+recordTotalCount);
//		 System.out.println("pageTotalCount : "+pageTotalCount);
		 
		
		return navi;
	}
	
	public int getPageTotalCountBoard() throws Exception{
	int recordTotalCount = this.getRecordCount(); 
	int pageTotalCount = 0; //
	if(recordTotalCount % IFCPStatics.RECORD_COUNT_PER_PAGE == 0) { 
		pageTotalCount = recordTotalCount / IFCPStatics.RECORD_COUNT_PER_PAGE;
	}else {
		pageTotalCount = recordTotalCount / IFCPStatics.RECORD_COUNT_PER_PAGE + 1;
	}
	return pageTotalCount;
	}
	
	public String getPageNaviIFBoard(int currentPage) throws Exception{

		// 총 몇개의 레코드(게시글)을 가지고 있는지
		int recordTotalCount = this.getRecordCount(); // 게시글 개수
		int recordCountPerPage = 9; // 한페이지에 출력되는 개수
		int naviCountPerPage = 3; // 밑에 페이지 숫자 출력

		int pageTotalCount = 0; //

		if(recordTotalCount % IFCPStatics.RECORD_COUNT_PER_PAGE == 0) { // 게시글 개수와 한페이 출력되는 개수를 나눴을 때 나머지가 없는 경우
			pageTotalCount = recordTotalCount / IFCPStatics.RECORD_COUNT_PER_PAGE;
		}else {// 게시글 개수와 한페이 출력되는 개수를 나눴을 때 나머지가 있는 경우 +1을해서 나머지 게시글도 출력하게 한다
			pageTotalCount = recordTotalCount / IFCPStatics.RECORD_COUNT_PER_PAGE + 1;
		}


		if(currentPage < 1) {
			currentPage = 1;  // 보완작업
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		} // currentPage 인자값을 클라이언트가 조작했을 시 방어하기 위한 코드

		int startNavi = (currentPage-1) / IFCPStatics.NAVI_PER_PAGE * IFCPStatics.NAVI_PER_PAGE +1;
		int endNavi = startNavi + IFCPStatics.NAVI_PER_PAGE -1 ;

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount; // 보완작업
		}

		boolean needPrev = true;
		boolean needNext= true;

		if(startNavi == 1) {
			needPrev = false;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		String pageNavi = "";
		if(needPrev) {
			pageNavi += "<a href ='/IFBoardList.mem?cpage="+(startNavi-1)+"'><</a> ";		
		}

		for(int i = startNavi; i <= endNavi; i++) {
			pageNavi +="<a href='/IFBoardList.mem?cpage="+i+"'>" + i +"</a> ";
		}
		if(needNext) {
			pageNavi += "<a href ='/IFBoardList.mem?cpage="+(endNavi+1)+"'>></a> ";
		}

		return pageNavi;
	}
	
	public List<BoardDTO> selectByBoundBoard(String writer, int start, int end) throws Exception{

		String sql = "select * from(select freeboard.*, row_number() over(order by seq desc) rn from freeboard where writer = ?) where rn between ? and ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, writer);
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			try(ResultSet rs = pstat.executeQuery();){
				List<BoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setSeq(rs.getInt("seq"));
					dto.setWriter(rs.getString("writer"));
					dto.setTitle(rs.getString("title"));
					dto.setContents(rs.getString("contents"));
					dto.setWrite_date(rs.getTimestamp("write_date"));
					dto.setView_count(rs.getInt("view_count"));
					list.add(dto);
				}
				return list;
			}			
		}
	}
	
	public String getPageNaviCPBoard(int currentPage) throws Exception{

		// 총 몇개의 레코드(게시글)을 가지고 있는지
		int recordTotalCount = this.getRecordCount(); // 게시글 개수
		int recordCountPerPage = 9; // 한페이지에 출력되는 개수
		int naviCountPerPage = 3; // 밑에 페이지 숫자 출력

		int pageTotalCount = 0; //

		if(recordTotalCount % IFCPStatics.RECORD_COUNT_PER_PAGE == 0) { // 게시글 개수와 한페이 출력되는 개수를 나눴을 때 나머지가 없는 경우
			pageTotalCount = recordTotalCount / IFCPStatics.RECORD_COUNT_PER_PAGE;
		}else {// 게시글 개수와 한페이 출력되는 개수를 나눴을 때 나머지가 있는 경우 +1을해서 나머지 게시글도 출력하게 한다
			pageTotalCount = recordTotalCount / IFCPStatics.RECORD_COUNT_PER_PAGE + 1;
		}


		if(currentPage < 1) {
			currentPage = 1;  // 보완작업
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		} // currentPage 인자값을 클라이언트가 조작했을 시 방어하기 위한 코드

		int startNavi = (currentPage-1) / IFCPStatics.NAVI_PER_PAGE * IFCPStatics.NAVI_PER_PAGE +1;
		int endNavi = startNavi + IFCPStatics.NAVI_PER_PAGE -1 ;

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount; // 보완작업
		}

		boolean needPrev = true;
		boolean needNext= true;

		if(startNavi == 1) {
			needPrev = false;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		String pageNavi = "";
		if(needPrev) {
			pageNavi += "<a href ='/CPBoardList.mem?cpage="+(startNavi-1)+"'><</a> ";		
		}

		for(int i = startNavi; i <= endNavi; i++) {
			pageNavi +="<a href='/CPBoardList.mem?cpage="+i+"'>" + i +"</a> ";
		}
		if(needNext) {
			pageNavi += "<a href ='/CPBoardList.mem?cpage="+(endNavi+1)+"'>></a> ";
		}

		return pageNavi;
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
