<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.freeeat.place.model.vo.*, java.util.*, com.freeeat.common.model.vo.*, java.lang.Math.*, com.freeeat.review.model.vo.*" %>
<%
	Place place = (Place)request.getAttribute("place");
	ArrayList<PlaceMenu> pMenu = (ArrayList<PlaceMenu>)request.getAttribute("pMenu");
	ArrayList<Photo> pPhoto = (ArrayList<Photo>)request.getAttribute("pPhoto");
	ArrayList<Review> rList = (ArrayList<Review>)request.getAttribute("rList");
	ArrayList<ReviewLike> reviewLikeList = (ArrayList<ReviewLike>)request.getAttribute("reviewLikeList");
	ArrayList<ReviewLike> reviewCountList = (ArrayList<ReviewLike>)request.getAttribute("reviewCountList");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>

	
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
    <!-- clipboard.js cdn 추가 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.10/clipboard.min.js"></script>

    <title>식당상세정보보기</title>

    <style>
        
        @font-face {
            font-family: 'Happiness-Sans-Title';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/Happiness-Sans-Title.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        
        #store-name, #review-info{
        	font-size: 50px;
        }
        

        a{
            text-decoration: none;
            color: black;
        }

        textarea {
            border: none;
            font-size: 15px;
        }
        
        li{
        	list-decoration:none;
        }

        /* #outer{
            width: 100%;
            height: 3000px;
        } */

/* -------------------------------- 식당상세 상단 ---------------------------------- */

        #photo-area, #detail-area, 
        #store-detail-area, #review-area{
            width:1000px;
            margin: auto;
            box-sizing: border-box;
        }

		#detail-area .address{
			width:90px;
			height:35px;
			font-size: 15px;
			font-weight:900;
			border-radius: 45px;
			background-color: white;
			cursor:pointer;
		}
		
        #photo-area > div{
            width: 30%;
            height: 280px;
            margin-left: 20px;
            margin-top: 15px;
            display: inline-block;
            
        }
        
        #photo-area img {
        	width : 100%;
        	height: 100%;
        }

        #photo-area a{
            color: black;
            font-weight: 600;
            margin-left: 90%;
        }

        #photo-area > p {
            margin: 10px;
            padding: 0;
        }

        #detail-area ul{
            margin: 15px 0 15px 0;
            padding: 0;
        }

        #detail-area ul li {
            margin-left: 10px;
            display: inline-block;
            list-style: none;
            font-size:20px;
            font-weight:600;
            /*border-radius: 18px 18px 18px 18px;
            background-color: cadetblue;*/
        }

        #star-score-area {
            font-size: 24px;
        }

        #star-score-area p {
            margin-left: 5px;
        }


        #click-area{
        	margin-top : 20px;
            width: 1000px;
            height: 40px;
        }

        #click-area  a {
            color: black;
            font-size: 20px;
            border: 1px solid black;
            border-radius: 45px;
            padding: 10px;
            width:110px;
            height:30px;
            text-align:center;
        }

        #click-area  a:hover {
            border: 2px solid black ;
            box-shadow: 2px 2px 20px #ddd;
        }

        #click-area-left, #click-area-right{
            width: 490px;
            display:inline-block;
        }

        #click-area-left a{
            float: left;
            margin-left: 15px;
        }

        #click-area-left a:last-child{
            margin-left: 25px;
        }

        #click-area-right a{
            float: right;
            margin-right: 25px;
        }
        
/* ------------------------- 식당 상세 중간 ----------------------------- */
/*  */

        /* #store-detail-area {
            width:1000px;
            margin: auto;
        } */

        #store-detail-info th{
            text-align: left;
            vertical-align: top;
            width: 200px;
            font-size: 1.0rem;
            color :rgb(69, 69, 69);
            padding: 5px 5px 5px 15px;
            font-weight: 600;
        }

        #store-detail-info td{
            text-align: left;
            vertical-align: middle;
            width: 500px;
            font-size: 1.0rem;
            color: #4f4f4f;
            padding: 5px 5px 5px 15px;
            font-weight: 500px;
        }

        #store-detail-info li {
            line-height: 30px;
            display: flex;
            list-style: none;
            margin-bottom: 8px;
        }

        #store_menu .store_menuTag{
            flex-basis: 13%;
            border: 1px solid cadetblue;
            border-radius: 18px 18px 18px 18px;
            background-color: cadetblue;
            text-align: center;
            margin-right: 20px;
            font-size: 13px;
            color:aliceblue;
        }

        #store_menu .store_menuItem{
            flex-basis : 40%;
            margin-right:20px;
        }

        #store_menu .store_menuPrice{
            flex-basis : 20%;
            text-align: right;
        }

        #store-report {
            float: right;
            margin-right: 40px;
            font-size: 14px;
            cursor:pointer;
        }
        

/* ----------------------------- 식당 상세 하단 ----------------------------- */
/* 리뷰 업데이트 : ajax 비동기식 구현 */
	
		#review-detail, #review-photo, #review-header{
			width : 900px;
		}
	
	
		#review-detail{
			height:auto;
			border:1px solid black;
            margin: auto;
		}

        #review-header{
            height: 120px;
            display: inline-block;
            /* border:1px solid brown; */
        }

        #member-profil{
            float:left;
            margin-top:10px;
            margin-left:10px;
        }

        #review-detail-right, #review-detail-left {
            width:375px;
            height: 120px;
            box-sizing: border-box;
            float:left;
            margin-left: 20px;
            /* border: 1px solid pink; */
        }

        #review-detail-right i, #review-detail-left i {
            font-size : 15px;
        }

        #review-detail-right > div, #review-detail-left > div {
            width: 350px;
        }

        .reviewRight, .reviewLeft{
            display: block;
            text-align: right;
            margin-top: 15px;
        }
        
        .reviewRight{
            text-align: right;
        }

        .reviewLeft{
            text-align: left;
        }

        .report{
            padding-top: 10px;
            margin-bottom: 0;
            padding-bottom: 0;
            font-size: 12px;
        }

        #review-detail-right > .like > a{
            padding:5px 5px;
            border-radius: 40px;
            /* border:2px solid cadetblue; */
            text-align: center;
        }

        #review-detail-right > .like > a:hover{
            border:2px solid cadetblue;
            box-shadow: 2px 2px 20px #ddd;
        }

        #review-content {
            font-size: 18px;
    		line-height: 2;
            width: 750px;
            height: auto;
            float: right;
            background: #eae5dd;
            margin-bottom: 10px;
            margin-right: 28px;
            /* border: 1px solid ; */
        }

		#review-photo{
			/* width:900px; */
			height:150px;
			display: inline-block;
            /* box-sizing: border-box; */
			/* border : 1px solid black; */
		}

        #review-photo > .memberPhoto{
            width: 24%;
            height:100%;
            margin-left: 7px;
            overflow: hidden;
            /* border : 1px solid green;  */
            box-sizing: border-box;
            float: left;
        }

        .icon{
            margin: 10px 10px;
            line-height: 20px;
            padding: 4px 8px;
            font-size: 13px;
            background: cadetblue;
            border-radius: 35px;
            display: inline-block;
            color: #ffffff; 
        }
		
        .icon2{
            padding: 4px 8px;
            font-size: 20px;
            background: cadetblue;
            border-radius: 35px;
            display: inline-block;
            color: #ffffff; 
        }

