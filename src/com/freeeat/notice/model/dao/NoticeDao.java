package com.freeeat.notice.model.dao;

import static com.freeeat.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.notice.model.vo.Notice;
import com.freeeat.notice.model.vo.Qna;
import com.freeeat.place.model.dao.PlaceDao;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = PlaceDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//	여기부터 Qna
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectListCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;

	}

	public ArrayList<Qna> selectCsList(Connection conn, PageInfo pi) {

	    ArrayList<Qna> list = new ArrayList();
	    
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Qna q = new Qna();
				
				q.setQnaNo(rset.getInt("QNA_NO"));
				q.setIsLocked(rset.getString("IS_LOCKED"));
				q.setQnaCategory(rset.getString("QNA_CATEGORY"));
				q.setQnaTitle(rset.getString("QNA_TITLE"));
				q.setQnaWriter(rset.getString("QNA_WRITER"));
				q.setQnaDate(rset.getString("QNA_DATE"));
				q.setQnaQ(rset.getString("QNA_Q"));
				q.setQnaA(rset.getString("QNA_A"));
				q.setAnsDate(rset.getString("ANS_DATE"));
				q.setAnsYN(rset.getString("ANS_YN"));
				q.setQnaPwd(rset.getString("QNA_PWD"));
				q.setQnaEmail(rset.getString("QNA_EMAIL"));
				
				list.add(q);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	

	}

	public int insertCs(Connection conn, Qna q) {

		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCs");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,q.getQnaCategory());
			pstmt.setString(2, q.getQnaTitle());
			pstmt.setString(3, q.getQnaWriter());
			pstmt.setString(4, q.getQnaQ());
			pstmt.setString(5, q.getIsLocked());
			pstmt.setString(6, q.getQnaPwd());
			pstmt.setString(7, q.getQnaEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result; 
	}
// Qna 끝
	

	public Notice selectNotice(Connection conn, int noticeNo) {

	
		Notice n = new Notice();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				// n = new Notice();
				n.setNoticeNo(rset.getInt("NOTICE_NO"));
				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				n.setNoticeCont(rset.getString("NOTICE_CONT"));
				n.setNoticeDate((rset.getString("NOTICE_DATE")).substring(0, 10));
				n.setMemNickname(rset.getString("MEM_NICKNAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return n;
	}

	// 공지사항 개수 조회
		public int selectNoticeListCount(Connection conn) {
			
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectNoticeListCount");
			
			
			try {	
				
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				if (rset.next()) {
					listCount = rset.getInt("COUNT(*)");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}	
			
			return listCount;
		}
		
		// 공지사항 목록 조회
		public ArrayList<Notice> selectNoticeList(Connection conn, PageInfo pi) {
			ArrayList<Notice> list = new ArrayList();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectNoticeList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Notice notice = new Notice();
					notice.setNoticeNo(rset.getInt("NOTICE_NO"));
					notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
					notice.setMemNickname(rset.getString("MEM_NICKNAME"));
					notice.setNoticeDate(rset.getString("NOTICE_DATE"));
					list.add(notice);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}
		
		// 공지사항 삭제
		public int deleteNotice(Connection conn, int noticeNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteNotice");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, noticeNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
					
			return result;
		}
		
		// 공지사항 등록
		public int insertNotice(Connection conn, Notice notice) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertNotice");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, notice.getNoticeTitle());
				pstmt.setString(2, notice.getNoticeCont());
				pstmt.setInt(3, notice.getMemNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		// 공지사항 글번호로 조회
		public Notice selectByNoticeNo(Connection conn, int noticeNo) {
			Notice notice = new Notice();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectByNoticeNo");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, noticeNo);
				
				rset = pstmt.executeQuery();
				
				if (rset.next()) {
					notice.setNoticeNo(rset.getInt("NOTICE_NO"));
					notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
					notice.setNoticeCont(rset.getString("NOTICE_CONT"));
					notice.setMemNickname(rset.getString("MEM_NICKNAME"));
					notice.setNoticeDate(rset.getString("NOTICE_DATE"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
				
			return notice;
		}
		
		// 공지사항 수정
		public int updateNotice(Connection conn, Notice notice) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateNotice");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, notice.getNoticeTitle());
				pstmt.setString(2, notice.getNoticeCont());
				pstmt.setInt(3, notice.getNoticeNo());
							
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
}
