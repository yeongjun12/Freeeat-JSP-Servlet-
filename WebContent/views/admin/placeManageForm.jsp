<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.freeeat.place.model.vo.Place, com.freeeat.place.model.vo.PlaceMenu, com.freeeat.place.model.vo.PlacePhoto" %>
<%  
	Place place = (Place)request.getAttribute("place"); 
	ArrayList<PlaceMenu> list = (ArrayList<PlaceMenu>)request.getAttribute("list");
	PlacePhoto photo = (PlacePhoto)request.getAttribute("photo");
	
	int ppap = 0;
	if(photo != null){
		ppap =  photo.getPlacePhotoNo();
	}
	String alertMsg = (String)session.getAttribute("alertMsg");
	
	String type=""; 
	String menu=""; 
	String price=""; 
	
%>
<!DOCTYPE html>
<html>
   <head>
		<meta name="viewport" content="width=device-width, initial-scale=1">	
		<title>식당_관리</title>
		<style>

  * { box-sizing: border-box;}

   .wrap {
        margin-left: 250px;
        padding: 50px;
   }

   .inner-wrap {
        width: 1430px;
        border: 1px solid silver;
        border-radius: 10px;
        padding: 20px;
        margin: auto;
    }

    #mainContent {
        width: 1287px;
        margin-top: 30px;
        margin: auto;
    }

   /*header 영역(첫번째 div)*/
   #header {
       width: 100%;
       display: flex;
       margin-top: 40px;
   }

   #placelogo {
      width: 55px;
      height: 55px;
      margin-left: 20px;
      padding-top: 5px;
  }

   #header-center {
       width: 20%;
       font-size: 45px;
       margin-left: 15px;
   }

   #header-right {
       width: 450px;
       margin-top: 25px;
       margin-left: 810px;
   }

   .place-btn {
       width: 90px;
       height: 35px;
       border: 2px solid #ddd;
       cursor: pointer;
   }

   .place-btn:hover,
   #back:hover {
      background-color: rgb(205, 205, 205);
   }

   #placeTable {
      border-collapse: collapse;
      width: 100%;
      border: 1px solid #ddd;
      font-size: 18px;
      margin-top: 50px;
   }

   #placeTable th {
      text-align: center;
      padding: 12px;
   }

   #placeTable td {
      text-align: left;
      padding: 17px 5px 17px 75px;
   }
             
   #placeTable input {
      text-align: left;
      font-size: 11pt;
      padding: 3px;
      margin-left: 3px;
   }

    #placeTable tr {
      border-bottom: 1px solid #ddd;
    }

	.placeNameInput {
	     width: 90%;
	     height: 40px;
	}


	.textarea {
	    width: 90%;
	    height: 6.25em;
	    resize: none;
	}
	
	#placeImg {
	    width: 250px;
	    height: 250px;
	    margin-right : 10px;
	    border: 2px solid #ddd;
	}
	
	#back {
        margin-top: 20px;
        margin-left: 620px;
        width: 70px;
        height: 40px;
        border: 2px solid #ddd;
        cursor: pointer;
    }
	</style>
