package com.freeeat.feed.model.service;

import static com.freeeat.common.JDBCTemplate.*;
import static com.freeeat.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.freeeat.feed.model.dao.FeedDao;
import com.freeeat.feed.model.vo.Feed;

public class FeedService {
	
	// 성경 시작
	public int selectLastFeedCount() {
		Connection conn = getConnection();
		
		int result = new FeedDao().selectLastFeedCount(conn);
		
		close(conn);
		
		return result;
	}
	
	
	
	public Feed selectFeed(int fno) {
		Connection conn = getConnection();
		
		Feed feed = new FeedDao().selectFeed(conn, fno);
		
		close(conn);
		
		return feed;
	}
	
	// 성경 끝
	
	//영준시작

	   public ArrayList<Feed> selectFeedImage(int memNo){
		      
		      Connection conn = getConnection();
		      
		      ArrayList<Feed> feed = new FeedDao().selectFeedImage(conn,memNo);
		      
		      close(conn);
		      
		      return feed;
		   
		      
		   }
		   
		   public int selectFeedCount(int memNo) {
		      
		      Connection conn = getConnection();
		      
		      
		      int count = new FeedDao().selectFeedCount(conn,memNo);
		      
		      close(conn);
		      
		      return count;
		      
		      
		      
		   }
	//영준끝
		   
		   //인호시작
			public ArrayList<Feed> selectFeedList() {
				
				Connection conn = getConnection();
				ArrayList<Feed> list = new FeedDao().selectFeedList(conn);
				
				close(conn);
				
				return list;
			}


			public ArrayList<Feed> selectFeedByTagList(String tagName) {
				
				Connection conn = getConnection();
				ArrayList<Feed> list = new FeedDao().selectFeedByTagList(conn, tagName);
				
				close(conn);
				
				return list;
			}


			public ArrayList<Feed> selectFeedByFollowList(int memNo1) {
				
				Connection conn = getConnection();
				ArrayList<Feed> list = new FeedDao().selectFeedByFollowList(conn, memNo1);
				
				close(conn);
				
				
				return list;
			}

			public int insertFeed(Feed f) {
				
				Connection conn = getConnection();
				
				int result = new FeedDao().insertFeed(conn, f);
				
				if (result > 0) {
					commit(conn);
				} else {
					rollback(conn);
				}
				close(conn);
				
				return result;
			}

			public int updateFeed(Feed f) {
				
				Connection conn = getConnection();
				
				int result = new FeedDao().updateFeed(conn, f);
				
				if (result > 0) {
					commit(conn);
				} else {
					rollback(conn);
				}
				close(conn);
				
				return result;
			}


			public int deleteFeed(int feedNo) {
				
				Connection conn = getConnection();
				
				int result = new FeedDao().deleteFeed(conn, feedNo);
				
				if(result > 0) {
					commit(conn);
				} else {
					rollback(conn);
				}
				return result;
			}
			public int insertFeedLike(int memNo, int feedNo) {

				Connection conn = getConnection();
				
				int result = new FeedDao().insertFeedLike(conn, memNo, feedNo);
				
				if(result > 0) commit(conn);
				else rollback(conn);
				
				return result;
			}



			public int deleteFeedLike(int memNo, int feedNo) {

				Connection conn = getConnection();
				
				int result = new FeedDao().deleteFeedLike(conn, memNo, feedNo);
				
				if(result > 0) commit(conn);
				else rollback(conn);
				
				return result;
				
				
			}

		   //인호 끝
}
