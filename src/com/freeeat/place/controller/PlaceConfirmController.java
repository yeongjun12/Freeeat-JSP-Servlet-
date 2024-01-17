package com.freeeat.place.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.freeeat.place.model.service.PlaceService;

/**
 * Servlet implementation class PlaceConfirmController
 */
@WebServlet("/placeConfrim.yk")
public class PlaceConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceConfirmController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int pno = Integer.parseInt(request.getParameter("pno"));
		String status = request.getParameter("status");
		
		int result = new PlaceService().placeConfirm(pno,status);
		
		if(result > 0) { 
			
			HttpSession session = request.getSession();
			session.setAttribute("Msg","성공");
			response.sendRedirect(request.getContextPath()+"/plist.yk");
			
		}else { // 승인 실패한 화면
			response.sendRedirect(request.getContextPath()+"/placeManageForm.yk?pno="+pno);
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
