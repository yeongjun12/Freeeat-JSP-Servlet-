package com.freeeat.notice.model.vo;

public class Notice {

	private int noticeNo; // NOTICE_NO	NUMBER 공지번호
	private String noticeTitle; // NOTICE_TITLE	VARCHAR2(50 BYTE) 공지제목
	private String noticeCont; // NOTICE_CONT	VARCHAR2(4000 BYTE) 공지내용
	private String memNickname; //  공지작성자
	private String noticeDate; // NOTICE_DATE	DATE 공지작성일
	private int memNo; // MEM_NO	NUMBER
	
	public Notice() {
		super();
	}

	public Notice(int noticeNo, String noticeTitle, String noticeCont, String memNickname, String noticeDate,
			int memNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeCont = noticeCont;
		this.memNickname = memNickname;
		this.noticeDate = noticeDate;
		this.memNo = memNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeCont() {
		return noticeCont;
	}

	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}

	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeCont=" + noticeCont
				+ ", memNickname=" + memNickname + ", noticeDate=" + noticeDate + ", memNo=" + memNo + "]";
	}

	
	
		
}