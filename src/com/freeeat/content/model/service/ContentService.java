package com.freeeat.content.model.service;

import static com.freeeat.common.JDBCTemplate.close;
import static com.freeeat.common.JDBCTemplate.commit;
import static com.freeeat.common.JDBCTemplate.getConnection;
import static com.freeeat.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.content.model.dao.ContentDao;
import com.freeeat.content.model.vo.Content;

public class ContentService {

	//추천 콘텐츠
	public ArrayList<Content> selectRecommList(String keyword) {
		
		Connection conn = getConnection();
		
		 ArrayList<Content> Clist = new ContentDao().selectRecommList(conn, keyword);
		 
		 close(conn);
		 
		 return Clist;
	}
	
	// 콘텐츠 개수 조회 - 페이징 처리위해 전체 콘텐츠 목록 카운트
	public int selectContentListCount() {
		Connection conn = getConnection();
		
		int listCount = new ContentDao().selectContentListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	// 콘텐츠 목록조회
	public ArrayList<Content> selectContentList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Content> list = new ContentDao().selectContentList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	// 콘텐츠 등록
	public int insertContent(Content cont) {
		Connection conn = getConnection();
		
		int result = new ContentDao().insertContent(conn, cont);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	// 콘텐츠 조회 - 콘텐츠 수정 위해 콘텐츠 번호로 조회
	public Content selectByContNo(int contNo) {
		Connection conn = getConnection();
		
		Content cont = new ContentDao().selectByContNo(conn, contNo);
		
		close(conn);
		
		return cont;
	}
	
	// 콘텐츠 수정
	public int updateContent(Content cont) {
		Connection conn = getConnection();
		
		int result = new ContentDao().updateContent(conn, cont);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	// 콘텐츠 개수 조회 - 카테고리별
	public int selectContentListCountByCategory(String cate) {
		Connection conn = getConnection();
		
		int listCount = new ContentDao().selectContentListCountByCategory(conn, cate);
		
		close(conn);
		
		return listCount;
	}
	
	// 콘텐츠 목록조회 - 카테고리별
	public ArrayList<Content> selectContentListByCategory(PageInfo pi, String cate) {
		Connection conn = getConnection();
		
		ArrayList<Content> list = new ContentDao().selectContentListByCategory(conn, pi, cate);
		
		close(conn);
		
		return list;
	}
	
	// 콘텐츠 좋아요 등록
	public int insertContentLike(int memNo, int contNo) {
		Connection conn = getConnection();
		
		int result = new ContentDao().insertContentLike(conn, memNo, contNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
	// 콘텐츠 좋아요 삭제
	public int deleteContentLike(int memNo, int contNo) {
		Connection conn = getConnection();
		
		int result = new ContentDao().deleteContentLike(conn, memNo, contNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
	// 콘텐츠 좋아요 목록 조회
	public ArrayList<Integer> selectContentLikeList(int memNo) {
		Connection conn = getConnection();
		
		ArrayList<Integer> likeList = new ContentDao().selectContentLikeList(conn, memNo);
		
		close(conn);
		
		return likeList;
	}
	// 콘텐츠 삭제 
	public int deleteContent(int cno) {
		Connection conn = getConnection();
		
		// 콘텐츠에 딸린 좋아요 삭제
		int result1 = new ContentDao().deleteContentAllLike(conn, cno);
		
		// 콘텐츠 삭제
		int result2 = new ContentDao().deleteContent(conn, cno);
		
		
		if(result1 + result2 > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result1 + result2;		
	}

}
