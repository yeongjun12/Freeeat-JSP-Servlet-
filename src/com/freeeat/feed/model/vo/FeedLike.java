package com.freeeat.feed.model.vo;

public class FeedLike {

	private int memNo; //MEM_NO	NUMBER	No		1	좋아요한회원번호
	private int feedNo; //FEED_NO	NUMBER	No		2	피드글번호
	
	public FeedLike() {
		super();
	}
	public FeedLike(int memNo, int feedNo) {
		super();
		this.memNo = memNo;
		this.feedNo = feedNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getFeedNo() {
		return feedNo;
	}
	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}
	@Override
	public String toString() {
		return "FeedLike [memNo=" + memNo + ", feedNo=" + feedNo + "]";
	}
	
	
	
}
