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
 * Servlet implementation class wishDeleteController
 */
@WebServlet("/wishDelete.yj")
public class wishDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wishDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int memNo = ((Member)request.getSession().getAttribute("loginMem")).getMemNo();
		System.out.println("mem넘 :"+memNo);
		
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
		
		int result = new PlaceService().deleteWish(placeNo,memNo);
		
		if(result > 0 ) {
			
			response.sendRedirect(request.getContextPath() +"/wish.yj");
			
		}else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
