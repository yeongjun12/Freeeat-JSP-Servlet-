 package com.freeeat.place.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.freeeat.common.MyFileRenamePolicy;
import com.freeeat.common.model.vo.Photo;
import com.freeeat.place.model.service.PlaceService;
import com.freeeat.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/review.mr")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10; //10Mbyte
			
			String savePath = request.getServletContext().getRealPath("/resources/review_upfiles");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int userNo = Integer.parseInt(multiRequest.getParameter("memNo"));
			int placeNo = Integer.parseInt(multiRequest.getParameter("placeNo"));
			String reviewCount = multiRequest.getParameter("reviewStar");
			String reviewMenutype = multiRequest.getParameter("menu-type");
			String reviewContent = multiRequest.getParameter("content");
			// tag VO에 담아서 보내야 된다고 생각했지만,  
			// tag는 최대 5개를 DB에 가지고 가야 하기 때문에 그냥 들고 가서 배열로 빼주겠음. 
			String[] tags = multiRequest.getParameterValues("tag");
			
			// review 객체에 담아주기 
			Review review = new Review();
			review.setMemNo(userNo);
			review.setPlaceNo(placeNo);
			review.setReviewCount(Integer.parseInt(reviewCount));
			review.setReviewMenuType(reviewMenutype);
			review.setReviewContent(reviewContent);
			
			
			// photo가 최대 4장이니까 
			ArrayList<Photo> photoList = new ArrayList();
			//service에서 isEmpty()로 DAO보내장 
			
			for(int i = 1; i <= 4; i++) {
				String key = "file" + i; 
					if(multiRequest.getOriginalFileName(key) != null) {
					Photo photo = new Photo();
					photo.setPlaceNo(placeNo);
					photo.setOriginName(multiRequest.getOriginalFileName(key));
					photo.setChangeName(multiRequest.getFilesystemName(key));
					photo.setFilePath("resources/review_upfiles");
					
					photoList.add(photo);
				}
			}
			
			int result = new PlaceService().reviewInsert(review, photoList, tags);
			
			if(result > 0) {
				// 여기 가는 게 아니라 성공하면 해당 정보를 가지고 다시 jsp에 가야 함 
				// 아님아님 다시 페이징 요청에서 다녀오면 됨 ----- 해당 상세페이지를 요청하면 응답해주는 게 전체 select니까 다시 조회해서 올 것 
				request.setAttribute("alertMsg", "리뷰등록이 완료되었습니다.");
				response.sendRedirect(request.getContextPath() + "/placeDetail.mr?placeNo="+placeNo);
				
			} else {
				
				if( photoList != null) {
					for(Photo reP : photoList) {
						new File(savePath + reP.getChangeName()).delete();						
					}
				} 
				
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
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
