<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.place.model.vo.Place, com.freeeat.place.model.vo.PlaceMenu, 
com.freeeat.place.model.vo.PlacePhoto, com.freeeat.place.model.vo.Request" %>
<% 
    Place place = (Place)request.getAttribute("place"); 
    ArrayList<PlaceMenu> list = (ArrayList<PlaceMenu>)request.getAttribute("list");
    
    PlacePhoto photo = (PlacePhoto)request.getAttribute("photo");
    
    
    Request r = (Request)request.getAttribute("r");
    
    String type=""; 
	String menu=""; 
	String price=""; 
	
	
%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>수정 요청</title>
    <style>
        * {
            box-sizing: border-box;
        }

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

        #header-left {
            width: 55px;
            height: 55px;
            margin-left: 20px;
            padding-top: 5px;
        }

        #header-center {
            width: 23%;
            font-size: 45px;
            margin-left: 15px;
        }

        #header-right {
            width: 450px;
            margin-top: 25px;
            margin-left: 665px;
        }
		#header-right>div{
			margin-left:75px;
            display:flex;
        }
        
        .request-btn {
            width: 90px;
            height: 35px;
            border: 2px solid #ddd;
            margin-left:5px;
            cursor: pointer;
        }

        .request-btn:hover,
        #back:hover {
            background-color: rgb(205, 205, 205);
        }
        
		#request-table,
		#request-table2{
        	background-color: rgb(238 238 238);
        }
        
        #placeTable,
        #request-table {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd;
            font-size: 18px;
            margin-top: 50px;
        }

        #request-table2 {
            border-collapse: collapse;
            width: 100%;
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            font-size: 18px;
        }

        #placeTable th,
        #request-table th,
        #request-table2 th {
            text-align: center;
            padding: 12px;
        }

        #request-table2 th {
            text-align: center;
            padding-top: 12px;
            padding-left: 5px;
            padding-right: 12px;
            padding-bottom: 12px;
        }

        #placeTable td,
        #request-table td,
        #request-table2 td {
            text-align: left;
            padding: 17px 10px 17px 75px;

        }

        #placeTable input {
            text-align: left;
            font-size: 11pt;
            padding: 3px;
            margin-left: 3px;
        }

        .longInput {
            width: 90%;
            height: 40px;
        }

        #placeTable tr,
        #request-table tr,
        #request-table2 tr {
            border-bottom: 1px solid #ddd;
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
        .placeNameInput {
		     width: 90%;
		     height: 40px;
		}
    </style>
</head>

<body>

    <%@ include file="../common/adminMenubar.jsp" %>
        <div class="wrap">
            <div class="inner-wrap">
                <div id="mainContent">
                <form action="<%=contextPath %>/requestUpdate.yk" method="post" enctype="multipart/form-data">
					<div id="header">
					    <div>
					       <img src="<%= contextPath %>/resources/image/update.png" id="header-left">
						</div>
					    <div id="header-center">수정요청</div>
					    <div id="header-right">
                        	<div>
                        		<button type="submit" class="request-btn">수정하기</button>
                            	<button type="button" class="request-btn" onclick="location.href='<%= contextPath %>/requestList.yk'">목록</button>
                        	</div>
                        </div>
					</div>

					<hr style="border: 1px solid #ddd">
					<div>
                        <table id="request-table">
                            <colgroup>
                                <col style="width: 60px;" />
                                <col style="width: 250px;"/>
                                <col style="width: 80px;" />
                                <col style="width: 210px;" />
                            </colgroup>

                            <tr>
                                <th>요청 No.</th>
                                <td>
                                 <input type= "hidden" name = "reqno" value="<%=r.getRequesetNo() %>">
                                 <%=r.getRequesetNo() %>
                                </td>
                                
                                <th>요청일자</th>
                                <td><%=r.getRequestDate() %></td>
                            </tr>
                            <tr>
                                <th>식당명</th>
                                <td ><%=r.getPlaceName() %></td>
                                <th>요청자</th>
                                <td><%=r.getMemId() %></td>
                            </tr>
                        </table>

                        <table id="request-table2">
                        	<colgroup>
                                <col style="width: 60px;" />
                                <col style="width: 250px;"/>
                                <col style="width: 80px;" />
                                <col style="width: 210px;" />
                            </colgroup>
                            <tr>
                                <th>요청내용</th>
                                <td colspan="3"><%=r.getRequestContent() %></td>
                            </tr>
                        </table>
                    </div>
                        
					<div>
					  	<table id="placeTable">
					       <tr>
					           <th>식당 No.</th>
					           <td><%=place.getPlaceNo() %>
								  <input type="hidden" name ="placeNo" class="placeInput" value="<%=place.getPlaceNo()%>">   
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
									<input type="hidden" name ="size" value="<%=list.size()%>">	                         
									
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
								    	<option>비건</option>
								      	<option>락토프리</option>
								      	<option>글루텐프리</option>
								      	<option>슈가프리</option>
								      	<option>동물복지</option>
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
									   <img id="placeImg" src="<%=contextPath%>/resources/image/noImage.jpg">
									</td>
									<td>   
									   <input type="file" name="reUpfile" id="file1" onchange="loadImg(this);">
									</td>
	
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
				
				reader.onload = function (e) {
					$('#placeImg').attr("src", e.target.result);
				}
			} else {
				$('#placeImg').attr("src", "<%=contextPath%>/resources/image/noImg.png");
			}
		};

		<% if(photo != null ) { %>

			// 사진 삭제 눌렀을 때
			$('#ppdelete').on('click',function(){
				$('#placeImg').attr('src', "<%=contextPath%>/resources/image/noImage.jpg");
				result = '<td><input type="file" name="reUpfile" id="file1" onchange="loadImg(this);"></td>'
				$('#photo-area').after(result);
				$('button').remove('#ppdelete');
			});
		<% } %>

	 </script>	
                
       

</body>

</html>