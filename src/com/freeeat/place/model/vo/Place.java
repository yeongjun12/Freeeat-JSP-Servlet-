package com.freeeat.place.model.vo;

import java.util.ArrayList;
import java.util.HashSet;

public class Place {

   private int placeNo;
   private String placeName;
   private String placeAddress;
   private String placePhone;
   private String placeKind;
   private String placeTime;
   private String placeDayoff;
   private String placeParking;
   private String placeInfo;
   private String placeStatus;
   private int placeViews;
   private String placeType; //타입
   
   private double grade; //리뷰 평점
   private int reviewCount; //리뷰수
   private int wishCount; //좋아요수
   private String titleImg; //리스트 대표사진
   
   private int countReview;
   private int sumReview;
   
   public Place() {}

   public Place(int placeNo, String placeName, String placeAddress, String placePhone, String placeKind, String placeTime,
		String placeDayoff, String placeParking, String placeInfo, String placeStatus, int placeViews,
		String placeType) {
	super();
	this.placeNo = placeNo;
	this.placeName = placeName;
	this.placeAddress = placeAddress;
	this.placePhone = placePhone;
	this.placeKind = placeKind;
	this.placeTime = placeTime;
	this.placeDayoff = placeDayoff;
	this.placeParking = placeParking;
	this.placeInfo = placeInfo;
	this.placeStatus = placeStatus;
	this.placeViews = placeViews;
	this.placeType = placeType;
   }

   public int getPlaceNo() {
      return placeNo;
   }

   public void setPlaceNo(int placeNo) {
      this.placeNo = placeNo;
   }

   public String getPlaceName() {
      return placeName;
   }

   public void setPlaceName(String placeName) {
      this.placeName = placeName;
   }

   public String getPlaceAddress() {
      return placeAddress;
   }

   public void setPlaceAddress(String placeAddress) {
      this.placeAddress = placeAddress;
   }

   public String getPlacePhone() {
      return placePhone;
   }

   public void setPlacePhone(String placePhone) {
      this.placePhone = placePhone;
   }

   public String getPlaceKind() {
      return placeKind;
   }

   public void setPlaceKind(String placeKind) {
      this.placeKind = placeKind;
   }

   public String getPlaceTime() {
      return placeTime;
   }

   public void setPlaceTime(String placeTime) {
      this.placeTime = placeTime;
   }

   public String getPlaceDayoff() {
      return placeDayoff;
   }

   public void setPlaceDayoff(String placeDayoff) {
      this.placeDayoff = placeDayoff;
   }

   public String getPlaceParking() {
      return placeParking;
   }

   public void setPlaceParking(String placeParking) {
      this.placeParking = placeParking;
   }

   public String getPlaceInfo() {
      return placeInfo;
   }

   public void setPlaceInfo(String placeInfo) {
      this.placeInfo = placeInfo;
   }

   public String getPlaceStatus() {
      return placeStatus;
   }

   public void setPlaceStatus(String placeStatus) {
      this.placeStatus = placeStatus;
   }

   public int getPlaceViews() {
      return placeViews;
   }

   public void setPlaceViews(int placeViews) {
      this.placeViews = placeViews;
   }
   
  
   public double getGrade() {
	   return grade;
	}
	
	public void setGrade(double grade) {
		this.grade = grade;
	}
	
	public int getReviewCount() {
		return reviewCount;
	}
	
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	
	public int getWishCount() {
		return wishCount;
	}
	
	public void setWishCount(int wishCount) {
		this.wishCount = wishCount;
	}
	

	public String getTitleImg() {
			return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	
	public String getPlaceType() {
		return placeType;
	}

	public void setPlaceType(String placeType) {
		this.placeType = placeType;
	}
	public int getCountReview() {
		return countReview;
	}

	public void setCountReview(int countReview) {
		this.countReview = countReview;
	}

	public int getSumReview() {
		return sumReview;
	}

	public void setSumReview(int sumReview) {
		this.sumReview = sumReview;
	}

@Override
   public String toString() {
      return "Place [placeNo=" + placeNo + ", placeName=" + placeName + ", placeAddress=" + placeAddress
            + ", placePhone=" + placePhone + ", placeKind=" + placeKind + ", placeTime=" + placeTime
            + ", placeDayoff=" + placeDayoff + ", placeParking=" + placeParking + ", placeInfo=" + placeInfo
            + ", placeStatus=" + placeStatus + ", placeViews=" + placeViews + ",placeType=" + placeType + "]";
   }
	
}
