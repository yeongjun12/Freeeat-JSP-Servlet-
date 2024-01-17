<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.place.model.vo.Place" %>
<% 
    String contextPath = request.getContextPath();
%>
   <%@ page import="com.freeeat.member.model.vo.Member, com.freeeat.place.model.vo.*, java.util.*" %>
<%
 	ArrayList<Wish> wish = (ArrayList<Wish>)session.getAttribute("wish");
	Member loginMem = (Member)session.getAttribute("loginMem");
	// 로그인 전 : menubar.jsp가 로딩 될 때 null
	// 로그인 후 : menubar.jsp가 로딩 될 때 로그인한 회원의 정보가 담겨있음
%>
<%
	ArrayList<Place> recentList = (ArrayList<Place>)request.getAttribute("recentList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Freeeat</title>
   <link rel="shortcut icon" href="<%=contextPath %>/resources/image/favicon.ico" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <style>
  @font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
    /* common(공통) */
  body{
      color: #333;
      font-size: 16px;
      font-weight: 500;
      line-height: 1.4; /*줄 높이*/
      height: 3000px;
      font-family: 'S-CoreDream-3Light';
  }
  img{
      display: block;
  }
  a{
      text-decoration: none; 
      color: #2c2a29;
  }
  .inner{
      width: 1100px;
      margin: 0 auto;/*가운데 정렬*/
      position: relative;
  }

  /* Header */
  header{
      width: 100%;
      background-color: #f6f5f0;
      border-bottom: 1px solid #c8c8c8;
      position: fixed;
      top:0;
      z-index: 20;
  }
  header> .inner{
      height: 120px;
  }
  header .logo{
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      margin: auto;
  }

  header .sub-menu{
      position:absolute;
      top: 10px;
      right: 0;
      display: flex;

  }
  header .sub-menu ul.menu{
      display: flex; /*수평으로 정렬*/
  }
  header .sub-menu ul.menu li{
      position: relative;
  }
  header .sub-menu ul.menu li:before{/*구분선*/
      content: "";
      display: block;
      width: 1px;
      height: 12px;
      background-color: #e5e5e5;
      position: absolute;
      top: 0;
      bottom: 0;
      margin: auto;
  }
  header .sub-menu ul.menu li:first-child:before{
      display: none;
  }
  header .sub-menu ul.menu a{
      font-size: 12px;
      padding: 11px 16px;
      display: block;
      color: #656565;
  }
  header .sub-menu ul.menu a:hover{
      color: black;
  }

  header .main-menu{
      position: absolute;
      bottom: 0;
      right: 0;
      z-index: 1;
      display: flex;
  }
  header .main-menu .item .item__name{
      padding: 10px 20px 34px 20px;
      font-size: 17px;
      font-weight: 600;
  }
  header .main-menu .item:hover .item__name{
      background-color: #2c2a29;
      color: #88A201 !important;
      border-radius: 6px 6px 0 0;
  }
  header .main-menu .item:hover .item__name a{
      background-color: #2c2a29;
      color: #88A201 !important;
      border-radius: 6px 6px 0 0;
  }
  header .main-menu .item .item__contents{
      width: 100%;
      position: fixed;
      left: 0;
      display: none;
  }
  header .main-menu .item:hover .item__contents{
      display: block;
  }
  header .main-menu .item .item__contents .contents__menu{
      background-color: #88A201;
  }
  header .main-menu .item .item__contents .contents__menu>ul{
      display: flex ;
      padding: 20px 0;
  }
  header .main-menu .item .item__contents .contents__menu>ul>li{
      width: 220px;
  }
  header .main-menu .item .item__contents .contents__menu>ul>li h4{
      padding: 3px 0 12px 0;
      font-size: 20px;
      color: #fff;
  }
  header .main-menu .item .item__contents .contents__menu>ul>li h4{
      padding: 3px 0 12px 0;
      font-size: 20px;
      color: #fff;
  }
  header .main-menu .item .item__contents .contents__menu>ul>li h4 a{
      padding: 3px 0 12px 0;
      font-size: 18px;
      color: #fff;
  }
  header .main-menu .item .item__contents .contents__menu>ul>li ul li{
      padding: 5px 0;
      font-size: 15px;
      color: black;
      cursor: pointer;
  }
  header .main-menu .item .item__contents .contents__menu>ul>li h4 a:hover{
  	font-size : 20px;
  }
  header .main-menu .item .item__contents .contents__menu>ul>li ul li a:hover{
      color:#fff ;
  }
  /* 최근본식당 시작 */

  * {padding:0;margin:0;}
    input[id="menuicon"] {display:none;}
    input[id="menuicon"] + ul {
      display:block;
      position:fixed;
      right:0;
      top:20%;
      transform:translateY(-50%);
      transition:all .35s;
      text-align:right;
    }
    input[id="menuicon"] + ul > li {
      display:block;
      width:130px;
      height:30px;
      position:relative;
      margin-top:-1px;
      text-align:center;}
    input[id="menuicon"] + ul > li > button {
      display:block;
      width:auto;
      height:30px;
      overflow:hidden;
      transition:all .35s;
      background-color :#f6f5f0;
      border : none;
      border-radius : 100px;
      }
    input[id="menuicon"] + ul > li > label {
      display: block;
      cursor: pointer;
      width: auto;
      height: 30px;
      background: #dadada;
      margin: auto;
      text-align: center;
      }
    
    input[id="menuicon"] + ul > li:nth-child(1) label span {
      display:block;
      position:absolute;
      width:50%;
      height:3px;
      border-radius:30px;
      background:#333;
      transition:all .35s;
      top:30%;
      left:50%;
    }

    input[id="menuicon"]:checked + ul {
      z-index:2;
      right:300px;}
    input[id="menuicon"]:checked + ul > li:nth-child(1) label {
      z-index:2;
      right:300px;}
    input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(1) {
      top:50%;
      left:50%;
      transform:translate(-50%,-50%) rotate(45deg);}
    div[class="sidebar"] {
      width:300px;
      height:100%;
      background:#f5f5f5;
      position:fixed;
      top:0;
      right:-300px;
      z-index:1;
      transition:all .35s;
       overflow: auto;}
    input[id="menuicon"]:checked + ul + div {right:0;}

    .recentList{
      padding: 10px 10px 10px 10px;
      display: flex;
    }

    #recentTitle{
   	 padding: 10px 10px 10px 10px;
      text-align: center;
      font-size: 30px;
    
    }
    .recentList .recentText{
      font-size: 20px;
      width: 130px;
    }
    #recent{
   
    }
