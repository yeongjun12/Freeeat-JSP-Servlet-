<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.common.model.vo.PageInfo, com.freeeat.content.model.vo.Content" %>
<%
	ArrayList<Content> list = (ArrayList<Content>)request.getAttribute("list");
    PageInfo pi = (PageInfo)request.getAttribute("pi");

    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();	
	
	String cate = (String)request.getAttribute("cate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘텐츠 목록보기</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>

    .content-btn span {
        text-decoration: none;
        color: black;
        margin-right: 5px;
    }

    .content-btn img {
        margin-top: 5px;
        margin-right: 10px;
        
    }
    
    .content-btn img:hover {
        cursor: pointer;
        transform: scale(1.1);
    }
    
    #contentListWrap {
        width: 1100px;
        margin: auto;
        position: relative;
    }

    #contentCategoryWrap {
        width: 90%;
        margin: auto;
        padding-left: 315px;
    }

    .content-category {
        width: 210px;
        height: 40px;
        
        border-radius: 10px;
        margin: 10px;

        border: 1px solid gray;
        font-size: 16px;
    }

    .content-category:hover {
        background-color: darkgray;
        cursor: pointer;
    }

    
    #contentContainerWrap {
        width: 90%;
        
        margin: auto;
        text-align: center;
    }
    
    
    .content-container {
        display: inline-block;
        border: solid 1px silver;
        
        width: 400px;
        /* height: 500px; */
        text-align: center;
        margin: 30px;        
        box-shadow: 2px 2px 5px 0px lightgrey;
    }

    .moveToLink {

        width: 200px;
        height: 45px;
                
        position: absolute;

        top: 50%;
        left: 25%;

        background-color: rgba(255, 255, 255, 0.7);

        display: none;
        font-size: 20px;

        padding-top: 15px;
        border-radius: 15px;
        border: 1px solid darkgray;

    }

    .content-img img {
        width: 400px;
        height: 400px;
        object-fit: cover;
        margin: auto;
    }

    .content-type {
        text-align: left;
    }


    .typeTag {

        display: inline-block;
        width: 60px;
        height: 20px;
        background-color: green;
        border-radius: 20px;
        font-size: 12px;
        color: whitesmoke;
        margin-left: 5px;
        margin-right: 5px;
        text-align: center;

    }


    .content-text p {
        text-align: right;
        margin: 5px;
        text-align: left;
    }

    .content-btn {
        position: relative;
        width: 98%;
        height: 25px;
        text-align: right;
    }

    .content-btn img {
        display: inline;
        width: 20px;
        height: 20px;
    }

    .like-alarm {
        background-color: rgba(255, 255, 255);
        display: inline-block;
        width: 55px;
        font-size: 12px;
        border-radius: 3px;
        /* border: 1px solid darkgray; */
        padding: 2px;
        position: absolute;
        top: -25px;
        right: 22px;
        display: none;
    }



    /* 링크 복사 모달창 */

    #linkCopyModalBack {
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.6);
        z-index: 40;
        position: fixed;
        top: 0;
        left: 0;
        display: none;
    }

    #linkCopyModalOuter {
        width: 400px;
        height: 160px;
        background-color: whitesmoke;
        border-radius: 8px;
        position: fixed;
        z-index: 50;
        top: 30%;
        left: 37%;
        padding: 20px;
        text-align: center;
        display: none;
    }

    #modalheaderWrap>div {
        width: 80%;
        display: inline-block;
        text-align: left;
        font-size: 25px;
    }

    #modalheaderWrap>div+div {
        width: 15%;
        display: inline-block;
        text-align: right;
    }

    #modalbodyWrap {
        width: 90%;
        text-align: right;
        padding: 10px;
        position: relative;
    }

    #modalbodyWrap textarea {
        resize: none;
        width: 95%;
        padding-top: 5px;
        padding-left: 10px;
        background-color: white;
        border: darkgray 1px solid;
        font-family: 'S-CoreDream-3Light';
        margin-left: 15px;
    }

    #linkCopyModalOuter button {
        background: transparent;
        border: none;
        margin: 5px;
        vertical-align: middle;
    }

    #linkCopyModalOuter button:hover {
        cursor: pointer;
    }

    #linkCopyAlarm {
        width:50px;
        background-color: rgba(0, 0, 0, 0.8);
        color: whitesmoke;
        border-radius: 5px;
        padding: 5px;
        font-size: 13px;
        display: none;
        position: absolute;
        bottom: 12%;
        right: 12%;
        z-index: 60;
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

