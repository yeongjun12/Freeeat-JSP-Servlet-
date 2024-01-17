package com.freeeat.common.model.vo;

import java.sql.Date;

public class Photo {
	
	//
	// 혜진이랑 다른 부분 
//	private int placePhotoNo;
//	private	int placeNo;
	private int placePhotoNo; //REVIEW_PHOTO_NO	NUMBER
	private int placeNo; //REVIEW_NO(리뷰는 리뷰넘버) or PLACE_NO(식당은 식당 넘버)	NUMBER
	private String originName; // ORIGIN_NAME	VARCHAR2(255 BYTE)
	private String changeName; // CHANGE_NAME	VARCHAR2(255 BYTE)
	private String filePath; //FILE_PATH	VARCHAR2(1000 BYTE)
	private Date uploadDate; // UPLOAD_DATE	DATE
	private String status; // STATUS	VARCHAR2(1 BYTE)
	
	
	
	public Photo() {
		super();
	}
	
	public Photo(int placePhotoNo, int placeNo, String originName, String changeName, String filePath, Date uploadDate,
			String status) {
		super();
		this.placePhotoNo = placePhotoNo;
		this.placeNo = placeNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
	}
	
	
	
	public int getPlacePhotoNo() {
		return placePhotoNo;
	}
	public void setPlacePhotoNo(int placePhotoNo) {
		this.placePhotoNo = placePhotoNo;
	}
	public int getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	@Override
	public String toString() {
		return "Photo [placePhotoNo=" + placePhotoNo + ", placeNo=" + placeNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}
	
	
}
