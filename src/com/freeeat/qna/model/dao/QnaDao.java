package com.freeeat.qna.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.freeeat.common.JDBCTemplate.*;
import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.qna.model.vo.Qna;

public class QnaDao {

	private Properties prop = new Properties();
	
	public QnaDao() {
		String file = QnaDao.class.getResource("/sql/qna/qna-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 질문글 개수 조회
	public int selectQnaListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selecQnaListCount");
		
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
	
	// 질문글 목록 조회
	public ArrayList<Qna> selectQnaList(Connection conn, PageInfo pi) {
		ArrayList<Qna> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna qna = new Qna();
				qna.setQnaNo(rset.getInt("QNA_NO"));
				qna.setQnaCategory(rset.getString("QNA_CATEGORY"));
				qna.setQnaTitle(rset.getString("QNA_TITLE"));
				qna.setQnaWriter(rset.getString("QNA_WRITER"));
				qna.setQnaDate(rset.getString("QNA_DATE").substring(0, 10));
				if (rset.getString("ANS_YN").equals("Y")) qna.setAnsYN("답변완료");
				else qna.setAnsYN("미답변");
				if (rset.getString("ANS_DATE") == null) qna.setAnsDate("");
				else qna.setAnsDate(rset.getString("ANS_DATE").substring(0, 10));
				qna.setIsLocked(rset.getString("IS_LOCKED"));
				list.add(qna);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 질문글 글번호로 조회
	public Qna selectByQnaNo(Connection conn, int QnaNo) {
		Qna qna = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectByQnaNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, QnaNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				qna = new Qna();
				qna.setQnaNo(rset.getInt("QNA_NO"));
				qna.setQnaCategory(rset.getString("QNA_CATEGORY"));
				qna.setQnaTitle(rset.getString("QNA_TITLE"));
				qna.setQnaWriter(rset.getString("QNA_WRITER"));
				qna.setQnaDate(rset.getString("QNA_DATE").substring(0, 10));
				qna.setQnaQ(rset.getString("QNA_Q"));
				qna.setQnaA(rset.getString("QNA_A"));
				if (rset.getString("ANS_YN").equals("Y")) qna.setAnsYN("답변완료");
				else qna.setAnsYN("미답변");
				if (rset.getString("ANS_DATE") == null) qna.setAnsDate("");
				else qna.setAnsDate(rset.getString("ANS_DATE").substring(0, 10));
				qna.setIsLocked(rset.getString("IS_LOCKED"));
				qna.setQnaPwd(rset.getString("QNA_PWD"));
				qna.setQnaEmail(rset.getString("QNA_EMAIL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qna;
	}
	
	// 답변 없는 질문글 개수 조회 
	public int selectQnaAnswerNListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaAnswerNListCount");
		
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
	
	// 답변 없는 질문글 목록 조회
	public ArrayList<Qna> selectQnaAnswerNList(Connection conn, PageInfo pi) {
		ArrayList<Qna> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnaAnswerNList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qna qna = new Qna();
				qna.setQnaNo(rset.getInt("QNA_NO"));
				qna.setQnaCategory(rset.getString("QNA_CATEGORY"));
				qna.setQnaTitle(rset.getString("QNA_TITLE"));
				qna.setQnaWriter(rset.getString("QNA_WRITER"));
				qna.setQnaDate(rset.getString("QNA_DATE").substring(0, 10));
				if (rset.getString("ANS_YN").equals("Y")) qna.setAnsYN("답변완료");
				else qna.setAnsYN("미답변");
				if (rset.getString("ANS_DATE") == null) qna.setAnsDate("");
				else qna.setAnsDate(rset.getString("ANS_DATE").substring(0, 10));
				qna.setIsLocked(rset.getString("IS_LOCKED"));
				list.add(qna);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 질문글 삭제
	public int deleteQna(Connection conn, int qnaNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qnaNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}
	
	// 질문글 답변 / 수정
	public int answerQna(Connection conn, Qna qna) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("answerQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qna.getQnaA());
			pstmt.setInt(2, qna.getQnaNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
}
