package com.freeeat.qna.model.vo;

public class Qna {

	
	
	private int qnaNo; 			// QNA_NO	NUMBER	No		1	문의글번호
	private String qnaCategory; // QNA_CATEGORY	VARCHAR2(30 BYTE)	No		2	카테고리
	private String qnaTitle; 	// QNA_TITLE	VARCHAR2(50 BYTE)	No		3	문의글제목
	private String qnaWriter; 	// QNA_WRITER	VARCHAR2(20 BYTE)	No		4	작성자
	private String qnaDate; 	// QNA_DATE	DATE	No	SYSDATE 	5	등록일
	private String qnaQ; 		// QNA_Q	VARCHAR2(1000 BYTE)	No		6	문의글내용
	private String qnaA; 		// QNA_A	VARCHAR2(1000 BYTE)	Yes		7	답변내용
	private String ansYN; 		// ANS_YN	CHAR(1 BYTE)	No	'N' 	8	답변여부
	private String ansDate;		// ANS_DATE	DATE	Yes	SYSDATE	9	답변일
	private String isLocked; 	// IS_LOCKED	CHAR(1 BYTE)	No	'N' 	10	비밀글여부
	private String qnaPwd;		// QNA_PWD	CHAR(4 BYTE)	Yes		11	비밀번호
	private String qnaEmail; 	// QNA_EMAIL	VARCHAR2(20 BYTE)	No		12	작성자이메일
	public Qna() {
		super();
	}
	// 비밀글 아닌 질문글
	public Qna(int qnaNo, String qnaCategory, String qnaTitle, String qnaWriter, String qnaDate, String qnaQ,
			String qnaEmail) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTitle;
		this.qnaWriter = qnaWriter;
		this.qnaDate = qnaDate;
		this.qnaQ = qnaQ;
		this.qnaEmail = qnaEmail;
	}
	// 비밀글인 질문글
	public Qna(int qnaNo, String qnaCategory, String qnaTitle, String qnaWriter, String qnaDate, String qnaQ,
			String isLocked, String qnaPwd, String qnaEmail) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTitle;
		this.qnaWriter = qnaWriter;
		this.qnaDate = qnaDate;
		this.qnaQ = qnaQ;
		this.isLocked = isLocked;
		this.qnaPwd = qnaPwd;
		this.qnaEmail = qnaEmail;
	}
	// 답변 완료 후 질문글
	public Qna(int qnaNo, String qnaCategory, String qnaTitle, String qnaWriter, String qnaDate, String qnaQ,
			String qnaA, String ansYN, String ansDate, String isLocked, String qnaPwd, String qnaEmail) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTitle;
		this.qnaWriter = qnaWriter;
		this.qnaDate = qnaDate;
		this.qnaQ = qnaQ;
		this.qnaA = qnaA;
		this.ansYN = ansYN;
		this.ansDate = ansDate;
		this.isLocked = isLocked;
		this.qnaPwd = qnaPwd;
		this.qnaEmail = qnaEmail;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaQ() {
		return qnaQ;
	}
	public void setQnaQ(String qnaQ) {
		this.qnaQ = qnaQ;
	}
	public String getQnaA() {
		return qnaA;
	}
	public void setQnaA(String qnaA) {
		this.qnaA = qnaA;
	}
	public String getAnsYN() {
		return ansYN;
	}
	public void setAnsYN(String ansYN) {
		this.ansYN = ansYN;
	}
	public String getAnsDate() {
		return ansDate;
	}
	public void setAnsDate(String ansDate) {
		this.ansDate = ansDate;
	}
	public String getIsLocked() {
		return isLocked;
	}
	public void setIsLocked(String isLocked) {
		this.isLocked = isLocked;
	}
	public String getQnaPwd() {
		return qnaPwd;
	}
	public void setQnaPwd(String qnaPwd) {
		this.qnaPwd = qnaPwd;
	}
	public String getQnaEmail() {
		return qnaEmail;
	}
	public void setQnaEmail(String qnaEmail) {
		this.qnaEmail = qnaEmail;
	}
	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaCategory=" + qnaCategory + ", qnaTitle=" + qnaTitle + ", qnaWriter="
				+ qnaWriter + ", qnaDate=" + qnaDate + ", qnaQ=" + qnaQ + ", qnaA=" + qnaA + ", ansYN=" + ansYN
				+ ", ansDate=" + ansDate + ", isLocked=" + isLocked + ", qnaPwd=" + qnaPwd + ", qnaEmail=" + qnaEmail
				+ "]";
	}
	
	
	
	
	
	
	
	
	
}