/* 리뷰작성 모달 */

	/*신고하기 모달 화면 구현 */
	#report_modal{
		position: fixed;
        width: 600px;
        height:900px;
        background-color: rgb(253, 219, 219);
        border-radius: 20px;
	    left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        display: none;
        z-index: 1000;
        boxShadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	#report_modal > #report_iframe{
		width: 550px;
		height: 840px;
		margin-height:20px;
		margin-left : 25px;
	}
	
	#report_btn{
		cursor:pointer;
	}
	
	#report_btn:hover{
		font-weight : 900;
		color: black;
	}
	
	#report_modal > .modal_close_btn{
        background-color:rgba(95, 152, 124, 0);
        border: 1px solid rgba(245, 245, 220, 0);
        cursor: pointer;
        color:rgb(0, 0, 0);
	    margin-left: 560px;
	    font-size: 30px;
	    font-weight: 900;
	}



    #write-textarea, #star-area, #pt-insert-table, #checked-meal-type{
        text-align: center;
    }

    #review-write-area, #store-report-area{
        position: fixed;
        width: 600px;
        height:900px;
        background-color: rgb(253, 219, 219);
        border-radius: 20px;
        /* position: fixed; */
        left: 50%;
        top: 50%;
        /* -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%); */
        transform: translate(-50%, -50%);
        display: none;
        z-index: 1000;
    }

    #review-write-area .close, #store-report-area .close{
        font-size: 40px;
        background-color:rgba(95, 152, 124, 0);
        border: 1px solid rgba(245, 245, 220, 0);
        cursor: pointer;
        color:rgb(0, 0, 0);
        padding-left: 560px;
    }

    #review-write-area .modal-title{
        text-align: center;
    }

    .modal-content p {
        margin-left: 25px;
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 5px;
    }

    #review-write-area .modal-title h2{
        /* margin-left: 20px; */
        font-size: 30px;
        font-weight: 900;
        color: black;
    }

    #checked-meal-type {
        width: 600px;
        height:120px;
    }

    #checked-meal-type img{
        margin-bottom: 10px;
        margin-left: 10px;
    }

    #checked-meal-type input[name=menu-type] {
        display: none;
    }

    #checked-meal-type label{
        width:80px;
        height:60px;
        display: inline-block;
        text-align: center;
        margin: auto;
        font-weight: 800;
        margin: 0 10px;
    }

    #modal-footer {
        width: 600px;
        height: 50px;
        text-align: center;
    }

    #modal-footer input {
        width:100px;
        height: 50px;
        font-size: 17px;
        font-weight: 900;
        border-style: none;
        background-color: rgba(209, 231, 157, 0.755);
        cursor: pointer;
        margin-left: 14px;
        margin-top:10px;
    }

    #modal-footer input:hover{
        background-color: rgba(67, 70, 62, 0.755);
        color: aliceblue;
    }

    #star-area img{
        margin: 0 25px;
    }

    #star-area label{
        display: inline-block;
    }

    #star-area input[name=reviewStar] {
        display: none;
    }

    #pt-insert-table span{
        border: 1px solid black;
        display: inline-block;

    }

    /* 공유하기 모달 */
    #share-area{
        position: fixed;
        width: 380px;
        height:200px;
        background-color: rgb(253, 219, 219);
        border-radius: 20px;
        left: 50%;
        top: 50%;
        /* -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%); */
        transform: translate(-50%, -50%);
        display: none;
        z-index: 1000;
        text-align: center;
    }
    
    #share-area p {
        font-weight: 900;
        margin-bottom: 10px;;
        font-size: 20px;
    }

    #share-area #url-text {
        width:300px; 
        height:70px;
        resize: none;
        font-size: 15px;
        /* font-family:  */
        border: none;
    }
    
    #share-area .close{
        font-size: 25px;
        background-color:rgba(95, 152, 124, 0);
        border: 1px solid rgba(245, 245, 220, 0);
        cursor: pointer;
        color:rgb(0, 0, 0);
        padding-left: 355px;
    }
    
    #share-area #url-copy{
        border: none;
        cursor: pointer;
        background:  rgba(209, 231, 157, 0.755);
        width:80px;
        height:35px;
        font-size: 20px;
        font-weight: 900;
    }
    
    /* 신고하기 모달 */
    #store-report-area{
        height:720px;
    }

    .modal-title>h2{
        font-size: 34px;
        text-align: center;
        font-weight: 900px;
        font-family: 'Happiness-Sans-Title';
    }

    #store-report-area p {
        font-weight: 900;
        padding: 5px 20px;
        font-size: 20px;
    }

    #st-text-area p {
        padding-left: 40px;
        font-weight: 400;
        font-size: 16px;
    }

    #store-name-area{
        margin: 5px 10px;
        padding-left: 50px;
        font-size: 30px;
        color:rgb(109, 104, 104);
        /* font-weight: 00; */
        font-family: 'Happiness-Sans-Title';
    }

    #tag-area {
        margin-left: 45px;
    }
    
    .tag-opt {
        font-size: 18px;
    }

    /* 사진 확대해서 더보기 기능  */

    body{
        box-sizing: border-box;
    }

    #photoAddView-area {
        position: fixed;
        width: 800px;
        height:1100px;
        box-sizing: border-box;
        overflow: hidden;
        display: none;
        background-color: rgb(45, 45, 45);
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);       
        z-index: 1000;
        /* position: absolute;  */  
        /* display: inline-block; */
        /* border: 1px solid black; */
        /*text-align: center;*/
    }

    #photoAddView-area .close{
        font-size: 50px;
        background-color:rgb(45, 45, 45);
        border: 1px solid rgba(245, 245, 220, 0);
        cursor: pointer;
        color:rgb(255, 255, 255);
        padding-left: 750px;
    }

    #top-photo-area{
        width: 800px;
        height: 700px;
        display: flex;
        justify-content: space-around;
        align-items: center;
        text-align: center;
        margin:40px 0 100px 0;
    }

    #big-photo{
        width: 600px;
        height: 700px;
        /* border: 1px solid rgb(217, 62, 62); */
        display: inline-block;
        text-align: center;

        display: flex; 
        justify-content: center;
        align-items: center;
        /* text-align: center; */
    }

    #align-area > img,  #align-area {
        width: 100%;
    }

    .pho-button {
        width:140px;
        height:800px;
        /* display: block; */
        /* display: inline-block; */
    }

    .left-btn, .right-btn {
        /* padding-top:50%; */
        /* width:100px;
        height:100px; */
        /* background-color: white; */
        width:60px;
        height:100px;
        border: none;
        cursor:pointer;
        text-align: center;
        justify-content: space-around;
        align-items: center;
        display: flex;
     } 

     .left-btn > img, .right-btn > img {
        width:60px;
        height:60px;
        margin: 0;
        padding: 0;
        display: inline;
     }

    #small-photo, #slide-photo-area{
        width: 100%;
        height: 100px;
        /* border: 1px solid rgb(217, 62, 62); */
        display: flex;
        /* justify-content: space-around; */
        position: absolute; 
        z-index: 99;
        margin-top:20px;
    }
    
    #slide-photo-area{
    	margin-left: 0;
    }

    #small-photo img{
        width: 100px;
        height: 100px;
        border: 1px solid rgb(45, 45, 45);
    }

    #photoAddView-area  a{
        /* border : 1px red solid; */
        width : 100px;
        height: 100px;
        display: inline-block;
    }

    </style>

