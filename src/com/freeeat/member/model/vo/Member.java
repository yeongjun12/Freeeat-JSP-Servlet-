package com.freeeat.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memNo; //MEM_NO	NUMBER
	private String memId;
	private String memPwd; //MEM_PWD	VARCHAR2(20 BYTE)
	private String memNickName; //MEM_NICKNAME	VARCHAR2(20 BYTE)
	private String phone; //MEM_PHONE	VARCHAR2(20 BYTE)
	private String birthDate; //MEM_BIRTH	DATE
	private String email; //MEM_EMAIL	VARCHAR2(20 BYTE)
	private String type; //MEM_TYPE	VARCHAR2(20 BYTE)
	private String residence; //MEM_RESIDENCE	VARCHAR2(20 BYTE)
	private String enrollDate;//MEM_ENROLLDATE	DATE
	private String status; //MEM_STATUS	VARCHAR2(1 BYTE)
	private String mem_profileOG;
	private String mem_profileRevise;
	private String mem_profile_savePath;

	private int reviewNo;
	
	public Member() {
		super();
	}

	public Member(int memNo, String memId, String memPwd, String memNickName, String phone, String birthDate,
			String email, String type, String residence, String enrollDate, String status, String mem_profileOG,
			String mem_profileRevise, String mem_profile_savePath) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memNickName = memNickName;
		this.phone = phone;
		this.birthDate = birthDate;
		this.email = email;
		this.type = type;
		this.residence = residence;
		this.enrollDate = enrollDate;
		this.status = status;
		this.mem_profileOG = mem_profileOG;
		this.mem_profileRevise = mem_profileRevise;
		this.mem_profile_savePath = mem_profile_savePath;
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

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemNickName() {
		return memNickName;
	}

	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMem_profileOG() {
		return mem_profileOG;
	}

	public void setMem_profileOG(String mem_profileOG) {
		this.mem_profileOG = mem_profileOG;
	}

	public String getMem_profileRevise() {
		return mem_profileRevise;
	}

	public void setMem_profileRevise(String mem_profileRevise) {
		this.mem_profileRevise = mem_profileRevise;
	}

	public String getMem_profile_savePath() {
		return mem_profile_savePath;
	}

	public void setMem_profile_savePath(String mem_profile_savePath) {
		this.mem_profile_savePath = mem_profile_savePath;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memNickName=" + memNickName
				+ ", phone=" + phone + ", birthDate=" + birthDate + ", email=" + email + ", type=" + type
				+ ", residence=" + residence + ", enrollDate=" + enrollDate + ", status=" + status + ", mem_profileOG="
				+ mem_profileOG + ", mem_profileRevise=" + mem_profileRevise + ", mem_profile_savePath="
				+ mem_profile_savePath + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
