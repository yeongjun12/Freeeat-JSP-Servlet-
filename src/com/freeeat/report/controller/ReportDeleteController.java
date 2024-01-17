package com.freeeat.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.report.model.service.ReportService;

/**
 * Servlet implementation class ReportDeleteController
 */
@WebServlet("/reportDelete.yk")
public class ReportDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		String code = request.getParameter("code");
		
		if(code.equals("피드")) {
			code = "FEED";
		}else if(code.equals("댓글")) {
			code = "REPLY";
		}else {
			code = "REVIEW";
		}
		
		int result = new ReportService().reportConfirm(rno, bno, code);
		
		if(result > 0) { // 삭제 성공
			//request.setAttribute("", ); // 삭제 성공 알림창
			response.sendRedirect(request.getContextPath()+"/reportList.yk");
		}else { // 삭제 실패
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