</head>
<body>
	<%@ include file="../common/menubar_hj.jsp" %>
	

	<script>
	
		$(function(){
			
			var str = '<%= alertMsg %>';
				
			if(str != 'null'){
				alert(str);
				<% session.removeAttribute("alertMsg"); %>
			}
		
		})
		
		<!-- 로그인 유저의 식당 좋아요 여부를 확인해서 그에 맞는 버튼 이미지를 보여준다.  -->		
		<% // 자바소스에서 자바스크립트 함수를 호출할 수 없음.
		  int likePlace = 0;
	   
	   	  if(loginMem != null && !wish.isEmpty()) {
	    	  for(int i = 0; i < wish.size(); i++){
	    		  likePlace += Integer.parseInt(wish.get(i).getPlace_No()) == place.getPlaceNo() ? 1 : 0;
	   		  }
	  	  } else { likePlace = 0; }
    	%>
		
   		if(<%= likePlace%> == 1){
   			$('#like').attr('value', '1');
   			$('#like').css({'background' : 'cadetblue', 'color':'white'}).text('♥좋아요');
   		} else {
   			$('#like').attr('value', '0');
   			$('#like').css({'background' : 'none', 'color':'black'}).text('♡좋아요');
   		}
    	
	</script>
	<br><br><br>
    <div id="outer">

<!-- /* -------------------------------- 식당상세 상단 식당 기본 사진 및 더보기 버튼 ---------------------------------- */ -->

        <div id="photo-area" class="area">

			<% if(!pPhoto.isEmpty() && pPhoto.size() <= 3) { 
				  for(int i =0; i < pPhoto.size(); i++) { %>
					<div><img  src="<%= contextPath%>/<%= pPhoto.get(i).getFilePath()%>/<%= pPhoto.get(i).getChangeName()%>"></div>
				<% } 
				   for(int i = 0; i < 3 - pPhoto.size(); i++) { %>
					<div><img  src="<%= contextPath%>/resources/image/plus.png"></div>
				<% } 
			  } else if(pPhoto.size() > 3) {
				   for(int i =0; i < 3; i++) { %>
					<div><img  src="<%= contextPath%>/<%= pPhoto.get(i).getFilePath()%>/<%= pPhoto.get(i).getChangeName()%>"></div>
				<% } 
			  } else { 
				   for(int i =0; i < 3; i++) { %>
				<div><img  src="<%= contextPath%>/resources/image/plus.png"></div>
				<% } 
			  } %>
			
            <p><a id="more-pho" style="cursor:pointer;">더보기</a></p>    
        </div>

