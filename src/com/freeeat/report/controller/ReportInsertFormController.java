package com.freeeat.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.member.model.vo.Member;
import com.freeeat.report.model.service.ReportService;

/**
 * Servlet implementation class ReportInsertFormController
 */
@WebServlet("/reportForm.mr")
public class ReportInsertFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int memNo = Integer.parseInt((Member)(request.getSession().getLoginMem()).getMemNo());
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		//System.out.println(reviewNo);
		
		Member m = new ReportService().reportInsertMember(reviewNo);
		
		if(m != null) {
			request.setAttribute("member", m);
			request.getRequestDispatcher("/views/report/reportInsertView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "reportInsertController오류");
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