</head>
<body>


	<%@ include file="../common/menubar_hj.jsp" %>
	
    <div id="contentListWrap">

        <div id="contentCategoryWrap">
            <button type="button" onclick="location.href='<%= contextPath %>/contentListC.sk?cate=article&cpage=1'" class="content-category">이런 이슈 🌍 이런 기사</button>
            <button type="button" onclick="location.href='<%= contextPath %>/contentListC.sk?cate=place&cpage=1'" class="content-category">이 식당엔 이런 비밀이?🤔</button>
        </div>

        <div id="contentContainerWrap">

            <% for (Content cont : list) { %>
            

                <div class="content-container">
                    <input type="hidden" value="<%= cont.getContLink() %>">

                    <div class="content-img" style="position: relative;">
                        <img src="<%= cont.getContImgSource() %>" alt="해당기사사진">
                        <div class="moveToLink">
                            	📰 기사 보러가기 🔍
                        </div>
                    </div>
                    <div class="content-btn">
                        <div class="like-alarm">좋아요💗</div>
                        <% if (cont.getLikeYN() != null && cont.getLikeYN().equals("Y") ) { %>
                        	<img class="like" src="<%= contextPath %>/resources/image/redheart.png">                        	
                        <% } else { %>
                        	<img class="like" src="<%= contextPath %>/resources/image/emptyheart.png">
                        <% } %>
                    	<input type="hidden" value="<%= cont.getContNo() %>">
                        <img class="shareLink" src="<%= contextPath %>/resources/image/share.png" alt="">
                    </div>
                    <div class="content-type">
                        <span class="typeTag"><%= cont.getMenuType() %></span>
                    </div>
                    <div class="content-text">
                        <p style="font-size: 15px; font-weight: 600;" class="contTitle">
                        	<%= cont.getContTitle() %>
                        </p>
                        <p style="font-size: 13px;">
                            <%= cont.getContInfo() %>
                        </p>
                    </div>
                </div>


            <% } %>


            <div id="footer">
                <!-- 페이징바 -->
                    <div class="pagination p1">
                       <ul>
                            <% if(currentPage != 1) { %>
                                <a href="<%= contextPath %>/contentList.sk?cpage=<%= currentPage - 1 %>"><li>&lt;</li></a>
                            <% } %>

                            <% for(int i = startPage; i <= endPage; i++) { %>
                                <% if(currentPage != i) { %>
                                    <a href="<%= contextPath %>/contentList.sk?cpage=<%= i %>"><li><%= i %></li></a>
                                <% } else { %>
                                    <a class="is-active" disabled><li><%= i %></li></a>
                                <% } %> 
                            <% } %>

                            <% if(!list.isEmpty() && maxPage != currentPage) { %>
                                <a href="<%= contextPath %>/contentList.sk?cpage=<%= currentPage + 1 %>"><li>&gt;</li></a>
                            <% } %>
                        </ul>
                    </div>
            </div>
            
        
        </div>
    
        
        
        
        <%@ include file="../common/footer.jsp" %>
        


        <!-- 링크 공유 모달창 -->
        <div id="linkCopyModalBack"></div>
        <div id="linkCopyModalOuter">
            <div id="modalheaderWrap">
                <div>
                    <span class="material-symbols-outlined">
                        share
                    </span>                    
                    링크 공유하기
                </div>
                <div>
                    <button>
                        <span class="material-symbols-outlined">
                            close
                        </span>
                    </button>
                </div>
            </div>
            <div id="modalbodyWrap">
                <textarea name="" id="linkCopyText" rows="3" readonly disabled>http://www.naver.com</textarea>
                <div id="linkCopyAlarm">
                    	복사완료
                </div>
                <button>
                    <span class="material-symbols-outlined">
                        content_copy
                    </span>
                </button>
            </div>
        </div>


    </div>
	

    <script>


        $(function() {
            
        	// 선택된 카테고리 버튼 색 바뀌게
        	if('<%= cate %>' == '기사') {
        		$('#contentCategoryWrap button:even').css('background-color', 'darkgray');
        	} else if ('<%= cate %>' == '식당') {
        		$('#contentCategoryWrap button:odd').css('background-color', 'darkgray');        		
        	}
        	
        	
        	<% if(loginMem != null) { %>
	            // 하트 클릭해서 좋아요 눌리게 - AJAX추가
	            $('.like').click(function() {
	                
	                if($(this).attr('src').includes('empty')) {
	                    $.ajax({
	
	                        url : 'insertContentLike.sk',
	                        data : {
	                            memNo : <%= loginMem.getMemNo() %>,
	                            contNo : $(this).next().val()
	                        },
	                        type : 'post',
	                        success : function(contNo) {
	                        	
	                        	$('.content-container input[type=hidden]:odd').each(function(){
	                        		if($(this).val() == contNo) {
	                        			$(this).prev().attr('src', '<%= contextPath %>/resources/image/redheart.png');
	                        			$(this).prev().prev().fadeIn(600);
	                        		    $(this).prev().prev().fadeOut(600);
	                        		}
	                        	});
			                       	
	                        },
	                        error : function() {
	                        	alert('고장');	
	                        }
	                    });
	                } 
	                else {
	                	$.ajax({
	
	                        url : 'deleteContentLike.sk',
	                        data : {
	                            memNo : <%= loginMem.getMemNo() %>,
	                            contNo : $(this).next().val()
	                        },
	                        type : 'post',
	                        success : function(contNo) {
	                        	
	                        	$('.content-container input[type=hidden]:odd').each(function(){
	                        		if($(this).val() == contNo) {
	              						$(this).prev().attr('src', '<%= contextPath %>/resources/image/emptyheart.png');
	                        		}
	                        	});
			                       	
	                        },
	                        error : function() {
	                        	alert('고장');	
	                        }
	                    });
	
	                }
	                
	            });
        	<% } %>
            


            // 호버해서 링크보러가기 버튼 나오게
            $('.content-container').hover(function() {
                $(this).find('.moveToLink').css({'display':'block', 'cursor':'pointer'});
            }, function() {
                $(this).find('.moveToLink').css('display', 'none');
            });

            var $index;
            var $link;

            // 링크보러가기 클릭하면 새 창 뜨게
            $('.moveToLink').click(function() {
                $index = $('.moveToLink').index(this);
                $link = $('.content-container input[type=hidden]:even').eq($index).val();
                window.open($link);
            });
            
            // 공유 클릭해서 모달창 뜨게
            $('.shareLink').click(function() {
                $('#linkCopyModalBack').css('display', 'block');
                $('#linkCopyModalOuter').css('display', 'block');

                $index = $('.shareLink').index(this);
                $link = $('.content-container input[type=hidden]:even').eq($index).val();
                $('#linkCopyText').val($link);
            });

            // 복사 클릭해서 글 복사하고, 알림div뜨게
            $('#linkCopyAlarm').next().click(function() {
                window.navigator.clipboard.writeText($link);
                
                $('#linkCopyAlarm').fadeIn(600);
                $('#linkCopyAlarm').fadeOut(600);
            });

            // x 클릭해서 모달창 안보이게
            $('#modalheaderWrap').find('button').click(function() {
                $('#linkCopyModalBack').css('display', 'none');
                $('#linkCopyModalOuter').css('display', 'none');
            });

            

                
        });

 


    </script>



</body>
</html>