package com.freeeat.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxIdCheckController
 */
@WebServlet("/idCheck.yj")
public class AjaxIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String checkId = request.getParameter("checkId");
		
		System.out.println(checkId);
	
		
		
	
		int count = new MemberService().idCheck(checkId);
	
		
		response.setContentType("text/html; charset=UTF-8");
		

		// 중복값이 있을 때 "NNNNN" count == 1
		// 중복값이 없을 때 "NNNNY" count == 0
		if(count > 0) { // 존재하는 아이디가 이미 있을 경우 => "NNNNN"
			response.getWriter().print("NNNNN");
		} else { // 존재하는 아이디가 없을 경우 => "NNNNY"
			response.getWriter().print("NNNNY");
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
