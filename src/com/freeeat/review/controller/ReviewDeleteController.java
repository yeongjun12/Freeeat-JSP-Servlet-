package com.freeeat.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDeleteController
 */
@WebServlet("/reviewDelete.yj")
public class ReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**												
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	      
	      int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	      
	      int result =new ReviewService().deleteReview(reviewNo);
	      int result2 = new ReviewService().deleteReviewPhoto(reviewNo);
	      int result3 = new ReviewService().deleteTag(reviewNo);
	      
	      if(result+result2+result3 > 0) {
	         response.sendRedirect(request.getContextPath() +"/review.yj?cpage=1");
	         
	         
	      }else {
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
