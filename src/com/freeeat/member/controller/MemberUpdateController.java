package com.freeeat.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.freeeat.common.MyFileRenamePolicy;
import com.freeeat.member.model.service.MemberService;
import com.freeeat.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.yj")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	      
	      request.setCharacterEncoding("UTF-8");
	      
	      
	      if(ServletFileUpload.isMultipartContent(request)) {
	         
	         
	         int maxSize = 1024 * 1024 * 10;
	         
	         String savePath = request.getSession().getServletContext().getRealPath("/resources/mem_upfiles");
	         
	         MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	                  
	         String memId = multiRequest.getParameter("memId");
	         String memNickName = multiRequest.getParameter("memNickName");
	         String phone = multiRequest.getParameter("phone");
	         String memPwd = multiRequest.getParameter("memPwd");
	         String email = multiRequest.getParameter("email");
	         String[] typeArr = multiRequest.getParameterValues("type");
	         
	         
	         String type = "";
	         if(typeArr != null) {
	            type = String.join(",", typeArr);
	         }
	         
	 
	         Member loginMem = new Member();
	         
	         loginMem.setMemId(memId);
	         loginMem.setMemNickName(memNickName);
	         loginMem.setPhone(phone);
	         loginMem.setMemPwd(memPwd);
	         loginMem.setEmail(email);
	         loginMem.setType(type);
	         loginMem.setMem_profileOG(((Member)request.getSession().getAttribute("loginMem")).getMem_profileOG());
	         loginMem.setMem_profileRevise(((Member)request.getSession().getAttribute("loginMem")).getMem_profileRevise());
	         loginMem.setMem_profile_savePath("resources/mem_upfiles");
	         
	         // 새로운 첨부파일명을 반환해주는 메소드를이용해서 첨부파일이 있는지 확인
	         if(multiRequest.getOriginalFileName("profile") != null) {
	            loginMem.setMem_profileOG(multiRequest.getOriginalFileName("profile"));
	            loginMem.setMem_profileRevise(multiRequest.getFilesystemName("profile"));
	            loginMem.setMem_profile_savePath("resources/mem_upfiles");
	            
	            // 기존 첨부파일이 있을 경우 -> 삭제
	            if(((Member)request.getSession().getAttribute("loginMem")).getMem_profileOG() != null) {
	            	new File(savePath + ((Member)request.getSession().getAttribute("loginMem")).getMem_profileOG()).delete();
	            } 
	         } 
	                  
	         
	         Member updateMem = new MemberService().updateMember(loginMem);
	        
	         
	         if(updateMem != null) {
	        	 //request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
	        	 
	        	 HttpSession session = request.getSession();
	        	 session.setAttribute("loginMem", updateMem);
	        	 
	        	 // sendRedirect방식으로 보내주기
	        	 // /jsp/myPage.me
	        	 response.sendRedirect("views/member/EditMember.jsp");
	        	 
	         } else {
	        	 
	        	 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
