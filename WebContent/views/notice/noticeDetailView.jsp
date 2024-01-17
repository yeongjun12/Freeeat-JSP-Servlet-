<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.freeeat.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>공지사항 페이지 입니다</title>
        <link rel="icon" href="../common/image/favicon.ico" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

        <style>
            /* div {
                border: 1px rgba(179, 228, 195, 0.178) solid;
            } */

            #outer1 {
                width: 1000px;
                margin-top: 100px;
                background-color: rgba(236, 249, 249, 0.687);
                color: black;
                text-align: center;
                margin-left: auto;
                margin-right: auto;
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
                width: 100px;
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

            .noticeHead{
                background-color: #03c8a8;
            }

            .button_box {
                text-align: center;
                margin-top: 100px;
            }

            .red_btn {
                background-color: #c62d2d;
                background-image: linear-gradient(315deg, #c31e0b 0%, #ce5f15 74%);
                border: none;
                z-index: 1;
                text-align: center;
                font-size: x-large;
            }
            .blue_btn {
                background-color: #033db1;
                background-image: linear-gradient(315deg, #0e9aec 0%, #29b8df 74%);
                border: none;
                z-index: 1;
                text-align: center;
                font-size: x-large;
            }

            .red_btn:after {
                position: absolute;
                content: "";
                width: 100%;
                height: 0;
                bottom: 0;
                left: 0;
                z-index: -1;
                border-radius: 5px;
                background-color: #c43333;
                background-image: linear-gradient(315deg, #cc4f4d 0%, #5f1ace 74%);
                box-shadow:
                    -7px -7px 20px 0px #fff9,
                    -4px -4px 5px 0px #fff9,
                    7px 7px 20px 0px #0002,
                    4px 4px 5px 0px #0001;
                transition: all 0.3s ease;
            }
            .blue_btn:after {
                position: absolute;
                content: "";
                width: 100%;
                height: 0;
                bottom: 0;
                left: 0;
                z-index: -1;
                border-radius: 5px;
                background-color: #0523be;
                background-image: linear-gradient(315deg, #cc4f4d 0%, #042e92 74%);
                box-shadow:
                    -7px -7px 20px 0px #fff9,
                    -4px -4px 5px 0px #fff9,
                    7px 7px 20px 0px #0002,
                    4px 4px 5px 0px #0001;
                transition: all 0.3s ease;
            }

            .red_btn:hover {
                color: #fff;
            }

            .red_btn:hover:after {
                top: 0;
                height: 100%;
            }

            .red_btn:active {
                top: 2px;
            }


            #detail-area {
                border: 2px solid black;
                margin: 100px;
                margin-left:auto;
                margin-right:auto;
                background-color: #4dccc631;
            }

            #detail-area tr>td {
                border: 2px solid black;
                padding-left: 20px;
                padding-top: 20px;
                padding-right: 20px;
                height: 50px;
            }

            #detail-area tr>td {
                border: 2px solid black;

                height: 50px;
            }

            #notice_content {
                height: inherit;
            }
        </style>
    </head>

    <body id="body">
        <%@ include file="../common/menubar_hj.jsp" %>
            <!--  여기 인클루드 하자 -->
        <%@ include file="../common/noticeFaqCs.jsp" %>
            <div class="outer">
                <br>
                <div class="noticeHead">
                    <h1 align="center" id="title_h1">공지사항</h1>
                </div>
                <br>

                <table id="detail-area">
                    <tr>
                        <td width="50">&nbsp;제목</td>
                        <td width="580" colspan="3"><%= n.getNoticeTitle() %></td>
                    </tr>
                    <tr>
                        <th style="border: 1px solid black;">작성자</th>
                        <td><%= n.getMemNickname() %></td>
                        <th>작성일</th>
                        <td><%= n.getNoticeDate() %></td>
                    </tr>
                    <tr id="notice_content">
                        <th>내용</th>
                        <td colspan="3" >
                            <p style="height: 450px; line-height: 50px;"> <%= n.getNoticeCont() %>
                            </p>
                        </td>
                    </tr>
                </table>
                <div class="button_box">
                    <a href="<%=contextPath %>/noticeList.sk?cpage=1" class="custom-btn btn-13 blue_btn">목록으로</a>
                    <!-- 아래 두 버튼은 관리자 아니면 안보이도록 처리하기 -->
                   <!-- <a href="" class="custom-btn btn-13">수정하기</a> --> 
                   <!-- <a href="" class="custom-btn red_btn">삭제하기</a> --> 
                   <!-- 관리자 페이지에서 처리하므로 필요 없어짐 -->

                </div>
                <br>
            </div>





    </body>


    </html>