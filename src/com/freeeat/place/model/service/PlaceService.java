package com.freeeat.place.model.service;

import static com.freeeat.common.JDBCTemplate.close;
import static com.freeeat.common.JDBCTemplate.commit;
import static com.freeeat.common.JDBCTemplate.getConnection;
import static com.freeeat.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.freeeat.common.model.vo.PageInfo;
import com.freeeat.common.model.vo.Photo;
import com.freeeat.place.model.dao.PlaceDao;
import com.freeeat.place.model.vo.Place;
import com.freeeat.place.model.vo.PlaceMenu;
import com.freeeat.place.model.vo.PlacePhoto;
import com.freeeat.place.model.vo.Request;
import com.freeeat.place.model.vo.ReviewLike;
import com.freeeat.place.model.vo.Wish;
import com.freeeat.review.model.vo.Review;

public class PlaceService {

	
	public int selectListCount(String keyword) {
		
		Connection conn = getConnection();
		
		int listCount = new PlaceDao().selectListCount(conn, keyword);
		close(conn);

		return listCount;
		
	}

//	혜진 식당 검색 시작
	public ArrayList<Place> selectList(PageInfo pi, String keyword, String orderby) {
		
		Connection conn = getConnection();
		
		 ArrayList<Place> list = new PlaceDao().selectList(conn, pi, keyword, orderby);
		 
		 close(conn);
		 
		 return list;
	}

	public ArrayList<Place> selectRecentList(int memNo) {
		
		Connection conn = getConnection();
		
		 ArrayList<Place> list = new PlaceDao().selectRecentList(conn, memNo);
		 
		 close(conn);
		 
		 return list;
	}

	public ArrayList<Place> selectTop() {
		
		Connection conn = getConnection();
		
		 ArrayList<Place> list = new PlaceDao().selectTop(conn);
		 
		 close(conn);
		 
		 return list;
	
	}

	//최근 본 식당 중복여부 select
	public int recentSelect(int placeNo, int memNo) {
		
		Connection conn = getConnection();
		
		 int overlap = new PlaceDao().recentSelect(conn, placeNo, memNo);
		 
		 close(conn);
		 
		 return overlap;
	}
	