<!-- 더보기 클릭시 일어나는 이벤트-->
<!--------------------------------사진 더보기 기능 및 화면 구현 ----------------------------------------->

     
        <div id="photoAddView-area">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <div id="top-photo-area"> 
                <a class="left-btn"><img src="<%= contextPath %>/resources/image/left-btn3.png"></a>
                
                <div id="big-photo">
                    <div id="align-area"><img id="insert-img"></div>
                </div>
              
                <a class="right-btn"><img src="<%= contextPath %>/resources/image/right-btn2.png"></a> 
            </div> 

            <div id="small-photo">
            	<!-- #slide-photo-area가 움직이면서 사진이 옮겨 다니는 것  -->
                <div id="slide-photo-area"></div>
            </div>
        </div>

        <script>
	        $(function(){
	        	
	            photoPopup(); //문서가 다 로딩되면 무조건 실행되는 선언적 함수 - ajax 실행되면서 더보기를 위한 사진 로딩해 온 상태 
	            
//-------------------photo 더보기 Ajax -----------------------------------------------------------------------------  
	            function photoPopup(){
	                $.ajax({
	                    url : '<%=contextPath%>/photoList.mr',
	                    data : { placeNo : <%= place.getPlaceNo() %>},
	                    success : function(phoList){
	                        
	                        var result = '';
	                        for(var i = 0; i < phoList.length; i++){
	                        	result += '<div class="btn-div" value="'+ i +'">' 
	                                    +'<div role="button"><img src=' 
	                                    +'<%= contextPath%>/' 
	                                    + phoList[i].filePath  
	                                    + '/'
	                                    + phoList[i].changeName 
	                                    + '></div></div>'
	                        }
	                        
	                        $('#slide-photo-area').html(result);

	                    },
	                    error: function(){
	                        alert('요청하신 사진 정보를 가져올 수 없습니다.');
	                    }
	                }); //ajax 끝 

	            }; //photoPopup 끝 
	            
	            
//-------------- 더보기 클릭했을 때 발생하는 이벤트 -------------------------------------------------
	            $('#more-pho').click(function(){
	            	//사진이 한장이라도 있다면 
	                if($('div[role="button"]').length > 0){
	                	
	                	$('#photoAddView-area').fadeIn();
	                	
	                    var $this = $('div[role="button"]').children().attr('src');
	                    
	                    //큰 화면에 있는 이미지를 $this의 이미지로 넣어서 보여준다. 
	                    $('#insert-img').attr('src', $this);
	                    
	                } else {
	                	alert('더보기 사진이 없습니다!');
	                }
	            });
        

//--------------- 더보기 창 종료할 때 클릭이벤트 ------------------------------------------------------------------
                $('.close').click(function(){
                	
                    $('#photoAddView-area').fadeOut(300);
						
                    	// 종료 시 큰 화면의 이미지를 minibar 첫번째 사진으로 변경하고, 옮겨졌던 슬라이드bar의 margin-left를 제자리로 옮김 
                        $('#insert-img').attr('src', $('div[role="button"]').children().attr('src'));
                        $('#slide-photo-area').css('margin-left', '0px');
                    
                });
                
//-------------------------------------- 더보기 창의 mini photo click-------------------------------------                
                
               	var $miniView;
                var marginNum = 0;
                
                $(document).on('click','div[role="button"]', function(){
                    
                    $miniView = $(this); //img태그를 싸고 있는 div를 선택했을 때 

                    if($miniView.parent().attr('value') < ($('#slide-photo-area > div').length/2)){
                        marginNum += -100;
                        
                        //만약에 marginNum(slidebar의 margin-left)가  작은 사진의 전체 길이의 30% 보다 크다면  왼쪽으로 당길 수 있게 함
                        if(marginNum > -($('.btn-div').length*100)*0.3) {
                   			$('#slide-photo-area').animate({"margin-left" : marginNum + "px"}, 100);
                       }
                        
                    } else if($miniView.parent().attr('value') >= ($('#slide-photo-area > div').length/2)){
                        marginNum += 100;

                    	if(marginNum < ($('.btn-div').length*100)*0.3) {
                            $('#slide-photo-area').animate({"margin-left" : marginNum + "px"}, 100);
                    	} 
                    	
                    } 
                    //선택한 miniphoto의 사진을 큰 화면에 넣어줘야 함    
                    var $img = $miniView.children().attr('src');
                    
                    $('#insert-img').attr('src', $img);
                    
                });
//-------------------------------------더보기 창의 왼쪽 오른쪽 버튼 --------------------------------
//(개인참고용)매개변수에 k, v로 넣으면 매개변수로는 $('#small-photo img')요소의 속성/속성값을 가지고 오는 것 

                
            var $num;
            var att;
            
           	$(document).on('click', '.right-btn', function(){           
               	
                   var $rClick = $('#insert-img').attr('src');
   				
                   $('#small-photo img').each(function(){
                       //큰화면의 src속성값과 img의 src속성값이 같으면 true가 반환됨 
                       if($(this).attr('src') == $rClick){
                       	//img의 부모의 부모의 div의 value값 가지고 와서 num에 담는다. 
                           $num = $(this).parent().parent().attr('value'); 
                       }
                   });

                   $('.btn-div').each(function(){
                   	
                       if($(this).attr('value') == $num){
                           $('#insert-img').attr('src', $(this).next().find('img').attr('src'));
                           // this(value속성을 가지고 있는 div)의 다음번째 div의 자식의 자식(img)의 src속성값을 가지고 온다.

                           if(marginNum > -($('.btn-div').length*100)*0.3 && $(this).attr('value') < $('#slide-photo-area > div').length ){
		                       	marginNum -= 100;
                               $(this).parent().animate({"margin-left" : marginNum+"px"}, 100)
                           }
                       }
                   })
                       
               }); 

            	
            $(document).on('click', '.left-btn', function(){
            	
                var $lClick = $('#insert-img').attr('src');
                
                $('#small-photo img').each(function(){
                	
                    if($(this).attr('src') == $lClick){
                        $num = $(this).parent().parent().attr('value');
                    }
                    
                });

                $('.btn-div').each(function(){
                	
                    if($(this).attr('value') == $num && $(this).attr('value') > -1){
                        
                        $('#insert-img').attr('src', $(this).prev().find('img').attr('src'));

                        if(marginNum < ($('.btn-div').length*100)*0.3 && $(this).attr('value') > 0){
	                        marginNum += 100;
                            $(this).parent().animate({"margin-left" : marginNum+"px"}, 100)
                        }
                    }
                });
            });
            

        });
          
        </script>

<!---------------------------------- 식당 상세정보 ------------------------------------->
        <div id="detail-area">
            <div>
                <ul>
                	<% //구분자(,)로 하나의 문장으로 들어가 있는 type문자열을 각각 배열에 담음 
                		String type = place.getPlaceType();
                		String[] tArr = type.split(",");
                	%>
                    <li>
                    	<% for(int i = 0; i < tArr.length; i++){ %>
                    			<span class="icon2"><%= tArr[i] %></span>
                    	<% } %>
                    </li>
                </ul>
            </div>

            <div>
                <h1 id="store-name" style="font-weight:bold"><%= place.getPlaceName() %></h1>
            </div>

            <div>
                <ul>
                    <li><%= place.getPlaceKind() %></li>
                    <li id="place-address"><%= place.getPlaceAddress() %></li>
                    <li><button class="address" data-clipboard-target="#place-address">주소복사</button></li>
                </ul>
            </div>

            <div id="star-score-area">
                <p>
                	<% //null 처리 및 별점 계산
                		long count = (place.getCountReview() == 0)? 1 : place.getCountReview() ;
                    	long sum = (place.getSumReview() == 0)? 0 : place.getSumReview();
                    	
                    	int avg =  Math.round(sum/count);
                    %>
                    <span>
       				<% if(avg >= 1){ %>
                    	<% for(int i = 1; i <= avg; i++){ %>
                    		<img style="display:inline-block" width="20px" height="20px" src="<%= contextPath%>/resources/image/star1.png"/>
                    	<% } %>
                    	<% for(int i = 1; i <= (5-avg); i++){ %>
                    		<img style="display:inline-block" width="20px" height="20px" src="<%= contextPath%>/resources/image/star2.png"/>
                    	<% } %>
       				<% } else { %>
                   		<% for(int i = 1; i <= 5 ; i++){ %>                    
							<img style="display:inline-block" width="20px" height="20px" src="<%= contextPath%>/resources/image/star2.png"/>                    	
	                    <% } %>
                    <% } %>
                    </span>
                    <span><%= avg %>점</span>
                    <span><a href="#review-info">(<%= place.getCountReview() %>명)</a></span>
                </p>
            </div>
            
            <div id="click-area">
                <div id="click-area-left">
                	<!-- 좋아요 버튼은 로그인 유저만 클릭할 수 있음 -->
                	<%
                		int wishCount = (place.getWishCount() == 0)? 0 : place.getWishCount();
                	%>

                	<% if(loginMem != null) { %>
	                    <a id="like" onclick="likeClick();" name="like_val" value="0">
	                    	<span>♡좋아요<i style="font-size:13px;">(<%= wishCount %>)</i></span>
                    	</a>
                	<% } else { %>
	                    <a id="like" onclick="alertLogin('좋아요');"><span>♡좋아요<i style="font-size:13px;">(<%= wishCount %>)</i></span></a>
                	<% } %>
                	
          	        <script>
          	        
	               		if(<%= likePlace%> == 1){
	               			console.log(<%= likePlace%>);
	                		$('#like').attr('value', '1');
	               			$('#like').css({'background' : 'cadetblue', 'color':'white'})
	               			$('#like span').html('♥좋아요<i style="font-size:13px;">(<%= wishCount %>)</i>');
	               		}  else {
	               			$('#like').attr('value', '0');
                   			$('#like').css({'background' : 'none', 'color':'black'})
                   			$('#like span').html('♡좋아요<i style="font-size:13px;">(<%= wishCount %>)</i>');
	               		}
		               		
	
		               		

	                </script>
                	
                    <a id="share" href="#"><span>공유하기</span></a>
                </div>
                <div id="click-area-right">
                    <a><span>리뷰쓰기</span></a> 
                </div>         
            </div>
        </div>

	    <script>
	        
	    
	        // 좋아요 기능 구현 ----------------------------------------------------------------------
	      
        <% if(loginMem != null) {%>
	        function likeClick(){
	        
		        	var $likeVal = $('#like').attr('value');
		        	// 좋아요 버튼 클릭하면 value값을 전달해줌!! 
		        	console.log($likeVal);
		        	
		        	$.ajax({
		        		url : '<%=contextPath%>/likeInsert.mr',
		        		data : { placeNo:<%= place.getPlaceNo() %>,
		        			
		        			     memNo:<%= loginMem.getMemNo() %>,
		        			
		        		         likeStatus: $likeVal  },
		        		         
						success : function(result){
									statusLike(result);
								},
						error: function(){
									alert('요청한 like 기능을 구현할 수 없음');
								}		
		        			     
		        	}); //ajax끝
		        	
	       		
	       	}
        <% } %> 
	 
   		
       	function statusLike(result){
       		console.log(result);
       		
       		if(result.num == 1){
       			$('#like').attr('value', '1');
       			$('#like').css({'background' : 'cadetblue', 'color':'white'})
       			$('#like span').html('♥좋아요<i style="font-size:13px;">('+ result.wishCount +')</i>');
       		} else {
       			$('#like').attr('value', '0');
       			$('#like').css({'background' : 'none', 'color':'black'})
       			$('#like span').html('♡좋아요<i style="font-size:13px;">('+ result.wishCount +')</i>');
       		}
       		
       	}
       		

	        

    	</script>

        <div id="share-area">
            <button type="button" id="close-share" class="close" data-dismiss="modal">&times;</button>
            <p> 공유하기 </p>
            <div>
                <textarea id="url-text"></textarea>
                <br>
                <button id="url-copy"  data-clipboard-target="url-text">링크복사</button>
            </div>
        </div>            

        <script>
        
            $('.address').click(function(){
                // 주소 복사하기 기능 구현 
                var clipboard = new ClipboardJS('.address');
                
                clipboard.on('success', function(e){
                    alert('주소가 복사되었습니다.');
                });
                
                clipboard.on('error', function(e){
                    alert('주소 복사에 실패했습니다.');
                });
                
                // $('#place-address').focus();
            })
            
            // 공유하기

            $(function(){
                var url = $(location).attr('href');
                $('#url-text').val(url);
                
                $('#share').click(function(){
                    $('#share-area').fadeIn(300);
                });

                $('.close').click(function(){
                    $('#share-area').fadeOut();
                });
            }) 
                
            $(function () {
                $(document).on('click', '#url-copy', function () {
            
                var copyText = document.getElementById("url-text");//클립보드에 복사할 텍스트 가져옴
                var textArea = document.createElement("textarea");//textarea 생성
                
                textArea.value = $(copyText).val();//textarea에 텍스트 입력
                document.body.appendChild(textArea);//body에 textarea 추가
                
                textArea.select();//선택
                document.execCommand("Copy");//복사
                textArea.remove();//생성한 textarea 삭제
                
                alert("복사되었습니다.");
                
                });
            });
           

        </script>


