package com.freeeat.content.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.content.model.service.ContentService;
import com.freeeat.content.model.vo.Content;

/**
 * Servlet implementation class ContentInsertController
 */
@WebServlet("/insertCont.sk")
public class ContentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Content cont = new Content();

		cont.setContTitle(request.getParameter("contTitle"));
		cont.setContInfo(request.getParameter("contInfo"));
		cont.setContSource(request.getParameter("contSource"));
		cont.setContCategory(request.getParameter("contCategory"));
		cont.setContLink(request.getParameter("contLink"));
		cont.setContImgSource(request.getParameter("contImgLink"));
		cont.setMenuType(request.getParameter("menuType"));
		
		int result = new ContentService().insertContent(cont);
		
		if(result > 0) {
			request.getSession().setAttribute("successMsg", "콘텐츠를 등록했습니다.");
			response.sendRedirect(request.getContextPath() + "/contentList.sk?cpage=1");
		} else {
			request.getRequestDispatcher("views/common/error404.jsp");
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
