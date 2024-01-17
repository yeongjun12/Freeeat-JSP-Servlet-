package com.freeeat.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.common.model.vo.Photo;
import com.freeeat.place.model.service.PlaceService;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxPhotoListSelectController
 */
@WebServlet("/photoList.mr")
public class AjaxPhotoListSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPhotoListSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get방식으로 들어와서 생략함 
		//request.setCharacterEncoding("UTF-8");
		
		// Ajax의 요청으로 올 때, 식당 사진을 가지고 와야 하기 때문에 식당 번호가 필요함 
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
	
		ArrayList<Photo> phoList = new PlaceService().photoListSelect(placeNo);
		
		// 응답을 해줘야 함 GSON사용 
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new Gson();
		gson.toJson(phoList, response.getWriter());
		// Gson에 따로 키값을 지정하지 않으면 키값 == 필드명 
		
		
		
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
