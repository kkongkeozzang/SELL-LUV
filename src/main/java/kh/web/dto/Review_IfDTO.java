package kh.web.dto;

import java.sql.Timestamp;

public class Review_IfDTO {

	int seq;
	String name_ref;
	String writer;
	String content;
	Timestamp timestamp;
	
	Review_IfDTO(){}

	public Review_IfDTO(int seq, String name_ref, String writer, String content, Timestamp timestamp) {
		super();
		this.seq = seq;
		this.name_ref = name_ref;
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

	public String getName_ref() {
		return name_ref;
	}

	public void setName_ref(String name_ref) {
		this.name_ref = name_ref;
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
