package com.freeeat.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.member.model.vo.Member;
import com.freeeat.place.model.vo.Tag;
import com.freeeat.review.model.service.ReviewService;
import com.freeeat.review.model.vo.Review;

/**
 * Servlet implementation class ReviewController
 */
@WebServlet("/review.yj")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) 인코딩 
		  request.setCharacterEncoding("UTF-8");
		  
		  int memNo = ((Member)request.getSession().getAttribute("loginMem")).getMemNo();
		  
		
		// -- 페이징처리 --
	      int listCount;
	      int pageLimit;
	      int boardLimit;
	      
	      int currentPage;
	      int maxPage;
	      int startPage;
	      int endPage;

	      listCount = new ReviewService().selectMemReviewCount(memNo);
	      
	      pageLimit = 10;
	      boardLimit = 6;
	      
	      currentPage = Integer.parseInt(request.getParameter("cpage"));
	      maxPage = (int)Math.ceil((double)listCount / boardLimit);
	      startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	      endPage = startPage + pageLimit - 1;
	      if(endPage > maxPage) {
	           endPage = maxPage;
	           
	           
	      }
	      

	      PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	
	
		//태그불러오기
	
		
		ArrayList<Tag> tag = new ReviewService().selectTag(memNo);
		
		HttpSession session = request.getSession();
		
		request.setAttribute("tag", tag);
		
		
		System.out.println(tag);
		
		ArrayList<Review> review = new ReviewService().selectReview(memNo,pi);
	
		
		
		request.setAttribute("review", review);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("/views/member/MyReviewForm.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
