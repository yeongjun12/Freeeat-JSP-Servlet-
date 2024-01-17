<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
 ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Freeeat</title>
<style>
    .outer>div{
     /* border: 1px solid red; */
    }
    .outer{
        width: 70%;
        height: 2500px;
        margin: auto;
    }
    .outer #mainbanners{
        height: 600px;
        z-index: 50;
    }
    .outer #type{
        height: 400px;
        display: flex;
    }
    .outer .best{
        height: 1300px;
    }
    #placeInfo{
    	height: 200px;
    }
    #placeInfo img{
    	margin: auto;
    }
    
    #bestTitle{
        font-size: 30px;
    }
    #type .card{
        width: 18rem; 
        height: 22rem;
        margin-top: 15px;
        margin-right: 5px;
    }
    #type .card:hover{
        box-shadow: 0px 10px 15px;
    }
    #type .card img{
        height: 170px;
    }
    .card-title{
        font-weight: 700;
    }
    .card-body .card-title, .card-body .btn{
        height: 30%;
        margin: auto;
    }
    .card-body .card-text{
       height: 40%;
    }

    .carousel-inner img {
      width: 900px;
      height: 600px;
    }
    #content .result{
		width: 50%;
		float: left;
		margin: auto;
    }
    #bestTitle{
    	padding: 10px;
    }
    
    #resturantList{
        margin: auto;
    }
    #resturantList > li{
		width: 30%;
		float: left;
		margin: 5px 5px auto;
		padding: 10px;
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
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <div style="z-index: 10;">
        <%@include file = "../common/menubar_hj.jsp"%>
    </div>

    <div class="outer" style="z-index: 7;">
        <div id="mainbanners">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="<%=contextPath%>/resources/image/main.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="https://publy.imgix.net/images/2021/07/07/1625642772_2jQ47Vp9M88V7cJYo99Z2c31LjoP4IuGzBZS1Qg9.jpeg?fm=pjpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="https://vegilog.com/wp-content/uploads/2019/10/glutenfree.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="https://www.oasis.co.kr:48581/display/mainBanner/main_banner_M_TOP_2DNO.jpg" class="d-block w-100" alt="...">
                </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div id="type">
            <div class="card">
                <img src="http://newsimg.hankookilbo.com/2020/01/07/202001071691015667_1.jpg" class="card-img-top" alt="...">
                <div class="card-body" style="height: 30px;">
                  <h3 class="card-title">비건</h3>
                  <p class="card-text">나와 지구를 모두 살리는 방법</p>
                  <a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=비건" class="btn" id="plusBtn">> 맛집 보러가기</a>
                </div>
              </div>
              <div class="card">
                <img src="http://res.heraldm.com/phpwas/restmb_idxmake.php?idx=507&simg=/content/image/2019/09/30/20190930000185_0.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h3 class="card-title">락토프리</h3>
                  <p class="card-text">속-편안하게</p>
                  <a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=락토프리" class="btn">> 맛집 보러가기</a>
                </div>
              </div>
              <div class="card">
                <img src="https://file.mk.co.kr/meet/neds/2022/05/image_readtop_2022_459643_16533975055053518.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h3 class="card-title">슈가프리</h3>
                  <p class="card-text">맛은 그대로, 설탕은 DOWN</p>
                  <a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=슈가프리" class="btn">> 맛집 보러가기</a>
                </div>
              </div>
              <div class="card">
                <img src="https://src.hidoc.co.kr/image/lib/2021/11/23/1637657511922_0.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h3 class="card-title">글루텐프리</h3>
                  <p class="card-text">밀가루를 줄이려는 분들을 위한</p>
                  <a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=글루텐프리" class="btn">> 맛집 보러가기</a>
                </div>
              </div>
              <div class="card">
                <img src="https://us.123rf.com/450wm/baldion/baldion1902/baldion190200003/125682585-%ED%91%B8%EB%A5%B8-%ED%95%98%EB%8A%98-%EC%95%84%EB%9E%98-%EB%AA%A9%EC%B4%88%EC%A7%80-%EC%9E%94%EB%94%94-%EC%88%B2%EC%97%90-%EC%9E%88%EB%8A%94-%EC%86%8C%EC%9D%98-%EC%84%B8-%EA%B0%80%EC%A7%80-%EC%8B%A4%EB%A3%A8%EC%97%A3%EC%9D%B4-%EC%9E%88%EB%8A%94-%ED%98%84%EC%8B%A4%EC%A0%81%EC%9D%B8-%EA%B7%B8%EB%A6%BC-%EB%B2%A1%ED%84%B0.jpg?ver=6" class="card-img-top" alt="...">
                <div class="card-body">
                  <h3 class="card-title">동물복지</h3>
                  <p class="card-text">불필요한 고통없이, 건강하게</p>
                  <a href="<%=contextPath%>/selectList.hj?cpage=1&keyword=동물복지" class="btn">> 맛집 보러가기</a>
                </div>
              </div>
        </div>
        <div class="best">
            <div id="bestTitle">
                <h2>지금 가장 인기있는 식당 TOP 9 🏅</h2>
            </div>
            <ul id="resturantList">

            </ul>
       </div>
       
       <script>
     $(function(){
       $.ajax({
           url : '<%=contextPath%>/mainPage.hj',
           success : function(list){
        	   var result = '';
        	   for(var i in list){
                   result +=  '<li>' + 
                   '<div class="thumbnail">' + 
	               		'<input type="hidden" name="placeNo" value=' + list[i].placeNo +'>' +
					
						'<img src="' + '<%=contextPath%>/' + list[i].titleImg + '" alt="" width="100%" height="300px">' +
	                    
	              '</div>' + 
               '<div class="discription">' + 
                   '<div class="location" style="font-size:15px;">' + list[i].placeAddress + '</div>' +  
                       '<span class="placeName"  style="font-size:20px;">' + list[i].placeName + '</span>' + 
                       '<span class="grade">' + list[i].grade + '</span><br>' + 
						'<span>' + 
							'<span class="material-icons">favorite</span>' + 
							list[i].reviewCount + 
						'</span>' + 
						'<span>' + 
							'<span class="material-icons">edit</span>' + 
								list[i].wishCount + 
						'</span><br>' + 
                   '</div>' + 
               '</div>' + 
           '</li>'
           
	
           };
           
        	 $('#resturantList').html(result);
        	   
           },
           error : function(){
        	   
           }
           });
       });
           
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

		<div id="placeInfo">
			<a href="<%=contextPath%>/views/member/reportEnrollForm.jsp"><img src="<%=contextPath%>/resources/image/제보버튼.png" height="200px"></a>
		</div>
    </div> 

    <%@include file = "../common/footer.jsp"%>
</body>
</html>