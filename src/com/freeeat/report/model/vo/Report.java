package com.freeeat.report.model.vo;

public class Report {
	
	private int reportNo; //REPORT_NO	NUMBER	No		1	신고번호
	private int reportMemNo; //REPORT_MEM_NO	NUMBER	No		2	신고자회원번호
	private int boardNo; //BOARD_NO	NUMBER	No		3	신고당한글번호
	private String reportReason; //REPORT_REASON	VARCHAR2(200 BYTE)	Yes	'스팸/홍보/도배글입니다.'	4	신고사유
	private String reportDate; //REPORT_DATE	DATE	No	SYSDATE 	5	신고일자
	private String reportCode; //REPORT_CODE	VARCHAR2(10 BYTE)	No	'피드' 	6	신고코드(피드/댓글/리뷰)
	private String reportResult; //REPORT_RESULT	CHAR(1 BYTE)	Yes		7	처리내용(삭제D/유지U)
	private String reportPlus; //REPORT_PLUS	VARCHAR2(1000 BYTE)	No		8	추가사유
	private String reportMemId;
	private String reportedFeedWriter; // 신고할 글 작성지
	private String reportedFeedText; // 신고할 글 내용
	

	
	public Report() {
		super();
	}
	
	public Report(int reportNo, int reportMemNo, int boardNo, String reportReason, String reportDate, String reportCode,
			String reportResult, String reportPlus, String reportMemId) {
		super();
		this.reportNo = reportNo;
		this.reportMemNo = reportMemNo;
		this.boardNo = boardNo;
		this.reportReason = reportReason;
		this.reportDate = reportDate;
		this.reportCode = reportCode;
		this.reportResult = reportResult;
		this.reportPlus = reportPlus;
		this.reportMemId = reportMemId;
	}
	
	
	public Report(int reportNo, int reportMemNo, int boardNo, String reportReason, String reportDate, String reportCode,
			String reportResult, String reportPlus, String reportedFeedWriter, String reportedFeedText) {
		super();
		this.reportNo = reportNo;
		this.reportMemNo = reportMemNo;
		this.boardNo = boardNo;
		this.reportReason = reportReason;
		this.reportDate = reportDate;
		this.reportCode = reportCode;
		this.reportResult = reportResult;
		this.reportPlus = reportPlus;
		this.reportedFeedWriter = reportedFeedWriter;
		this.reportedFeedText = reportedFeedText;
	}
	
	



	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getReportMemNo() {
		return reportMemNo;
	}
	public void setReportMemNo(int reportMemNo) {
		this.reportMemNo = reportMemNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getReportReason() {
		return reportReason;
	}
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportCode() {
		return reportCode;
	}
	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}
	public String getReportResult() {
		return reportResult;
	}
	public void setReportResult(String reportResult) {
		this.reportResult = reportResult;
	}
	public String getReportPlus() {
		return reportPlus;
	}
	public void setReportPlus(String reportPlus) {
		this.reportPlus = reportPlus;
	}
	public String getReportMemId() {
		return reportMemId;
	}
	public void setReportMemId(String reportMemId) {
		this.reportMemId = reportMemId;
	}
	
	public String getReportedFeedWriter() {
		return reportedFeedWriter;
	}

	public void setReportedFeedWriter(String reportedFeedWriter) {
		this.reportedFeedWriter = reportedFeedWriter;
	}

	public String getReportedFeedText() {
		return reportedFeedText;
	}

	public void setReportedFeedText(String reportedFeedText) {
		this.reportedFeedText = reportedFeedText;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportMemNo=" + reportMemNo + ", boardNo=" + boardNo
				+ ", reportReason=" + reportReason + ", reportDate=" + reportDate + ", reportCode=" + reportCode
				+ ", reportResult=" + reportResult + ", reportPlus=" + reportPlus + ", reportMemId=" + reportMemId
				+ ", reportedFeedWriter=" + reportedFeedWriter + ", reportedFeedText=" + reportedFeedText + "]";
	}


	
	
	
}