package com.freeeat.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.common.model.vo.Photo;
import com.freeeat.review.model.service.ReviewService;
import com.freeeat.review.model.vo.Review;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/reviewDetail.sk")
public class ReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewNo = Integer.parseInt(request.getParameter("rno"));
		
		Review review = new ReviewService().selectReviewByReviewNo(reviewNo);
		ArrayList<Photo> list = new ReviewService().selectReviewPhoto(reviewNo);
		
		request.setAttribute("review", review);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/admin/reviewDetail.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
