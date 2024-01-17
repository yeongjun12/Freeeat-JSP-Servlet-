package com.freeeat.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.freeeat.place.model.service.PlaceService;
import com.freeeat.place.model.vo.Place;
import com.freeeat.place.model.vo.PlaceMenu;
import com.freeeat.place.model.vo.PlacePhoto;
import com.freeeat.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class PlaceInsertController
 */
@WebServlet("/placeInsert.yk")
public class PlaceInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
		
			String savePath = request.getServletContext().getRealPath("/resources/placephoto_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Place place = new Place();
			ArrayList<PlaceMenu> list = new ArrayList();
			PlacePhoto photo = new PlacePhoto();
			
			place.setPlaceName(multiRequest.getParameter("placeName"));
			place.setPlaceTime(multiRequest.getParameter("placeTime"));
			place.setPlaceInfo(multiRequest.getParameter("placeInfo"));
			place.setPlaceAddress(multiRequest.getParameter("placeAddress"));
			place.setPlaceKind(multiRequest.getParameter("placeKind"));
			place.setPlaceDayoff(multiRequest.getParameter("placeDayoff"));
			place.setPlaceParking(multiRequest.getParameter("placeParking"));
			place.setPlacePhone(multiRequest.getParameter("placePhone"));
	
			String placeType ="";
			
			for(int i = 1; i<=5; i++ ) { // 메뉴는 최대 5개 가능하므로 5까지
				
				String menu = multiRequest.getParameter("menu"+i);
				String price = multiRequest.getParameter("price" + i); 
				String type = multiRequest.getParameter("type"+i);
				
				if((menu.length() != 0) && (price.length() != 0)) {
					
					PlaceMenu m = new PlaceMenu();

					m.setMenuName(menu);
					m.setPrice(Integer.parseInt(price)); 
					m.setMenuType(type);
					
					if(!placeType.contains(type)) { // 중복 제거
						placeType += type + ",";
					} 
					list.add(m);
				}	
			}

			place.setPlaceType(placeType);
					
			photo.setOriginName(multiRequest.getOriginalFileName("file1")); // 원본명
			photo.setChangeName(multiRequest.getFilesystemName("file1")); // 수정명
			photo.setFilePath("resources/placephoto_upfiles/"); // 경로명	

			int result = new PlaceService().placeInsert(place,list,photo);

			if(result > 0) { 
				request.setAttribute("alertMsg", "성공");
				request.getRequestDispatcher("views/admin/placeList.jsp").forward(request, response);
				
			}else { // 실패
				System.out.println("실패");
				request.setAttribute("errorMsg", "실패");
				response.sendRedirect("");// 다시 등록창으로
			}
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
