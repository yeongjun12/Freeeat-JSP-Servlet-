package com.freeeat.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteController
 */
@WebServlet("/deleteNotice.sk")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String[] noticeNo = request.getParameterValues("noticeNo");
		
		ArrayList<Integer> noticeList = new ArrayList();
		for (String s : noticeNo) {
			noticeList.add(Integer.parseInt(s));
		}
		
		int result = new NoticeService().deleteNotice(noticeList);
		
		if (result > 0) { // 성공
			request.getSession().setAttribute("successMsg", "공지사항을 삭제했습니다.");
			// request.setAttribute("successMsg", "공지사항을 삭제했습니다.");
			response.sendRedirect(request.getContextPath() + "/noticeList.sk?cpage=1");
		} else { // 실패
			request.getRequestDispatcher("views/common/error404.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
