package com.freeeat.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.place.model.service.PlaceService;
import com.freeeat.place.model.vo.Place;
import com.freeeat.place.model.vo.PlaceMenu;
import com.freeeat.place.model.vo.PlacePhoto;
import com.freeeat.place.model.vo.Request;

/**
 * Servlet implementation class RequestSelectController
 */
@WebServlet("/requestSelect.yk")
public class RequestSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// place 상세 조회
		// 요청 번호, 식당 번호 필요
		int reqno = Integer.parseInt(request.getParameter("reqno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		Request r = new PlaceService().requestSelect(reqno);
		
		request.setAttribute("r", r);
		
		if(r != null) {
			
			Place place = new PlaceService().placeSelect(pno);
			
			if(place.getPlaceNo() > 0) { // 식당 번호가 있으면 > place에 값이 있음 > 조회 성공
				
		    	  ArrayList<PlaceMenu> list = new PlaceService().placeMenuSelect(pno);
		    	  PlacePhoto photo = new PlaceService().placePhotoSelect(pno);
		    	  
		    	  request.setAttribute("place", place);
		    	  request.setAttribute("list", list);
		    	  
		    	  if(photo.getOriginName() != null) {
		    		  request.setAttribute("photo", photo);
		    	  }  
		    }
		}		
		// 결과
		request.getRequestDispatcher("/views/admin/requestUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