<!-- ------------------------------------- 리뷰쓰기 모달창 -------------------------------------------- -->
<!-- (수정) -->
	<% if(loginMem != null) { %>
        <div id="review-write-area">
            <div class="modal fade" id="mymodal1">
                <div class="modal-dialog">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <br>
                        <div class="modal-title"><h2>리뷰쓰기📝</h2></div>
                    </div>

                    <form action="<%= contextPath %>/review.mr" method="post" enctype="multipart/form-data">
                        <!-- 여기 나중에 수정해야 함  -->
                    <% if(loginMem!=null){ %>
                  		<input type="hidden" name="memNo" value="<%= loginMem.getMemNo() %>">
					<% } %>
                    <input type="hidden" name="placeNo" value="<%=place.getPlaceNo()%>"> 
                        <div class="modal-content">
                            <p>● 별점을 메겨주세요</p>
                            <div id="star-area">

                                <label for="rate1">
                                    <input type="radio" name="reviewStar" value="1" id="rate1" checked>
                                    <img src="<%= contextPath %>/resources/image/star1.png" width="50" height="50" alt="">
                                </label>

                                <label for="rate2">
                                    <input type="radio" name="reviewStar" value="2" id="rate2">
                                    <img src="<%= contextPath %>/resources/image/star2.png" width="50" height="50" alt="">
                                </label>

                                <label for="rate3">
                                    <input type="radio" name="reviewStar" value="3" id="rate3">
                                    <img src="<%= contextPath %>/resources/image/star2.png" width="50" height="50" alt="">
                                </label>

                                <label for="rate4">
                                    <input type="radio" name="reviewStar" value="4" id="rate4">
                                    <img src="<%= contextPath %>/resources/image/star2.png" width="50" height="50" alt="">
                                </label>
                                
                                <label for="rate5">
                                    <input type="radio" name="reviewStar" value="5" id="rate5">
                                    <img src="<%= contextPath %>/resources/image/star2.png" width="50" height="50" alt="">
                                </label>

                            </div>

                            <br>
                            <p>● 식사 타입을 골라주세요</p>
                            <div id="checked-meal-type">

                                <label for="menu-type1" class="radio-type" >
                                    <img src="<%= contextPath %>/resources/image/free-icon-vegan.png" width="60" height="60" alt="">
                                    <input type="radio" id="menu-type1" name="menu-type" value="비건" checked/> 
                                  	 비건
                                </label>
                                
                                <label for="menu-type2" class="radio-type">
                                    <img src="<%= contextPath %>/resources/image/no-milk.png" width="60" height="60" alt="">
                                    <input type="radio" id="menu-type2" name="menu-type" value="락토프리"/>
                                                                락토프리
                                </label>

                                <label for="menu-type3" class="radio-type">
                                    <img src="<%= contextPath %>/resources/image/sugar-free.png" width="60" height="60" alt="">
                                    <input type="radio" id="menu-type3" name="menu-type" value="슈가프리" />
                                                                슈가프리
                                </label>

                                <label for="menu-type4" class="radio-type">
                                    <img src="<%= contextPath %>/resources/image/gluten-free.png" width="60" height="60" alt="">
                                    <input type="radio" id="menu-type4" name="menu-type" value="글루텐프리"/>
                          			글루텐프리
                                </label>
                                
                                <label for="menu-type5" class="radio-type">
                                    <img src="<%= contextPath %>/resources/image/animal- welfare.png" width="60" height="60" alt="">
                                    <input type="radio" id="menu-type5" name="menu-type" value="동물복지"/>
                                	 동물복지
                                </label>
                            </div>

                            <p>● 식당에 대해서 평가해주세용😏</p>
                            <div id="write-textarea">
                                <textarea name="content" rows="500" style="width:500px; height:120px; resize:none;" placeholder="10자 이상 입력해주세요!" required></textarea>
                            </div>

                            <br>
                            <p>● 사진 등록하기📷</p>
                            <div id="photo-insert-area">
                                <div id="pt-insert-table">
                                        <span><img width="120" height="120" id="photo-insert1" class="1" src="<%= contextPath%>/resources/image/plus.png"></span>
                                        <span><img width="120" height="120" id="photo-insert2" class="2" src="<%= contextPath%>/resources/image/plus.png"></span>
                                        <span><img width="120" height="120" id="photo-insert3" class="3" src="<%= contextPath%>/resources/image/plus.png"></span>
                                        <span><img width="120" height="120" id="photo-insert4" class="4" src="<%= contextPath%>/resources/image/plus.png"></span>
                                </div>
                            </div>

                            <div id="file-insert">
                                <input type="file" name="file1" id="file1" class="1">
                                <input type="file" name="file2" id="file2" class="2">
                                <input type="file" name="file3" id="file3" class="3">
                                <input type="file" name="file4" id="file4" class="4">
                            </div>
                       
                            <br>
                            <!-- 나중에 완성  -->
                            <p>● 태그 골라용</p>
                            <div id="tag-area">
                                <select name="tag" class="tag-opt"> <!--style="display:none;"-->
                                    <option>플레이팅이 멋져요</option>
                                    <option>매장이 청결해요</option>
                                    <option>직원이 상냥해요</option>
                                    <option>화장실이 깨끗해요</option>
                                    <option>특별한 날 가기 좋아요</option>
                                    <option>주차하기 편해요</option>
                                    <option>양이 많아요</option>
                                    <option>음식이 맛있어요</option>
                                    <option>재료가 신선해요</option>
                                    <option>가성비가 좋아요</option>
                                    <option>매장이 넓어요</option>
                                    <option>뷰가 좋아요</option>
                                    <option>모임하기 좋아요</option>
                                    <option>인테리어가 멋져요</option>
                                    <option>혼밥하기 좋아요</option>
                                    <option>사장님이 다정해요</option>
                                    <option>반려동물과 함께해요</option>
                                    <option>접근성이 좋아요</option>
                                </select>
                                <span id="tag-zone"></span>
                                <a id="tag-add" style="cursor:pointer;"> + </a>
                                <a id="tag-minus" style="cursor:pointer;"> - </a>
                            </div>
                        </div>

                        <div id="modal-footer">
                            <input type="submit" value="등록하기" disabled/>
                            <input type="reset" value="다시쓰기"/>
                        </div>
                    </form>
                </div><!-- class="modal-dialog" -->
            </div><!-- class="modal fade" id="mymodal1" -->
        </div> <!-- #review-write-area-->
        
        <script>
<!-- (수정)-------------------------------리뷰쓰기 관련 기능 -------------------------------------------------- -->
            $(function(){
                // 모달(리뷰) 클릭시
                $('#click-area-right > a').click(function(){
                    $('#review-write-area').fadeIn();
                    $('body').css({overflow:'hidden', background:'rgba(51, 51, 51, 0.955)'});
                    $('label[for=menu-type1]').css({color: 'red', background:'rgba(100, 100, 100, 0.19)'});
                });

            // 모달(리뷰) 창종료시  --- 원상복귀
                $('.close').click(function(){

                    $('#review-write-area').fadeOut();
                    $('body').css({overflow:'scroll', background:'none'});
                    $('#write-textarea > textarea').val("");

                    $('input[name=reviewStar]').each(function(){
                    	if($(this).val() == 1){
                    		$(this).next().attr('src','<%= contextPath %>/resources/image/star1.png');
                    		$(this).prop('checked', true);
                    	} else {
							$(this).next().attr('src','<%= contextPath %>/resources/image/star2.png');
	                    }
              		})
              		
              		$('input[name=menu-type]').each(function(){
              			if($(this).val() == '비건'){
			            	$(this).parent().css({color: 'red', background:'rgba(100, 100, 100, 0.19)'});
              				$(this).prop('checked', true);
              			} else {
              				$(this).parent().css({color: 'rgb(51, 51, 51)', background:'none'});
              			}
              		})
                    
              		$('#modal-footer>input[type=submit]').attr('disabled', 'true');
                });
                
                // 모달(리뷰) 타입 선택
                $('input[name=menu-type]').click(function(){

                    $('input[name=menu-type]').each(function(){
                        if($(this).prop('checked') == true){
                            $(this).parent().css({color: 'red', background:'rgba(100, 100, 100, 0.19)'});
                        } else {
                            $(this).parent().css({color: 'rgb(51, 51, 51)', background:'none'});
                        }

                    });
                });
                    
                // 모달(리뷰) 별 
                $('input[name=reviewStar]').click(function(){

                    var $num = $(this).val();

                    $('input[name=reviewStar]').each(function(){

                        if($(this).val() <= $num){
                            $(this).next().attr('src','<%= contextPath%>/resources/image/star1.png');
                        } else {
                            $(this).next().attr('src','<%= contextPath%>/resources/image/star2.png');
                        }
                    })
                });

                // 모달 사진 
                $('#file-insert').hide();

                $('#pt-insert-table').find('img').click(function(){
                	// 클래스에 식별값으로 번호를 줬음. 
                    var $this = $(this).attr('class');

                    $('input[type=file]').each(function(){
                        if($this == $(this).attr('class')){
                            $(this).click();
                        }
                    })
                });


               $('input[type=file]').change(function(){
                    var file = this;
                    var $num = this.files.length;

                    if($num == 1){
                        var reader = new FileReader();

                        reader.readAsDataURL(file.files[0]);

                        reader.onload = function(e){
                          
                            $('img[id^=photo]').each(function(){

                            if($(file).attr('class') == $(this).attr('class')){
                                    $(this).attr('src', e.target.result);
                                }
                            })
                        }
                    } else {
                        $('img[id^=photo]').each(function(){
                            if($(file).attr('class') == $(this).attr('class')){
                                $(this).attr('src', '<%= contextPath%>/resources/image/plus.png');
                            }
                        })
                    }
                });
               
               
                $('#tag-add').click(function(){
                    if($('.tag-opt').length <= 4){
                        $('#tag-zone').append($('.tag-opt').first().clone(true));
                    } else {
                        alert('최대 입력 수를 초과하셨습니다.');
                    }
                });

                $('#tag-minus').click(function(){
                        if($('.tag-opt').length > 1){
                            $('.tag-opt').last().remove();
                        } else {
                            alert('최대 삭제수를 초과하셨습니다.');
                       }
                });                                      
                   
            });          
        </script>
	<% } else { %>
		<script>
			 $('#click-area-right > a').click(function(){
				 alertLogin("리뷰쓰기");
	         });
		</script>
	<% } %>
	

        

