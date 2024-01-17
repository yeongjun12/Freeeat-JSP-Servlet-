package com.freeeat.place.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.freeeat.common.MyFileRenamePolicy;
import com.freeeat.place.model.service.PlaceService;
import com.freeeat.place.model.vo.Place;
import com.freeeat.place.model.vo.PlaceMenu;
import com.freeeat.place.model.vo.PlacePhoto;
import com.oreilly.servlet.MultipartRequest;



/**
 * Servlet implementation class PlaceReportController
 */
@WebServlet("/report.yj")
public class PlaceReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			String savePath = application.getRealPath("/resources/placephoto_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		String placeName = multiRequest.getParameter("placeName");
		String detailAddress = multiRequest.getParameter("detailAddress");
		String residence = multiRequest.getParameter("residence");
		String placeKind = multiRequest.getParameter("placeKind");
		String time1 = multiRequest.getParameter("time1");
		String time2 = multiRequest.getParameter("time2");
		String parking = multiRequest.getParameter("parking");
		String call = multiRequest.getParameter("call");
//		String photo = request.getParameter("upfile");
		//int count = Integer.parseInt(request.getParameter("count"));
		String placeType = multiRequest.getParameter("placeType");
		String[] dayoffArr = multiRequest.getParameterValues("dayoff");
		String info = multiRequest.getParameter("info");

		
		String address = detailAddress +" "+residence;
		String time = time1 + "~" + time2;
	
		
		String dayoff ="";
		if(dayoffArr != null) {
			dayoff= String.join(",", dayoffArr);
		}
		

	

	ArrayList<PlaceMenu> list = new ArrayList();
		PlaceMenu menu = new PlaceMenu();
		menu.setMenuName(multiRequest.getParameter("menu"));
		menu.setMenuType(multiRequest.getParameter("menuType"));
		menu.setPrice(Integer.parseInt(multiRequest.getParameter("price")));
		
		list.add(menu);
		
		
		//ArrayList<String> list2 = new ArrayList();
		for(int i = 2; i < 6; i++) {
			
			if(request.getParameter("menu"+i) != null) {
				
				PlaceMenu menu2 = new PlaceMenu();
				
				menu2.setMenuName(multiRequest.getParameter("menu"+i));
				
				menu2.setMenuType(multiRequest.getParameter("menuType"+i));
				menu2.setPrice(Integer.parseInt(multiRequest.getParameter("price"+i)));
			
				list.add(menu2);
			}
		}
		

	
		Place reportPlace = new Place();
		reportPlace.setPlaceName(placeName);
		reportPlace.setPlaceAddress(address);
		reportPlace.setPlaceType(placeType);
		reportPlace.setPlaceKind(placeKind);
		reportPlace.setPlaceTime(time);
		reportPlace.setPlaceParking(parking);
		reportPlace.setPlacePhone(call);
		reportPlace.setPlaceDayoff(dayoff);
		reportPlace.setPlaceInfo(info);
		
		
		// 두번째 INSERT -> 선택적(첨부파일이 있을 경우에만 INSERT)
					PlacePhoto at = null;
					
					
					// multiRequest.getOriginalFileName("키값");
					// => 첨부파일이 있으면 "원본파일명" / 첨부파일이 없으면 null 리턴
					if(multiRequest.getOriginalFileName("upfile") != null) {
						
						// 첨부파일이 있다 => VO객체로 가공
						at = new PlacePhoto();
						
						System.out.println(multiRequest.getOriginalFileName("upfile"));
						
						at.setOriginName(multiRequest.getOriginalFileName("upfile")); // 원본명
						
						// 수정파일명
						// multiRequest.getFilesystemName("키값");
						at.setChangeName(multiRequest.getFilesystemName("upfile"));
						
						// 파일경로
						at.setFilePath("resources/placephoto_upfiles");
						
						
					}
		
		
		
		int result = new PlaceService().insertPlace(reportPlace,list,at);
		
		
		
		
		if( result > 0) {
			
			RequestDispatcher view = request.getRequestDispatcher("views/member/reportCompleteForm.jsp");
			view.forward(request, response);
			
		}else {
			
			if(at != null) {
				// delete() 호출
				new File(savePath + at.getChangeName()).delete();
			}
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);	
			
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
