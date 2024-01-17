package com.freeeat.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.notice.model.service.NoticeService;
import com.freeeat.notice.model.vo.Qna;

/**
 * Servlet implementation class InsertCSController
 */
@WebServlet("/insertCS.hj")
public class InsertCSController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCSController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("UTF-8");	
	
		
	String title = request.getParameter("title");
	String category = request.getParameter("category");
	String name = request.getParameter("name");
	String email = request.getParameter("email") + 
					request.getParameter("domain");
	String content = request.getParameter("content");
	String lock = request.getParameter("lock");
	String password = request.getParameter("password");
	
	System.out.println(lock);
	
	Qna q = new Qna();
	
	q.setQnaTitle(title);
	q.setQnaCategory(category);
	q.setQnaWriter(name);
	q.setQnaEmail(email);
	q.setQnaQ(content);
	q.setIsLocked(lock);
	q.setQnaPwd(password);
	
	int result = new NoticeService().insertCs(q);
	
	if(result > 0) {
		response.sendRedirect(request.getContextPath()+"/CSList.hj?cpage=1");
	}else {
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
