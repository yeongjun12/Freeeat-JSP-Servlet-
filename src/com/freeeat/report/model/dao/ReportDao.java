package com.freeeat.report.model.dao;

import static com.freeeat.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.freeeat.common.model.vo.Photo;
import com.freeeat.feed.model.vo.Feed;
import com.freeeat.member.model.vo.Member;
import com.freeeat.place.model.dao.PlaceDao;
import com.freeeat.reply.model.vo.Reply;
import com.freeeat.report.model.vo.Report;
import com.freeeat.review.model.vo.Review;

public class ReportDao {

	Properties prop = new Properties();

	public ReportDao() {
		String fileName = PlaceDao.class.getResource("/sql/report/report-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//유경시작
	public ArrayList<Report> reportList(Connection conn) {

		ArrayList<Report> list = new ArrayList();

		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("reportList");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Report r = new Report();

				r.setReportNo(rset.getInt("REPORT_NO"));
				r.setReportMemId(rset.getString("MEM_ID"));
				r.setBoardNo(rset.getInt("BOARD_NO"));
				r.setReportReason(rset.getString("REPORT_REASON"));
				r.setReportDate(rset.getString("REPORT_DATE"));
				r.setReportCode(rset.getString("REPORT_CODE"));

				if (rset.getString("REPORT_RESULT") == null) {
					r.setReportResult("");
				} else {
					r.setReportResult(rset.getString("REPORT_RESULT"));
				}

				list.add(r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list; // 빈 list , 가득 찬 list
	}

	// 처리 대기중인 리스트 조회
	public ArrayList<Report> reportWaitList(Connection conn) {

		ArrayList<Report> list = new ArrayList();

		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("reportWaitList");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Report r = new Report();

				r.setReportNo(rset.getInt("REPORT_NO"));
				r.setReportMemId(rset.getString("MEM_ID"));
				r.setReportReason(rset.getString("REPORT_REASON"));
				r.setReportDate(rset.getString("REPORT_DATE"));
				r.setReportCode(rset.getString("REPORT_CODE"));
				if (rset.getString("REPORT_RESULT") == null) {
					r.setReportResult("");
				} else {
					r.setReportResult(rset.getString("REPORT_RESULT"));
				}

				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 처리 완료된 리스트 조회
	public ArrayList<Report> reportFinishList(Connection conn) {

		ArrayList<Report> list = new ArrayList();

		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("reportFinishList");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Report r = new Report();

				r.setReportNo(rset.getInt("REPORT_NO"));
				r.setReportMemId(rset.getString("MEM_ID"));
				r.setReportReason(rset.getString("REPORT_REASON"));
				r.setReportDate(rset.getString("REPORT_DATE"));
				r.setReportCode(rset.getString("REPORT_CODE"));
				if (rset.getString("REPORT_RESULT") == null) {
					r.setReportResult("");
				} else {
					r.setReportResult(rset.getString("REPORT_RESULT"));
				}
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 신고 테이블 상세 조회
	public Report reportSelect(Connection conn, int rno) {

		Report report = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reportSelect");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				report = new Report();

				report.setReportNo(rset.getInt("REPORT_NO"));
				report.setReportMemId(rset.getString("MEM_ID"));
				report.setBoardNo(rset.getInt("BOARD_NO"));
				report.setReportReason(rset.getString("REPORT_REASON"));
				report.setReportDate(rset.getString("REPORT_DATE"));
				report.setReportCode(rset.getString("REPORT_CODE"));
				if (rset.getString("REPORT_RESULT") == null) {
					report.setReportResult("");
				} else {
					report.setReportResult(rset.getString("REPORT_RESULT"));
				}
				report.setReportPlus(rset.getString("REPORT_PLUS"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return report;// 조회된 결과 있으면 객체, 없으면 null
	}

	// 피드 상세 조회
	public Feed feedSelect(Connection conn, int bno) {

		Feed feed = new Feed();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("feedSelect");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);

			rset = pstmt.executeQuery();
			if (rset.next()) {

				feed.setFeedNo(rset.getInt("FEED_NO"));
				feed.setFeedWriter(rset.getString("MEM_ID"));
				feed.setFeedTitle(rset.getString("FEED_TITLE"));
				feed.setFeedText(rset.getString("FEED_TEXT"));
				feed.setFeedTag(rset.getString("FEED_TAG"));
				if (rset.getString("FEED_TAG") == null) {
					feed.setFeedTag("");
				}
				feed.setFeedDeleted(rset.getString("FEED_DELETED"));
				feed.setFeedDate(rset.getString("FEED_DATE"));
				feed.setOriginName(rset.getString("ORIGIN_NAME"));
				feed.setChangeName(rset.getString("CHANGE_NAME"));
				feed.setFilePath(rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return feed;
	}

	// 리뷰 상세 조회
	public Review reviewSelect(Connection conn,int bno) {
		
		Review review = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reviewSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				review.setReviewNo(rset.getInt("REVIEW_NO"));
				review.setNickName(rset.getString("MEM_ID"));
				review.setPlaceNo(rset.getInt("PLACE_NO"));
				review.setReviewCount(rset.getInt("REVIEW_COUNT"));
				review.setReviewMenuType(rset.getString("REVIEW_MENU_TYPE"));
				review.setReviewContent(rset.getString("REVIEW_CONTENT"));
				review.setReviewCreateDate(rset.getDate("REVIEW_CREATE_DATE"));
				review.setReviewDelete(rset.getString("REVIEW_DELETED"));
				review.setPlaceName(rset.getString("PLACE_NAME"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return review;
	}
	
	public int reviewPhotoCheck(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reviewSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	// review photo 조회
	public ArrayList<Photo> reviewPhotoSelect(Connection conn, int bno){
		
		ArrayList<Photo> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reviewPhotoSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Photo photo = new Photo();
				photo.setPlacePhotoNo(rset.getInt("REVIEW_PHOTO_NO"));
				photo.setOriginName(rset.getString("ORIGIN_NAME"));
				photo.setChangeName(rset.getString("CHANGE_NAME"));
				photo.setFilePath(rset.getString("FILE_PATH"));
				
				list.add(photo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	// 댓글 상세 조회
	public Reply replySelect(Connection conn, int bno) {

		Reply reply = new Reply();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("replySelect");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				reply.setReplyNo(rset.getInt("REPLY_NO"));
				reply.setReplyContent(rset.getString("REPLY_CONTENT"));
				reply.setReplyDeleted(rset.getString("REPLY_DELETED"));
				reply.setFeedNo(rset.getInt("FEED_NO"));
				reply.setMemNickName(rset.getString("MEM_ID"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return reply; // 빈객체 또는 가득 차있는 객체
	}

	// 신고 취소
	public int reportCancel(Connection conn, int rno) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reportCancel");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rno);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 신고로 인한 글 삭제 > 처리 상태 변경
	public int reportResultUpdate(Connection conn, int rno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reportConfirm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 신고로 인한 피드/댓글/리뷰 삭제여부 컬럼 값 변경
	public int reprotOriginDelete(Connection conn, int bno, String code){
		
		int result = 0;
		Statement stmt = null;
		
		String sql = 
	               "UPDATE "+ code
	               + " SET " + code +"_DELETED = 'Y'"
	               + " WHERE " + code + "_NO = " + bno;
		try {
			stmt = conn.createStatement();
			
	        result = stmt.executeUpdate(sql);
	        
		} catch (SQLException e) {

			e.printStackTrace();
			
		}finally {
			close(stmt);
		}
		return result;		
	}
	
	// 리뷰 사진 테이블에서 status 변경
	public int reviewPhotoDelete(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reviewPhotoDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
//유경 끝
	
	
	
	
//	인호시작
	public int insertReport(Connection conn, Report report) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, report.getReportMemNo());
			pstmt.setInt(2, report.getBoardNo());
			pstmt.setString(3, report.getReportReason());
			pstmt.setString(4, report.getReportCode());
			pstmt.setString(5, report.getReportPlus());
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
// 인호 끝
	
	//매란
	public Member reportInsertMember(Connection conn, int reviewNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("reportInsertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				m = new Member();
				m.setMemNo(rset.getInt("MEM_NO"));
				m.setReviewNo(rset.getInt("REVIEW_NO"));
				m.setMemNickName(rset.getString("MEM_NICKNAME"));
				m.setMem_profile_savePath(rset.getString("REVIEW_CONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		
		return m;
	}
		
	public int reportReviewInsert(Connection conn, Report r ) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reportReviewInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getReportMemNo());
			pstmt.setInt(2, r.getBoardNo());
			pstmt.setString(3, r.getReportReason());
			pstmt.setString(4, r.getReportPlus());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
