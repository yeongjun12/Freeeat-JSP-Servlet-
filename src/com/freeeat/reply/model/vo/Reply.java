package com.freeeat.reply.model.vo;

public class Reply {

	private int replyNo; //REPLY_NO	NUMBER	No		1	댓글번호
	private String replyContent; //REPLY_CONTENT	VARCHAR2(200 BYTE)	No		2	댓글내용
	private String replyDeleted; //REPLY_DELETED	CHAR(1 BYTE)	No	'N' 	3	삭제여부
	private int feedNo; //FEED_NO	NUMBER	No		4	피드글번호
	private int memNo; //MEM_NO	NUMBER	No		5	회원번호
	private String memNickName; // 작성자명
	public Reply() {
		super();
	}
	
	public Reply(int replyNo, String replyContent, String replyDeleted, int feedNo, int memNo, String memNickName) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyDeleted = replyDeleted;
		this.feedNo = feedNo;
		this.memNo = memNo;
		this.memNickName = memNickName;
	}

	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyDeleted() {
		return replyDeleted;
	}
	public void setReplyDeleted(String replyDeleted) {
		this.replyDeleted = replyDeleted;
	}
	public int getFeedNo() {
		return feedNo;
	}
	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemNickName() {
		return memNickName;
	}

	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyDeleted=" + replyDeleted
				+ ", feedNo=" + feedNo + ", memNo=" + memNo + ", memNickName=" + memNickName + "]";
	}

	
}