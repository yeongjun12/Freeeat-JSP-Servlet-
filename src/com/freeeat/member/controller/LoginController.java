package com.freeeat.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.freeeat.member.model.service.MemberService;
import com.freeeat.member.model.vo.Member;
import com.freeeat.place.model.service.PlaceService;
import com.freeeat.place.model.vo.Wish;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.yj")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1) 포스팅방식
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		
		//2) 값뽑기
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		
		
		//3) Service로 토스
		Member loginMem =  new MemberService().loginMember(memId, memPwd);
		

		
		//4) 로그인 실패시 (아이디나 ,비밀번호가 맞지 않을 경우)  errorPage가 나온다.
		if(loginMem == null) {
			
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
			

			
		}else {
			session.setAttribute("loginMem", loginMem);
			
			if(loginMem.getMemId().equals("admin")) {
				response.sendRedirect(request.getContextPath() + "/memberList.sk?tap=1&cpage=1");				
			} else {				
				// response.sendRedirect("views/common/mainPage.jsp");
				ArrayList<Wish> wish = new PlaceService().selectWish(loginMem.getMemNo()); //로그인 시  memNo를 사용하여  내가 찜한식당을 select하기 위해 넘긴다.
				
				session.setAttribute("wish",wish); //로그인을 하면 wish객체를  어디에서든 사용 가능하게 session에 담는다

				response.sendRedirect(request.getContextPath());
			}
			
			

			
			

			
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