</head>
<body>

    <%@ include file="../common/adminMenubar.jsp" %>

	<div class="wrap">
   		<div class="inner-wrap">
       		<div id="mainContent">
           		<form action="<%=contextPath %>/placeUpdate.yk" method="post" enctype="multipart/form-data">
					<div id="header">
					    <div>
					       <img src="<%= contextPath %>/resources/image/place.png" id="placelogo">
						</div>
					    <div id="header-center">식당</div>
					    <div id="header-right">
			
					    <% if(place.getPlaceStatus().equals("W")) { %>
						<button type="submit" class="place-btn">수정</button>
						<button type="button" class="place-btn confirm" value="Y">승인</button>
						<button type="button" class="place-btn confirm" value="N">거절</button>
					
					<% } else if(place.getPlaceStatus().equals("Y")) { %>
						<button type="submit" class="place-btn">수정</button>
						<button type="button" class="place-btn" id = "delete">삭제</button>
					<% } %>
		    			</div>
					</div>

					<hr style="border: 1px solid #ddd">

					<div>
					  	<table id="placeTable">
					       <tr>
					           <th>No.</th>
					           <td><%=place.getPlaceNo() %>
								  <input type="hidden" name ="placeNo" value="<%=place.getPlaceNo()%>">   
					   		   </td>
					   
							   <th>조회수</th>
								 <td><%=place.getPlaceViews()%></td>
					 	  </tr>
						  <tr>
						  	   <th>식당명</th>
						       	  <td colspan="3">
						          	<input type="text" class="placeNameInput" name="placeName" value="<%=place.getPlaceName() %>" required>
						          </td>
						  </tr>

						  <tr>
						     <th>매장소개</th>
						         <% if(place.getPlaceInfo() !=null){ %>
						  <td colspan="3">
						     <textarea class="textarea" name="placeInfo"><%=place.getPlaceInfo() %></textarea>
						  </td>
						  <% } else { %>
						    <td colspan="3">
						       <textarea class="textarea" name="placeInfo"></textarea>
						    </td>
						  <% } %>
						  </tr>

						  <tr>
						    <th>주소</th>
						    <td colspan="3">
						      <textarea class="textarea" name="placeAddress" required><%=place.getPlaceAddress() %></textarea>
						    </td>
						  </tr>

						  <tr>
						     <th>업종</th>
						         <% if(place.getPlaceKind().equals("식당")) {%>
						  <td colspan="1">
						     <label for="kind1">
						        <input type="radio" id="kind1" name="placeKind" value="식당" checked="checked"> 식당
						     </label>
						 </td>
						
						 <td colspan="2">
						    <label for="kind2">
						       <input type="radio" id="kind2"name="placeKind" value="카페"> 카페
						     </label>
						 </td>
						<% } else { %>
						  <td colspan="1">
						     <label for="kind1">
						        <input type="radio" id="kind1"name="placeKind" value="식당"> 식당
						     </label>
						  </td>
						
					      <td colspan="2">
					          <label for="kind2">
					            <input type="radio" id="kind2" name="placeKind" value="카페" checked="checked"> 카페
					          </label>
					        </td>
						 <% } %>
						</tr>

						<tr>
						   <th>영업시간</th>
						   <td colspan="3">
						      <textarea class="textarea" required name="placeTime"><%=place.getPlaceTime() %></textarea>
						   </td>
						</tr>

						<tr>
						   <th>휴무일</th>
						       <% if(place.getPlaceDayoff() != null){ %>
								<td colspan="3">
								   <textarea class="textarea" name="placeDayoff"><%=place.getPlaceDayoff() %></textarea>
								</td>
								
								<% } else { %>
								<td colspan="3">
								   <textarea class="textarea" name="placeDayoff"></textarea>
								 </td>
								<% } %>
						</tr>

						<tr>
						   <th>주차</th>
						       <% if(place.getPlaceParking().equals("N")) {%>
						<td colspan="1">
							<label for="parking1">
								<input type="radio" id="parking1" name="placeParking" checked="checked" value="N"> 불가능
							</label>
						  </td>
						
						  <td colspan="2">
						        <label for="parking2"><input type="radio" id="parking2" name="placeParking" value="Y"> 가능</label>
						  </td>
						<% } else { %>
							<td colspan="1">
							   <label for="parking1">
							     	<input type="radio" id="parking1" name="placeParking" value="N"> 불가능</label>
							</td>
							<td colspan="2">
							   <label for="parking2"><input type="radio" id="parking2" name="placeParking" checked="checked" value="Y"> 가능</label>
							</td>
						<% } %>

						</tr>
						<tr>
							<th>연락처</th>
						    	<td colspan="3">
						        	<textarea class="textarea" name="placePhone"required><%=place.getPlacePhone()%></textarea>
						        </td>
						</tr>
						
					
						<% for(int i=0; i < 5; i++) { %>
							<% 
								type="type"+(i+1); 
								menu="menu"+(i+1); 
								price="price"+(i+1); 
							%>

						<tr>
							<% if(i == 0){%>
								<th rowspan="5">메뉴</th>
							<% } %>
							
							<% if(i < list.size()){%>
								<td>타입 :
								   	<select name="<%=type%>" class="type">
								    	<option class="origin">비건</option>
								    	<option class="origin">락토프리</option>
								    	<option class="origin">글루텐프리</option>
								    	<option class="origin">슈가프리</option>
								    	<option class="origin">동물복지</option>
								    </select>
								</td>
								<td>메뉴명 : 
									<input type="text" name="<%=menu%>"value="<%=list.get(i).getMenuName()%>">                           
								</td>
								<td>가격(원) : 
									<input type="number" name="<%=price%>"value="<%=list.get(i).getPrice()%>">
								 </td>
								 
								 <script>
									$(function(){
										$('select[name=<%= type %>] option').each(function() {
											if($(this).val() == '<%= list.get(i).getMenuType() %>') {
														$(this).prop('selected', true);
											}    
										});
									});
								</script>
								
							<% } else {%>
								 <td>타입 :
								 	<select name="<%=type%>" class="type">
								    	<option class="origin">비건</option>
								      	<option class="origin">락토프리</option>
								      	<option class="origin">글루텐프리</option>
								      	<option class="origin">슈가프리</option>
								      	<option class="origin">동물복지</option>
								    </select>
								 </td>
									<td>메뉴명 : <input type="text" name="<%=menu%>"></td>
									<td>가격(원) : <input type="number" name="<%=price%>"></td>
							<% } %>
						<% } %>
						</tr>
						
						<tr>
						     <th>사진</th>
						      <% if(photo != null) { %>
								<td id="photo-area" >
									<input type="hidden" name="originFile" value="<%=photo.getChangeName() %>">
									<input type="hidden" name="originFileNo" value="<%=photo.getPlacePhotoNo() %>">  
									<img id="placeImg" src="<%=contextPath%>/<%= photo.getFilePath()  + photo.getChangeName() %>">
								    
								    <% if(photo.getStatus().equals("N")) { %>
										<button type="button" id="ppdelete">사진 삭제</button>
									<% } %>
								</td>
							<% } else { %>
								<td>
								   <img id="placeImg" name = "noImg" src="<%=contextPath%>/resources/image/noImage.jpg">		   
								</td>
									<% if(!place.getPlaceStatus().equals("D")&& !place.getPlaceStatus().equals("N")) { %>
										<td>   
										   <input type="file" name="reUpfile" id="file1" onchange="loadImg(this);">
										</td>
									<% } %>
							<% } %>
					      
	   					</tr>
	   					
					 </table>
                   </div>
 			   </form>
            </div>
      	</div>
  	</div>


    <script>

		function loadImg(inputFile) {
			if (inputFile.files.length == 1) {
				var reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload = function(e){
            		$('#placeImg').attr("src", e.target.result);
            	}

			} else {
				$('#placeImg').attr("src", "<%=contextPath%>/resources/image/noImage.jpg");
				$('#placeImg').attr("value", 0);
			}
		};

		 // 삭제 버튼 눌렀을 경우
		$(document).on('click','#delete',function(){
			var pno = <%=place.getPlaceNo()%>
			location.href="<%=contextPath%>/placeDelete.yk?pno="+pno;
		});
	
		<% if(photo != null ) { %>

			// 사진 삭제 눌렀을 때
			$('#ppdelete').on('click',function(){
				$('#placeImg').attr('src', "<%=contextPath%>/resources/image/noImage.jpg");
				result = '<td><input type="file" name="reUpfile" id="file1" onchange="loadImg(this);"></td>'
				$('#photo-area').after(result);
				$('button').remove('#ppdelete');
			});
			
		<% } %>
		
		// 승인 / 거절 눌렀을 떄
		$('.confirm').click(function(){
			var status = $(this).val();
			location.href="<%=contextPath%>/placeConfrim.yk?pno=<%=place.getPlaceNo()%>&&status="+status; 
		});
	 </script>

   </body>
</html>