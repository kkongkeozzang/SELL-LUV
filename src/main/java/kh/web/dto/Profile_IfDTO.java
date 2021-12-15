package kh.web.dto;

public class Profile_IfDTO {
	private int	p_seq_if;
	private int member_seq;
	private String condition_if;
	private String career_if;
	private String intro_if;
	private int sLike_if;
	private int rLike_if;
	
	
	public Profile_IfDTO() {

	}


	public Profile_IfDTO(int seq_if, int member_seq, String condition_if, String career_if, String intro_if,
			int sLike_if, int rLike_if) {
		super();
		this.p_seq_if = seq_if;
		this.member_seq = member_seq;
		this.condition_if = condition_if;
		this.career_if = career_if;
		this.intro_if = intro_if;
		this.sLike_if = sLike_if;
		this.rLike_if = rLike_if;
	}


	public int getSeq_if() {
		return p_seq_if;
	}


	public void setSeq_if(int seq_if) {
		this.p_seq_if = seq_if;
	}


	public int getMember_seq() {
		return member_seq;
	}


	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}


	public String getCondition_if() {
		return condition_if;
	}


	public void setCondition_if(String condition_if) {
		this.condition_if = condition_if;
	}


	public String getCareer_if() {
		return career_if;
	}


	public void setCareer_if(String career_if) {
		this.career_if = career_if;
	}


	public String getIntro_if() {
		return intro_if;
	}


	public void setIntro_if(String intro_if) {
		this.intro_if = intro_if;
	}


	public int getsLike_if() {
		return sLike_if;
	}


	public void setsLike_if(int sLike_if) {
		this.sLike_if = sLike_if;
	}


	public int getrLike_if() {
		return rLike_if;
	}


	public void setrLike_if(int rLike_if) {
		this.rLike_if = rLike_if;
	}

	
}