<!-- /* ------------------------- 식당 상세 중간 ----------------------------- */ -->
        <br><br>
            <hr>
        <br><br>
      	
        <div id="store-detail-area">
            <table id="store-detail-info">
                <tr>
                    <th>지역</th>
                    <% 
                    	String placeAdd = place.getPlaceAddress(); 
						String[] pAdd = placeAdd.split(" ");
                    %>
                    <td><%= pAdd[0] %></td>
                </tr>
                <tr>
	                <%
						String kind = (place.getPlaceKind() == null)? "-" : place.getPlaceKind(); 

	                	String placeInfo = (place.getPlaceInfo() == null)? "정보없음" : place.getPlaceInfo();
 	                
	                	String placePhone = (place.getPlacePhone() == null)? "정보없음" : place.getPlacePhone();
	                
	                	String placeTime = (place.getPlaceTime() == null)? "정보없음" : place.getPlaceTime();
	                	
	                	String dayoff = (place.getPlaceDayoff() == null)? "정보없음" : place.getPlaceDayoff();
	                	
	                %>
                    <th>업종</th>
                    <td><%= kind %></td>
                </tr>
                <tr>
                    <th>매장소개</th>
                    <td><%= placeInfo %></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><%= placePhone %></td>
                </tr>
                <tr>
                    <th>영업시간</th>
                    <td><%= placeTime %></td>
                </tr>
                <tr>
                    <th>휴무일</th>
                    <td><%= dayoff %></td>
                </tr>
                <tr>
                    <th>편의/시설정보</th>
                    <% 
                    	String str = "";
                    	if(place.getPlaceParking().equals("N")){
                    		str = "주차불가";
                    	} else {
                    		str = "주차가능";
                    	}
                    %>
                    <td><%= str %></td>
                </tr>
                <tr>
                    <th>메뉴</th>
                    <td id="store_menu">
                        <u1> 
                        <% if(pMenu != null) { %>
	                    	<% for(PlaceMenu p : pMenu) { %>
	                            <li>
	                                <span class="store_menuTag"><%= p.getMenuType() %></span>
	                                <span class="store_menuItem"><%= p.getMenuName() %></span>
	                                <span class="store_menuPrice"><%= p.getPrice() %></span>
	                            </li>
							<% } %>
						<% } else {%>
								<li colspan="3"><span>정보없음</span>	
						<% } %>
                        </u1>
                    </td>
                </tr>

            </table>
            <div id="store-report">
                <a>▶식당정보수정요청</a>
            </div>
        </div>
		
        <br><br>
            <hr>
        <br><br>

