package com.freeeat.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.feed.model.service.FeedService;
import com.freeeat.feed.model.vo.Feed;
import com.freeeat.member.model.vo.Member;
import com.freeeat.place.model.service.PlaceService;
import com.freeeat.review.model.service.ReviewService;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/mypage.yj")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memNo = ((Member)request.getSession().getAttribute("loginMem")).getMemNo();
		
		ArrayList<Feed> feed = new FeedService().selectFeedImage(memNo);
		int feedCount = new FeedService().selectFeedCount(memNo);
		int reviewCount = new ReviewService().selectMemReviewCount(memNo);
		int wishCount = new PlaceService().selectWishListCount(memNo);
		
		request.setAttribute("reviewCount", reviewCount);
		request.setAttribute("feed", feed);
		request.setAttribute("feedCount", feedCount);
		request.setAttribute("wishCount",  wishCount);
		
		if(feed != null) {
		request.getRequestDispatcher("/views/member/MyPage.jsp").forward(request, response);
		} else {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
