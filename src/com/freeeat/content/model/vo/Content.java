package com.freeeat.content.model.vo;

public class Content {

	private int contNo; 			// CONT_NO	NUMBER	콘텐츠글번호
	private String contCategory;	// CONT_CATEGORY	CHAR(6 BYTE) 콘텐츠카테고리
	private String contTitle; 		// CONT_TITLE	VARCHAR2(50 BYTE) 콘텐츠제목
	private String contInfo; 		// CONT_INFO	VARCHAR2(300 BYTE)	콘텐츠소개글
	private String contSource; 		// CONT_SOURCE	VARCHAR2(1000 BYTE)	콘텐츠출처
	private String contLink; 		// CONT_LINK	VARCHAR2(4000 BYTE)	콘텐츠출처링크
	private String contImgSource; 	// CONT_IMG_LINK	VARCHAR2(4000 BYTE)	콘텐츠사진링크
	private String menuType; 		// MENU_TYPE	VARCHAR2(20 BYTE) 타입
	private String likeYN; 			// 좋아요 눌렸는지 확인하는 컬럼
	
	public Content() {
		super();
	}
	
	public Content(int contNo, String contCategory, String contTitle, String contInfo, String contSource,
			String contLink, String contImgLink, String menuType, String likeYN) {
		super();
		this.contNo = contNo;
		this.contCategory = contCategory;
		this.contTitle = contTitle;
		this.contInfo = contInfo;
		this.contSource = contSource;
		this.contLink = contLink;
		this.contImgSource = contImgLink;
		this.menuType = menuType;
		this.likeYN = likeYN;
	}

	public int getContNo() {
		return contNo;
	}
	public void setContNo(int contNo) {
		this.contNo = contNo;
	}
	public String getContCategory() {
		return contCategory;
	}
	public void setContCategory(String contCategory) {
		this.contCategory = contCategory;
	}
	public String getContTitle() {
		return contTitle;
	}
	public void setContTitle(String contTitle) {
		this.contTitle = contTitle;
	}
	public String getContInfo() {
		return contInfo;
	}
	public void setContInfo(String contInfo) {
		this.contInfo = contInfo;
	}
	public String getContSource() {
		return contSource;
	}
	public void setContSource(String contSource) {
		this.contSource = contSource;
	}
	public String getContLink() {
		return contLink;
	}
	public void setContLink(String contLink) {
		this.contLink = contLink;
	}
	public String getContImgSource() {
		return contImgSource;
	}
	public void setContImgSource(String contImgSource) {
		this.contImgSource = contImgSource;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	
	public String getLikeYN() {
		return likeYN;
	}

	public void setLikeYN(String likeYN) {
		this.likeYN = likeYN;
	}

	@Override
	public String toString() {
		return "Content [contNo=" + contNo + ", contCategory=" + contCategory + ", contTitle=" + contTitle
				+ ", contInfo=" + contInfo + ", contSource=" + contSource + ", contLink=" + contLink + ", contImgSource="
				+ contImgSource + ", menuType=" + menuType + ", likeYN=" + likeYN + "]";
	}
	
}
