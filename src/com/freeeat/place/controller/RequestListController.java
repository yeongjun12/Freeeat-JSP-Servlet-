package com.freeeat.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.place.model.service.PlaceService;
import com.freeeat.place.model.vo.Request;
import com.freeeat.report.model.service.ReportService;
import com.freeeat.report.model.vo.Report;

/**
 * Servlet implementation class RequestListController
 */
@WebServlet("/requestList.yk")
public class RequestListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Request> list = new PlaceService().requestList();
		
		request.setAttribute("list", list);
		
		if(!list.isEmpty()) {
			request.getRequestDispatcher("/views/admin/requestList.jsp").forward(request, response);
		}else {
			//에러 페이지
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
