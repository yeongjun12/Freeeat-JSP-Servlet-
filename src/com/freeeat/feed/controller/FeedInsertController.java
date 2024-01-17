package com.freeeat.feed.controller;

import static com.freeeat.common.JDBCTemplate.close;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.freeeat.common.MyFileRenamePolicy;
import com.freeeat.feed.model.service.FeedService;
import com.freeeat.feed.model.vo.Feed;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class FeedInsertController
 */
@WebServlet("/feedInsert.ih")
public class FeedInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		// 2) "첨부파일" => multipart/form-data 가 맞아? => 조건제시 => 서버로 파일 올려주자
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// MultipartRequest 객체 생성
			// 객체 생성 전
			// 1_1. 전송 용량 제한 (10Mbyte)
			int maxSize = 1024 * 1024 * 10;
			
			// 1_2. 저장할 서버의 물리적 리얼 경로 제시
			String savePath = request.getServletContext().getRealPath("/resources/feed_upfiles/");
			
			// 2. MultipartRequest객체 생성 (** 파일명 수정해서 올리기)
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 찐 2단계 ) multiRequest로부터 값 뽑기 => getParameterValue()를 이용하여 값을 뽑자
			String feedTitle = multiRequest.getParameter("title");
			String feedText = multiRequest.getParameter("feedText");
			String[] feedTagArr = multiRequest.getParameterValues("tag"); // ["일상", "취미"] // null
			//String.join("구분자", 배열명);
			String feedTag = "";
			if (feedTagArr != null) {
				feedTag = String.join(",", feedTagArr);
			}
			String userNo = multiRequest.getParameter("userNo");
			
			// 3) VO로 가공 
			// Feed
			Feed f = new Feed();
			f.setFeedTitle(feedTitle);
			f.setFeedText(feedText);
			f.setFeedTag(feedTag);
			f.setMemNo(Integer.parseInt(userNo));
			
			if(multiRequest.getOriginalFileName("file1") != null) { // 파일이 없으면 null값 // 안으로 들어오면 파일이 존재한다는 뜻
				f.setOriginName(multiRequest.getOriginalFileName("file1"));
				f.setChangeName(multiRequest.getFilesystemName("file1"));
				f.setFilePath("resources/feed_upfiles/");
			}

			// 4) 서비스 요청
			int result = new FeedService().insertFeed(f);
			
			// 5) 결과에 따른 응답 뷰 지정
			if(result > 0) { // 성공시 feed페이지 메핑값으로 요청
				
				request.getSession().setAttribute("alertMsg", "피드 등록은 성공하셨습니다만.. 이것이 과연 당신에게 이득이 될까요..??");
				// 메뉴바에 로그인 만들고 주석 제거.?
				response.sendRedirect(request.getContextPath() + "/FeedGo.ih");
				
			} else { // 실패시 에러페이지인데 실패를 안할거라고.....음... 
				request.getSession().setAttribute("alertMsg", "응 실패야 집에나 가");
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
