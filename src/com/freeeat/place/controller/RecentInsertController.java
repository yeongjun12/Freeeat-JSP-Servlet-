package com.freeeat.place.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.member.model.vo.Member;
import com.freeeat.place.model.service.PlaceService;

/**
 * Servlet implementation class RecentInsertController
 */
@WebServlet("/recentInsert.hj")
public class RecentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecentInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member m = ((Member)request.getSession().getAttribute("loginMem"));
		int memNo = 0;
		
		if(m != null) {
			memNo = m.getMemNo();
		}
		
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
		
		//중복여부 판단
		int overlap = new PlaceService().recentSelect(placeNo, memNo);
		
		int result = 0;
		
		if(overlap == 0) {
			result = new PlaceService().recentInsert(placeNo, memNo);
		}else {
			result = new PlaceService().recentUpdate(placeNo, memNo);
		}
		
		if(result>0) {
			response.sendRedirect(request.getContextPath() + "/placeDetail.mr?placeNo=" + placeNo);
//			request.getRequestDispatcher("/views/place/placeSelectDetailView.jsp").forward(request, response);
		}else {
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
