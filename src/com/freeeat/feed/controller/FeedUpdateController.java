package com.freeeat.feed.controller;

import java.io.IOException;
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
 * Servlet implementation class FeedUpdateController
 */
@WebServlet("/feedUpdate.ih")
public class FeedUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 *1024 * 20;

			String savePath = request.getSession().getServletContext().getRealPath("/resources/feed_upfiles/");
			// 전달될 파일을 저장시킬 폴더의 물리적인 경로를 알아내기 String savePath
			// String getRealPath(path) : 시스템 경로를 기준으로 시작하며 "/" 문자로 시작합니다. 시스템 루트경로에서 부터 '파라미터로 전달한 경로가 포함'한 경로를 문자열로 반환합니다.
			// 전달된 파일명 수정 후 서버에 업로드
				// MultipartRequest 객체를 생성함으로 서버에 파일이 업로드
				MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				
				// UPDATEBOARD : 공통적으로 수행해야 하는 SQL
				// 2) 값 뽑기 request => multuRequest
				int memNo = Integer.parseInt(multiRequest.getParameter("userNo"));
				String title = multiRequest.getParameter("title");
				String feedText = multiRequest.getParameter("feedText");
				int feedNo = Integer.parseInt(multiRequest.getParameter("feedNo3"));
				String beforeChangeOgFileName = multiRequest.getParameter("originFileName");
				String beforeChangeChFileName = multiRequest.getParameter("originFileName");
				
				String[] feedTagArr = multiRequest.getParameterValues("tag"); 
				String feedTag = "";
				if (feedTagArr != null) {
					feedTag = String.join(",", feedTagArr);
				}
				
				Feed f = new Feed();
				f.setMemNo(memNo);
				f.setFeedTitle(title);
				f.setFeedText(feedText);
				f.setFeedNo(feedNo);
				f.setFeedTag(feedTag);
				
				if(multiRequest.getOriginalFileName("file3") != null) { // 파일이 없으면 null값 // 안으로 들어오면 파일이 존재한다는 뜻 
					f.setOriginName(multiRequest.getOriginalFileName("file3"));
					f.setChangeName(multiRequest.getFilesystemName("file3"));
					f.setFilePath("resources/feed_upfiles/");
					
				} else {
					f.setOriginName(beforeChangeOgFileName);
					f.setChangeName(beforeChangeOgFileName);
					f.setFilePath("resources/feed_upfiles/");
				}
				
				int result = new FeedService().updateFeed(f);
				
				// 결과에 따른 응답 뷰 지정
				if(result > 0) { 
					request.getSession().setAttribute("alertMsg", "피드 수정 성공.. 이 메시지를 발견하시면 행운이 옵니다.");
					response.sendRedirect(request.getContextPath() + "/FeedGo.ih");
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
