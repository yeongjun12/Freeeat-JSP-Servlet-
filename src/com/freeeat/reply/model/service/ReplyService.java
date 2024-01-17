package com.freeeat.reply.model.service;

import static com.freeeat.common.JDBCTemplate.close;
import static com.freeeat.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.freeeat.reply.model.dao.ReplyDao;
import com.freeeat.reply.model.vo.Reply;

public class ReplyService {

	
	public ArrayList<Reply> selectReplyAdd(int lastNo) {
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new ReplyDao().selectReplyAdd(conn, lastNo);
		
		close(conn);		
		
		return list;
	}
	
	public ArrayList<Reply> selectReplyByFeedNo(int fno) {
		Connection conn = getConnection();
		
		ArrayList<Reply> replyList = new ReplyDao().selectReplyByFeedNo(conn, fno);
		
		close(conn);
		
		return replyList;
	}

	
	
	
	
	
}