<!-- ------------------식당정보수정 모달창 -------------------- -->
	<% if(loginMem != null) {%>
		<div id="store-report-area">
		    <div class="modal fade" id="mymodal2">
		        <div class="modal-dialog">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal">&times;</button>
		                <br>
		                <div class="modal-title"><h2>식당정보수정요청👏</h2></div>
		            </div>
		
		            <form action="<%= contextPath %>/request.mr" method="post">
		                <input type="hidden" name="placeNo" value="<%= place.getPlaceNo()%>"/>
		         		<% if(loginMem != null) { %>
		                <input type="hidden" name="memNo" value="<%= loginMem.getMemNo()%>"/>
		                <% } %>
		                <div class="modal-content">
		                    <br>
		                    <div id="st-text-area">
		                        <p>
					                            수정이 필요한 사항을 제보해 주시면 <br>
		                         	Freeeat팀이 검토 후 수정합니다. <br>
					                            감사합니다😃
		                        </p>
		                    </div>
		
		                    <h1 id="store-name-area"><%= place.getPlaceName() %></h1>
		
		                    <br>
		                    <p>● 수정사항을 입력해주세요 </p>
		                    <div id="write-textarea">
		                        <textarea name="content" rows="500" style="width:500px; height:300px; resize:none;" placeholder="10자 이상 입력해주세요!"required></textarea>
		                    </div>          
		                </div> <!-- modal-content -->
		                
		                <div id="modal-footer">
		                    <input type="submit" value="요청하기" disabled/>
		                    <input type="reset" value="다시쓰기"/>
		                </div>
		            </form>
		        </div><!-- class="modal-dialog" -->
		    </div><!-- class="modal fade" id="mymodal1" -->
		</div> <!-- #store-report-area-->
	<% } else { %>
		<script>
			$('#store-report a').click(function(){
				alertLogin("수정하기");
	        });
		</script>
	<% } %>

