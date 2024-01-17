package com.freeeat.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.member.model.vo.Member;
import com.freeeat.notice.model.service.NoticeService;
import com.freeeat.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertCotroller
 */
@WebServlet("/insertNotice.sk")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int memNo = ((Member)request.getSession().getAttribute("loginMem")).getMemNo();
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeCont = request.getParameter("noticeCont");
		
		Notice notice = new Notice();
		
		notice.setMemNo(memNo);
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeCont(noticeCont);
		
		int result = new NoticeService().insertNotice(notice);
		
		if (result > 0) {
			request.getSession().setAttribute("successMsg", "공지사항을 등록했습니다.");
			response.sendRedirect(request.getContextPath() + "/noticeList.sk?cpage=1");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
