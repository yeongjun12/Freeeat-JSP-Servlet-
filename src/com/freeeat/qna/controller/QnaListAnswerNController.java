package com.freeeat.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.qna.model.service.QnaService;
import com.freeeat.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaListAnswerNController
 */
@WebServlet("/qnaListN.sk")
public class QnaListAnswerNController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListAnswerNController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// -- 페이징처리 --
		int listCount;
		int pageLimit;
		int boardLimit;
		
		int currentPage;
		int maxPage;
		int startPage;
		int endPage;
	
		
		listCount = new QnaService().selectQnaAnswerNListCount();
		pageLimit = 10;
		boardLimit = 10;
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			  endPage = maxPage;
		}
		// System.out.println(listCount);
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Qna> list = new QnaService().selectQnaAnswerNList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("answer", request.getParameter("answer"));
		
		request.getRequestDispatcher("views/admin/adminQNAList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
