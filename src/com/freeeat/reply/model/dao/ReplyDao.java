package com.freeeat.reply.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.freeeat.common.JDBCTemplate.*;
import com.freeeat.reply.model.vo.Reply;

public class ReplyDao {

	private Properties prop = new Properties();
	private String file = ReplyDao.class.getResource("/sql/reply/reply-mapper.xml").getPath();
	
	public ReplyDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}	
		
	}
	
	
	public ArrayList<Reply> selectReplyAdd(Connection conn, int lastNo) {
		ArrayList<Reply> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyAdd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, lastNo);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reply rp = new Reply();
				
				rp.setReplyNo(rset.getInt("REPLY_NO"));
				rp.setReplyContent(rset.getString("REPLY_CONTENT"));
				rp.setReplyDeleted(rset.getString("REPLY_DELETED"));
				rp.setFeedNo(rset.getInt("FEED_NO"));
				rp.setMemNo(rset.getInt("MEM_NO"));
				rp.setMemNickName(rset.getString("MEM_NICKNAME"));
				
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
	
	public ArrayList<Reply> selectReplyByFeedNo(Connection conn, int fno) {
		ArrayList<Reply> replyList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyByFeedNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			    Reply rp = new Reply();   
				rp.setReplyNo(rset.getInt("REPLY_NO"));
				rp.setReplyContent(rset.getString("REPLY_CONTENT"));
				rp.setReplyDeleted(rset.getString("REPLY_DELETED"));
				rp.setFeedNo(rset.getInt("FEED_NO"));
				rp.setMemNo(rset.getInt("MEM_NO"));
				rp.setMemNickName(rset.getString("MEM_NICKNAME"));
				
				replyList.add(rp);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return replyList;
	}
	
	
	
}
