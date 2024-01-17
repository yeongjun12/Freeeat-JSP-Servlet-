package com.freeeat.place.model.vo;

public class PlacePhoto {

	private int placePhotoNo;
	private	int placeNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
	private String status;
	
	public PlacePhoto() {
		super();
	}

	public PlacePhoto(int placePhotoNo, int placeNo, String originName, String changeName, String filePath,
			String uploadDate, String status) {
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

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
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
		return "PlacePhoto [placePhotoNo=" + placePhotoNo + ", placeNo=" + placeNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status="
				+ status + "]";
	}
	
}
