package com.gr.farming.qna.model;

import java.sql.Timestamp;

public class QnaVO {
	private int no;
	private String name;	
	private String pwd;
	private String title;
	private String email;
	private Timestamp regdate;
	private int readcount;
	private String content;
	
	//답변형 게시판 필드
	private int groupNo;
	private int step; 
	private int sortNo;  
	private String delFlag;
	
	//24시간 이내의 글인 경우 처리를 위한 변수
	private float dateTerm;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public float getDateTerm() {
		return dateTerm;
	}

	public void setDateTerm(float dateTerm) {
		this.dateTerm = dateTerm;
	}

	@Override
	public String toString() {
		return "QnaVO [no=" + no + ", name=" + name + ", pwd=" + pwd + ", title=" + title + ", email=" + email
				+ ", regdate=" + regdate + ", readcount=" + readcount + ", content=" + content + ", groupNo=" + groupNo
				+ ", step=" + step + ", sortNo=" + sortNo + ", delFlag=" + delFlag + ", dateTerm=" + dateTerm + "]";
	}
	
	
}