	//식당 중복되지 않을 시 insert
	public int recentInsert(int placeNo, int memNo) {

		Connection conn = getConnection();
		
		 int result = new PlaceDao().recentInsert(conn, placeNo, memNo);
		 
		 if(result > 0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 close(conn);
		 
		 return result;
	
	}
	
	//식당 중복 시 날짜 update
	public int recentUpdate(int placeNo, int memNo) {

		Connection conn = getConnection();
		
		 int result = new PlaceDao().recentUpdate(conn, placeNo, memNo);
		 
		 if(result > 0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 close(conn);
		 
		 return result;
	}
	
	// 최근 본 식당 삭제
	public int recentDelete(int placeNo, int memNo) {
		
		Connection conn = getConnection();
		
		 int result = new PlaceDao().recentDelete(conn, placeNo, memNo);
		 
		 if(result > 0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 close(conn);
		 
		 return result;
		 
	}	
	
//	혜진 식당 검색 끝
	
// 유경 관리자 기능 시작
	public ArrayList<Place> placeSelectList(String sort){ // 전체 리스트 조회
		   
		  ArrayList<Place> list = null;
	      Connection conn = getConnection();  
	      if(sort.equals("A")) list = new PlaceDao().placeAllList(conn); // 모든 식당
	      else list = new PlaceDao().placeSelectList(conn,sort);// PLACE_STATUS : 대기(W),삭제(D) 승인(Y,N) 
	      close(conn);
	      return list;
	 }
		   
	 public ArrayList<Place> placeSearchList(String keyword){ // 검색된 키워드에 맞는 리스트
	    Connection conn = getConnection();
	    ArrayList<Place> list = new PlaceDao().placeSearchList(conn, keyword);
	    close(conn);
	    return list;
	 }
	 
	 // 식당, 메뉴, 사진 조회 : 관리페이지
	 public Place placeSelect(int pno) { 
	     
	    Connection conn = getConnection();
	    
	    Place place = new PlaceDao().placeSelect(conn, pno);
	    
	    close(conn);
	    
	    return place;
	 }
	 
	 public ArrayList<PlaceMenu> placeMenuSelect(int pno){
		   Connection conn = getConnection();
		   ArrayList<PlaceMenu> list = new PlaceDao().placeMenuSelect(conn, pno);
		   close(conn);
		   return list;
	 }
	 
	 public PlacePhoto placePhotoSelect(int pno){
		   Connection conn = getConnection();
		   PlacePhoto photo = new PlaceDao().placePhotoSelect(conn, pno);
		   close(conn);
		   return photo; // 있으면 photo : 없으면 비어있는 객체
	 }
	 
	 // 식당, 메뉴, 사진 등록
	 public int placeInsert(Place place, ArrayList<PlaceMenu> list, PlacePhoto photo) {
	    
	    Connection conn = getConnection();
	 
	    int result1 = new PlaceDao().placeInsert(conn, place);
	    int result2 = 0;
	    int result3 = 1; // 사진 없을 때도 성공해야함
	    
	    if(result1 > 0) {
	  	  result2 = new PlaceDao().placeMenuInsert(conn, list); 
	
	        if(photo.getChangeName() != null){ 
	           // 문제 : 사진 있을 때만 INSERT되어야하는데 실행사진 없을 때 오류 발생
	           // controller에서 객체 생성했기 때문에 객체는 무조건 있음
	           // 따라서 객체 안의 필드값이 null인지 아닌지 판단해야함
	           result3 = new PlaceDao().placePhotoInsert(conn, photo);
	        }
	    }
	    
	    if((result1* result2 * result3) > 0) {
	       commit(conn);
	    }else {
	       rollback(conn);
	    }
	    close(conn);
	    return (result1* result2 * result3);
	 } 
	 
	 // 식당, 메뉴, 사진 삭제
	 public int placeDelete(int pno) {
		   
		   Connection conn = getConnection();
	
		   int result1 = new PlaceDao().placeDelete(conn, pno);
		   // 메뉴는 상태값 없어서 따로 삭제처리 x > 삭제 후, 상세페이지에서 보여줘야하기 때문에
		   
		   int result2 = 1; // 사진없으면 dao 가서 변경 안해도 되니까 
		  
		   if(placePhotoSelect(pno).getPlacePhotoNo() != 0) { // 사진이 있는 지 확인  
			   result2 = new PlaceDao().placePhotoDelete(conn,pno); // 있으면 삭제, 식당에 사진 1개씩	등록가능해서 식당 번호로 식별가능	   
		   }
		   
		   if((result1*result2) >0) {commit(conn);}
		   else {rollback(conn);}
		   close(conn);
		   return (result1*result2);
	 }
	 
	 // 체크박스로 삭제
	 public int placeCheckDelete(String[] clist){
		   
		   int result = 1; // 식당정보가 여러개 있을 수 있기 떄문에
		   Connection conn = getConnection();
		   
		   for(int i = 0; i < clist.length; i++) { // 배열은 length
			   
			   int pno = Integer.parseInt(clist[i]); 
			   result *= placeDelete(pno);	 // 하나의 식당+메뉴+사진 세트로 지워야함
		   }
		   close(conn);
		   return result;
	 }
	 
 	// 식당 수정 @@@@@@@@@@@@@@@@
	 public int placeUpdate(Place place, ArrayList<PlaceMenu> list, PlacePhoto photo){
		
		   Connection conn = getConnection();
		   int result1 = new PlaceDao().placeUpdate(conn, place);
  
		   int result2 = 0; // 메뉴는 무조건 있음
		   int result3 = 1; // 사진 없을 때도 성공해야함
		       
		   result2 = new PlaceDao().placeMenuDelete(conn, place.getPlaceNo()); 
		   
		   
		   if(result2 > 0) { // 삭제하고 다시 insert
		    	result2 = new PlaceDao().placeMenuUpdate(conn, list);

		   }
		    	
		   if(photo != null){ 
		        if((photo.getPlacePhotoNo() != 0) &&( photo.getPlaceNo() != 0)) {

		        	result3 = new PlaceDao().placePhotoUpdate(conn, photo);

		        }else if((photo.getPlacePhotoNo() == 0) &&( photo.getPlaceNo() != 0)){ // 기존 파일 없으면
		        	result3 = new PlaceDao().placeNewPhotoInsert(conn,photo);
		        	
		        }else if((photo.getPlacePhotoNo() != 0) &&( photo.getPlaceNo() == 0)){ // 추가할 파일 없음 : 기존 파일을 삭제
		        	
				    result3 = new PlaceDao().originPlacePhotoDelete(conn, place.getPlaceNo());
				} 
		   }
	
		if((result1* result2 * result3) > 0) {
			commit(conn);
	    }else {
	       rollback(conn);
	    }
		   close(conn);
		   return (result1*result2*result3);
	 	}
  
	 // 승인/거절 > 사진  삭제 처리도 해야함
	 public int placeConfirm(int pno, String status){
			
			Connection conn = getConnection();
			int result = new PlaceDao().placeConfirm(conn, pno, status);
			
			if(result > 0) {commit(conn);}
			else {rollback(conn);}
			
			return result;
	 }
	 
	 // 요청 전체 리스트 조회
	 public ArrayList<Request> requestList(){
		   
		    Connection conn = getConnection();
			ArrayList<Request> list = new PlaceDao().requestList(conn);
			close(conn);				
			return list;
	 }
	 
	 // 요청사항 상세 조회
	 public Request requestSelect(int reqno) {
		
		   Connection conn = getConnection();
		   Request r = new PlaceDao().requestSelect(conn, reqno);
		   close(conn);
		   return r;
	 }
	 
	 // 요청사항 수정 > 테이블에서 삭제 + 식당,메뉴,사진 한 번에 수정되어야함
	 public int requestUpdate(int reqno, Place place, ArrayList<PlaceMenu> list, PlacePhoto photo) {
	    Connection conn = getConnection();
	    int result1 = new PlaceDao().requestUpdate(conn, reqno);
	    
	    System.out.println("result1 : "+ result1);
	    int result2 = 0;
	    
	    if(result1 > 0) {
	       System.out.println("ㅁㄴㅇ : " + place);
	       System.out.println("ㅁㄴㅇlsit : " + list);
	       System.out.println("ㅁㄴㅇphoto : " + photo);
	       result2 = placeUpdate(place, list, photo); // 식당 수정
	    } 
	    
	    if((result1*result2) > 0) {commit(conn);}
	    else { rollback(conn);}
	    
	    return (result1*result2);
	 }
	 
// 유경 관리자 기능 끝
// 영준시작

			public int insertPlace(Place reportPlace, ArrayList<PlaceMenu> list,PlacePhoto at) {
				
				Connection conn = getConnection();
				
				int result = new PlaceDao().insertPlace(conn, reportPlace);
				
				int result2 = 1;
				if(at != null) {
					 result2 = new PlaceDao().insertPlacePhoto(conn, at);
				}
				
				for(int i =0; i< list.size(); i++) {
					
					 result *= new PlaceDao().insertMenu(conn,list.get(i));
					
				}
				
				if(result * result2> 0) {
					commit(conn);
				} else {
					rollback(conn);
				}
				
				close(conn);
				
				
				return result;
			}
			
			
			public ArrayList<Wish> selectWish(int memNo){
				
				Connection conn = getConnection();
				
				ArrayList<Wish> wish = new PlaceDao().selectWish(conn,memNo);
				
				close(conn);
				
				return wish;
			}

			
			public int deleteWish(int placeNo,int memNo) {
				
				Connection conn = getConnection();
				
				int result = new PlaceDao().deleteWish(conn,placeNo,memNo);
				
				if(result > 0) { //성공
					commit(conn);
					
				} else { // 실패
					rollback(conn);
				}
				
				close(conn);
				
				
				return result;
				
			}
			

				
				
			public int selectWishListCount() {
			      Connection conn = getConnection();
			      
			      int result = new PlaceDao().selectWishListCount(conn);
			      
			      close(conn);
			      
			      return result;			
				
				
					   }
			
		   public int selectWishListCount(int memNo) {
		         Connection conn = getConnection();
		         
		         int wishCount = new PlaceDao().selectWishListCount(conn,memNo);
		         
		         close(conn);
		         
		         return wishCount;         
		      
		      
		            }
		   
// 영준 끝
			
			/*
			 * 강매란 시작 
			 */
			public int requestInsert(Request req) {
				
				Connection conn = getConnection();
				
				int result = new PlaceDao().requestInsert(conn, req);
				
				if(result > 0) commit(conn);
				else rollback(conn);
				
				close(conn);
				
				return result;
			}
			
			
			public ArrayList<Photo> photoListSelect(int placeNo){
				Connection conn = getConnection();
				
				ArrayList<Photo> phoList = new PlaceDao().photoListSelect(conn, placeNo);
				
				close(conn);
				
				return phoList; 
				
			}
			
			public ArrayList<Photo> placeSelectPhoto(int placeNo){
				Connection conn = getConnection();
				
				ArrayList<Photo> pPhoto = new PlaceDao().placeSelectPhoto(conn, placeNo);
				
				close(conn);
				
				return pPhoto; 
				
			}
			
			// 식당 조회수 증가 
			public int placeIncreaseCount(int placeNo) {
				Connection conn = getConnection();
				
				int result = new PlaceDao().placeIncreaseCount(conn, placeNo);
				
				if (result > 0) commit(conn);
				else rollback(conn);
				
				return result;
				
			}
			
			
			// 식당 상세정보 들고 셀렉트
			public Place placeSelectDetail(int placeNo){
				Connection conn = getConnection();
				
				Place place = new PlaceDao().placeSelectDetail(conn, placeNo);
				
				close(conn);
				
				return place;
			}
			
			
			public ArrayList<PlaceMenu> placeSelectMenu(int placeNo){
				Connection conn = getConnection();
				
				ArrayList<PlaceMenu> pMenu = new PlaceDao().placeMenuSelect(conn, placeNo);
				
				close(conn);
				
				return pMenu;
			}
			
			
			//강매란 리뷰 insert 
			public int reviewInsert(Review review , ArrayList<Photo> photoList, String[] tags) {
				
				Connection conn = getConnection();
				
				int result1 = new PlaceDao().reviewInsert(conn, review);
				
				int result2 = new PlaceDao().tagsInsert(conn, tags);
				
				int result3 = 1; 
				if(!photoList.isEmpty()) {
					result3 = new PlaceDao().reviewPhotoInsert(conn, photoList);
					
				}
				
				if( (result1 * result2 * result3) > 0) {
					commit(conn);
				} else {
					rollback(conn);
				}
				
				close(conn);
				
				
				return (result1 * result2 * result3);
			} // reviewInsert 
			
			
			// select Review 
			public ArrayList<Review> placeSelectReview(int placeNo){
				
				Connection conn = getConnection();
				
				ArrayList<Review> rList = new PlaceDao().placeSelectReview(conn, placeNo);
				
				if(!rList.isEmpty()) {
					rList = new PlaceDao().placeSelectReviewTags(conn, placeNo, rList); 
				} 
				
				if(!rList.isEmpty()) {
					rList = new PlaceDao().placeSelectReviewPhoto(conn, placeNo, rList);			
				}
				
				close(conn);
				
				return rList;
			}
			
			//-----------------------------------------------------------------------추가
			public ArrayList<ReviewLike> placeReviewLikeSelect(int memNo, int placeNo){
				Connection conn = getConnection();
				
				ArrayList<ReviewLike> reviewLikeList = new PlaceDao().placeReviewLikeSelect(conn, memNo, placeNo);

				close(conn);
				
				return reviewLikeList;
			}
			
			public int placeInsertWish(int placeNo, int memNo) {
				Connection conn = getConnection();
				
				int result = new PlaceDao().placeInsertWish(conn, placeNo, memNo);
				
				if(result > 0) commit(conn);
				else rollback(conn);
				
				close(conn);
				
				return result;
			}
			
			public int placeWishCount(int placeNo) {
				Connection conn = getConnection();
				
				int result = new PlaceDao().placeWishCount(conn, placeNo);
				
				close(conn);
				
				return result; 
			}
			
			public ArrayList<ReviewLike> selectReviewCount(int placeNo){
				Connection conn = getConnection();
				
				ArrayList<ReviewLike> list = new PlaceDao().selectReviewCount(conn, placeNo);
				
				close(conn);
				
				return list;
			}
			
			public int likeReviewInsert(int reviewNo, int memNo) {
				Connection conn = getConnection();
				
				int result = new PlaceDao().likeReviewInsert(conn, reviewNo, memNo);
				
				if(result > 0) commit(conn);
				else rollback(conn);
				
				close(conn);
				
				return result;
			}
			
			public int likeReviewDelete(int reviewNo, int memNo) {
				Connection conn = getConnection();
				
				int result = new PlaceDao().likeReviewDelete(conn, reviewNo, memNo);
				
				if(result > 0) commit(conn);
				else rollback(conn);
				
				close(conn);
				
				return result;
			}
			
			public int recountReviewCount(int reviewNo) {
				Connection conn = getConnection();
				
				int result = new PlaceDao().recountReviewCount(conn, reviewNo);
				
				close(conn);
				
				return result; 
			}
			
			/*
			 * 강매란 끝 
			 */

}
