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
import kh.web.statics.BoardStatics;

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
				list.add(new BoardDTO(seq,writer,title,contents,write_date,view_count));
			}
			return list;
			}
	}
	
	public List<BoardDTO> selectByBound(int start, int end) throws Exception {
		String sql = "SELECT * FROM (SELECT ROWNUM rn, freeboard.* FROM freeboard ORDER BY seq DESC) a WHERE a.rn BETWEEN ? AND ?";
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
					list.add(new BoardDTO(seq,writer,title,contents,write_date,view_count));
				}
				return list;
				}
			}
	}
	
	public List<BoardDTO> selectByBoundSearch(int start, int end, String select, String keyword) throws Exception {
		String sql = "SELECT * FROM (SELECT ROWNUM rn, freeboard.* FROM freeboard WHERE "+select+ " LIKE ? ORDER BY seq DESC) a WHERE a.rn BETWEEN ? AND ?";
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
					list.add(new BoardDTO(seq,writer,title,contents,write_date,view_count));
				}
				return list;
				}
			}
	}
	
	public BoardDTO selectBySeq(int seq) throws Exception {
		String sql = "SELECT * FROM freeboard WHERE seq = ?";
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
					dto = new BoardDTO(seq,writer,title,contents,write_date,view_count);
				}
				return dto;
				}
			}
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
		String sql = "SELECT COUNT(*) FROM freeboard WHERE "+select+" LIKE ? ";
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
			navi += "<li class=page-item><a class=page-link href='/boardList.board?cpage="+(startNavi-1)+"' data-abc=true>"+"«"+"</a></li>";
		}
		for(int i=startNavi;i<=endNavi;i++) {
			navi += "<li class=page-item><a class=page-link href='/boardList.board?cpage="+i+"' data-abc=true>"+i+"</a></li>";
		}
		if(needNext) {
			navi += "<li class=page-item><a class=page-link href='/boardList.board?cpage="+(endNavi+1)+"' data-abc=true>"+"»"+"</a></li>";
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
	
	
	
	
	
	
	
	
	
	
	
}
