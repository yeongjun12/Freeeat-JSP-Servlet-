package com.freeeat.content.model.dao;

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
import com.freeeat.content.model.vo.Content;
import com.freeeat.place.model.dao.PlaceDao;

public class ContentDao {

	private Properties prop = new Properties();
	
	public ContentDao() {
		String fileName = PlaceDao.class.getResource("/sql/content/content-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
		public ArrayList<Content> selectRecommList(Connection conn, String keyword) {
			
			ArrayList<Content> Clist = new ArrayList();
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("selectRecommList");
			String k = "%"+keyword+"%";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, k);
				pstmt.setString(2, k);
				pstmt.setString(3, k);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					Content c = new Content();
					
					c.setContNo(rset.getInt("CONT_NO"));
					c.setContCategory(rset.getString("CONT_CATEGORY"));
					c.setContTitle(rset.getString("CONT_TITLE"));
					c.setContInfo(rset.getString("CONT_INFO"));
					c.setContLink(rset.getString("CONT_LINK"));
					c.setContImgSource(rset.getString("CONT_IMG_SOURCE"));
					c.setMenuType(rset.getString("MENU_TYPE"));
					
					Clist.add(c);
				}		
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return Clist;
		}
		
		// 콘텐츠 개수 조회 - 페이징 처리위해 전체 콘텐츠 목록 카운트
		public int selectContentListCount(Connection conn) {
			
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectContentListCount");
			
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
		
		// 콘텐츠 목록조회
		public ArrayList<Content> selectContentList(Connection conn, PageInfo pi) {
			ArrayList<Content> list = new ArrayList();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectContentList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Content cont = new Content();
					cont.setContNo(rset.getInt("CONT_NO"));
					cont.setContCategory(rset.getString("CONT_CATEGORY"));
					cont.setContTitle(rset.getString("CONT_TITLE"));
					cont.setContInfo(rset.getString("CONT_INFO"));
					cont.setContSource(rset.getString("CONT_SOURCE"));
					cont.setContLink(rset.getString("CONT_LINK"));
					cont.setContImgSource(rset.getString("CONT_IMG_SOURCE"));
					cont.setMenuType(rset.getString("MENU_TYPE"));
					
					list.add(cont);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}
		
		// 콘텐츠 등록
		public int insertContent(Connection conn, Content cont) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertContent");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, cont.getContCategory());
				pstmt.setString(2, cont.getContTitle());
				pstmt.setString(3, cont.getContInfo());
				pstmt.setString(4, cont.getContSource());
				pstmt.setString(5, cont.getContLink());
				pstmt.setString(6, cont.getContImgSource());
				pstmt.setString(7, cont.getMenuType());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}	
			
			return result;
		}
		
		// 콘텐츠 조회 - 콘텐츠 수정 위해 콘텐츠 번호로 조회
		public Content selectByContNo(Connection conn, int contNo) {
			Content cont = new Content();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectByContNo");
			
			try {
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setInt(1, contNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					cont.setContNo(rset.getInt("CONT_NO"));
					cont.setContCategory(rset.getString("CONT_CATEGORY"));
					cont.setContTitle(rset.getString("CONT_TITLE"));
					cont.setContInfo(rset.getString("CONT_INFO"));
					cont.setContSource(rset.getString("CONT_SOURCE"));
					cont.setContLink(rset.getString("CONT_LINK"));
					cont.setContImgSource(rset.getString("CONT_IMG_SOURCE"));
					cont.setMenuType(rset.getString("MENU_TYPE"));
				}
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return cont;
		}
		
		// 콘텐츠 수정
		public int updateContent(Connection conn, Content cont) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateContent");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, cont.getContCategory());
				pstmt.setString(2, cont.getContTitle());
				pstmt.setString(3, cont.getContInfo());
				pstmt.setString(4, cont.getContSource());
				pstmt.setString(5, cont.getContLink());
				pstmt.setString(6, cont.getContImgSource());
				pstmt.setString(7, cont.getMenuType());
				pstmt.setInt(8, cont.getContNo());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}	
			System.out.println(result);
			return result;
		}
		
		
		// 콘텐츠 개수 조회 - 카테고리별
		public int selectContentListCountByCategory(Connection conn, String cate) {
			
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectContentListCountByCategory");
			
			try {	
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, cate);
				
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
		
		// 콘텐츠 목록조회 - 카테고리별
		public ArrayList<Content> selectContentListByCategory(Connection conn, PageInfo pi, String cate) {
			ArrayList<Content> list = new ArrayList();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectContentListByCategory");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setString(1, cate);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Content cont = new Content();
					cont.setContNo(rset.getInt("CONT_NO"));
					cont.setContCategory(rset.getString("CONT_CATEGORY"));
					cont.setContTitle(rset.getString("CONT_TITLE"));
					cont.setContInfo(rset.getString("CONT_INFO"));
					cont.setContSource(rset.getString("CONT_SOURCE"));
					cont.setContLink(rset.getString("CONT_LINK"));
					cont.setContImgSource(rset.getString("CONT_IMG_SOURCE"));
					cont.setMenuType(rset.getString("MENU_TYPE"));
					
					list.add(cont);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}
		
		
		// 콘텐츠 좋아요 등록
		public int insertContentLike(Connection conn, int memNo, int contNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertContentLike");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memNo);
				pstmt.setInt(2, contNo);			
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		// 콘텐츠 좋아요 삭제
		public int deleteContentLike(Connection conn, int memNo, int contNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteContentLike");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memNo);
				pstmt.setInt(2, contNo);			
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;		
		}
		
		// 콘텐츠 좋아요 목록 조회
		public ArrayList<Integer> selectContentLikeList(Connection conn, int memNo) {
			ArrayList<Integer> likeList = new ArrayList();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectContentLikeList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					likeList.add(rset.getInt("CONT_NO"));
				}
							
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return likeList;
		}
		// 콘텐츠에 딸린 좋아요 삭제
		public int deleteContentAllLike(Connection conn, int cno) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteContentAllLike");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, cno);
				
				result = pstmt.executeUpdate();				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}	
			
			return result;
		}
		
		
		// 콘텐츠 삭제
		public int deleteContent(Connection conn, int cno) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteContent");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, cno);
				
				result = pstmt.executeUpdate();
							
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
	}


