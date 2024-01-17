package com.freeeat.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.freeeat.member.model.service.MemberService;
import com.freeeat.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.yj")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1)인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기
		String memId = request.getParameter("memId");     // 필수입력
		String memNickName = request.getParameter("memNickName");   // 필수입력
		String memPwd = request.getParameter("memPwd");
		String phone = request.getParameter("phone");       // 빈 문자열이 들어갈 수 있음
		String memBirth = request.getParameter("memBirth"); 
		String email = request.getParameter("email");
		String[] typeArr = request.getParameterValues("type"); // ["음주","등산"] / null
		String residence = request.getParameter("residence");
	
		//System.out.println(memId+memNickName+memPwd+phone+memBirth+email+address);
	
		String type ="";
		
		if(typeArr != null) {
			type = String.join(",", typeArr);
		}
		
		
		
		//3) 
		
		Member loginMem = new Member();
		loginMem.setMemId(memId);
		loginMem.setMemNickName(memNickName);
		loginMem.setMemPwd(memPwd);
		loginMem.setPhone(phone);
		loginMem.setBirthDate(memBirth);
		loginMem.setEmail(email);
		loginMem.setType(type);
		loginMem.setResidence(residence);
		
		System.out.println(loginMem);
		
		//4) 
		int result = new MemberService().insertMember(loginMem);
		
		
		if( result > 0 ) {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("loginMem", loginMem);
			
			session.invalidate();
			
			response.sendRedirect("views/member/joinCompleteForm.jsp");
			
			
		} else { // 실패
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
			
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
