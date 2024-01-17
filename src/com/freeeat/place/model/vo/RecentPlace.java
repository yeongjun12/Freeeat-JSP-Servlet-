package com.freeeat.place.model.vo;

public class RecentPlace {

	private int placeNo;
	private String placeAddress;
	private String placeName;
	private double grade;
	private String titleImg;
	
	
	public RecentPlace() {
		super();
	}


	public RecentPlace(int placeNo, String placeAddress, String placeName, double grade, String titleImg) {
		super();
		this.placeNo = placeNo;
		this.placeAddress = placeAddress;
		this.placeName = placeName;
		this.grade = grade;
		this.titleImg = titleImg;
	}


	public int getPlaceNo() {
		return placeNo;
	}


	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}


	public String getPlaceAddress() {
		return placeAddress;
	}


	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}


	public String getPlaceName() {
		return placeName;
	}


	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}


	public double getGrade() {
		return grade;
	}


	public void setGrade(double grade) {
		this.grade = grade;
	}


	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}


	@Override
	public String toString() {
		return "RecentPlace [placeNo=" + placeNo + ", placeAddress=" + placeAddress + ", placeName=" + placeName
				+ ", grade=" + grade + ", titleImg=" + titleImg + "]";
	}
	
	
	
}