/* 최근 본 식당 끝 */

/* 검색창 */
.main-menu .search{
      height: 34px;
      position: relative;
}
.main-menu .search input{
     width: 400px;
     height: 50px;
      padding: 4px 10px;
      border: 1px solid #ccc; 
      box-sizing: border-box;
      border-radius: 5px;
      outline: none;
      background-color: #fff;
      color: black;
      font-size: 20px;
  }
  .main-menu .search input:focus{
      border-color:#C8E183 ;
  }
  .main-menu .search #searchImg{
      height: 25px;
      position: absolute;
      bottom: 0;
      right: 7px;
      margin: auto;
  }
  .main-menu .search #searchImg img{
  		height: 30px;
  }
  .main-menu .search #searchImg button{
  	  left: 350px;
  	  border:none; 
	  background-color:white;
  }
  
  .main-menu .search.focused #searchImg{
      opacity: 0;
  }
  /* 검색창 끝 */
  </style>

</head>
<body>

  <!--HEADER-->
  <header>
    <div class="inner">
      <!-- 로고(홈) -->
      <a href="<%=contextPath%>/views/common/mainPage.jsp" class="logo"><!--/은 현재 index파일로 이동-->
        <img src="<%=contextPath%>/resources/image/freeeatlogo.png" alt="Freeeat" style="height: 100%;" >
      </a>

      <div class="sub-menu">
        <ul class="menu">
        
        
          <% if(loginMem == null) { %>
          <!-- 로그인 안했을 때 보이는 화면 -->
        
          <li>
            <a href="<%= contextPath %>/enrollForm.yj">회원가입</a>
          </li>

          <li>
            <a href="<%= contextPath %>/views/member/loginEnrollForm.jsp">로그인</a>
          </li>


          
       <% } else {%>
            <!-- 로그인했을 때 보이는 화면 -->
           
            <% if (loginMem.getMemId().equals("admin")) { %>
	            <li>
	              <a href="<%= contextPath %>/memberList.sk?tap=1&cpage=1">관리자페이지</a>
	            </li>
            <% } else { %> 
	            <li>
	              <a href="<%= contextPath %>/mypage.yj">마이페이지</a>
	            </li>
            <% } %>

          <li>
           <a href='<%= contextPath %>/logout.yj'>로그아웃</a>
          </li>

          <li>
            <a><%= loginMem.getMemNickName() %>님 건강한 하루 되세요😄</a>
          </li>

		<% } %>
		     
          <li>
            <a href="<%=contextPath%>/CSList.hj?cpage=1">고객센터</a>
          </li>
        </ul>
      </div>
		<!-- 검색창 -->
      <ul class="main-menu">
        <li>
          <div class="search">
            <form action="<%=contextPath%>/selectList.hj" method="get">
              <input type="text" name="keyword" placeholder="식당명/지역명/유형명을 입력해주세용">
              <input type="hidden" name="cpage" value="1">
              <input type="hidden" name="orderby" value="GRADE">
              
              <span id="searchImg"><button type="submit"><img  src="<%=contextPath%>/resources/image/search.png"></button></span>
            </form>
          </div>
        </li>
		<!-- 카테고리 -->
        <li class="item">
          <div class="item__name">카테고리</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4>지역별</h4>
                  <ul>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=서울&orderby=GRADE">서울</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=인천&orderby=GRADE">인천</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=경기&orderby=GRADE">경기</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=강원&orderby=GRADE">강원</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=충청&orderby=GRADE">충청</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=전라&orderby=GRADE">전라</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=경상&orderby=GRADE">경상</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=제주&orderby=GRADE">제주</a></li>
                  </ul>
                </li>
                <li>
                  <h4>유형별</h4>
                  <ul>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=비건&orderby=GRADE">비건</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=락토프리&orderby=GRADE">락토프리</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=슈가프리&orderby=GRADE">슈가프리</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=글루텐프리&orderby=GRADE">글루텐프리</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=동물복지&orderby=GRADE">동물복지</a></li>
                  </ul>
                </li>
                <li>
                  <h4>업종별</h4>
                  <ul>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=식당&orderby=GRADE">식당</a></li>
                    <li><a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=카페&orderby=GRADE">카페/베이커리</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <li class="item">
          <div class="item__name"><a href="<%= contextPath %>/contentListC.sk?cate=article&cpage=1">콘텐츠</a></div>
        </li>
        <li class="item">
          <div class="item__name" ><a href="<%=contextPath%>/FeedGo.ih" >피드</a></div>
        </li>
        <li class="item">
          <div class="item__name">ABOUT</div>
          <div class="item__contents">
            <div class="contents__menu">
              <ul class="inner">
                <li>
                  <h4><a href="https://longhaired-operation-c48.notion.site/10-27-0e9418a0c9fd4c73bc5b5887bdf465b2">Freeeat이란?</a></h4>
                </li>
                <li>
                  <h4><a href="#">조직도</a></h4>
                </li>
                <li>
                  <h4><a href="https://map.naver.com/v5/directions/14137575.330745716,4509031.393076643,%EC%84%9C%EC%9A%B8%EC%97%AD,,ADDRESS_POI/14135697.54904722,4518567.734803315,KH%EC%A0%95%EB%B3%B4%EA%B5%90%EC%9C%A1%EC%9B%90%20%EC%A2%85%EB%A1%9C%EC%A7%80%EC%9B%90,38563272,PLACE_POI/-/car?c=14133815.0008156,4513671.2543247,12,0,0,0,dh">찾아오시는 길</a></h4>
                </li>
              </ul>
            </div>
          </div>
        </li>
      </ul>

    </div>
    <!--BADGES : 최근 본 식당-->
    
    <div class="badges">
      <input type="checkbox" id="menuicon">
      <ul>
        <li>
        	<button onclick="selectRecentList();">
          		<label for="menuicon">
	            	😮최근 본 식당
             	</label>
         	</button>
        </li>
      </ul>
      <div class="sidebar" id="sidebar">
        <h2 id="recentTitle" style="text-align:center;"> 최근 본 식당  </h2>
        <hr>
		<div id="recent">
		</div>
      </div>
    
    </div>
  </header>
  <br><br><br><br><br><br>
  <script>
  function selectRecentList(){
      $.ajax({
          url : '<%=contextPath%>/recent.hj',
          data : {},
          success : function(list){
        	  console.log(list);
              var result = '';
		if(list.length == 0){
			result +='<div><h5>로그인 후 이용 가능한 서비스 입니다.</h5></div>'
		}else{		
              for(var i in list){
				
						
     	 result += '<div class="recentList">' +
	              	 '<div class="recentText">' +
		                 '<h6>' + list[i].placeAddress+ '</h6>' +
		                 '<span>' + list[i].placeName + '</span><br>' +
		                 '<span>' + parseFloat(list[i].grade) + '</span>' +
		             '</div>' + 
		             '<div class="recentImg">'+
		             '<img src="' + '<%=contextPath%>/' +  list[i].titleImg + '" alt="" width="100px" height="100px">' + 
		           	 '</div>'+
           	 	   '</div>'+
		             '<div>' +
           	 	   			'&nbsp&nbsp' + 
           	 	   			    '<a href="' +  '<%=contextPath%>' + '/placeDetail.mr?placeNo=' + list[i].placeNo  +  '" class="btn"> >보러가기</a>' + 
           	 	   			'&nbsp&nbsp' + 
           	 	   				'<a href="'+  '<%=contextPath%>' + '/recentDelete.hj?placeNo=' + list[i].placeNo  + '" class="btn"> >삭제</a>' + 
           	 	   	'</div>'+
		             '<hr>' 
     				}
              }
              $('#recent').html(result);

          },
          error : function(){
              console.log('최근 본 식당이 없습니다.');
          }
      });
  };
  
  </script>
</body>
</html>