package com.freeeat.feed.model.dao;

import static com.freeeat.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.freeeat.feed.model.vo.Feed;

public class FeedDao {
	
	private Properties prop = new Properties();
	private String file = FeedDao.class.getResource("/sql/feed/feed-mapper.xml").getPath();
	
	public FeedDao() {
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 성경 시작
	
	public int selectLastFeedCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastFeedCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt("COUNT(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	public Feed selectFeed(Connection conn, int fno) {
		Feed feed = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFeed");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fno);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				feed = new Feed();
				
				feed.setFeedNo(rset.getInt("FEED_NO"));
				feed.setMemNo(rset.getInt("MEM_NO"));
				feed.setFeedWriter(rset.getString("MEM_NICKNAME"));
				feed.setFeedTitle(rset.getString("FEED_TITLE"));
				feed.setFeedText(rset.getString("FEED_TEXT"));
				if (rset.getString("FEED_TAG") == null) feed.setFeedTag("");
				else feed.setFeedTag(rset.getString("FEED_TAG"));
				feed.setFeedDeleted(rset.getString("FEED_DELETED"));
				feed.setFeedDate(rset.getString("FEED_DATE").substring(0, 10));
				feed.setLikeCount(rset.getInt("LIKE_COUNT"));
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
	
	// 성경 끝
	
	public ArrayList<Feed> selectFeedImage(Connection conn,int memNo){
	      
	      ArrayList<Feed> feed = new ArrayList();
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("selectFeedImage");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, memNo);
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            Feed f = new Feed();
	            f.setChangeName(rset.getString("CHANGE_NAME"));
	            f.setFilePath(rset.getString("FILE_PATH"));
	            feed.add(f);
	      
	         }
	         
	         System.out.println(feed);
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      
	      return feed;
	      
	   }
	   
	   public int selectFeedCount(Connection conn, int memNo) {
	      
	      
	      int count = 0;
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("selectFeedCount");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, memNo);
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            Feed f = new Feed();
	            
	            count = rset.getInt("COUNT(*)");
	            
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      return count;
	   }
	
	   
	   //인호 시작
		public int insertFeed(Connection conn, Feed f) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertFeed");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, f.getMemNo());
				pstmt.setString(2, f.getFeedTitle());
				pstmt.setString(3, f.getFeedText());
				pstmt.setString(4, f.getFeedTag()); // 여러개가 올 수 있음
				pstmt.setString(5, f.getOriginName());
				pstmt.setString(6, f.getChangeName());
				pstmt.setString(7, f.getFilePath());
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}


		public ArrayList<Feed> selectFeedList(Connection conn) {
			
			ArrayList<Feed> list = new ArrayList<Feed>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectFeedList");
			
			try {
				pstmt = conn.prepareStatement(sql);
					
				rset = pstmt.executeQuery();
				
				while (rset.next()) {
					
					Feed f = new Feed();
					f.setFeedNo(rset.getInt("FEED_NO"));
					f.setMemNo(rset.getInt("MEM_NO"));
					f.setFeedTitle(rset.getString("FEED_TITLE"));
					f.setFeedText(rset.getString("FEED_TEXT"));
					f.setFeedTag(rset.getString("FEED_TAG"));
					f.setLikeCount(rset.getInt("LIKE_COUNT"));
					f.setOriginName(rset.getString("ORIGIN_NAME"));
					f.setChangeName(rset.getString("CHANGE_NAME"));
					f.setFilePath(rset.getString("FILE_PATH"));
					f.setFeedWriter(rset.getString("MEM_NICKNAME"));
					f.setUserPhoto(rset.getString("UP"));

					list.add(f);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}


		public ArrayList<Feed> selectFeedByTagList(Connection conn, String tagName) {
			
			ArrayList<Feed> list = new ArrayList<Feed>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectFeedByTagList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, tagName);
				rset = pstmt.executeQuery();
				
				while (rset.next()) {
					
					Feed f = new Feed();
					f.setFeedNo(rset.getInt("FEED_NO"));
					f.setMemNo(rset.getInt("MEM_NO"));
					f.setFeedTitle(rset.getString("FEED_TITLE"));
					f.setFeedText(rset.getString("FEED_TEXT"));
					f.setFeedTag(rset.getString("FEED_TAG"));
					f.setLikeCount(rset.getInt("LIKE_COUNT"));
					f.setOriginName(rset.getString("ORIGIN_NAME"));
					f.setChangeName(rset.getString("CHANGE_NAME"));
					f.setFilePath(rset.getString("FILE_PATH"));
					f.setFeedWriter(rset.getString("MEM_NICKNAME"));
					f.setUserPhoto(rset.getString("UP"));

					list.add(f);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
			
		}


		public ArrayList<Feed> selectFeedByFollowList(Connection conn, int memNo1) {
			

			ArrayList<Feed> list = new ArrayList<Feed>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectFeedByFollowList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memNo1);
				rset = pstmt.executeQuery();
				
				while (rset.next()) {
					
					Feed f = new Feed();
					f.setFeedNo(rset.getInt("FEED_NO"));
					f.setMemNo(rset.getInt("MEM_NO"));
					f.setFeedTitle(rset.getString("FEED_TITLE"));
					f.setFeedText(rset.getString("FEED_TEXT"));
					f.setFeedTag(rset.getString("FEED_TAG"));
					f.setLikeCount(rset.getInt("LIKE_COUNT"));
					f.setOriginName(rset.getString("ORIGIN_NAME"));
					f.setChangeName(rset.getString("CHANGE_NAME"));
					f.setFilePath(rset.getString("FILE_PATH"));
					f.setFeedWriter(rset.getString("MEM_NICKNAME"));
					f.setUserPhoto(rset.getString("UP"));

					list.add(f);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}


		public int updateFeed(Connection conn, Feed f) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateFeed");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, f.getFeedTitle());
				pstmt.setString(2, f.getFeedText());
				pstmt.setString(3, f.getFeedTag());
				pstmt.setString(4, f.getOriginName());
				pstmt.setString(5, f.getChangeName());
				pstmt.setString(6, f.getFilePath());
				pstmt.setInt(7, f.getFeedNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}


		public int deleteFeed(Connection conn, int feedNo) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteFeed");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, feedNo);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		public int insertFeedLike(Connection conn, int memNo, int feedNo) {

			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertFeedLike");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memNo);
				pstmt.setInt(2, feedNo);			
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		

		public int deleteFeedLike(Connection conn, int memNo, int feedNo) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteFeedLike");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memNo);
				pstmt.setInt(2, feedNo);			
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;	
		}
	   //인호 끝
}
