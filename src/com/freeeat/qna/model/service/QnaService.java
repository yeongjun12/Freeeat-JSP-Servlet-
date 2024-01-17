package com.freeeat.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.freeeat.common.JDBCTemplate.*;
import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.notice.model.dao.NoticeDao;
import com.freeeat.qna.model.dao.QnaDao;
import com.freeeat.qna.model.vo.Qna;

public class QnaService {
	
	// 질문글 개수 조회
	public int selectQnaListCount() {
		Connection conn = getConnection();
		
		int listCount = new QnaDao().selectQnaListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	// 질문글 목록 조회
	public ArrayList<Qna> selectQnaList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Qna> list = new QnaDao().selectQnaList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	// 질문글 글번호로 조회
	public Qna selectByQnaNo(int QnaNo) {
		Connection conn = getConnection();
		
		Qna qna = new QnaDao().selectByQnaNo(conn, QnaNo);
		
		close(conn);
		
		return qna;
	}
	
	// 답변 없는 질문글 개수 조회 
	public int selectQnaAnswerNListCount() {
		Connection conn = getConnection();
		
		int listCount = new QnaDao().selectQnaAnswerNListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	// 답변 없는 질문글 목록 조회
	public ArrayList<Qna> selectQnaAnswerNList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Qna> list = new QnaDao().selectQnaAnswerNList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	// 질문글 삭제
	public int deleteQna(ArrayList<Integer> qnaList) {
		Connection conn = getConnection();
		int result = 1;
		
		for (int qnaNo : qnaList) { // 반복문 돌면서 리스트만큼 DB DELETE
			result *= new QnaDao().deleteQna(conn, qnaNo);			
		}
		
		if (result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	// 질문글 답변 / 수정
	public int answerQna(Qna qna) {
		Connection conn = getConnection();
		
		int result = new QnaDao().answerQna(conn, qna);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	
	
	
	

}
