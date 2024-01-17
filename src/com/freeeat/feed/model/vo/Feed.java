package com.freeeat.feed.model.vo;

public class Feed {
	
	
	private int feedNo; 			//FEED_NO	NUMBER
	private int memNo;				//MEM_NO	NUMBER
	private String feedTitle; 		// FEED_TITLE	VARCHAR2(200 BYTE)	No		3	피드내용
	private String feedText;		//FEED_TEXT	VARCHAR2(200 BYTE)
	private String feedTag;			//FEED_TAG	VARCHAR2(200 BYTE)
	private String feedDeleted;		//FEED_DELETED	CHAR(1 BYTE)
	private String feedDate;		//FEED_DATE	DATE
	private int likeCount;			//LIKE_COUNT	NUMBER
	private String originName;		//ORIGIN_NAME	VARCHAR2(255 BYTE)
	private String changeName;		//CHANGE_NAME	VARCHAR2(255 BYTE)
	private String filePath;		//FILE_PATH	VARCHAR2(1000 BYTE)
	private String feedWriter;		//피드창에 보여줄 memNickname
	private String userPhoto;		//피드창에 보여줄 사진 경로 + changed사진 이름
	private int FeedCount; //마이페이지에서 게시글 수를 보여줌
	public Feed() {
		super();
	}
	public Feed(int feedNo, int memNo, String feedTitle, String feedText, String feedTag, String feedDeleted,
			String feedDate, int likeCount, String originName, String changeName, String filePath, String feedWriter,
			String userPhoto) {
		super();
		this.feedNo = feedNo;
		this.memNo = memNo;
		this.feedTitle = feedTitle;
		this.feedText = feedText;
		this.feedTag = feedTag;
		this.feedDeleted = feedDeleted;
		this.feedDate = feedDate;
		this.likeCount = likeCount;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.feedWriter = feedWriter;
		this.userPhoto = userPhoto;
	}
	
	public Feed(int feedNo, int memNo, String feedTitle, String feedText, String feedTag, String feedDeleted,
			String feedDate, int likeCount, String originName, String changeName, String filePath, String feedWriter,
			String userPhoto, int feedCount) {
		super();
		this.feedNo = feedNo;
		this.memNo = memNo;
		this.feedTitle = feedTitle;
		this.feedText = feedText;
		this.feedTag = feedTag;
		this.feedDeleted = feedDeleted;
		this.feedDate = feedDate;
		this.likeCount = likeCount;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.feedWriter = feedWriter;
		this.userPhoto = userPhoto;
		FeedCount = feedCount;
	}
	public int getFeedNo() {
		return feedNo;
	}
	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getFeedTitle() {
		return feedTitle;
	}
	public void setFeedTitle(String feedTitle) {
		this.feedTitle = feedTitle;
	}
	public String getFeedText() {
		return feedText;
	}
	public void setFeedText(String feedText) {
		this.feedText = feedText;
	}
	public String getFeedTag() {
		return feedTag;
	}
	public void setFeedTag(String feedTag) {
		this.feedTag = feedTag;
	}
	public String getFeedDeleted() {
		return feedDeleted;
	}
	public void setFeedDeleted(String feedDeleted) {
		this.feedDeleted = feedDeleted;
	}
	public String getFeedDate() {
		return feedDate;
	}
	public void setFeedDate(String feedDate) {
		this.feedDate = feedDate;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
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
	public String getFeedWriter() {
		return feedWriter;
	}
	public void setFeedWriter(String feedWriter) {
		this.feedWriter = feedWriter;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	
	public int getFeedCount() {
		return FeedCount;
	}
	public void setFeedCount(int feedCount) {
		FeedCount = feedCount;
	}
	@Override
	public String toString() {
		return "Feed [feedNo=" + feedNo + ", memNo=" + memNo + ", feedTitle=" + feedTitle + ", feedText=" + feedText
				+ ", feedTag=" + feedTag + ", feedDeleted=" + feedDeleted + ", feedDate=" + feedDate + ", likeCount="
				+ likeCount + ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", feedWriter=" + feedWriter + ", userPhoto=" + userPhoto + ", FeedCount=" + FeedCount + "]";
	}

	
}