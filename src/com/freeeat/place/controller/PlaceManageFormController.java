package com.freeeat.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.place.model.vo.PlacePhoto;
import com.freeeat.place.model.service.PlaceService;
import com.freeeat.place.model.vo.Place;
import com.freeeat.place.model.vo.PlaceMenu;

/**
 * Servlet implementation class PlaceManageController
 */
@WebServlet("/placeManageForm.yk")
public class PlaceManageFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceManageFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pno = Integer.parseInt(request.getParameter("pno")); 
		Place place = new PlaceService().placeSelect(pno);
		
		if(place.getPlaceName() != null) { // 식당 번호가 있으면 > place에 값이 있음 > 조회 성공
			  
	    	  ArrayList<PlaceMenu> list = new PlaceService().placeMenuSelect(pno);
	    	  
	    	  PlacePhoto photo = new PlaceService().placePhotoSelect(pno);
	    	  
	    	  request.setAttribute("place", place);
	    	  request.setAttribute("list", list); // 1개 ~ 5개 들어있음
	    	  
	    	  if(photo.getOriginName() != null) { // 이미지가 있을 경우
	    		  request.setAttribute("photo", photo);
	    	  }  
	    }
		request.getRequestDispatcher("views/admin/placeManageForm.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
