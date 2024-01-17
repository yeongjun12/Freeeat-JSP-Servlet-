package com.freeeat.place.model.vo;

import java.util.Date;

public class Wish {
	
	
	private String place_Name;
	private int mem_No;
	private String place_No;
	private Date wish_date;
	private String img_Name;
	private String img_Path;
	
	public Wish() {
		super();
	}



	public Wish(String place_Name, int mem_No, String place_No, Date wish_date, String img_Name, String img_Path) {
		super();
		this.place_Name = place_Name;
		this.mem_No = mem_No;
		this.place_No = place_No;
		this.wish_date = wish_date;
		this.img_Name = img_Name;
		this.img_Path = img_Path;
	}



	public String getPlace_Name() {
		return place_Name;
	}

	public void setPlace_Name(String place_Name) {
		this.place_Name = place_Name;
	}

	public int getMem_No() {
		return mem_No;
	}

	public void setMem_No(int mem_No) {
		this.mem_No = mem_No;
	}

	public String getPlace_No() {
		return place_No;
	}

	public void setPlace_No(String place_No) {
		this.place_No = place_No;
	}

	public Date getWish_date() {
		return wish_date;
	}

	public void setWish_date(Date wish_date) {
		this.wish_date = wish_date;
	}

	public String getImg_Name() {
		return img_Name;
	}

	public void setImg_Name(String img_Name) {
		this.img_Name = img_Name;
	}
	

	public String getImg_Path() {
		return img_Path;
	}



	public void setImg_Path(String img_Path) {
		this.img_Path = img_Path;
	}



	@Override
	public String toString() {
		return "Wish [place_Name=" + place_Name + ", mem_No=" + mem_No + ", place_No=" + place_No + ", wish_date="
				+ wish_date + ", img_Name=" + img_Name + ", img_Path=" + img_Path + "]";
	}
	
	

}
