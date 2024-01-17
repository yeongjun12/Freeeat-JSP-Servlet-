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
 * Servlet implementation class ReportInsertController
 */
@WebServlet("/reportFeed.ih")
public class ReportInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int reportMemNo = Integer.parseInt(request.getParameter("memNo"));
		int boardNo = Integer.parseInt(request.getParameter("feedno1"));
		String reportReason = request.getParameter("report_reason");
		String reportCode = request.getParameter("report_category");
		String reportPlus = request.getParameter("etc_reason_text");
		String reportedFeedWriter = request.getParameter("FeedWrirter");
		String reportedFeedText = request.getParameter("reported_content_text");
		// 가공
		Report report = new Report();
		report.setReportMemNo(reportMemNo);
		report.setBoardNo(boardNo);
		report.setReportReason(reportReason);
		report.setReportCode(reportCode);
		report.setReportPlus(reportPlus);
		report.setReportedFeedWriter(reportedFeedWriter);
		report.setReportedFeedText(reportedFeedText);
		
		System.out.println(report);
		int result = new ReportService().insertReport(report);
		System.out.println(result);
		//응답페이지
		if (result > 0) {// 성공시 다시 피드 페이지 혹은 모달창 닫기....
			request.setAttribute("errorMsg", "신고가 완료되었습니다");
			response.sendRedirect(request.getContextPath() + "/FeedGo.ih");
			System.out.println("신고성공");
		}else {
			request.setAttribute("errorMsg", "신고가 안되었어요...ㅠㅠ");
			response.sendRedirect(request.getContextPath() + "/FeedGo.ih");
			System.out.println("신고 실패");
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
