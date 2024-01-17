package com.freeeat.feed.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.feed.model.service.FeedService;
import com.freeeat.feed.model.vo.Feed;
import com.freeeat.reply.model.service.ReplyService;
import com.freeeat.reply.model.vo.Reply;

/**
 * Servlet implementation class FeedListController
 */
@WebServlet("/feedDetail.sk")
public class FeedDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int fno = Integer.parseInt(request.getParameter("fno"));
		
		Feed feed = new FeedService().selectFeed(fno);
		ArrayList<Reply> replyList = new ReplyService().selectReplyByFeedNo(fno);
		
		request.setAttribute("feed", feed);
		request.setAttribute("replyList", replyList);

	    request.getRequestDispatcher("views/admin/feedDetail.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
