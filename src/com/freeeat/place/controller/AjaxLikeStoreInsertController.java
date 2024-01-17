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
 * Servlet implementation class AjaxLikeStoreInsertController
 */
@WebServlet("/likeInsert.mr")
public class AjaxLikeStoreInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxLikeStoreInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int likeStatus = Integer.parseInt(request.getParameter("likeStatus"));
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		// 값 전달 잘됨 System.out.println(placeNo + " // " + memNo );
		// System.out.println(placeNo + " // " + memNo + " // " + likeStatus);
		//  likeStatus가 1 이면 DELETE / 0 이면 INSERT
		
		int num = 0; 
		
		if(likeStatus > 0) {
			int result1 = new PlaceService().deleteWish(placeNo, memNo);
			if(result1 > 0) num = 0;
	
		} else {
			int result2 = new PlaceService().placeInsertWish(placeNo, memNo);
			if(result2 > 0) num = 1;
		}
		int wishCount = new PlaceService().placeWishCount(placeNo);
		
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("num", num);
		jObj.put("wishCount", wishCount);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().println(jObj);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
