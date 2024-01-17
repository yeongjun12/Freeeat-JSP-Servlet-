package com.freeeat.place.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.place.model.service.PlaceService;
import com.freeeat.place.model.vo.Request;

/**
 * Servlet implementation class RequestInsertController
 */
@WebServlet("/request.mr")
public class RequestInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		/*
		this.requesetNo = requesetNo;  -- SEQ_REQNO.NEXTVAL
		this.requestContent = requestContent; -- 값 받는 것 
		this.requestDate = requestDate; -- default Sysdate
		this.placeNo = placeNo; -- hidden 값 받는 것 
		this.memNo = memNo; -- hidden 값 받는 것 
		*/
		
		String requestContent = request.getParameter("content");
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		Request req = new Request();
		
		req.setRequestContent(requestContent);
		req.setPlaceNo(placeNo);
		req.setMemNo(memNo);
		
		System.out.println(req);
		int result = new PlaceService().requestInsert(req);	
		
		
		if(result > 0) {
			
			request.setAttribute("alertMsg", "수정요청이 등록되었습니다!");
			response.sendRedirect(request.getContextPath() + "/placeDetail.mr?placeNo="+placeNo);
			
		} else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
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
