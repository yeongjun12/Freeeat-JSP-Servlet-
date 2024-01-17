package com.freeeat.place.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.freeeat.place.model.service.PlaceService;

/**
 * Servlet implementation class AjaxLikeReviewInsertController
 */
@WebServlet("/reviewLike.mr")
public class AjaxLikeReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxLikeReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("왔닝?");
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int likeStatus = Integer.parseInt(request.getParameter("likeStatus"));
		
		int result = 0; //결과값 반을 변수 
		int status = 0; // json 값을 보낼 변수 
		int recountReview = 0; // count값
		
		if(likeStatus == 1) {
			result = new PlaceService().likeReviewDelete(reviewNo, memNo);
			status = 0;
		} else {
			result = new PlaceService().likeReviewInsert(reviewNo, memNo);
			status = 1;
		}
		
		if(result > 0) {
			recountReview = new PlaceService().recountReviewCount(reviewNo);
		} 
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("likeStatus", status);
		jObj.put("recountReview",recountReview);
		
		response.setContentType("application/json; charset=UTF-8"); 
		response.getWriter().print(jObj);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
