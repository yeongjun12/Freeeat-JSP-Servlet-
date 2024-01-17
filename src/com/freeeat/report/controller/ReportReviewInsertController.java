package com.freeeat.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.report.model.service.ReportService;
import com.freeeat.report.model.vo.Report;

/**
 * Servlet implementation class ReportReviewInsertController
 */
@WebServlet("/reportInsert.mr")
public class ReportReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int loginMemNo = Integer.parseInt(request.getParameter("loginMemNo"));
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		String reportReason = request.getParameter("report-reason");
		String reportPlus = (request.getParameter("report-plus") == "")? " " : request.getParameter("report-plus") ;

		Report r = new Report();
		r.setReportMemNo(loginMemNo);
		r.setBoardNo(reviewNo);
		r.setReportReason(reportReason);
		r.setReportPlus(reportPlus);
		
		int result = new ReportService().reportReviewInsert(r);
		
		if(result > 0) {
			request.setAttribute("msg", "신고성공");
			request.getRequestDispatcher("/views/report/reportInsertView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "ReportReviewInsertController오류");
			request.getRequestDispatcher(request.getContextPath() + "/views/common/errorPage.jsp").forward(request, response);
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
