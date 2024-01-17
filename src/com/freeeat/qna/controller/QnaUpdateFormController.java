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
 * Servlet implementation class QnaUpdateFormController
 */
@WebServlet("/qnaUpdateForm.sk")
public class QnaUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int QnaNo = Integer.parseInt(request.getParameter("qno"));
		
		System.out.println(QnaNo);
		
		Qna qna = new QnaService().selectByQnaNo(QnaNo);
		
		request.setAttribute("qna", qna);
		request.getRequestDispatcher("views/admin/adminQNAUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
