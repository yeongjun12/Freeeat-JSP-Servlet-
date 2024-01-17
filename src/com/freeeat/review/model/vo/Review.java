package com.freeeat.review.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.freeeat.common.model.vo.Photo;
import com.freeeat.place.model.vo.Tag;

public class Review { // 유경이 review VO를 사용해야 할 수도 있어용 ~~~~ 
	
	private int reviewNo; //	REVIEW_NO	NUMBER
	private int memNo; // MEM_NO	NUMBER
	private int placeNo; //PLACE_NO	NUMBER
	private int reviewCount; // REVIEW_COUNT	NUMBER
	private String reviewMenuType; // REVIEW_MENU_TYPE	VARCHAR2(100 BYTE)
	private String reviewContent; // REVIEW_CONTENT	VARCHAR2(4000 BYTE)
	private Date reviewCreateDate; // REVIEW_CREATE_DATE	DATE
	private String reviewDelete; // REVIEW_DELETE	CHAR(1 BYTE)
	private String reviewImagePath;
	private String reviewImageName;
	
	private String placeName;
	
	private String nickName;
	private String profileRevise;//	 MEM_PROFILE_REVISE, 
	private String profileSavePath; ////     MEM_PROFILE_SAVEPAT
	private int myReviewCount;
	
	private ArrayList<Photo> rPhotoList = new ArrayList(); // 리뷰 사진을 담을 photoList 
	private ArrayList<Tag> tList = new ArrayList();
	
	public Review() {
		super();
	}
	
	public Review(int reviewNo, int memNo, int placeNo, int reviewCount, String reviewMenuType, String reviewContent,
			Date reviewCreateDate, String reviewDelete) {
		super();
		this.reviewNo = reviewNo;
		this.memNo = memNo;
		this.placeNo = placeNo;
		this.reviewCount = reviewCount;
		this.reviewMenuType = reviewMenuType;
		this.reviewContent = reviewContent;
		this.reviewCreateDate = reviewCreateDate;
		this.reviewDelete = reviewDelete;
	}

	
	
	public Review(int reviewNo, int memNo, int placeNo, int reviewCount, String reviewMenuType, String reviewContent,
			Date reviewCreateDate, String reviewDelete, String reviewImagePath, String reviewImageName,
			String placeName, String nickName, String profileRevise, String profileSavePath, int myReviewCount,
			ArrayList<Photo> rPhotoList, ArrayList<Tag> tList) {
		super();
		this.reviewNo = reviewNo;
		this.memNo = memNo;
		this.placeNo = placeNo;
		this.reviewCount = reviewCount;
		this.reviewMenuType = reviewMenuType;
		this.reviewContent = reviewContent;
		this.reviewCreateDate = reviewCreateDate;
		this.reviewDelete = reviewDelete;
		this.reviewImagePath = reviewImagePath;
		this.reviewImageName = reviewImageName;
		this.placeName = placeName;
		this.nickName = nickName;
		this.profileRevise = profileRevise;
		this.profileSavePath = profileSavePath;
		this.myReviewCount = myReviewCount;
		this.rPhotoList = rPhotoList;
		this.tList = tList;
	}

	public void addTag(Tag tag) {
		this.tList.add(tag);
	}
	
	public void addPhoto(Photo photo) {
		this.rPhotoList.add(photo);
		
		//매개변수 안의 자신의 변수를 선택하고자 할 때 사용하는 것 this.(참조변수) 
	}

	public Review(int reviewNo, int memNo, int placeNo, int reviewCount, String reviewMenuType, String reviewContent,
			Date reviewCreateDate, String reviewDelete, String nickName, String profileRevise, String profileSavePath,
			ArrayList<Photo> rPhotoList, ArrayList<Tag> tList) {
		super();
		this.reviewNo = reviewNo;
		this.memNo = memNo;
		this.placeNo = placeNo;
		this.reviewCount = reviewCount;
		this.reviewMenuType = reviewMenuType;
		this.reviewContent = reviewContent;
		this.reviewCreateDate = reviewCreateDate;
		this.reviewDelete = reviewDelete;
		this.nickName = nickName;
		this.profileRevise = profileRevise;
		this.profileSavePath = profileSavePath;
		this.rPhotoList = rPhotoList;
		this.tList = tList;
	}


	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProfileRevise() {
		return profileRevise;
	}

	public void setProfileRevise(String profileRevise) {
		this.profileRevise = profileRevise;
	}

	public String getProfileSavePath() {
		return profileSavePath;
	}

	public void setProfileSavePath(String profileSavePath) {
		this.profileSavePath = profileSavePath;
	}

	public ArrayList<Photo> getrPhotoList() {
		return rPhotoList;
	}

	public void setrPhotoList(ArrayList<Photo> rPhotoList) {
		this.rPhotoList = rPhotoList;
	}

	public ArrayList<Tag> gettList() {
		return tList;
	}

	public void settList(ArrayList<Tag> tList) {
		this.tList = tList;
	}

	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public String getReviewMenuType() {
		return reviewMenuType;
	}
	public void setReviewMenuType(String reviewMenuType) {
		this.reviewMenuType = reviewMenuType;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewCreateDate() {
		return reviewCreateDate;
	}
	public void setReviewCreateDate(Date reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}
	public String getReviewDelete() {
		return reviewDelete;
	}
	public void setReviewDelete(String reviewDelete) {
		this.reviewDelete = reviewDelete;
	}
	public String getPlaceName() {
		return placeName;
	}
	
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	
	

	public String getReviewImagePath() {
		return reviewImagePath;
	}

	public void setReviewImagePath(String reviewImagePath) {
		this.reviewImagePath = reviewImagePath;
	}

	public String getReviewImageName() {
		return reviewImageName;
	}

	public void setReviewImageName(String reviewImageName) {
		this.reviewImageName = reviewImageName;
	}

	public int getMyReviewCount() {
		return myReviewCount;
	}

	public void setMyReviewCount(int myReviewCount) {
		this.myReviewCount = myReviewCount;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", memNo=" + memNo + ", placeNo=" + placeNo + ", reviewCount="
				+ reviewCount + ", reviewMenuType=" + reviewMenuType + ", reviewContent=" + reviewContent
				+ ", reviewCreateDate=" + reviewCreateDate + ", reviewDelete=" + reviewDelete + ", reviewImagePath="
				+ reviewImagePath + ", reviewImageName=" + reviewImageName + ", placeName=" + placeName + ", nickName="
				+ nickName + ", profileRevise=" + profileRevise + ", profileSavePath=" + profileSavePath
				+ ", myReviewCount=" + myReviewCount + ", rPhotoList=" + rPhotoList + ", tList=" + tList + "]";
	}
	
	
}
