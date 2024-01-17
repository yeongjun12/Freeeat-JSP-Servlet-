package com.freeeat.notice.model.service;

import static com.freeeat.common.JDBCTemplate.close;
import static com.freeeat.common.JDBCTemplate.commit;
import static com.freeeat.common.JDBCTemplate.getConnection;
import static com.freeeat.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.notice.model.dao.NoticeDao;
import com.freeeat.notice.model.vo.Notice;
import com.freeeat.notice.model.vo.Qna;

public class NoticeService {

	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);

		return listCount;
		
	}

	public ArrayList<Qna> selectCsList(PageInfo pi) {

		Connection conn = getConnection();
		
		 ArrayList<Qna> list = new NoticeDao().selectCsList(conn, pi);
		 
		 close(conn);
		 
		 return list;
	
	
	}

	public int insertCs(Qna q) {
		
		Connection conn = getConnection();
		
		 int result = new NoticeDao().insertCs(conn, q);
		 
		 if(result>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 
		 
		 close(conn);
		 
		 return result;
		
	}
	//QnA 끝
	
	//공지사항
	
	public Notice selectNotice(int noticeNo) {

		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		
		close(conn);
		
		return n;
	}	

	
	// 공지사항 개수 조회
	public int selectNoticeListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectNoticeListCount(conn);
		
		close(conn);
		
		return listCount;		
	}
	
	// 공지사항 목록 조회
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn, pi);
		
		close(conn);
		
		return list;	
	}
	
	// 공지사항 삭제
	public int deleteNotice(ArrayList<Integer> noticeList) {
		Connection conn = getConnection();
		int result = 1;
		
		for (int noticeNo : noticeList) { // 반복문 돌면서 리스트만큼 
			result *= new NoticeDao().deleteNotice(conn, noticeNo);			
		}
		
		if (result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	// 공지사항 등록
	public int insertNotice(Notice notice) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, notice);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);		
		
		return result;
	}
	
	// 공지사항 글번호로 조회
	public Notice selectByNoticeNo(int noticeNo) {
		Connection conn = getConnection();
		
		Notice notice = new NoticeDao().selectByNoticeNo(conn, noticeNo);
		
		close(conn);
		
		return notice;
	}
	
	// 공지사항 수정
	public int updateNotice(Notice notice) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, notice);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
}
