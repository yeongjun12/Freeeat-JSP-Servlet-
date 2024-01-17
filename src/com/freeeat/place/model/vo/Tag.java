package com.freeeat.place.model.vo;

public class Tag {
	
	private int tagNo; // TAG_NO	NUMBER
	private String tagContent; //TAG_CONTENT	VARCHAR2(50 BYTE)
	private int reviewNo; //REVIEW_NO	NUMBER
	
	
	public Tag() {
		super();
	}

	public Tag(int tagNo, String tagContent, int reviewNo) {
		super();
		this.tagNo = tagNo;
		this.tagContent = tagContent;
		this.reviewNo = reviewNo;
	}

	
	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagContent() {
		return tagContent;
	}

	public void setTagContent(String tagContent) {
		this.tagContent = tagContent;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	
	@Override
	public String toString() {
		return "Tag [tagNo=" + tagNo + ", tagContent=" + tagContent + ", reviewNo=" + reviewNo + "]";
	}
	
	
	
}
