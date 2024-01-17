package com.freeeat.content.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.content.model.service.ContentService;
import com.freeeat.content.model.vo.Content;
import com.freeeat.member.model.vo.Member;

/**
 * Servlet implementation class ContentListCategoryController
 */
@WebServlet("/contentListC.sk")
public class ContentListCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentListCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// -- 페이징처리 --
		int listCount;
		int pageLimit;
		int boardLimit;
		
		int currentPage;
		int maxPage;
		int startPage;
		int endPage;
		
		// 콘텐츠 카테고리
		String cate = request.getParameter("cate");
		if (cate.equals("article")) cate = "기사";
		else if (cate.equals("place")) cate = "식당";
		
		listCount = new ContentService().selectContentListCountByCategory(cate);
		pageLimit = 10;
		boardLimit = 10;
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			  endPage = maxPage;
		}
		
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Content> list = new ContentService().selectContentListByCategory(pi, cate);
		
		
		Member loginMem = (Member)request.getSession().getAttribute("loginMem");
		
		if (loginMem != null) {
			
			ArrayList<Integer> likeList = new ContentService().selectContentLikeList(loginMem.getMemNo());
			
			for (Content cont : list) {
				for (int no : likeList) {
					if(cont.getContNo() == no) {
						cont.setLikeYN("Y");
						break;
					}
				}
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("cate", cate);
		
		request.getRequestDispatcher("views/content/contentListView.jsp").forward(request, response);
	
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
