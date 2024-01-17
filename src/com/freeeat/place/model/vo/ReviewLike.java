package com.freeeat.place.model.vo;

public class ReviewLike {
	
	private int memNo; //좋아요한회원번호
	private int reviewNo; //리뷰글번호
	
	
	public ReviewLike() {
		super();
	}

	public ReviewLike(int memNo, int reviewNo) {
		super();
		this.memNo = memNo;
		this.reviewNo = reviewNo;
	}

	
	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	
	@Override
	public String toString() {
		return "ReviewLike [memNo=" + memNo + ", reviewNo=" + reviewNo + "]";
	}


	
	
	
	
}
