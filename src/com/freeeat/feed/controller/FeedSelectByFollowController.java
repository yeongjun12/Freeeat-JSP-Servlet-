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
import com.google.gson.Gson;

/**
 * Servlet implementation class FeedSelectByFollowController
 */
@WebServlet("/selectFeedListFollow.ih")
public class FeedSelectByFollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedSelectByFollowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // 겟방식 이지만 그냥 하고 본다
		
		int memNo1 = Integer.parseInt(request.getParameter("memNo1"));
		
		ArrayList<Feed> feedList = new FeedService().selectFeedByFollowList(memNo1); // 오버로딩으로 해도 될까..? 근데 어차피 메소드 새로 써야되는건데..
		
		response.setContentType("application/json; charset=UTF-8" );
		new Gson().toJson(feedList, response.getWriter());
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
