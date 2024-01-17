package com.freeeat.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.review.model.service.ReviewService;
import com.freeeat.review.model.vo.Review;


/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/reviewList.sk")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// -- 페이징처리 --
		int listCount = 0;
		int pageLimit = 10;
		int boardLimit = 10;
		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			  endPage = maxPage;
		}
		
		String del = request.getParameter("del");

		
		if (del.equals("Y") || del.equals("N")) {
			listCount =  new ReviewService().selectReviewListCount(del);						
		} else if (del.equals("A")) {
			listCount =  new ReviewService().selectReviewListAllCount();			
		}
		
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Review> list = null;
		
		if (del.equals("Y") || del.equals("N")) {					
			list = new ReviewService().selectReviewList(pi, del);
		} else if (del.equals("A")) {	
			list = new ReviewService().selectReviewListAll(pi);
		}
		
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("del", del);
		
		request.getRequestDispatcher("views/admin/reviewList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
