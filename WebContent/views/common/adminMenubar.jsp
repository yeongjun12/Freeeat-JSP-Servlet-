<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.freeeat.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();
	String successMsg = (String)session.getAttribute("successMsg");
	Member loginMem = (Member)request.getAttribute("loginMem");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 사이드바</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    
    <script>

// location.href = location.href;
    </script>
    
    <style>

        @font-face {
            font-family: 'S-CoreDream-3Light';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'S-CoreDream-3Light';
        }

        body>div {
            margin: 0;
        }

        div {
            /*border: 1px solid gray;*/
            box-sizing: border-box;
        }

        .sidebar {
            position: fixed;
            width: 250px;
            height: 100%;
            background-color: #f6f5f0;
            /*text-align: left;*/
        }

        #sidebar-logo {
            width: 250px;
            height: 250px;
        }


        .sidebar-menu>a {
            text-decoration: none;
            color: black;
            font-size: 18px;
            font-weight: 900;
            padding-top: 10px;

            text-align: justify;
            display: block;
            width: 180px;
            height: 45px;
            background-color: silver;
            border-radius: 10px;

            margin-top: 15px;
            margin-bottom: 15px;
            margin-left: auto;
            margin-right: auto;

            padding: 10px;

            position: relative;

        }

        .sidebar-menu>a:hover {
            cursor: pointer;
        }

        .sub-menu {
            width: 180px;
            height: 80px;
            background-color: white;
            margin-left: auto;
            margin-right: auto;
            border-radius: 10px;
            display: none;
        }

        .sub-menu>a {
            text-decoration: none;
            color: black;
            font-size: 15px;
            text-align: center;
            padding-top: 5px;
            display: block;
            width: 150px;
            height: 20px;
            margin-left: auto;
            margin-right: auto;
        }

        .sub-menu>a:hover {
            color: #88A201;
        }

        .sub-menu-btn {
            position: relative;
        }

        .sub-menu-span {
            position: absolute;
            right:10px;
        }
        

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
            text-decoration: none;
        }

        .p1 a{
            width: 40px;
            height: 40px;
            line-height: 40px;
            padding: 0;
            text-align: center;
            text-decoration: none;

        }

        .p1 a.is-active{
            background-color: #88A201;
            border-radius: 100%;
            color: #fff;
            text-decoration: none;

        }

        /* 메시지 알림 */
        
        #message {
            width:220px;
            height: 50px;
            background-color: rgba(0, 0, 0, 0.8);
            color: whitesmoke;
            border-radius: 5px;
            padding: 15px;
            font-size: 15px;
            position: absolute;
            bottom: 30px;
            left: 15px;
            z-index: 50;
            display: none;
        }
        

    </style>
</head>
<body>
	
	
    <div class="sidebar">

        <div id="sidebar-logo">
            <a href="<%= contextPath %>">
                <img src="<%=contextPath %>/resources/image/freeeatlogo.png" alt="프리잇 로고" width="100%" height="100%">
            </a>
        </div>
        <div class="sidebar-menu">
            <a class="menu-btn" href="<%= contextPath %>/memberList.sk?tap=1&cpage=1">
                	회원관리
            </a>
            <a class="menu-btn sub-menu-btn" href="#">식당관리
               <span class="material-symbols-outlined sub-menu-span">
                    arrow_drop_down
               </span>
            </a>
            <div class="sub-menu">
               <a class="menu-sub-button" href="<%=contextPath %>/PlaceInsertView.yk">식당등록</a>
               <a class="menu-sub-button" href="<%=contextPath %>/plist.yk">식당조회/수정</a>
            </div>
            <a class="menu-btn" href="<%= contextPath %>/contentList.sk?cpage=1">콘텐츠관리</a>
            <a class="menu-btn sub-menu-btn">
                고객센터관리
                <span class="material-symbols-outlined sub-menu-span">
                    arrow_drop_down
                </span>
            </a>
            <div class="sub-menu">
                <a class="menu-sub-button" href="<%= contextPath %>/noticeList.sk?cpage=1">공지사항관리</a>
                <a class="menu-sub-button" href="<%= contextPath %>/qnaList.sk?cpage=1">문의관리</a>
            </div>
            <a class="menu-btn sub-menu-btn" href="#">
                데이터관리
                <span class="material-symbols-outlined sub-menu-span">
                    arrow_drop_down
                </span>
            </a>
            <div class="sub-menu">
                <a class="menu-sub-button" href="<%= contextPath %>/reviewList.sk?del=A&cpage=1">리뷰</a>
                <a class="menu-sub-button" id="feedBtn">피드</a>
                <a class="menu-sub-button" href="<%= contextPath %>/replyList.sk?cpage=1">댓글</a>
            </div>
            <a class="menu-btn sub-menu-btn" href="#">
                신고/요청
                <span class="material-symbols-outlined sub-menu-span">
                    arrow_drop_down
                </span>
            </a>
            <div class="sub-menu">
                <a class="menu-sub-button" href="<%=contextPath %>/reportList.yk">신고</a>
                <a class="menu-sub-button" href="<%=contextPath %>/requestList.yk">정보수정</a>
            </div>
        </div>
        <div id="message">
            
        </div>


    </div>
    
    
    <script>
    
        $(function() {
        	
        	
        	
        	$.ajax({
        		url : 'feedCount.sk',
        		async : false,
        		success : function(feedCount) {	
        			var link = '<%= contextPath %>/feedDetail.sk?fno=' + feedCount;
        			$('#feedBtn').attr('href', link);
        		},
        		error : function() {
        			console.log('리스트 조회 실패')
        		}        	
        	
        	});

        	
        	
            $('.sub-menu-btn').click(function() {
                var $div = $(this).next();
                
                if($div.css('display') == 'none') {
                    // 해당 div 보이기
                    $div.slideDown(100);
                    $(this).children().text('arrow_drop_up');
                    // 다른 div 안보이기
                    $($div).siblings('div').slideUp(100);
                    $(this).siblings('a').find('span').text('arrow_drop_down');
                }
                else {
                    $div.slideUp(100);
                    $(this).children().text('arrow_drop_down');
                }
            });


            if('<%= successMsg %>' != 'null') {
                $('#message').text('<%= successMsg %>');
            	$('#message').fadeIn(2100);
            	$('#message').fadeOut(2100);
            	<% session.removeAttribute("successMsg"); %>
            }
        });

    
    </script>


    
</body>
</html>