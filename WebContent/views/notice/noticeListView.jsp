<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.freeeat.common.model.vo.PageInfo, com.freeeat.notice.model.vo.Notice" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");

    PageInfo pi = (PageInfo)request.getAttribute("pi");

    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();	

%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>공지사항 페이지 입니다</title>
        <link rel="icon" href="../common/image/favicon.ico" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <!-- <link href="../../resources/feed_resources/styles/common.css" rel="stylesheet" type="text/css" /> -->
        <!-- <link href="../../resources/feed_resources/styles/feed.css" rel="stylesheet" type="text/css" /> -->

        <style>
            /* div {
                border: 1px rgba(179, 228, 195, 0.178) solid;
            } */

            #outer1 {
                width: 1000px;
                margin-top: 50px;
                background-color: rgba(236, 249, 249, 0.687);
                color: black;
                text-align: center;
                margin-left: auto;
                margin-right: auto;
                border-radius: 30px;
            }

            .list-area {
                text-align: center;
                border: 2px solid rgb(5, 6, 1);
            }

            .list-area>tbody>tr:hover {
                cursor: pointer;
                background-color: rgba(195, 251, 167, 0.696);
            }

            #title_h1 {
                font-size: 40px;
                font-weight: bolder;
            }

            .custom-btn {
                /* 상단버튼 스타일 */
                width: 80px;
                height: 30px;
                color: #fff;
                border-radius: 5px;
                padding: 10px 25px;
                font-family: 'S-CoreDream-3Light';
                font-weight: 500;
                background: transparent;
                cursor: pointer;
                transition: all 0.3s ease;
                position: relative;
                display: inline-block;
                box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
                    7px 7px 20px 0px rgba(0, 0, 0, .1),
                    4px 4px 5px 0px rgba(0, 0, 0, .1);
                outline: none;
            }

            /* 13 */
            .btn-13 {
                background-color: #89d8d3;
                background-image: linear-gradient(315deg, #89d8d3 0%, #03c8a8 74%);
                border: none;
                z-index: 1;
                text-align: center;
                font-size: x-large;
            }

            .btn-13:after {
                position: absolute;
                content: "";
                width: 100%;
                height: 0;
                bottom: 0;
                left: 0;
                z-index: -1;
                border-radius: 5px;
                background-color: #4dccc6;
                background-image: linear-gradient(315deg, #4dccc6 0%, #96e4df 74%);
                box-shadow:
                    -7px -7px 20px 0px #fff9,
                    -4px -4px 5px 0px #fff9,
                    7px 7px 20px 0px #0002,
                    4px 4px 5px 0px #0001;
                transition: all 0.3s ease;
            }

            .btn-13:hover {
                color: #fff;
            }

            .btn-13:hover:after {
                top: 0;
                height: 100%;
            }

            .btn-13:active {
                top: 2px;
            }

            .list-area tr {
                height: 20px;
            }

            .list-area>tbody>tr>td {
                height: 60px;
            }

            /* 페이징바 */
            .pagination {
                padding: 30px 0;
                text-align: center !important;
            }

            .pagination ul {
                margin: 0;
                padding: 0;
                list-style-type: none;
                margin: auto;
            }

            .pagination a {
                display: inline-block;
                padding: 10px 18px;
                color: #222;
            }

            .p1 a {
                width: 40px;
                height: 40px;
                line-height: 40px;
                padding: 0;
            }

            .p1 a.is-active {
                background-color: #88A201;
                border-radius: 100%;
                color: #fff;
            }
            #page_good{
                margin: auto;
            }
            #thead>tr>th{
                padding-top: 10px;
            }
            tbody tr td{
                padding-left: 10px;
                padding-top: 20px;
            }
        </style>
    </head>

    <body id="body">
        <%@ include file="../common/menubar_hj.jsp" %>
            <!--  여기 인클루드 하자 -->
        	
            <!--  버튼 3개 인클루드   -->
        <%@ include file="../common/noticeFaqCs.jsp" %>
        
            <div class="outer" id="outer1">
                <br>
                <h1 id="title_h1">공지사항</h1>
                <br>

                <!-- 관리자만 글쓰기 버튼이 보이게끔 -->
                <!-- 로그인이 되어있으면서 관리자일 경우 / 관리자용 화면이 따로 있기 때문에 필요 없어짐 -->

                <div style="width:1000px;" align="right">
                </div>
                <br><br>

                <table class="list-area" align="center">
                    <thead id="thead">
                        <tr>
                            <th width="100">글번호</th>
                            <th width="800">글제목</th>
                            <th width="100">작성자</th>
                            <th width="250">작성일</th>
                        </tr>
                    </thead>
                    <tbody>

                        <!-- 공지사항이 있을수도 있고 없을수도 있음 -->
                        <% if (list.isEmpty()) { %>
		                <!-- 공지사항이 없다는 뜻 ㅎㅎ -->
                        	<tr>
                        		<td colspan="5">등록된 글이 없습니다<td>
                        	<tr>
                        <% } else { %> <!-- 공지사항이 존재할 경우 -->
                        	<% for (Notice n : list) { %>
		                        <tr>
		                            <td><%= n.getNoticeNo() %></td>
		                            <td><%= n.getNoticeTitle() %></td>
		                            <td><%= n.getMemNickname() %></td>
		                            <td><%= n.getNoticeDate() %></td>
		                        </tr>
                             <% } %>
                        <% } %>
                    </tbody>
                </table>
                <br><br><br>

            </div>

            <script>

                $(function () {

                    $('.list-area>tbody>tr').click(function () {
                        var nno = $(this).children().eq(0).text();

                        location.href = "<%=contextPath%>/noticeDetail.ih?nno=" + nno;

                    });
                })
            </script>

            <div id="footer" class="page_good">
                <!-- 페이징바 -->
                <div class="pagination p1">
                   <ul>
                        <% if(currentPage != 1) { %>
                            <a href="<%= contextPath %>/noticeList.sk?cpage=<%= currentPage - 1 %>"><li>&lt;</li></a>
                        <% } %>

                        <% for(int i = startPage; i <= endPage; i++) { %>
                            <% if(currentPage != i) { %>
                                <a href="<%= contextPath %>/noticeList.sk?cpage=<%= i %>"><li><%= i %></li></a>
                            <% } else { %>
                                <a class="is-active" disabled><li><%= i %></li></a>
                            <% } %> 
                        <% } %>

                        <% if(!list.isEmpty() && maxPage != currentPage) { %>
                            <a href="<%= contextPath %>/noticeList.sk?cpage=<%= currentPage + 1 %>"><li>&gt;</li></a>
                        <% } %>
                    </ul>
                </div>

            </div>







    </body>


    </html>