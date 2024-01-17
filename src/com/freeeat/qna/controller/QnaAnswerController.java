package com.freeeat.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.qna.model.service.QnaService;
import com.freeeat.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaAnswerController
 */
@WebServlet("/answerQna.sk")
public class QnaAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		String qnaA = request.getParameter("qnaA");

		Qna qna = new Qna();
		qna.setQnaNo(qnaNo);
		qna.setQnaA(qnaA);
		
		int result = new QnaService().answerQna(qna);
		
		if (result > 0) {
			request.getSession().setAttribute("successMsg", "질문글에 대한 답변을 등록했습니다.");
			response.sendRedirect(request.getContextPath() + "/qnaList.sk?cpage=1");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
