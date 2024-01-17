package com.freeeat.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.freeeat.reply.model.vo.Reply;
import com.freeeat.common.model.vo.Photo;
import com.freeeat.feed.model.vo.Feed;
import com.freeeat.report.model.service.ReportService;
import com.freeeat.report.model.vo.Report;
import com.freeeat.review.model.vo.Review;

/**
 * Servlet implementation class ReportSelectController
 */
@WebServlet("/reportSelect.yk")
public class ReportSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 상세 조회하러 가자
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		//String code = request.getParameter("code");
		
		Report report = new ReportService().reportSelect(rno);
		int bno = report.getBoardNo();
		
		request.setAttribute("report", report);
		
		if(report.getReportCode().equals("피드")) { // 가져오는 code 값으로 화면 다르게 포워딩 > 받아오는 객체가 다름 > 합칠 수 있나??
			
			Feed feed = new ReportService().feedSelect(bno,rno);
			
			/// 실패 화면 지정해야함
			if(feed.getFeedNo() != 0) {
				
				request.setAttribute("feed", feed);
				request.getRequestDispatcher("/views/admin/reportFeed.jsp").forward(request, response);	
			}else {
				request.setAttribute("alertMsg", "조회 실패");
			}
		    
		}else if(report.getReportCode().equals("리뷰")) {
			Review review = new ReportService().reviewSelect(bno);
			
			if(review.getReviewNo() != 0) { // 조회 성공
				
				int result = new ReportService().reviewPhotoCheck(bno);
				ArrayList<Photo> list = null;

				request.setAttribute("review", review);
				
				if(result > 0) {
					list = new ReportService().reviewPhotoSelect(bno); // 리뷰 번호
				
				}else { // 사진 없음
					request.setAttribute("alertMsg", "조회 실패");
				}
				request.setAttribute("list", list);
				request.getRequestDispatcher("/views/admin/reportReview.jsp").forward(request, response);	
		    }else { // 조회 실패
		    	HttpSession session = request.getSession();
		    	session.setAttribute("alertMsg", "조회 실패");
		    	request.getRequestDispatcher("/reportList.yk").forward(request, response);	
		    }
			
			
		}else {
			Reply reply = new ReportService().replySelect(bno,rno);
			
			if(reply.getReplyNo() != 0) {
				request.setAttribute("reply", reply);
				request.getRequestDispatcher("/views/admin/reportReply.jsp").forward(request, response);
			}else {
				request.setAttribute("alertMsg", "조회 실패");
			}
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
