package com.freeeat.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.freeeat.place.model.dao.PlaceDao;
import com.freeeat.place.model.service.PlaceService;
import com.freeeat.place.model.vo.Place;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxPlaceListController
 */
@WebServlet("/placelist.yk")
public class AjaxPlaceListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPlaceListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String sort = request.getParameter("sort");
    	
    	// 삼항연산자 사용 > 쿼리문에서 ?에 담을 값으로 사용 예정
        sort = sort.equals("all") ? "A" : sort.equals("wait") ? "W" : sort.equals("check") ? "Y','N" : "D";
        
        // 인코딩 > json사용해서 여러 데이터를 한번에  보낼 계획 
        // JSON 형식으로 넘긴다 > JSONArray / JSONObject로
        response.setContentType("application/json; charset=UTF-8");
        
        new Gson().toJson(new PlaceService().placeSelectList(sort), response.getWriter());
       
        /*
        String sort = request.getParameter("sort");
		
		switch(sort) {
			case "all" : sort = "A"; break;
			case "wait" : sort = "W"; break;
			case "check" : sort = "Y','N"; break;
			default : sort = "D"; break;
		}
		
		ArrayList<Place> list = new PlaceService().placeSelectList(sort);

		JSONArray jArr = new JSONArray();
		
		for(Place p : list) {
			
			JSONObject jObj = new JSONObject();
			
			jObj.put("placeNo", p.getPlaceNo()); 
			jObj.put("placeName", p.getPlaceName());
			jObj.put("placeAddress", p.getPlaceAddress());
			jObj.put("placePhone", p.getPlacePhone());
			jObj.put("placeKind", p.getPlaceKind());
			jObj.put("placeTime", p.getPlaceTime());
			jObj.put("placeDayoff", p.getPlaceDayoff());
			jObj.put("placeParking", p.getPlaceParking());
			jObj.put("placeInfo", p.getPlaceInfo());
			jObj.put("placeStatus", p.getPlaceStatus());
			jObj.put("placeViews", p.getPlaceViews());
			jArr.add(jObj);
		}
		
		response.setContentType("application/json; charset=UTF-8");

		response.getWriter().print(jArr);
		*/
     }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
