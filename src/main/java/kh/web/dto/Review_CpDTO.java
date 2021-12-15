package kh.web.dto;

import java.sql.Timestamp;

public class Review_CpDTO {

	int seq;
	String nickname_ref;
	String writer;
	String content;
	Timestamp timestamp;
	
	Review_CpDTO(){}

	public Review_CpDTO(int seq, String nickname_ref, String writer, String content, Timestamp timestamp) {
		super();
		this.seq = seq;
		this.nickname_ref = nickname_ref;
		this.writer = writer;
		this.content = content;
		this.timestamp = timestamp;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getNickname_ref() {
		return nickname_ref;
	}

	public void setNickname_ref(String nickname_ref) {
		this.nickname_ref = nickname_ref;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}



}
