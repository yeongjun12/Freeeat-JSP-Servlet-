package com.freeeat.report.model.service;

import static com.freeeat.common.JDBCTemplate.close;
import static com.freeeat.common.JDBCTemplate.commit;
import static com.freeeat.common.JDBCTemplate.getConnection;
import static com.freeeat.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.freeeat.common.model.vo.Photo;
import com.freeeat.feed.model.vo.Feed;
import com.freeeat.member.model.vo.Member;
import com.freeeat.reply.model.vo.Reply;
import com.freeeat.report.model.dao.ReportDao;
import com.freeeat.report.model.vo.Report;
import com.freeeat.review.model.vo.Review;


public class ReportService {

	//유경시작
	// 전체 리스트 조회
		public ArrayList<Report> reportList(String sort){
			
			Connection conn = getConnection();
			ArrayList<Report> list = null;
			
			if(sort.equals("wait")) { // sort가 전체(all)면 , 처리 대기(wait), 처리 완료(finish)
				list = new ReportDao().reportWaitList(conn);
			}else if(sort.equals("finish")){
				list = new ReportDao().reportFinishList(conn);
			}else {
				list = new ReportDao().reportList(conn);
			}

			close(conn);
					
			return list;
		}
		
		// report 상세조회
		public Report reportSelect(int rno) {
			
			Connection conn = getConnection();
			Report report = new ReportDao().reportSelect(conn, rno);
			close(conn);
			return report;
		}
		
		// feed 상세조회
		public Feed feedSelect(int bno, int rno) {
			
			Connection conn = getConnection();
			int result = 0;
			Feed feed = new ReportDao().feedSelect(conn, bno);
			
			if(feed.getFeedDeleted().equals("Y")) { // 관리자가 처리하기 전에 원본 글이 삭제되었을 경우, 처리 컬럼 값을 변경해주어야함 
				result = new ReportDao().reportResultUpdate(conn,rno);
				if(result > 0) commit(conn);
				else rollback(conn);
			}
			close(conn);
			return feed;
		}
		
		// review 상세 조회
		public Review reviewSelect(int bno){
			Connection conn = getConnection();
			Review review = new ReportDao().reviewSelect(conn, bno);// 빈 객체 또는 내용있는 객체
			close(conn);
			return review;
		}
		// 사진 유무 조회
		public int reviewPhotoCheck(int bno) {
			Connection conn = getConnection();
			int result = new ReportDao().reviewPhotoCheck(conn, bno);
			close(conn);
			return result;
		}
		// review photo 상세 조회
		public ArrayList<Photo> reviewPhotoSelect(int bno){
			
			Connection conn = getConnection();
			ArrayList<Photo> list = new ReportDao().reviewPhotoSelect(conn, bno); // 비어있는 리스트 또는 photo 객체가 있는 리스트
			
			close(conn);
			return list;
		}
		// reply 상세 조회
		public Reply replySelect(int bno, int rno) {
			
			Connection conn = getConnection();
			
			Reply reply = new ReportDao().replySelect(conn, bno);
			
			if(reply.getReplyDeleted().equals("Y")) { // 관리자가 처리하기 전에 원본 글이 삭제되었을 경우, 처리 컬럼 값을 변경해주어야함 
				int result = new ReportDao().reportResultUpdate(conn,rno);
				if(result > 0) commit(conn);
				else rollback(conn);
			}
			close(conn);
			return reply;
		}
		
		// 신고 취소
		public int reportCancel(int rno) {
			
			Connection conn = getConnection();
			
			int result = new ReportDao().reportCancel(conn, rno);
			
			if(result > 0) commit(conn);
			else rollback(conn);
			
			close(conn);
			return result;
		}
		
		// 신고로 인한 삭제 
		public int reportConfirm(int rno, int bno, String  code){
			
			Connection conn = getConnection();
			int result1 = new ReportDao().reportResultUpdate(conn, rno); // > report 처리 컬럼 값 변경
			int result2 = new ReportDao().reprotOriginDelete(conn, bno, code); // 게시글 삭제
			int result3 = 1; // 리뷰 사진만 지우면되는데 댓글이랑 피드는 사진 테이블 없어서 안해도 된다.
			
			System.out.println("result1 : " + result1 );
			System.out.println("result2 : " + result2);
			// 리뷰 사진 테이블 status 변경해줘야함 / 사진 있을 수도, 없을 수도 
			
			if(code.equals("REVIEW") && (reviewPhotoCheck(bno)!= 0)) {
				result3 = new ReportDao().reviewPhotoDelete(conn, bno);
				System.out.println("result3 : " + result3 );
			}
			
			if((result1*result2*result3) > 0) {
				commit(conn);
			}
			else {
				rollback(conn);
			}

			close(conn);
			return (result1*result2*result3);
		}
	
	//인호시작
	public int insertReport(Report report) {
		
		Connection conn = getConnection();
		
		int result = new ReportDao().insertReport(conn, report);
		
		if (result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	//인호 끝
	
	//매란
	public Member reportInsertMember(int reviewNo) {
		
		Connection conn = getConnection();
		
		Member m = new ReportDao().reportInsertMember(conn, reviewNo);
		
		close(conn);
		
		return m;
	}
	
	public int reportReviewInsert(Report r) {
		Connection conn = getConnection();
		
		int result = new ReportDao().reportReviewInsert(conn, r);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
}
