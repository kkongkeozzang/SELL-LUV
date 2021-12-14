package kh.web.dto;


public class Board_CpDTO {
	private int seq_cp;
	private int member_seq;
	private String title_cp;
	private String condition_cp;
	private String intro_cp;
	private int sLike_cp;
	private int rLike_cp;
	private String photo_cp;
	
	
	public Board_CpDTO() {

	}


	public Board_CpDTO(int seq_cp, int member_seq, String title_cp, String condition_cp, String intro_cp, int sLike_cp,
			int rLike_cp, String photo_cp) {
		super();
		this.seq_cp = seq_cp;
		this.member_seq = member_seq;
		this.title_cp = title_cp;
		this.condition_cp = condition_cp;
		this.intro_cp = intro_cp;
		this.sLike_cp = sLike_cp;
		this.rLike_cp = rLike_cp;
		this.photo_cp = photo_cp;
	}


	public int getSeq_cp() {
		return seq_cp;
	}


	public void setSeq_cp(int seq_cp) {
		this.seq_cp = seq_cp;
	}


	public int getMember_seq() {
		return member_seq;
	}


	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}


	public String getTitle_cp() {
		return title_cp;
	}


	public void setTitle_cp(String title_cp) {
		this.title_cp = title_cp;
	}


	public String getCondition_cp() {
		return condition_cp;
	}


	public void setCondition_cp(String condition_cp) {
		this.condition_cp = condition_cp;
	}


	public String getIntro_cp() {
		return intro_cp;
	}


	public void setIntro_cp(String intro_cp) {
		this.intro_cp = intro_cp;
	}


	public int getsLike_cp() {
		return sLike_cp;
	}


	public void setsLike_cp(int sLike_cp) {
		this.sLike_cp = sLike_cp;
	}


	public int getrLike_cp() {
		return rLike_cp;
	}


	public void setrLike_cp(int rLike_cp) {
		this.rLike_cp = rLike_cp;
	}


	public String getPhoto_cp() {
		return photo_cp;
	}


	public void setPhoto_cp(String photo_cp) {
		this.photo_cp = photo_cp;
	}
}

	

	
	
