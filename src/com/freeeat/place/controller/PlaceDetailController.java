package com.freeeat.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.freeeat.common.model.vo.Photo;
import com.freeeat.member.model.vo.Member;
import com.freeeat.place.model.service.PlaceService;
import com.freeeat.place.model.vo.Place;
import com.freeeat.place.model.vo.PlaceMenu;
import com.freeeat.place.model.vo.ReviewLike;
import com.freeeat.review.model.vo.Review;

/**
 * Servlet implementation class PlaceDetailController
 */
@WebServlet("/placeDetail.mr")
public class PlaceDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceDetailController() {
    	

        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		int placeNo = Integer.parseInt(request.getParameter("placeNo"));
	
		// 조회수 증가 완료~~ 
		int result = new PlaceService().placeIncreaseCount(placeNo);
		
		HttpSession session = request.getSession();
		
		int memNo = 0;
		
		if(result > 0) {
			// 식당 정보 조회해 오기(식당/메뉴/사진)
			Place place = new PlaceService().placeSelectDetail(placeNo);
			ArrayList<PlaceMenu> pMenu = new PlaceService().placeSelectMenu(placeNo); 
			ArrayList<Photo> pPhoto = new PlaceService().placeSelectPhoto(placeNo);
			
			// 식당 리뷰 조회해 오기
			ArrayList<Review> rList = new PlaceService().placeSelectReview(placeNo);
			ArrayList<ReviewLike> reviewCountList = new ArrayList();
			if(!rList.isEmpty()) {
				 reviewCountList = new PlaceService().selectReviewCount(placeNo);
			}
			// 식당 리뷰의 좋아요 조회해 오기
			if((Member)session.getAttribute("loginMem") != null) {
				//session에 로그인 유저의 담긴 memNo 값 뽑기
				memNo = ((Member)session.getAttribute("loginMem")).getMemNo();
			} 
			ArrayList<ReviewLike> reviewLikeList = new PlaceService().placeReviewLikeSelect(placeNo, memNo);

			// 식당 정보 값담기(식당/메뉴/사진)
			request.setAttribute("pMenu", pMenu);
			request.setAttribute("place", place);	
			request.setAttribute("pPhoto", pPhoto);
			request.setAttribute("rList", rList);
			request.setAttribute("reviewLikeList", reviewLikeList);
			request.setAttribute("reviewCountList", reviewCountList);

			request.getRequestDispatcher("/views/place/placeSelectDetailView.jsp").forward(request, response);
		} else {
			
			request.setAttribute("errorNsg", "placeDetail에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
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