<!-- /* ----------------------------- 식당 상세 하단 ----------------------------- */ -->
<!-- /* 리뷰 업데이트 : ajax 비동기식 구현 */ -->
       	
        <div id="review-area">
       		<h1 id="review-info"><%= place.getCountReview() %>건의 리뷰가 있어요 😉</h1>
			
			<br><br><br>
			
			<% for(int i = 0;  i< rList.size(); i++) {%>
			<div id="review-detail" class="reviewArea">
                <div id="review-header">
                    <div id="member-profil" style="width:100px; height:100px;">
                        <% if(rList.get(i).getProfileRevise() != null && rList.get(i).getProfileSavePath() != null){ %>
                        	<div style="border-radius:50%; background:url('<%= contextPath%>/<%= rList.get(i).getProfileRevise() %>/<%= rList.get(i).getProfileSavePath() %>') no-repeat; background-size:auto 100px; background-position: center; width:auto; height:100px;"></div>
                        <% } else { %>			
                        	<div style="border-radius:50%; background:url('<%= contextPath%>/resources/image/plus.png') no-repeat; background-size:auto 100px; background-position: center; width:auto; height:100px;"></div>
                       	<% } %>
                    </div>			
                    
                    <div id="review-detail-left">
                        <div class="reviewLeft"><strong style="font-weight: 900; font-size: 20px;"><%= rList.get(i).getNickName() %></strong></div>
                        <div class="reviewLeft"><i class="date reviewLeft"><%= rList.get(i).getReviewCreateDate() %></i></div>
                        <% 
                        	int num = rList.get(i).getReviewCount();
                        	String star= "";
                        	
                        	if(num == 5){
                        		for(int j = 0; j < num; j++){ star += "★"+" "; }
                        	} else if(num < 5){
                        		for(int j = 0; j < num; j++){ star += "★"+" "; }
	                        	for(int j = 0; j < (5-num); j++){ star += "☆"+" "; }
                        	} else {
								for(int j = 0; j < 5; j++) { star += "☆"+" "; }                     		
                        	}
                        %>
                        <div class="reviewLeft">
                        	<p style="color: goldenrod">
								<%= star%>
	                        </p>
                        </div>
                    </div>

                    <div id="review-detail-right">
                    	<% if(loginMem != null) { %>
							<div class="reviewRight like" value="0" id="<%= rList.get(i).getReviewNo()%>" onclick="reviewLikeClick(this);"><a>좋아요👍</a></div>
                    	<% } else {%>
							<div class="reviewRight like" id="<%= rList.get(i).getReviewNo()%>" onclick="alertLogin('리뷰 좋아요');"><a>좋아요👍</a></div>
                    	<% } %>
		                <div class="reviewRight count">
		                 		<% 
		                 			int ReLikeCount = 0;
		                 			for(int j = 0; j < reviewCountList.size(); j++){
			                 			if(rList.get(i).getReviewNo() == reviewCountList.get(j).getReviewNo()){
			                 				ReLikeCount = reviewCountList.get(j).getMemNo();
			                 				//reviewLike VO의 memNo에 review의 count를 담아왔음
			                 			} 
		                 			}
	                 			%>
		                 	<i>
		                 		<%= ReLikeCount %>명이 좋아했어요!
	                 		</i>
                 		</div>
                 		
                        <div class="reviewRight report">
                        	<% if(loginMem != null){ %>
	                        	<a id="report_btn" class="<%= rList.get(i).getReviewNo()%>">신고🚨</a>
                        	<% } else {%>
                        		<a id="report_btn" onclick="alertLogin('신고기능');">신고🚨</a>
                        	<% } %>
                       	</div>
                        
                    </div>
                </div>

				<div id="review-content"><%= rList.get(i).getReviewContent() %> </div>
				<div id="review-photo">
                    <% ArrayList<Photo> p = rList.get(i).getrPhotoList();%>
                    <% if(p != null && p.size() == 4) { %>
                    	<% for(int j = 0; j < p.size(); j++) { %>
                    		<div class="memberPhoto"><img src="<%= contextPath%>/<%= p.get(j).getFilePath() %>/<%= p.get(j).getChangeName() %>" style="width:100%; margin-top:-25px;"></div>
                   		<% } %>
                   	<% } else if(p.size() < 4) { %>
                   		<% for(int j = 0; j < p.size(); j++) { %>
                    		<div class="memberPhoto"><img src="<%= contextPath%>/<%= p.get(j).getFilePath() %>/<%= p.get(j).getChangeName() %>" style="width:100%; margin-top:-25px;"></div>
                   		<% } %>
                   		<% for(int j = 0; j < 4 - p.size(); j++) {%>
                   			<div class="memberPhoto"><img src="<%= contextPath%>/resources/image/plus.png" style="width:100%; margin-top:-25px;"></div>
                   		<% } %>
                   	<% } else { %>
                   		<% for(int j = 0; j < 4; j++) {%>
                   			<div class="memberPhoto"><img src="<%= contextPath%>/resources/image/plus.png" style="width:100%; margin-top:-25px;"></div>
                   		<% } %>
                    <% } %>
				</div>
                <br style="clear:both;">
				<p id="tags">
					<% ArrayList<Tag> tagList = rList.get(i).gettList(); %>
					
					<% if(tagList != null && tagList.size() < 6) { %>
					
						<% for(int j = 0; j < tagList.size(); j++) { %>
							<span class="icon"><%= tagList.get(j).getTagContent() %></span>
						<% } %>
						
					<% } %>
				</p>
			</div>
        </div>

		<br><br><br>
		<% } %>

		
		

		<div>
			<%@ include file="../common/footer.jsp" %>
		</div>
    </div> <!-- outer div 닫는 태그 -->
<!----------------------- 신고하기 모달창 iframe으로 다른 페이지에 작성된 form태그 불러다가 신고처리 할 예정  ---------------------->
		<div id="report_modal">
    		<a class="modal_close_btn">&times;</a>
  			<iframe id="report_iframe">대체 내용</iframe>  
		</div>
    
    <script>

    	<% if(loginMem != null)	{%>
	    	$(document).on('click', '#report_btn', function(){
	    		var $reviewNo = $(this).attr('class');
	    		$('#report_iframe').attr('src', '<%= contextPath %>/reportForm.mr?reviewNo=' + $reviewNo);
	    		$('#report_modal').fadeIn(100);
	    		
	    	});
	    <% } %>
    	
    	
    
    	
   		$('.modal_close_btn').click(function(){
   			$('#report_modal').fadeOut(100);   			
   		})
	    	
    	
    
    
    
   		// 로그인 유저 
    	function alertLogin(msg){
    		alert(msg + ': 로그인 유저만 이용할 수 있습니다.');
    	}
   
   		
   		// 식당정보수정요청 버튼
		$('#store-report a').click(function(){
		          $('#store-report-area').fadeIn();
		      });
		
		$('#store-report-area .close').click(function(){
		    $('#store-report-area').fadeOut();
		});
		
		
   		
		
		$(function(){
			<% for(int i = 0; i < reviewLikeList.size(); i++){ %>
				$('.like').each(function(){
					if($(this).attr('id') == <%=reviewLikeList.get(i).getReviewNo()%>){
						$(this).children().css({'background-color' : 'cadetblue', 'color' : 'white'});
						$(this).attr('value', '1');
					}
				})
			<% } %>
		});
		
		
		<% if(loginMem != null){ %>

			function reviewLikeClick(e){
				//console.log($(this.event.target).parent().attr('value'));
				var $this = $(this.event.target).parent();
				var $likeStatus = $(this.event.target).parent().attr('value');
				var $reviewNo = $(this.event.target).parent().attr('id');
				
				$.ajax({
					url : '<%=contextPath%>/reviewLike.mr',
					data : {
						reviewNo : $reviewNo,
						memNo:<%= loginMem.getMemNo() %>,
						likeStatus: $likeStatus
					},
					success : function(result){
				
						if(result.likeStatus == 1){
							$this.children().css({'background-color' : 'cadetblue', 'color' : 'white'});
							$this.attr('value', result.likeStatus);							
							$this.siblings('.count').children().html('<i>'+ result.recountReview +'명이 좋아했어요!</i>');
						} else {
							$this.children().css({'background-color' : 'white', 'color' : 'black'});
							$this.attr('value', result.likeStatus);							
							$this.siblings('.count').children().html('<i>'+ result.recountReview +'명이 좋아했어요!</i>');
						}
					},
					error : function(){
						alert('review Like 기능을 실행할 수 없습니다.');
					}
				})
				
				

			}

		<% } %>
		
		
        // textarea 입력값이 데이터베이스에서  not-null임으로 무조건 입력해야 등록할 수 있도록 이벤트 설정 
        // 리뷰 \ 식당정보수정하기 
        $('textarea[name=content]').keyup(function(){
			if($(this).val().length >= 10){
            	$('#modal-footer > input[type=submit]').removeAttr('disabled');
			} else {
            	$('#modal-footer > input[type=submit]').attr('disabled', 'true');
			}                	
        })
		
    </script>
    
    
    
</body>
</html>