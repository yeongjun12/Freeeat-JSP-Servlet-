package com.freeeat.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.qna.model.service.QnaService;

/**
 * Servlet implementation class QnaDeleteController
 */
@WebServlet("/deleteQna.sk")
public class QnaDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("UTF-8");
	
		String[] qnaNo = request.getParameterValues("qnaNo");
		
		ArrayList<Integer> qnaList = new ArrayList();
		for (String s : qnaNo) {
			qnaList.add(Integer.parseInt(s));
		}
		
		int result = new QnaService().deleteQna(qnaList);
		
		if (result > 0) { // 성공
			request.getSession().setAttribute("successMsg", "문의글을 삭제했습니다.");
			response.sendRedirect(request.getContextPath() + "/qnaList.sk?cpage=1");
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
