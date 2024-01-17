package com.freeeat.review.model.dao;

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
import com.freeeat.common.model.vo.Photo;
import com.freeeat.place.model.vo.Tag;
import com.freeeat.review.model.vo.Review;

public class ReviewDao {

	private Properties prop = new Properties();
	private String file = ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath();
	
	public ReviewDao() {
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	
	// 전체 리뷰 목록 개수 조회
	public int selectReviewListAllCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewListAllCount");
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
	
	// 전체 리뷰 목록 조회 
	public ArrayList<Review> selectReviewListAll(Connection conn, PageInfo pi) {
		ArrayList<Review> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewListAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
						
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review review = new Review();
				
				review.setReviewNo(rset.getInt("REVIEW_NO"));
				review.setMemNo(rset.getInt("MEM_NO"));
				review.setNickName(rset.getString("MEM_NICKNAME"));
				review.setPlaceNo(rset.getInt("PLACE_NO"));
			    review.setPlaceName(rset.getString("PLACE_NAME")); 
			    review.setReviewCount(rset.getInt("REVIEW_COUNT"));
			    review.setReviewCreateDate(rset.getDate("REVIEW_CREATE_DATE"));
			       
			    list.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}
	
	// 리뷰 목록 개수 조회
	public int selectReviewListCount(Connection conn, String del) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, del);
			
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
	
	// 전체 리뷰 목록 조회 
	public ArrayList<Review> selectReviewList(Connection conn, PageInfo pi, String del) {
		ArrayList<Review> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, del);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review review = new Review();
				
				review.setReviewNo(rset.getInt("REVIEW_NO"));
				review.setMemNo(rset.getInt("MEM_NO"));
				review.setNickName(rset.getString("MEM_NICKNAME"));
				review.setPlaceNo(rset.getInt("PLACE_NO"));
			    review.setPlaceName(rset.getString("PLACE_NAME")); 
			    review.setReviewCount(rset.getInt("REVIEW_COUNT"));
			    review.setReviewCreateDate(rset.getDate("REVIEW_CREATE_DATE"));
			       
			    list.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}
	
	// 리뷰 번호로 리뷰 조회
	public Review selectReviewByReviewNo(Connection conn, int reviewNo) {
		Review review = new Review();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewByReviewNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				review.setReviewNo(rset.getInt("REVIEW_NO"));
				review.setMemNo(rset.getInt("MEM_NO"));
				review.setNickName(rset.getString("MEM_NICKNAME"));
				review.setPlaceNo(rset.getInt("PLACE_NO"));
				review.setPlaceName(rset.getString("PLACE_NAME"));
				review.setReviewCount(rset.getInt("REVIEW_COUNT"));
				review.setReviewContent(rset.getString("REVIEW_CONTENT"));
			    review.setReviewMenuType(rset.getString("REVIEW_MENU_TYPE"));
			    review.setReviewCreateDate(rset.getDate("REVIEW_CREATE_DATE"));			       
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
			
		return review;
	}
	
	// 리뷰 번호로 리뷰 사진 조회 
	public ArrayList<Photo> selectReviewPhoto(Connection conn, int reviewNo) {
		ArrayList<Photo> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Photo rp = new Photo();
				
				rp.setPlacePhotoNo(rset.getInt("REVIEW_PHOTO_NO"));
				rp.setPlaceNo(rset.getInt("REVIEW_NO"));
				rp.setOriginName(rset.getString("ORIGIN_NAME"));
				rp.setChangeName(rset.getString("CHANGE_NAME"));
				rp.setFilePath(rset.getString("FILE_PATH"));
				rp.setUploadDate(rset.getDate("UPLOAD_DATE"));
				rp.setStatus(rset.getString("STATUS"));
			    
				list.add(rp);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}
	
	// 키워드로 리뷰 개수 조회
	public int searchReviewByKeywordCount(Connection conn, String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchReviewByKeywordCount");	
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
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
	
	// 키워드로 리뷰 목록 조회
	public ArrayList<Review> searchReviewByKeyword(Connection conn, String keyword, PageInfo pi) {
		ArrayList<Review> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchReviewByKeyword");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);	
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review review = new Review();
				review.setReviewNo(rset.getInt("REVIEW_NO"));
				review.setMemNo(rset.getInt("MEM_NO"));
				review.setNickName(rset.getString("MEM_NICKNAME"));
				review.setPlaceNo(rset.getInt("PLACE_NO"));
				review.setPlaceName(rset.getString("PLACE_NAME"));
				review.setReviewCount(rset.getInt("REVIEW_COUNT"));
				review.setReviewContent(rset.getString("REVIEW_CONTENT"));
			    review.setReviewMenuType(rset.getString("REVIEW_MENU_TYPE"));
			    review.setReviewCreateDate(rset.getDate("REVIEW_CREATE_DATE"));			       
			    list.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	

		return list;
	}
	
	//성경 끝
	
	//영준 시작
	
	public ArrayList<Review> selectReview(Connection conn,int memNo, PageInfo pi){
		

		
		ArrayList<Review> review = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
	
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
	        int endRow = startRow + pi.getBoardLimit() - 1;
	        
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
		    pstmt.setInt(3, endRow);
			

			rset = pstmt.executeQuery();

			while(rset.next()) {
	               Review r = new Review();
	               r.setReviewNo(rset.getInt("REVIEW_NO"));
	               r.setPlaceName(rset.getString("PLACE_NAME"));
	               r.setPlaceNo(rset.getInt("PLACE_NO"));
	               r.setReviewContent(rset.getString("REVIEW_CONTENT"));
	               r.setReviewCreateDate(rset.getDate("REVIEW_CREATE_DATE"));
	               r.setReviewImageName(rset.getString("CHANGE_NAME"));
	               r.setReviewImagePath(rset.getString("FILE_PATH"));
	               
	               review.add(r);
	         
	            }
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
	
		return review;
	}
	

	public int deleteReview(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}
	
	public int deleteReviewPhoto(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReviewPhoto");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	public ArrayList<Tag> selectTag(Connection conn ,int memNo){
		
		ArrayList<Tag> tag = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectTag");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Tag t = new Tag();
				t.setTagNo(rset.getInt("TAG_NO"));
				t.setReviewNo(rset.getInt("REVIEW_NO"));
				t.setTagContent(rset.getString("TAG_CONTENT"));

				tag.add(t);
				
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
	
		return tag;
		

		
	}

	
	   public int selectMemReviewCount(Connection conn, int memNo) {
		      int listCount = 0;
		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      String sql = prop.getProperty("selectMemReviewCount");
		      
		      try {
		         pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setInt(1, memNo);
		         
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
	   public int deleteTag(Connection conn, int reviewNo) {
	         
	         
	         int result = 0;
	         PreparedStatement pstmt = null;
	         String sql = prop.getProperty("deleteTag");
	         
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setInt(1, reviewNo);
	            
	            result = pstmt.executeUpdate();
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }finally {
	            close(pstmt);
	         }
	         return result;
	            
	      }
	//영준 끝
	
}
