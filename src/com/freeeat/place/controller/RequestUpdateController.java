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
import com.freeeat.place.model.service.PlaceService;
import com.freeeat.place.model.vo.Place;
import com.freeeat.place.model.vo.PlaceMenu;
import com.freeeat.place.model.vo.PlacePhoto;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class updateRequestForm
 */
@WebServlet("/requestUpdate.yk")
public class RequestUpdateController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestUpdateController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/placephoto_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			System.out.println("dfgfd");
			Place place = new Place();
			ArrayList<PlaceMenu> list = new ArrayList();
			PlacePhoto photo = null; // 실제 첨부파일이 있을경우에만 객체 생성, 없으면 null
			int pno = Integer.parseInt(multiRequest.getParameter("placeNo"));
			
			place.setPlaceNo(pno);
			place.setPlaceName(multiRequest.getParameter("placeName"));
			place.setPlaceTime(multiRequest.getParameter("placeTime"));
			place.setPlaceInfo(multiRequest.getParameter("placeInfo"));
			place.setPlaceAddress(multiRequest.getParameter("placeAddress"));
			place.setPlaceKind(multiRequest.getParameter("placeKind"));
			place.setPlaceDayoff(multiRequest.getParameter("placeDayoff"));
			place.setPlaceParking(multiRequest.getParameter("placeParking"));
			String placePhone = multiRequest.getParameter("placePhone").trim();
			place.setPlacePhone(placePhone);
			
			String placeType ="";
			
			
			for(int i = 1; i <= 5; i++ ) {
				System.out.println("apsb1");
				String menu = multiRequest.getParameter("menu"+i);
				String price = multiRequest.getParameter("price"+i); 
				String type = multiRequest.getParameter("type"+i);
				System.out.println("menu : " + menu);
				
				if((menu.length() != 0) && (price.length() != 0)) {
					
					PlaceMenu m = new PlaceMenu();
					
					m.setPlaceNo(pno);
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
		
			if(multiRequest.getOriginalFileName("reUpfile") != null) { 
				
				photo = new PlacePhoto();
				
				photo.setPlaceNo(pno);
				photo.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				photo.setChangeName(multiRequest.getFilesystemName("reUpfile"));
				photo.setFilePath("resources/placephoto_upfiles/");

				if(multiRequest.getParameter("originFile") != null) { 
					
					photo.setPlacePhotoNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					new File(savePath + multiRequest.getParameter("originFile")).delete();
				}
			}else { // 업로드할 파일 없으면
				
					if(multiRequest.getParameter("originFile") != null) { 
						photo = new PlacePhoto();
						photo.setPlacePhotoNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
						new File(savePath + multiRequest.getParameter("originFile")).delete();
				}
			}
			
			int reqno = Integer.parseInt(multiRequest.getParameter("reqno"));
			
			int result = new PlaceService().requestUpdate(reqno, place,list ,photo);

			if(result > 0) { //성공
				System.out.println("성공");
				response.sendRedirect(request.getContextPath() + "/requestList.yk"); 
				
			}else {
				System.out.println("22실패");
				response.sendRedirect(request.getContextPath() + "/placeManageForm.yk?pno="+pno); 
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