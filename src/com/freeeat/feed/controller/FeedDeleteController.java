package com.freeeat.feed.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.feed.model.service.FeedService;

/**
 * Servlet implementation class FeedDeleteController
 */
@WebServlet("/deleteFeed.ih")
public class FeedDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		
		int result = new FeedService().deleteFeed(feedNo);
		
		if (result > 0) {// 성공 
			
			request.getSession().setAttribute("alertMsg", "피드삭제성공!!");
			response.sendRedirect(request.getContextPath() + "/FeedGo.ih");
			
		} else {
			request.setAttribute("alertMsg", "피드삭제에 실패했습니다!!!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
