package com.freeeat.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.member.model.service.MemberService;
import com.freeeat.member.model.vo.Member;

/**
 * Servlet implementation class MemberListStatusNController
 */
@WebServlet("/memberListN.sk")
public class MemberListStatusNController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListStatusNController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String status = request.getParameter("status");
		
		// -- 페이징처리 --
		int listCount;
		int pageLimit;
		int boardLimit;
		
		int currentPage;
		int maxPage;
		int startPage;
		int endPage;
	
		
		listCount = new MemberService().selectMemberNListCount();
		pageLimit = 10;
		boardLimit = 20; // 20명씩 보여주기
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			  endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Member> list = new MemberService().selectMemberNList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("status", status);
			
		request.getRequestDispatcher("views/admin/adminMember.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
