<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.place.model.vo.Place, com.freeeat.common.model.vo.PageInfo, com.freeeat.content.model.vo.Content" %>
<%
	ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");
	ArrayList<Content> Clist = (ArrayList<Content>)request.getAttribute("Clist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String keyword = (String)request.getAttribute("keyword");
	String orderby = (String)request.getAttribute("orderby");
	
	
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dd7467174bce94b954b035b41a5bccf5&libraries=services"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>'검색어'에 대한 검색 결과</title>
<style>
	.outer div{
		/* border: 1px solid red; */
		box-sizing: border-box;
	}
	.outer{
		height: 2500px;
		width: 1300px;
		margin:0 auto; 
	}
	.outer>div{
		width: 100%;
	}
	.outer #header{
		height: 200px;
	}
	.outer #content{
		height: 2100px;
		width: 1700px;
		left : 150px;
		right : 100px;*/
		display: inline-block;
	}
	.outer #footer{
		height: 200px;
	}
	

	/* header */
	#header > #resultText{
		font-size: 30px;
		font-weight: 700;
		height: 100px;
	}
	
	/* content */

	/* content-resultList */
	#content .result{
		width: 800px;
		float: left;
		margin: auto;
	
	}
	.resturantList > li{
		width: 30%;
		float: left;
		margin: 5px 5px;
		padding : 15px;
	}
	#resturantTitle{
		font-size: 30px;
		font-weight: 700;
		padding-top: 30px;
	}
	.location{
		font-size : 15px;
	}
	.placeName{
		font-size : 18px;
	}
	.grade{
		font-size : 27px;
		font-weight: 600;
		padding-right : 5px;
		float : right;
	}

	/* content-map */
	#rightContent{
		border-left: 1px dotted darkgray;
		height: 2000px;
		width: 450px;
		z-index: -1;
		float: left;
	}
	#map{
		height: 20%;
		margin : 20px;
		z-index: 1;
	}
	
	/* content-resultContent */
	#addressSearch{
		padding: 20px;
	}
	#addressSearch h3{
		font-size : 25px;
		text-align : center;
		padding:10px;
	}
	#addressSearch input{
		width : 400px;	
		height : 50px;
		position: absolute;
	    border-radius: 10px;
   		border: 1px solid darkgrey
	}
	#addressSearch input:focus{
		border-color:#C8E183 ;
	}
	#addressSearch button{
		left: 350px;
    	top: 13px;
		position: relative;
		border : none;
		background-color: white;
	}
	/* 추천 콘텐츠 */
	#contentsRecomm{
		float: left;
		margin : auto;
		padding-left: 35px;
	}
	#contentsTitle{
		font-size: 30px;
		font-weight:700;
	    padding: 12px;
	    margin : auto;
	}
	#contentsList li{
		height : 350px;
		margin : auto;
	}
	#contentsList li .thumbnail_contents{
		height : 180px;
	}
	#contentsList li .thumbnail_contents img{
		height : 100%;
		width : 380px;
	}
	#contentsList li .discription_contents{
		margin : auto;
		height : 120px;
		width : 380px;
		
	}
	.discription{
		height: 110px;
	}
	#contentsList li .discription_contents .contents_title{
		margin : auto;
		height : 50px;
		font-size: 20px;
		
	}
	#contentsList li .discription_contents .content_info{
		font-size: 13px;
		padding : 10px;
		height : 70px;
	}
	#finding img{
    	border-radius: 30px;
    	height : 120px;
    	margin : auto auto;
	}

	/* footer */
	/* 페이징바 */
	.pagination{
  	padding: 30px 0;
	
	}

	.pagination ul{
	margin: 0;
	padding: 0;
	list-style-type: none;
	margin: auto;
	}

	.pagination a{
	display: inline-block;
	padding: 10px 18px;
	color: #222;
	}

	.p1 a{
	width: 40px;
	height: 40px;
	line-height: 40px;
	padding: 0;
	text-align: center;
	}

	.p1 a.is-active{
	background-color: #88A201;
	border-radius: 100%;
	color: #fff;
	}
	
	
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<%@include file = "../common/menubar_hj.jsp"%>

	<div  class="outer">
		<div align="center" id="header">
			<br>
			
			<h2 id="resultText">'<%=keyword %>'에 대한 검색 결과</h2>
		
			<div align="right" id="orderby" >
				
				
				<button onclick="location.href='<%=contextPath%>/selectList.hj?keyword=<%=keyword%>&cpage=1&orderby=GRADE'" class="btn">평점순</button>
				<button onclick="location.href='<%=contextPath%>/selectList.hj?keyword=<%=keyword%>&cpage=1&orderby=WISHCOUNT'" class="btn">찜하기순</button>
				<button onclick="location.href='<%=contextPath%>/selectList.hj?keyword=<%=keyword%>&cpage=1&orderby=REVIEWCOUNT'" class="btn">후기순</button>
				

				&nbsp &nbsp
			</div>


		</div>
			

		<div id="content">

			
				<div class="result">
					<div class="title">
						 <h3 align="center" id="resturantTitle">식당</h3>
						 <h3 align="right" style="padding-right:50px;">총 <%=pi.getListCount()%>건의 검색 결과</h3>
						
					</div>
					
					<%if(list.isEmpty()){ %>
						
						<h5>조회된 식당이 없습니다.</h5>
						
					<%} else { %>
						<%for(Place p : list){ %>
						<ul class="resturantList">
						
							<li>
								<div class="thumbnail">
									<input type="hidden" name="placeNo" value="<%= p.getPlaceNo() %>"/>
									<%if(p.getTitleImg()!= null){%>
										<img src="<%=contextPath%>/<%=p.getTitleImg()%>" alt="" width="100%" height="180px">
									<%} else{ %>
										<img src="resources/image/noimage.jpg" alt="" width="100%">
									<%} %>
									<img src="">
								</div>
									
								<div class="discription">
									<%
									String type =  p.getPlaceType();
									if(type.contains(",")){
									String[] typeArr = type.split(",");										
										for(int i=0; i<typeArr.length; i++){
										%>
										<span class="badge text-bg-success"><%= typeArr[i] %></span>
										<%} %>
									<% }else{%>
									<span class="badge text-bg-success"><%= type %></span>
									<%} %>
									
									
									
									<div class="location"><%=p.getPlaceAddress() %></div> 
									<span class="placeName"><%=p.getPlaceName() %></span>
									<span class="grade"><%= p.getGrade() %></span>
									<div class="count">
										<span>
											<span class="material-icons">
												edit
											</span>
											<%=p.getReviewCount() %>
										</span>
										<span>
											<span class="material-icons">
												favorite
											</span>
												<%=p.getWishCount() %>
										</span>
									</div>
								</div>
							</li>
						<%}%>
					<%}%>
						</ul>
				</div>	
			<script>
				$(function(){
					// 
					$(document).on('click', '.thumbnail', function(){
						var placeNo = $(this).children().eq(0).val();
						//console.log(placeNo);
						location.href = "<%= contextPath %>/placeDetail.mr?placeNo="+placeNo
						
						if(<%=loginMem != null%>){
							location.href = "<%= contextPath %>/recentInsert.hj?placeNo="+placeNo
						}
					})
					
				});
				
				
			</script>
				
			<!-- 지도 -->
			<div id="rightContent">
				<div id="addressSearch">
					<h3>식당 주소로 검색하기 </h3>
					<input type="text" id="text1" placeholder="&nbsp&nbsp지역명을 입력해주세요.">
					<button id="btn1">검색</button>
				</div>
				<div id="map" style="width:400px;height:400px;"></div>
				
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level: 3 // 지도의 확대 레벨
					};  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				$('#btn1').click(function(){
				
				
				var geocoder = new kakao.maps.services.Geocoder();
					
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch($('#text1').val(), function(result, status) {
				
					// 정상적으로 검색이 완료됐으면 
					 if (status === kakao.maps.services.Status.OK) {
				
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
							map: map,
							position: coords
						});
				
						// 인포윈도우로 장소에 대한 설명을 표시합니다
						var infowindow = new kakao.maps.InfoWindow({
							content: '<div style="width:150px;text-align:center;padding:6px 0;">검색지</div>'
						});
						infowindow.open(map, marker);
				
						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						map.setCenter(coords);
					} 
				})
				
				});    
				</script>
				
				<a href="https://map.kakao.com/" id="finding"><img src="<%= contextPath%>/resources/image/길찾기버튼.png"></a>
				
				<!-- 지도 끝 -->
				<div id="contentsRecomm">
					<h2 align="center" id="contentsTitle">추천 콘텐츠</h2>
					<ul id="contentsList">
					<%if(Clist.size() != 0){ %>
						<% for (Content c : Clist){ %>
								
							<li align="center">
								<div align="center" class="thumbnail_contents">
									<img src="<%=c.getContImgSource()%>" alt=""
									width="70%">
								</div>
								<div class="discription_contents">
									<span class="badge text-bg-success"><%=c.getMenuType() %></span>
									<div class="contents_title"><%=c.getContTitle() %></div> 
									<p class="content_info"><%=c.getContInfo() %></p>
									<input type="hidden" id="link" value="<%=c.getContLink()%>">
								</div>
							</li>
							<%}%>
							<li>
								<a href="<%= contextPath %>/contentListC.sk?cate=article&cpage=1" style="margin:0 auto;">> 더보기</a>
							</li>
						<%}else {%>
							<div align="center" style="padding-left: 35px;">
									<h5>검색한 내용과 비슷한 콘텐트가 없습니다.</h5><br>
									<a href="<%= contextPath %>/contentListC.sk?cate=article&cpage=1">> 다른 콘텐츠 보러가기</a>
							</div>
						<%}%>
					</ul>
				</div>
				</div>
				
				<script>
					
				$(function(){
					$('#contentsList li').click(function(){
						
						location.href = $('#link').val();
						
					});
				});
				
				</script>
				
		<!-- .content end -->
		</div>

		<div id="footer">
			<!-- 페이징바 -->
			<div class="pagination p1">
				<ul>
				<%if(currentPage != 1){ %>
				  <a href="<%= contextPath%>/selectList.hj?cpage=<%=currentPage-1%>&keyword=<%=keyword%>&orderby=<%=orderby%>"><li><</li></a>
				 <%} %>
				 
				 <%for(int i = startPage; i<=endPage; i++){ %>	
				 		<%if(currentPage != i){ %>
				  		<a href="<%=contextPath%>/selectList.hj?cpage=<%= i %>&keyword=<%=keyword%>&orderby=<%=orderby%>"><li><%= i %></li></a>
				  		<%}else{ %>
				  		<a  class="is-active" href="#"><li><%= i %></li></a>
						<%} %>
					<%} %>
					
				<%if(maxPage != currentPage){ %>
				  <a href="<%=contextPath%>/selectList.hj?cpage=<%=currentPage+1%>&keyword=<%=keyword%>&orderby=<%=orderby%>"><li>></li></a>
				 <%} %>
				</ul>
			  </div>

		</div>
		
	<!-- .outer end -->
	</div>
	  <%@include file = "../common/footer.jsp"%>

</body>
</html>