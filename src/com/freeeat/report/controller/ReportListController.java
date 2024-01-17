package com.freeeat.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.report.model.service.ReportService;
import com.freeeat.report.model.vo.Report;

/**
 * Servlet implementation class reportManageController
 */
@WebServlet("/reportList.yk")
public class ReportListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전체 조회
		// 전체 / 처리 전 / 처리 후 나누기
		
		String sort = request.getParameter("sort"); // 예외 안뜨니...?
		
		
		if(sort == null) {
			sort = "all";
		}
		ArrayList<Report> list = new ReportService().reportList(sort);
		
		request.setAttribute("list", list);
		request.setAttribute("sort",sort);
		
		request.getRequestDispatcher("/views/admin/reportList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
