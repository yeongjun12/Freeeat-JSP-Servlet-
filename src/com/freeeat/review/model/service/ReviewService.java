package com.freeeat.review.model.service;

import static com.freeeat.common.JDBCTemplate.close;
import static com.freeeat.common.JDBCTemplate.commit;
import static com.freeeat.common.JDBCTemplate.getConnection;
import static com.freeeat.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.freeeat.common.JDBCTemplate;
import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.common.model.vo.Photo;
import com.freeeat.place.model.vo.Tag;
import com.freeeat.review.model.dao.ReviewDao;
import com.freeeat.review.model.vo.Review;

public class ReviewService {

	// 전체 리뷰 목록 개수 조회
	public int selectReviewListAllCount() {
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectReviewListAllCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	// 전체 리뷰 목록 조회 
	public ArrayList<Review> selectReviewListAll(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectReviewListAll(conn, pi);
				
		close(conn);
		
		return list;
	}
	
	// 리뷰 목록 개수 조회
	public int selectReviewListCount(String del) {
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectReviewListCount(conn, del);
		
		close(conn);
		
		return listCount;
	}
	
	// 리뷰 목록 조회 
	public ArrayList<Review> selectReviewList(PageInfo pi, String del) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectReviewList(conn, pi, del);
				
		close(conn);
		
		return list;
	}
	
	// 리뷰 번호로 리뷰 조회
	public Review selectReviewByReviewNo(int reviewNo) {
		Connection conn = getConnection();
		
		Review review = new ReviewDao().selectReviewByReviewNo(conn, reviewNo);
		
		close(conn);
		
		return review;		
	}
	
	// 리뷰 번호로 리뷰 사진 조회
	public ArrayList<Photo> selectReviewPhoto(int reviewNo) {
		Connection conn = getConnection();
		
		ArrayList<Photo> list = new ReviewDao().selectReviewPhoto(conn, reviewNo);
		
		close(conn);
		
		return list;
	}
	
	// 키워드로 리뷰 개수 조회
	public int searchReviewByKeywordCount(String keyword) {
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().searchReviewByKeywordCount(conn, keyword);
		
		close(conn);
		
		return listCount;
	}
	
	// 키워드로 리뷰 목록 조회
	public ArrayList<Review> searchReviewByKeyword(String keyword, PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().searchReviewByKeyword(conn, keyword, pi);
		
		close(conn);
		
		return list;
	}
	
	//성경 끝
	
	//영준 시작
		
		public ArrayList<Review> selectReview(int memNo, PageInfo pi){
			
			
			Connection conn = getConnection();
			
			ArrayList<Review> review = new ReviewDao().selectReview(conn,memNo,pi);
			
			
			close(conn);
			
			return review;

			
		}
		
		public int deleteReview(int reviewNo) {
			
			Connection conn = getConnection();
			
			int result = new ReviewDao().deleteReview(conn,reviewNo);
			

			if(result > 0) { //성공
				commit(conn);
				
			} else { // 실패
			rollback(conn);
			}
			
			close(conn);
			
			
			return result;
		}
		
		public int deleteReviewPhoto(int reviewNo) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new ReviewDao().deleteReviewPhoto(conn,reviewNo);
			
			if(result > 0) { //성공
				commit(conn);
				
			} else { // 실패
				rollback(conn);
			}
			
			close(conn);
			
			return result;
			
		}
		
		public ArrayList<Tag> selectTag(int memNo){
			
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Tag> tag = new ReviewDao().selectTag(conn,memNo);
			
			close(conn);
			
			return tag;
			
			
			
		}
		
		
	   public int selectMemReviewCount(int memNo) {
		      Connection conn = getConnection();
		      
		      int listCount = new ReviewDao().selectMemReviewCount(conn, memNo);
		      
		      close(conn);
		      
		      return listCount;
		   }
	   public int deleteTag(int reviewNo) {
		      
		      Connection conn = JDBCTemplate.getConnection();
		      
		      int result = new ReviewDao().deleteTag(conn,reviewNo);
		      
		      if(result > 0) { //성공
		         commit(conn);
		         
		      } else { // 실패
		         rollback(conn);
		      }
		      
		      close(conn);
		      
		      return result;   
		   }
	//영준 끝
}
