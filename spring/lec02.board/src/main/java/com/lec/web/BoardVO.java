package com.lec.web;

import java.sql.Date;
import java.util.Objects;

public class BoardVO {

	private int seq;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int cnt;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", title=" + title + ", writer=" + writer +  "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(cnt, content, regDate, seq, title, writer);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardVO other = (BoardVO) obj;
		return cnt == other.cnt && Objects.equals(content, other.content) && Objects.equals(regDate, other.regDate)
				&& seq == other.seq && Objects.equals(title, other.title) && Objects.equals(writer, other.writer);
	}
	
	
}
