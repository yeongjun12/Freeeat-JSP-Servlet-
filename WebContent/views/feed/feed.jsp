<%@page import="java.util.ArrayList" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="com.freeeat.report.model.vo.Report, com.freeeat.feed.model.vo.*" %> 
<% 
ArrayList<Feed> feedList = (ArrayList<Feed>)request.getAttribute("feedList"); 
String alertMsg = (String)session.getAttribute("alertMsg"); 
String successMsg = (String)session.getAttribute("successMsg"); 
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>피드페이지입니다</title>
    <link
      rel="icon"
      href="<%= request.getContextPath() %>/resources/image/favicon.ico"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <style>
      @font-face {
        font-family: "S-CoreDream-3Light";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }
      * {
        box-sizing: border-box;
        font-family: "S-CoreDream-3Light";
      }

      article {
        position: relative;
        right: 0px;
        border-radius: 3px;
      }

      .main_body {
        display: flex;
        position: relative;
        text-align: center;
        justify-content: center;
        left: 20px;
        margin-top: 50px;
      }

      .feed {
        width: 600px;
        height: auto;
        margin-top: 20px;
        box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, 0.5),
          7px 7px 20px 0px rgba(0, 0, 0, 0.1),
          4px 4px 5px 0px rgba(0, 0, 0, 0.1);
      }

      .story {
        height: 117px;
        border: 1px solid #dbdbdb;
        border-radius: 3px;
      }

      aside {
        position: relative;
        left: 0px;
        right: 100px;
        top: 10px;
      }

      .feed_left_container {
        position: sticky;
        width: 450px;
        top: 0px;
        right: 100px;
      }
      /* .feed_left_container_i */
      #feed_logo {
        width: 400px;
        height: 400px;
      }

      .my_profile {
        display: flex;
        height: 95px;
        margin: 20px;
        background-color: #fafafa;
        border-radius: 50%;
      }

      .empty_box {
        height: 26px;
      }

      .text {
        position: relative;
        top: 11px;
      }

      .feed {
        border: 1px solid #dbdbdb;
        border-radius: 3px;
      }

      .feed_id {
        position: relative;
        display: flex;
        justify-content: center;
        height: 83px;
        background-color: #e7f8ff9a;
      }

      .id_round {
        display: flex;
        position: absolute;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        top: 15px;
        left: 10px;
        width: 32px;
        height: 32px;
        background-size: contain;
        border-radius: 50%;
      }

      .id_box {
        display: flex;
        position: absolute;
        flex-direction: row;
        align-items: flex-start;
        justify-content: flex-start;
        left: 0px;
        top: 0px;
        width: 530px;
        height: 50px;
      }

      .id_container {
        display: flex;
        position: relative;
        flex-direction: column;
        align-items: flex-start;
        left: 10px;
      }

      .id_img {
        width: 50px !important;
        height: 50px !important;
        border-radius: 50% !important;
      }

      .id_name {
        margin-bottom: 3px;
        font-size: 14px;
        font-weight: 600;
      }

      .feed_title {
        font-size: 12px;
      }

      .more_details {
        position: relative;
        right: -535px;
        margin-top: 20px;
      }

      .more_details img {
        display: flex !important;
        justify-content: flex-end !important;
        width: 45px !important;
        height: 45px !important;
      }

      .feed_picture {
        width: 598px;
        height: 598px;
      }

      .feed_picture img {
        width: 598px !important;
        height: 598px !important;
      }

      .emoticon_box {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        height: 40px;
        margin: 0px;
        background-color: #e7f8ff9a;
      }

      .emoticon_box2 {
        display: flex;
      }

      .emoticon_box2 div {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        margin: 0px;
      }

      .emoticon_box2 img {
        width: 24px !important;
        height: 24px !important;
      }

      .bookmark_box {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 40px;
        height: 40px;
      }

      .bookmark_box img {
        width: 24px !important;
        height: 24px !important;
      }

      .feed_like_box {
        display: flex;
        position: relative;
        flex-direction: row;
        align-items: center;
        height: 30px;
        left: 8px;
        padding: 0 16px 0 8px;
      }

      .feed_like_box .feed_like {
        display: flex;
        position: relative;
        left: 5px;
        font-size: 14px;
      }

      .feed_like_picture {
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 50%;
        top: 15px;
        left: 10px;
        border: 1px solid #dbdbdb;
      }

      .feed_like_peolpe {
        width: 20px;
        height: 20px;
        border-radius: 50%;
      }

      .feed_article {
        display: flex;
        justify-content: flex-start;
        align-items: flex-start;
      }

      .feed_article_box {
        display: flex;
        justify-content: flex-start;
        align-items: flex-start;
        flex-direction: column;
        padding: 0 16px 0 16px;
      }

      .comments_container {
        display: flex;
      }

      .comments {
        font-size: 14px;
        line-height: 18px;
        padding: 2px;
      }

      .comments1 {
        padding: 2px;
        font-size: 14px;
        line-height: 18px;
        color: #8e8e8e;
      }

      .comments1_box {
        display: flex;
        justify-content: flex-start;
        align-items: flex-start;
        flex-direction: column;
      }

      .new_comments {
        display: block;
        text-align: start;
      }

      .newCommentBox {
        padding: 2px;
        font-size: 14px;
        line-height: 18px;
      }

      .newCommentBox1 {
        padding: 2px;
        font-size: 14px;
        line-height: 18px;
      }

      .comments2 {
        font-size: 10px;
        line-height: 18px;
        color: #8e8e8e;
        letter-spacing: 0.2px;
      }

      .inputContainer {
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 56px;
        padding: 0 12px 0 12px;
        margin: 0px;
        border-top: 1px solid #efefef;
      }

      .inputBox {
        background-color: #fafafa;
        font: 14px;
        color: black;
        outline: none;
        width: 550px;
        height: 50px;
        border: solid 0px;
      }

      .buttonBox {
        background-color: white;
        color: #b1d6f8;
        outline: none;
        border: solid 0px;
      }
      .buttonBox:hover {
        font-weight: bold;
        background-color: rgba(54, 53, 53, 0.124);
        color: #0095f6;
      }
      .gogo {
        color: #04303f !important;
        font-weight: bold !important;
      }

      .type_comment {
        display: flex;
        justify-content: flex-start;
        width: 530px;
        font-size: 14px;
        color: #8e8e8e;
      }

      .my_profile_box1 {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 66px;
        height: 66px;
        border: 1px solid gray;
        border-radius: 50%;
        background-size: contain;
        flex-direction: column;
      }

      .my_profile_box1 img {
        width: 60px !important;
        height: 60px !important;
        border-radius: 50% !important;
      }

      .my_profile_id {
        margin-left: 14px;
        font-weight: 400;
        line-height: 18px;
      }

      .my_profile_id1 {
        /* border: 1px solid blue; */
        margin-left: 10px;
      }

      .my_profile_id2 {
        /* border: 1px solid blue; */
        margin-left: 10px;
      }

      .allorfollow {
        display: flex;
        /* border: 1px solid pink; */
        align-items: center;
        position: relative;
        top: 7px;
        left: 30px;
        margin-left: 70px;
      }

      .other_box {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        /* border:1px solid red; */
        position: relative;
        left: 75px;
        top: -20px;
        margin-top: 20px;
      }

      .span1 {
        font-size: 11px;
        color: #c7c7c7;
      }

      .recommendation_box {
        margin: 10px 120px 10px 40px;
      }

      .comment {
        font-size: 12px;
        color: #262626;
        font-weight: 600;
      }

      .my_profile_main_box {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-direction: row;
        /* border:1px solid black; */
        width: 63%;
      }

      .my_profile_id_box {
        display: flex;
        align-items: flex-start;
        flex-direction: column;
      }

      .my_profile_id1 {
        font-size: 14px;
        font-weight: 600;
        color: #262626;
      }

      .my_profile_id2 {
        font-size: 12px;
        color: #8e8e8e;
      }

      .btn_category {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 55px;
        height: 55px;
        flex-direction: column;
      }

      .btn_category img {
        width: 40px !important;
        height: 40px !important;
        border-radius: 50% !important;
      }

      .users {
        display: flex;
        /* border: 1px solid paleturquoise; */
        margin-top: 20px;
        height: 290px;
        flex-direction: column;
      }

      .user {
        display: flex;
        flex-direction: row;
        align-items: center;
        height: 48px;
        margin: 5px 0 0 40px;
      }

      .user_box {
        height: 50%;
      }

      .follow {
        font-size: 12px;
        font-weight: 600;
        color: #0095f6;
      }

      .recommendation {
        font-size: 14px;
        color: #8e8e8e;
      }

      .btn {
        /*<!-- 모든 버튼에대한 css설정 -->*/
        text-decoration: none;
        color: white;
        padding: 10px 20px 10px 20px;
        margin: 20px;
        display: inline-block;
        border-radius: 10px;
        transition: all 0.1s;
        text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
      }

      .btn:active {
        transform: translateY(3px);
      }

      .btn.blue {
        background-color: #1f75d9;
        border-bottom: 5px solid #165195;
      }
      #red_btn,
      #red_btn2 {
        background-color: red;
        color: white;
        margin-bottom: 31110px;
      }

      .btn.blue:active {
        border-bottom: 2px solid #165195;
      }

      .custom-btn {
        /* 상단버튼 스타일 */
        width: 130px;
        height: 40px;
        color: #fff;
        border-radius: 5px;
        padding: 10px 25px;
        font-family: "S-CoreDream-3Light";
        font-weight: 500;
        background: transparent;
        cursor: pointer;
        transition: all 0.3s ease;
        position: relative;
        display: inline-block;
        box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, 0.5),
          7px 7px 20px 0px rgba(0, 0, 0, 0.1),
          4px 4px 5px 0px rgba(0, 0, 0, 0.1);
        outline: none;
      }

      /* 13 */
      .btn-13 {
        background-color: #89d8d3;
        background-image: linear-gradient(315deg, #89d8d3 0%, #03c8a8 74%);
        border: none;
        z-index: 1;
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
        box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9,
          7px 7px 20px 0px #0002, 4px 4px 5px 0px #0001;
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

      /* 14 */
      .btn-14 {
        background: rgb(255, 151, 0);
        border: none;
        z-index: 1;
      }

      .btn-14:after {
        position: absolute;
        content: "";
        width: 100%;
        height: 0;
        top: 0;
        left: 0;
        z-index: -1;
        border-radius: 5px;
        background-color: #eaf818;
        background-image: linear-gradient(315deg, #eaf818 0%, #f6fc9c 74%);
        box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, 0.5);
        /* 7px 7px 20px 0px rgba(0, 0, 0, .1),
  4px 4px 5px 0px rgba(0, 0, 0, .1); */
        transition: all 0.3s ease;
      }

      .btn-14:hover {
        color: #000;
      }

      .btn-14:hover:after {
        top: auto;
        bottom: 0;
        height: 100%;
      }

      .btn-14:active {
        top: 2px;
      }

      /* 15 */
      .btn-15 {
        background: #d6f2fec6;
        border: none;
        border-radius: 15px;
        z-index: 1;
        color: #165195;
      }

      .btn-15:after {
        position: absolute;
        content: "";
        width: 0;
        height: 100%;
        top: 0;
        right: 0;
        z-index: -1;
        background-color: #43ff3d;
        border-radius: 15px;
        box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, 0.5),
          7px 7px 20px 0px rgba(0, 0, 0, 0.1),
          4px 4px 5px 0px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
      }

      .btn-15:hover {
        color: #fff;
      }

      .btn-15:hover:after {
        left: 0;
        width: 100%;
      }

      .btn-15:active {
        top: 2px;
      }
      .btn-16 {
        background-color: palegreen;
        color: purple;
        font-weight: bold;
      }

      .select_btn_group {
        margin-top: 0px;
        padding-top: 100px;
      }
      .select_btn_group_button {
        margin-bottom: 20px;
      }
      #legend_reason {
      }
      .insert_feed_box {
        /* 피드등록버튼 div*/
        padding: 10px;
      }

      #insert_feed {
        height: 100px;
        background-color: #c8e183;
        width: 200px;
        font-size: x-large;
        font-weight: bolder;
      }

      .mouse_scroll {
        margin-top: 20px;
        width: 40px;
      }

      .tag_boxes {
        margin: 1px;
        margin-top: 3px;
        padding-left: 10px;
      }

      .tag {
        margin-left: 5px;
        width: 115px;
        height: 25px;
        background: #23849c;
        text-align: center;
        border-radius: 5px;
        color: white;
        font-weight: bold;
        line-height: 25px;
      }

      .more_buttons {
        margin-top: 10px;
        display: none;
      }

      .more_button {
        width: max-content;
      }

      .more_button {
        background: #d6f2fec6;
        border: none;
        border-radius: 15px;
        z-index: 1;
        color: #165195;
        margin-bottom: 3px;
      }

      .more_button:after {
        position: absolute;
        content: "";
        width: 0;
        height: 100%;
        top: 0;
        right: 0;
        z-index: -1;
        background-color: #4fe34945;
        border-radius: 15px;
        box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, 0.5),
          7px 7px 20px 0px rgba(0, 0, 0, 0.1),
          4px 4px 5px 0px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
      }

      .more_button:hover {
        color: #fff;
      }

      .more_button:hover:after {
        left: 0;
        width: 100%;
      }

      /* .more_button:active {
top: 2px;
} */
      button[type="hidden"],
      .hidden {
        color: rgba(0, 0, 0, 0) !important;
        background-color: rgba(0, 0, 0, 0) !important;
        display: none !important;
        border: rgba(255, 255, 255, 0) !important;
      }

      /* 신고하기 모달창!!!!!!!! */

      .modal_wrap {
        /* 신고하기 */
        display: none;
        width: 600px;
        height: 885px;
        top: 33%;
        left: 50%;
        margin: -250px 0 0 -250px;
        border-radius: 40px;

        background-color: rgb(253, 219, 219);
        position: fixed;
        transform: translate(0%, 0%);
        z-index: 1000;
      }

      .black_bg,
      .black_bg2,
      .black_bg3 {
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 300%;
        background-color: rgba(0, 0, 0, 0.5);
        top: 0;
        left: 0;
        z-index: 1;
      }

      .modal_close,
      .modal_close2,
      .modal_close3 {
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
        z-index: 4;
      }

      .modal_close > a,
      .modal_close2 > a,
      .modal_close3 > a {
        display: block !important;
        width: 100% !important;
        height: 100% !important;
        background: url(https://img.icons8.com/metro/26/000000/close-window.png) !important;
        text-indent: -9999px !important;
        z-index: 4 !important;
      }
      #s123 {
        height: 10px;
        width: 10px;
      }
      /* 모달 내부 div */
      #report_modal_title,
      #feed_modal_title {
        font-size: 40px;
        margin-top: 10px;
        margin-bottom: 10px;
      }
      #modal_inside {
        /* border: 1px solid red; */
        margin: 20px;
        margin-top: 30px;
      }
      .report_modal_btns {
        text-align: center;
        width: 560px;
        height: 0px;
        left: 0px;
        bottom: 0px;
      }
      .report_modal {
        background-color: white !important;
      }
      .reported_nickname {
        display: block;
      }
      .reported_textarea {
        width: 530px;
      }
      .report_reason_input_box {
        margin: 0px;
      }
      .report_reason_input_box input {
        margin: 10px;
      }
      #etc_reason_text {
        width: 530px;
        height: 80px;
        resize: none;
      }

      /* 모달 내부 div 끝 */
      /* 신고하기 모달창!  끝!! */
      /* ----------------------------------------------- */

      /* 피드등록 모달창 시작! */

      #feed_wrap {
        /* 피드등록하기*/
        display: none;
        width: 800px;
        height: 885px;
        top: 38%;
        left: 45%;
        right: 50%;
        margin: -250px 0 0 -250px;
        border-radius: 40px;

        background-color: #e7f8ff;
        position: fixed;
        transform: translate(0%, 0%);
        z-index: 1000;
      }

      #modal_inside2 {
        margin: 20px;
        margin-top: 30px;
        box-sizing: border-box;
      }
      #empty_p {
        height: 10px;
        margin-bottom: 20px;
      }
      /* -------------------------------------- */
      /* 피드 모달창 내부 */
      .titleImg_class1,
      .titleImg_class1_1 {
        text-align: center;
      }

      #feed_insert_title {
        height: 36px;
        width: 550px;
        display: block;
        margin-bottom: 20px;
        margin-top: 0;
      }

      #feed_content {
        margin-top: 10px;
      }
      #feed_insert_table {
        line-height: 40px;
      }
      #feed_tag {
        margin-top: 20px;
      }
      /* 피드등록 모달창 끝! */

      /* 피드수정 모달창 시작 */
      .feed_wrap3 {
        /* 피드수정하기*/
        display: none;
        width: 800px;
        height: 885px;
        top: 38%;
        left: 45%;
        right: 50%;
        margin: -250px 0 0 -250px;
        border-radius: 40px;

        background-color: #e7f8ff;
        position: fixed;
        transform: translate(0%, 0%);
        z-index: 1000;
      }
      #modal_inside3 {
        margin: 20px;
        margin-top: 30px;
        box-sizing: border-box;
      }
      #empty_p3 {
        height: 10px;
        margin-bottom: 20px;
      }
      /* -------------------------------------- 피드수정 모달창 내부 */
      .titleImg_class3,
      .titleImg_class3_1 {
        text-align: center;
      }
      #feed_update_title {
        height: 36px;
        width: 550px;
        display: block;
        margin-bottom: 20px;
        margin-top: 0;
      }
      #feed_content3 {
        vertical-align: top !important;
        margin-top: 10px;
      }
      #feed_update_table {
        line-height: 40px;
      }
      #feed_tag3 {
        margin-top: 20px;
      }
      #updateTitleSpan {
        font-size: 40px;
      }
      /* 피드수정 모달창 끝! */
    </style>
  </head>

  <body id="body">
    <%@ include file="../common/menubar_hj.jsp" %> 
    <% 
    String memNickName = loginMem.getMemNickName(); 
    String phone = loginMem.getPhone(); 
    String memId = loginMem.getMemId(); 
    String memPhotoPath = loginMem.getMem_profile_savePath(); 
    String memPhotoName = loginMem.getMem_profileRevise(); 
    %>
    <!--  여기 인클루드 하자 -->

    <!--body-->
    <div class="main_body">
      <aside>
        <div class="feed_left_container">
          <div class="feed_left_container_img">
            <img
              id="feed_logo"
              src="<%= contextPath %>/resources/feed_resources/img/freeeat_feed.gif"
              alt="피드 로고"
            />
          </div>

          <div id="select_btn_group">
            <button
              class="custom-btn btn-13"
              id="select_btn_group_button"
              onclick="location.href='<%= contextPath %>/FeedGo.ih'"
            >
              전체
            </button>
            <button class="custom-btn btn-14 follow_xx" id="gofollowbtn">
              팔로우
            </button>
          </div>
          <div class="users">
            <div class="user">
              <div class="btn_category">
                <img
                  src="<%= contextPath %>/resources/feed_resources/img/everyday.png"
                  alt="일상"
                />
              </div>
              <div class="my_profile_main_box">
                <button class="custom-btn btn-15 tag_xx">일상</button>
              </div>
            </div>
            <div class="user">
              <div class="btn_category">
                <img
                  src="<%= contextPath %>/resources/feed_resources/img/food.png"
                  alt="음식"
                />
              </div>
              <div class="my_profile_main_box">
                <button class="custom-btn btn-15 tag_xx">음식</button>
              </div>
            </div>
            <div class="user">
              <div class="btn_category">
                <img
                  src="<%= contextPath %>/resources/feed_resources/img/beauty.png"
                  alt="뷰티"
                />
              </div>
              <div class="my_profile_main_box">
                <button class="custom-btn btn-15 tag_xx">뷰티</button>
              </div>
            </div>
            <div class="user">
              <div class="btn_category">
                <img
                  src="<%= contextPath %>/resources/feed_resources/img/nature.png"
                  alt="환경"
                />
              </div>
              <div class="my_profile_main_box">
                <button class="custom-btn btn-15 tag_xx">환경</button>
              </div>
            </div>
            <div class="user">
              <div class="btn_category">
                <img
                  src="<%= contextPath %>/resources/feed_resources/img/tip.png"
                  alt="꿀팁"
                />
              </div>
              <div class="my_profile_main_box">
                <button class="custom-btn btn-15 tag_xx">꿀팁</button>
              </div>
            </div>
          </div>
          <div class="other_box">
            <div class="other1">
              <span class="span1"
                >위의 버튼을 누르면 조건별 피드 조회가 가능합니다.</span
              >
            </div>
          </div>
          <div class="other_box">
            <span class="span1">© 2022 FREEATE FROM KH</span>
          </div>
          <div class="insert_feed_box">
            <button id="insert_feed" class="custom-btn btn-15">
              피드 등록
            </button>
          </div>
        </div>
      </aside>

      <script>
        $(function () {

          $(document).on("click", ".more", function () {
            $(this).siblings(0).toggle(500);
            if (
              $(this).attr("src") ==
              "<%= contextPath %>/resources/feed_resources/img/more.png"
            ) {
              $(this).attr(
                "src",
                "<%= contextPath %>/resources/feed_resources/img/down.png"
              );
            } else {
              $(this).attr(
                "src",
                "<%= contextPath %>/resources/feed_resources/img/more.png"
              );
            }
          });


          $(document).on("click", ".heart", function () {

            if($(this).attr('src').includes('heart')) {

              // $.ajax({

              //     url : 'insertFeedLike.ih',
              //     data : {
              //         memNo : '<%= loginMem.getMemNo() %>',
              //         feedNo : $(this).next().val()
              //     },
              //     type : 'post',
              //     success : function(feedNo) {
                      $(this).attr('src', '<%= contextPath %>/resources/feed_resources/img/fullht.png');
              //         alert('좋아여성공');
              //     },
              //     error : function() {
              //       alert('고장');   
              //     }
              // });

            } 
            else {

              // $.ajax({

              //   url : 'deleteFeedLike.ih',
              //   data : {
              //         memNo : '<%= loginMem.getMemNo() %>',
              //         feedNo : $(this).next().val()
              //   },
              //   type : 'post',
              //   success : function(feedNo) {
                  $(this).attr('src', '<%= contextPath %>/resources/feed_resources/img/heart.png');
              //     alert('좋아요취소');
              //   },
              //   error : function() {
              //       alert('고장');   
              //   }
              // });

            }
          });

        });

      </script>
      <article id="aaa">
        <div class="empty_box"></div>
        <!-- 시험해보는 공간 -->
        <script></script>

        <!-- 시험해보는 공간 -->

        <!-- 이 안에 피드 리스트가 붙을 것이다. -->
      </article>
    </div>
    <script>
      // ---------------------------------------------------------------------------------------------------------------

      function selectFeedList() {
        $.ajax({
          url: "selectFeedList.ih",
          success: function (feedList) {
            var result = "";
            // console.log(feedList[0].userPhoto);
            for (var i in feedList) {
              result +=
                '<div class="feed">' +
                '<div class="feed_id">' +
                '<div class="id_round">' +
                '<div class="id_box">' +
                '<div class="id_box_img">' +
                '<img class="id_img" src="';

              if (feedList[i].userPhoto != "/Freeeat//") {
                //유저포토가 없지 않으면 띄워주고
                result += feedList[i].userPhoto;
              } else {
                // 없으면 기본이미지
                result +=
                  "<%= contextPath %>/resources/feed_resources/img/basicCat.jpg";
              }

              result +=
                '" alt="내 프로필">' +
                "</div>" +
                '<div class="id_container">' +
                '<div class="id_name">' +
                feedList[i].feedWriter +
                "</div>" + // 넘기는 피드 작성자
                '<div class="feed_title">' +
                feedList[i].feedTitle +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="more_details">' +
                '<img class="more" src="<%= contextPath %>/resources/feed_resources/img/more.png" alt="더보기">' +
                '<div class="more_buttons">';

              if ("<%= loginMem %>" != null) {
                result +=
                  '<button class="more_button">팔로우</button>' +
                  '<button class="more_button report_modal thisisFeedNo" value="' +
                  feedList[i].feedNo +
                  '">신고</button>' +
                  '<button type="hidden" class="hidden" value="' +
                  feedList[i].feedText +
                  '"></button>';
                // FNO가지고 가도록 신고, 수정, 삭제 버튼 변경 필요   && (loginMem.getMemNo() == feedList[i].memNo)
              }
              /* 여기가 당신이 찾는 바로 그 버튼*/
              if (
                "<%= loginMem %>" != null &&
                "<%= loginMem.getMemNo() %>" == feedList[i].memNo
              ) {
                // loginMem => 자바스크립트 변수 , loginMem.getMemNo() => 자바객체에 접근해서 겟, feedList=> 자바스크립트 변수
                result +=
                  '<button class="more_button updateFno" value="' +
                  feedList[i].feedNo +
                  "," +
                  feedList[i].feedTitle +
                  "," +
                  feedList[i].feedText +
                  "," +
                  feedList[i].originName +
                  "," +
                  feedList[i].changeName +
                  "," +
                  feedList[i].filePath +
                  "," +
                  '" >수정</button>' +
                  '<button class="more_button deleteFno" value="' +
                  feedList[i].feedNo +
                  '" >삭제</button>';
              }
              
              result +=
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="feed_picture">' +
                '<img src="' +
                feedList[i].filePath +
                feedList[i].changeName +
                '" alt="피드 사진">' +
                "</div>" +
                '<div class="feed_bottom">' +
                '<div class="emoticon_box">' +
                '<div class="emoticon_box2">' +
                '<div class="heart_box">' +
                '<img class="heart" src="<%= contextPath %>/resources/feed_resources/img/heart.png" alt="하트">' +
                '<input type="hidden" class="hidden" value="'+ feedList[i].feedNo +'">' +
                '</div>'+
                '<div class="comment_box">' +
                '<img class="coment" src="<%= contextPath %>/resources/feed_resources/img/comment.png" alt="댓글 숫자" />' +
                "</div>" +
                '<div class="direct_box">' +
                '<img class="direct" src="<%= contextPath %>/resources/feed_resources/img/direct.png" alt="종이비행기" />' +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="feed_like_box">' +
                '<div class="feed_like_picture">' +
                '<img class="feed_like_peolpe" src="';

              if (feedList[i].userPhoto != "/Freeeat//") {
                //유저포토가 없지 않으면 띄워주고
                result += feedList[i].userPhoto;
              } else {
                // 없으면 기본이미지
                result +=
                  "<%= contextPath %>/resources/feed_resources/img/basicCat.jpg";
              }

              result +=
                '" alt="내 프로필">' +
                "</div>" +
                '<div class="feed_like">' +
                feedList[i].feedWriter +
                "님 외" +
                feedList[i].likeCount +
                "명이 좋아합니다.</div>" +
                // 좋아요 하고 해결하기
                "</div>" +
                '<div class="feed_article">' +
                '<div class="feed_article_box">' +
                '<div class="comments_container">' +
                '<div style="margin-left: 3px;">' +
                '<div class="comments">' +
                '<div class="feed_content">' +
                "<span>" +
                feedList[i].feedWriter +
                "&nbsp;" +
                feedList[i].feedText +
                "</span>" +
                "</div>" +
                '<div class="tag_boxes">' +
                // 태그를 반복문을 돌려야해????????????? 댓글을 추가 처리해야하는 건 알았는데 태그도 해야되는구나..
                '<a href="#" class="tag">' +
                "#일상" +
                "</a>" +
                '<a href="#" class="tag">' +
                "#꿀팁" +
                "</a>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>" +
                // 댓글부분 여기부터
                '<div class="comments1">댓글 <span class="count">' +
                "replyList[i].replyCount" +
                " 개</span> 모두 보기</div>" +
                '<div class="comments1_box">' +
                "<div>" +
                //일단 댓글은 그대로 나오게 하자
                '<span class="comments">KH_ACADEMY 아따 냥이 행님! 어디여요???????????? 좋은디요?</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                '<!-- <input type="hidden"  class="hidden"  val="1"> -->' + // 댓글 하고 다시오자
                "</div>" +
                "<div>" +
                '<span class="comments">supercat 형님 너무 멋져요!!</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                "</div>" +
                "<div>" +
                '<span class="comments">cyber 와 얼룩냥님 완전 화보</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                "</div>" +
                "<div>" +
                '<span class="comments">catplay 얼룩냥님 정말 짱이에요!</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                "</div>" +
                "</div>" +
                '<div class="new_comments">' +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="inputContainer">' +
                '<div class="type_comment">' +
                '<input class="inputBox" type="text" name="replyContent" placeholder="댓글 달기...">' +
                "</div>" +
                "<span>" +
                '<button class="buttonBox gogo" onclick="insertReply();">게시</button>' +
                "</span>" +
                "</div>" +
                "</div>" +
                '<div align="center">' +
                '<img class="mouse_scroll" src="<%= contextPath %>/resources/feed_resources/img/scroll.gif" alt="마우스스크롤 그림">' +
                "</div>";
            }
            $(".empty_box").nextAll().remove();
            $("#aaa").append(result);
          },
          error: function () {
            console.log("피드 불러오기에 실패했습니다");
          },
        });
      }
      $(function () {
        console.log("작동중삐리삐리");
        selectFeedList();
      });
      ///////댓글-----------------------시작
      function selectReplyList() {
        $.ajax({
          url: "replyList.ih",
          data: { fno: 1 },
          success: function (replyList) {
            var result = "";
            for (var i in replyList) {
              result +=
                "<div>" +
                '<span class="comments">' +
                replyList[i].replyWriter +
                " " +
                replyList[i].replyContent +
                "</span>" +
                '<input type="hidden"  class="hidden" val="1">' + // 여기에 히든으로 FNO를 집어 넣어야 한다.
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                "</div>";
            }
            $(".comments1_box").html(result);
          },
          error: function () {
            console.log("댓글 읽어오는걸 실패하였다. 으악으악");
          },
        });
      }
      // 화면 로딩 완료시 댓글 조회
      $(function () {
        selectReplyList();

        // 댓글이 추가될 때 -> selectReplyList(); 다시할껀데 이건 insertReply에서 할 것이다.
      });

      function insertReply() {
        $.ajax({
          url: "insertReply.ih",
          data: {
            fno: 1,
            replyContent: $("#replyContent").val(),
          },
          success: function (result) {
            // 컨트롤러(서블릿)에서 넘겨받은 result
            if (result > 0) {
              alert(
                "댓글작성에 성공했는데 뭐 다하고나면 주석처리 바랍니다"
              );
              $("#replyContent").val(""); // 댓글 작성 후 비워주기
              selectReplyList(); // 댓글 생성
            }
          },
          error: function () {
            console.log(
              "댓글작성 실패함.. 지저스 갓 파더 플리즈 헬프 미!!!"
            );
          },
        });
      }

      $(".follow_xx").click(function () {
        if ("<%= loginMem.getMemNo() %>" != null) {
          selectFeedListFollow();
        } else {
          window.alert(
            "로그인이 필요한 기능입니다. 회원가입 부탁드립니닷!!"
          );
        }
      });

      function selectFeedListFollow() {
        $.ajax({
          url: "selectFeedListFollow.ih",
          data: { memNo1: "<%= loginMem.getMemNo() %>" },
          success: function (feedList) {
            console.log("selectFeedListFollow 작동중");
            var result = "";            
            for (var i in feedList) {
              result +=
                '<div class="feed">' +
                '<div class="feed_id">' +
                '<div class="id_round">' +
                '<div class="id_box">' +
                '<div class="id_box_img">' +
                '<img class="id_img" src="';

              if (feedList[i].userPhoto != "/Freeeat//") {
                //유저포토가 없지 않으면 띄워주고
                result += feedList[i].userPhoto;
              } else {
                // 없으면 기본이미지
                result +=
                  "<%= contextPath %>/resources/feed_resources/img/basicCat.jpg";
              }

              result +=
                '" alt="내 프로필">' +
                "</div>" +
                '<div class="id_container">' +
                '<div class="id_name">' +
                feedList[i].feedWriter +
                "</div>" + // 넘기는 피드 작성자
                '<div class="feed_title">' +
                feedList[i].feedTitle +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="more_details">' +
                '<img class="more" src="<%= contextPath %>/resources/feed_resources/img/more.png" alt="더보기">' +
                '<div class="more_buttons">';

              if ("<%= loginMem %>" != null) {
                result +=
                  '<button class="more_button">팔로우</button>' +
                  '<button class="more_button report_modal thisisFeedNo" value="' +
                  feedList[i].feedNo +
                  '">신고</button>' +
                  '<button type="hidden" class="hidden" value="' +
                  feedList[i].feedText +
                  '"></button>';
                // FNO가지고 가도록 신고, 수정, 삭제 버튼 변경 필요   && (loginMem.getMemNo() == feedList[i].memNo)
              }
              /* 여기가 당신이 찾는 바로 그 버튼*/
              if (
                "<%= loginMem %>" != null &&
                "<%= loginMem.getMemNo() %>" == feedList[i].memNo
              ) {
                // loginMem => 자바스크립트 변수 , loginMem.getMemNo() => 자바객체에 접근해서 겟, feedList=> 자바스크립트 변수
                result +=
                  '<button class="more_button updateFno" value="' +
                  feedList[i].feedNo +
                  "," +
                  feedList[i].feedTitle +
                  "," +
                  feedList[i].feedText +
                  "," +
                  feedList[i].originName +
                  "," +
                  feedList[i].changeName +
                  "," +
                  feedList[i].filePath +
                  "," +
                  '" >수정</button>' +
                  '<button class="more_button deleteFno" value="' +
                  feedList[i].feedNo +
                  '" >삭제</button>';
              }
              
              result +=
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="feed_picture">' +
                '<img src="' +
                feedList[i].filePath +
                feedList[i].changeName +
                '" alt="피드 사진">' +
                "</div>" +
                '<div class="feed_bottom">' +
                '<div class="emoticon_box">' +
                '<div class="emoticon_box2">' +
                '<div class="heart_box">' +
                '<img class="heart" src="<%= contextPath %>/resources/feed_resources/img/heart.png" alt="하트">' +
                '<input type="hidden" class="hidden" value="'+ feedList[i].feedNo +'">' +
                '</div>'+
                '<div class="comment_box">' +
                '<img class="coment" src="<%= contextPath %>/resources/feed_resources/img/comment.png" alt="댓글 숫자" />' +
                "</div>" +
                '<div class="direct_box">' +
                '<img class="direct" src="<%= contextPath %>/resources/feed_resources/img/direct.png" alt="종이비행기" />' +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="feed_like_box">' +
                '<div class="feed_like_picture">' +
                '<img class="feed_like_peolpe" src="';

              if (feedList[i].userPhoto != "/Freeeat//") {
                //유저포토가 없지 않으면 띄워주고
                result += feedList[i].userPhoto;
              } else {
                // 없으면 기본이미지
                result +=
                  "<%= contextPath %>/resources/feed_resources/img/basicCat.jpg";
              }

              result +=
                '" alt="내 프로필">' +
                "</div>" +
                '<div class="feed_like">' +
                feedList[i].feedWriter +
                "님 외" +
                feedList[i].likeCount +
                "명이 좋아합니다.</div>" +
                // 좋아요 하고 해결하기
                "</div>" +
                '<div class="feed_article">' +
                '<div class="feed_article_box">' +
                '<div class="comments_container">' +
                '<div style="margin-left: 3px;">' +
                '<div class="comments">' +
                '<div class="feed_content">' +
                "<span>" +
                feedList[i].feedWriter +
                "&nbsp;" +
                feedList[i].feedText +
                "</span>" +
                "</div>" +
                '<div class="tag_boxes">' +
                // 태그를 반복문을 돌려야해????????????? 댓글을 추가 처리해야하는 건 알았는데 태그도 해야되는구나..
                '<a href="#" class="tag">' +
                "#일상" +
                "</a>" +
                '<a href="#" class="tag">' +
                "#꿀팁" +
                "</a>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>" +
                // 댓글부분 여기부터
                '<div class="comments1">댓글 <span class="count">' +
                "replyList[i].replyCount" +
                " 개</span> 모두 보기</div>" +
                '<div class="comments1_box">' +
                "<div>" +
                //일단 댓글은 그대로 나오게 하자
                '<span class="comments">KH_ACADEMY 아따 냥이 행님! 어디여요???????????? 좋은디요?</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                '<!-- <input type="hidden"  class="hidden"  val="1"> -->' + // 댓글 하고 다시오자
                "</div>" +
                "<div>" +
                '<span class="comments">supercat 형님 너무 멋져요!!</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                "</div>" +
                "<div>" +
                '<span class="comments">cyber 와 얼룩냥님 완전 화보</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                "</div>" +
                "<div>" +
                '<span class="comments">catplay 얼룩냥님 정말 짱이에요!</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                "</div>" +
                "</div>" +
                '<div class="new_comments">' +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="inputContainer">' +
                '<div class="type_comment">' +
                '<input class="inputBox" type="text" name="replyContent" placeholder="댓글 달기...">' +
                "</div>" +
                "<span>" +
                '<button class="buttonBox gogo" onclick="insertReply();">게시</button>' +
                "</span>" +
                "</div>" +
                "</div>" +
                '<div align="center">' +
                '<img class="mouse_scroll" src="<%= contextPath %>/resources/feed_resources/img/scroll.gif" alt="마우스스크롤 그림">' +
                "</div>";
            }            $(".empty_box").nextAll().remove();
            $("#aaa").append(result);
          },
          error: function () {
            console.log("피드 불러오기에 실패했습니다");
          },
        });
      }

      // --댓글끌 끌끌끌끌끌끌끌끌끌끌끌끌끌끌끌끌끌끌끌끌끌끌끌 댓글끝 댓글끝 댓글끝 댓글끝 댓글끝

      $(".tag_xx").click(function () {
        var $tagName = $(this).text();
        selectFeedListTag($tagName);
      });

      function selectFeedListTag($tagName) {
        $.ajax({
          url: "selectFeedByTag.ih",
          data: { tagName: $tagName },
          success: function (feedList) {
            console.log("selectFeedListTag 작동중");
            var result = "";
            // console.log(feedList);
            for (var i in feedList) {
              result +=
                '<div class="feed">' +
                '<div class="feed_id">' +
                '<div class="id_round">' +
                '<div class="id_box">' +
                '<div class="id_box_img">' +
                '<img class="id_img" src="';

              if (feedList[i].userPhoto != "/Freeeat//") {
                //유저포토가 없지 않으면 띄워주고
                result += feedList[i].userPhoto;
              } else {
                // 없으면 기본이미지
                result +=
                  "<%= contextPath %>/resources/feed_resources/img/basicCat.jpg";
              }

              result +=
                '" alt="내 프로필">' +
                "</div>" +
                '<div class="id_container">' +
                '<div class="id_name">' +
                feedList[i].feedWriter +
                "</div>" + // 넘기는 피드 작성자
                '<div class="feed_title">' +
                feedList[i].feedTitle +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="more_details">' +
                '<img class="more" src="<%= contextPath %>/resources/feed_resources/img/more.png" alt="더보기">' +
                '<div class="more_buttons">';

              if ("<%= loginMem %>" != null) {
                result +=
                  '<button class="more_button">팔로우</button>' +
                  '<button class="more_button report_modal thisisFeedNo" value="' +
                  feedList[i].feedNo +
                  '">신고</button>' +
                  '<button type="hidden" class="hidden" value="' +
                  feedList[i].feedText +
                  '"></button>';
                // FNO가지고 가도록 신고, 수정, 삭제 버튼 변경 필요   && (loginMem.getMemNo() == feedList[i].memNo)
              }
              /* 여기가 당신이 찾는 바로 그 버튼*/
              if (
                "<%= loginMem %>" != null &&
                "<%= loginMem.getMemNo() %>" == feedList[i].memNo
              ) {
                // loginMem => 자바스크립트 변수 , loginMem.getMemNo() => 자바객체에 접근해서 겟, feedList=> 자바스크립트 변수
                result +=
                  '<button class="more_button updateFno" value="' +
                  feedList[i].feedNo +
                  "," +
                  feedList[i].feedTitle +
                  "," +
                  feedList[i].feedText +
                  "," +
                  feedList[i].originName +
                  "," +
                  feedList[i].changeName +
                  "," +
                  feedList[i].filePath +
                  "," +
                  '" >수정</button>' +
                  '<button class="more_button deleteFno" value="' +
                  feedList[i].feedNo +
                  '" >삭제</button>';
              }
              
              result +=
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="feed_picture">' +
                '<img src="' +
                feedList[i].filePath +
                feedList[i].changeName +
                '" alt="피드 사진">' +
                "</div>" +
                '<div class="feed_bottom">' +
                '<div class="emoticon_box">' +
                '<div class="emoticon_box2">' +
                '<div class="heart_box">' +
                '<img class="heart" src="<%= contextPath %>/resources/feed_resources/img/heart.png" alt="하트">' +
                '<input type="hidden" class="hidden" value="'+ feedList[i].feedNo +'">' +
                '</div>'+
                '<div class="comment_box">' +
                '<img class="coment" src="<%= contextPath %>/resources/feed_resources/img/comment.png" alt="댓글 숫자" />' +
                "</div>" +
                '<div class="direct_box">' +
                '<img class="direct" src="<%= contextPath %>/resources/feed_resources/img/direct.png" alt="종이비행기" />' +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="feed_like_box">' +
                '<div class="feed_like_picture">' +
                '<img class="feed_like_peolpe" src="';

              if (feedList[i].userPhoto != "/Freeeat//") {
                //유저포토가 없지 않으면 띄워주고
                result += feedList[i].userPhoto;
              } else {
                // 없으면 기본이미지
                result +=
                  "<%= contextPath %>/resources/feed_resources/img/basicCat.jpg";
              }

              result +=
                '" alt="내 프로필">' +
                "</div>" +
                '<div class="feed_like">' +
                feedList[i].feedWriter +
                "님 외" +
                feedList[i].likeCount +
                "명이 좋아합니다.</div>" +
                // 좋아요 하고 해결하기
                "</div>" +
                '<div class="feed_article">' +
                '<div class="feed_article_box">' +
                '<div class="comments_container">' +
                '<div style="margin-left: 3px;">' +
                '<div class="comments">' +
                '<div class="feed_content">' +
                "<span>" +
                feedList[i].feedWriter +
                "&nbsp;" +
                feedList[i].feedText +
                "</span>" +
                "</div>" +
                '<div class="tag_boxes">' +
                // 태그를 반복문을 돌려야해????????????? 댓글을 추가 처리해야하는 건 알았는데 태그도 해야되는구나..
                '<a href="#" class="tag">' +
                "#일상" +
                "</a>" +
                '<a href="#" class="tag">' +
                "#꿀팁" +
                "</a>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>" +
                // 댓글부분 여기부터
                '<div class="comments1">댓글 <span class="count">' +
                "replyList[i].replyCount" +
                " 개</span> 모두 보기</div>" +
                '<div class="comments1_box">' +
                "<div>" +
                //일단 댓글은 그대로 나오게 하자
                '<span class="comments">KH_ACADEMY 아따 냥이 행님! 어디여요???????????? 좋은디요?</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                '<!-- <input type="hidden"  class="hidden"  val="1"> -->' + // 댓글 하고 다시오자
                "</div>" +
                "<div>" +
                '<span class="comments">supercat 형님 너무 멋져요!!</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                "</div>" +
                "<div>" +
                '<span class="comments">cyber 와 얼룩냥님 완전 화보</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                "</div>" +
                "<div>" +
                '<span class="comments">catplay 얼룩냥님 정말 짱이에요!</span>' +
                '<button class="buttonBox report_modal" type="button">신고</button>' +
                "</div>" +
                "</div>" +
                '<div class="new_comments">' +
                "</div>" +
                "</div>" +
                "</div>" +
                '<div class="inputContainer">' +
                '<div class="type_comment">' +
                '<input class="inputBox" type="text" name="replyContent" placeholder="댓글 달기...">' +
                "</div>" +
                "<span>" +
                '<button class="buttonBox gogo" onclick="insertReply();">게시</button>' +
                "</span>" +
                "</div>" +
                "</div>" +
                '<div align="center">' +
                '<img class="mouse_scroll" src="<%= contextPath %>/resources/feed_resources/img/scroll.gif" alt="마우스스크롤 그림">' +
                "</div>";
            }
            $(".empty_box").nextAll().remove();
            $("#aaa").append(result);
          },
          error: function () {
            console.log("피드 불러오기에 실패했습니다");
          },
        });
      }
    </script>

    <!--신고하기 모달창 -->
    <div class="black_bg"></div>
    <div class="modal_wrap">
      <div class="modal_close">
        <a>&times;</a>
      </div>
      <div id="modal_inside">
        <div id="report_modal_title">&nbsp;&nbsp;😡&nbsp;신고하기</div>
        <span id="s123"></span>
        <hr />
        <form action="reportFeed.ih" method="post">
          <div class="report_modal_content">
            <div class="reported_content">
              <% if(loginMem!=null){ %>
              <input
                type="hidden"
                class="hidden"
                name="memNo"
                value="<%= loginMem.getMemNo() %>"
              />
              <% } %>
              <div>
                <br />
                신고할 글 작성자 &nbsp;| &nbsp;<span id="FeedWriter"
                  ><!-- 작성자명 집어넣기--></span
                >
                <br />
                <input
                  type="hidden"
                  class="hidden"
                  name="FeedWriter1"
                  id="FeedWriter1"
                  value=""
                /><!--뽑아올 FeedWriter -->
              </div>
              <br />
              <div class="report_category">
                신고 유형 :
                <select name="report_category" id="">
                  <option value="피드">피드 신고</option>
                  <option value="댓글">댓글 신고</option>
                  <option value="리뷰">리뷰 신고</option>
                </select>
              </div>
              <br />
              <div>
                신고할 글 내용 | <br />
                <textarea
                  name="reported_content_text"
                  id="FeedText"
                  class="reported_textarea"
                  cols="30"
                  rows="10"
                  style="resize: none"
                ></textarea>
              </div>
            </div>
            <br />
            <fieldset>
              <legend id="legend_reason">- 사유 선택</legend>
              <div class="report_reason_input_box">
                <input
                  type="radio"
                  name="report_reason"
                  id="reason1"
                  value="스팸/홍보/도배글입니다."
                  checked
                /><label for="reason1">스팸/홍보/도배글입니다.</label><br />
                <input
                  type="radio"
                  name="report_reason"
                  id="reason2"
                  value="음란물입니다."
                /><label for="reason2">음란물입니다.</label> <br />
                <input
                  type="radio"
                  name="report_reason"
                  id="reason3"
                  value="개인정보 노출 게시물입니다."
                /><label for="reason3">개인정보 노출 게시물입니다.</label>
                <br />
                <input
                  type="radio"
                  name="report_reason"
                  id="reason4"
                  value="불법정보를 포함하고 있습니다."
                /><label for="reason4">불법정보를 포함하고 있습니다.</label>
                <br />
                <input
                  type="radio"
                  name="report_reason"
                  id="reason5"
                  value="욕설/생명경시/혐오/차별적 표현입니다."
                /><label for="reason5"
                  >욕설/생명경시/혐오/차별적 표현입니다.</label
                >
                <br />
                <input
                  type="radio"
                  name="report_reason"
                  id="reason6"
                  value="불쾌한 표현이 있습니다."
                /><label for="reason6">불쾌한 표현이 있습니다.</label>
                <br />
                <input
                  type="radio"
                  name="report_reason"
                  id="reason7"
                  value="기타"
                /><label for="reason7"
                  >기타 (사유를 입력해 주세요)
                  <textarea
                    name="etc_reason_text"
                    id="etc_reason_text"
                    placeholder="기타 사유를 입력해 주세요"
                    cols="30"
                    rows="10"
                  >
                  </textarea></label
                ><br />
                <!-- 어떤 라디오 input을 누르더라도 기타안에 있는 아이디값 #etc_reason_text인 input 태그의 값이 간다(기본적으로 빈 문자열).
                기타를 눌렀을 때 #etc_reason_text의 disable이 해제되도록  -->

                <input
                  type="hidden"
                  class="hidden"
                  name="feedno1"
                  id="feedno1"
                  value=""
                />
                <!-- 피드넘버,작성자, 피드내용 가져오기...  -->
                <script>
                  $(function () {
                    $(document).on("click", ".thisisFeedNo", function () {
                      var thisisFeedNo = $(this).val();
                      $("#feedno1").val(thisisFeedNo);
                      //console.log($('#feedno1').val()); //41 ok

                      var FeedWrirter = $(this)
                        .parent()
                        .parent()
                        .prev()
                        .find(".id_name")
                        .text();
                      $("#FeedWriter").text(FeedWrirter);
                      $("#FeedWriter1").val(FeedWrirter); // 콘솔 : 관리자 ok

                      // 피드 내용 textarea의 콘텐트영역에 박아넣기
                      var FeedText = $(this).next().val();
                      // console.log(FeedText); // 큰일났네 잘 나온다.
                      $("#FeedText").text(FeedText);
                      // console.log($('#FeedText').text());// 얘도 잘나옴
                    });
                  });
                </script>
              </div>
            </fieldset>
          </div>
          <div class="report_modal_btns">
            <br />
            <button type="submit" class="custom-btn btn-15" id="red_btn">
              신고 등록
            </button>
            <button type="reset" class="custom-btn btn-15">초기화</button>
            <button
              type="button"
              class="custom-btn btn-15 btn-16"
              onclick="offClick()"
            >
              닫기
            </button>
          </div>
        </form>
      </div>
    </div>

    <script>
      function onClick() {
        $(".modal_wrap").css("display", "block");
        $(".black_bg").css("display", "block");
      }
      function offClick() {
        $(".modal_wrap").css("display", "none");
        $(".black_bg").css("display", "none");
      }
      $(function () {
        $(document).on("click", ".report_modal", function () {
          onClick();
        });
        $(document).on("click", ".modal_close", function () {
          offClick();
        });
      });
    </script>
    <!-- 신고하기 모달창 끝 -->

    <!-- 피드 등록하기 모달창 시작 -->
    <div class="black_bg2"></div>
    <div class="feed_wrap" id="feed_wrap">
      <div class="modal_close2">
        <a href="#">&times;</a>
      </div>
      <div id="modal_inside2">
        <div id="feed_modal_title">
          <span>&nbsp;&nbsp;🎉&nbsp;피드 등록하기</span>
          <p id="empty_p"></p>
          <hr />
        </div>
        <form
          action="<%=contextPath%>/feedInsert.ih"
          method="post"
          enctype="multipart/form-data"
        >
          <!-- 피드 등록 내용물 -->
          <div class="feed_modal_insert_content">
            <div class="feed_modal_insert_content1">
              <div class="titleImg_class1">
                <p>🎈피드 사진을 선택해 주세요!</p>
                <br />
                <!-- 미리보기 영역 -->
                <div class="titleImg_class1_1">
                  <img
                    id="titleImg"
                    width="200"
                    height="200"
                    style="margin: auto"
                    src="<%=contextPath%>/resources/feed_resources/img/click_me_and_enroll_photo.gif"
                  />
                </div>
                <div id="file-area">
                  <input
                    type="file"
                    name="file1"
                    id="file1"
                    required
                    onchange="loadImg(this);"
                  />
                </div>
                <!-- onchange : input태그의 내용물이 변경되었을 때 발생하는 이벤트 속성 - 수업시간에 함!! -->
                <!-- loadImg() : 우리가 만들 함수 -->
              </div>
              <% if(loginMem!=null){ %>
              <input
                type="hidden"
                class="hidden"
                name="userNo"
                value="<%= loginMem.getMemNo() %>"
              />
              <% } %>
              <!-- 유저넘버 히든 -->

              <table
                id="feed_insert_table"
                cellpadding="20"
                cellspacing="20"
              >
                <tr>
                  <th width="100" height="40px">피드 제목 :</th>
                  <td width="500px">
                    <input
                      id="feed_insert_title"
                      type="text"
                      name="title"
                      height="100px"
                      width="550px"
                      required
                    />
                  </td>
                </tr>
                <tr>
                  <th id="feed_content">피드 내용 :</th>
                  <td height="40px">
                    <textarea
                      name="feedText"
                      rows="10"
                      style="resize: none; width: 580px"
                      required
                    ></textarea>
                  </td>
                  <br /><br />
                </tr>
                <tr>
                  <th id="feed_tag">태그 선택 :</th>
                  <br />
                  <br />
                  <td>
                    <input type="checkbox" name="tag" value="일상" />일상
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="뷰티" />뷰티
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="음식" />음식
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="환경" />환경
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="꿀팁" />꿀팁
                  </td>
                </tr>
              </table>
            </div>
            <br />

            <script>
              $(function () {
                $("#file-area").hide();
                $("#titleImg").click(function () {
                  $("#file1").click();
                });
              });
              function loadImg(inputFile) {
                // 매개변수 이름은 그냥 자기가 정하는것. 알아보기 쉽게
                // inputFile : 함수가 호출될 때 현재 변화가 생긴 <input type="file"> 요소객체
                // num : 몇번째 input요소인지 확인 후 해당 영역에 미리보기를 하기 위해서 받아주는 변수

                // console.log(inputFile.files.length);
                // inputFile.files.length : 파일이 첨부되어 있으면 1, 없으면 0 을 반환한다.
                // => 파일의 존재 유무를 알 수 있다. inputFile.files[0]에 선택된 파일이 담겨있음 <=== !!!!!☆★

                // files 속성 : 업로드된 파일의 정보들을 배열형식으로 여러개 묶어서 반환 length : 배열의 크기

                if (inputFile.files.length == 1) {
                  // 파일이 첨부되어 있다.

                  // 선택된 파일을 읽어들여서 영역에 맞는 미리보기

                  // 파일을 읽어들일 FileReader객체 생성
                  var reader = new FileReader(); // 자바스크립트에서 파일 읽을때 쓰라고 제공해주는 친구

                  // FileReader객체로부터 파일을 읽어들이는 메소드를 호출
                  // 인자값으로 전달해줘야 뭔파일을 읽을지 안다
                  reader.readAsDataURL(inputFile.files[0]); // 읽을 파일을 전달해주는 방법
                  // -> 해당 파일을 읽는 순간에 이 파일만의 고유한 URL이 겁나 길게 하나 생긴다.
                  // -> 고걸 이미지의 src 속성에 넣어줄 거다 (해당 url을 src속성으로 부여할 것 => attr)
                  // 파일 읽기가 완료되면 실행할 함수를 정의
                  reader.onload = function (e) {
                    // e의 target => e.target => 이벤트 당한놈
                    //console.log(e.target);
                    // e.target.result에 각 파일의 url이 담긴다.
                    // 각 영역에 맞춰서 이미지 미리보기
                    $("#titleImg").attr("src", e.target.result);
                  };
                } else {
                  // 파일 첨부를 취소했을 때
                  $("#titleImg").attr(
                    "src",
                    "<%=contextPath%>/resources/feed_resources/img/click_me_and_enroll_photo.gif"
                  );
                }
              }
            </script>
          </div>

          <div class="feed_modal_btns" align="center">
            <br />
            <button type="submit" class="custom-btn btn-15" id="red_btn2">
              피드등록
            </button>
            <button type="reset" class="custom-btn btn-15">초기화</button>
            <button
              type="button"
              class="custom-btn btn-15 btn-16"
              onclick="offClick2()"
            >
              닫기
            </button>
          </div>
        </form>
      </div>
    </div>

    <script>
      function onClick2() {
        $(".feed_wrap").css("display", "block");
        $(".black_bg2").css("display", "block");
      }
      function offClick2() {
        $(".feed_wrap").css("display", "none");
        $(".black_bg2").css("display", "none");
      }
      $(function () {
        $(document).on("click", "#insert_feed", function () {
          onClick2();
        });
        $(document).on("click", ".modal_close2", function () {
          offClick2();
        });
      });
    </script>
    <!-- 피드 등록하기 모달창 끝 -->

    <!-- 피드 수정하기 모달창 시작 -->
    <div class="black_bg3"></div>
    <div class="feed_wrap3" id="feed_wrap3">
      <div class="modal_close3">
        <a href="#">&times;</a>
      </div>
      <div id="modal_inside3">
        <div id="feed_modal_title3">
          <span id="updateTitleSpan"
            >&nbsp;&nbsp;🎉&nbsp;피드 수정하기</span
          >
          <p id="empty_p3"></p>
          <hr />
        </div>
        <form
          action="<%=contextPath%>/feedUpdate.ih"
          method="post"
          enctype="multipart/form-data"
        >
          <!-- 피드 수정 내용물 -->
          <div class="feed_modal_update_content">
            <div class="feed_modal_update_content3">
              <div class="titleImg_class3">
                <br />
                <p>🎈피드 사진을 선택해 주세요!</p>
                <br />
                <div class="titleImg_class3_1">
                  <img
                    id="titleImg3"
                    width="200"
                    height="200"
                    style="margin: auto"
                    alt="피드이미지"
                    src=""
                  />
                  <!--이미지값 가져다 여기 attr('src', '어쩌고 해서 박어넣자')-->
                </div>
                <div id="file-area3">
                  <input
                    type="file"
                    name="file3"
                    id="file3"
                    onchange="loadImg1(this);"
                  />
                  <input
                    type="hidden"
                    name="originFileName"
                    id="originFileName"
                    value=""
                  />
                  <input
                    type="hidden"
                    name="originFilePath"
                    id="originFilePath"
                    value=""
                  />
                </div>
              </div>
              <% if(loginMem!=null){ %>
              <input
                type="hidden"
                class="hidden"
                name="userNo"
                value="<%= loginMem.getMemNo() %>"
              />
              <!-- 유저넘버 히든 -->
              <% } %>
              <input
                type="hidden"
                name="feedNo3"
                id="feedNo3"
                value=""
              /><!--피드넘버히든-->

              <table
                id="feed_insert_table3"
                cellpadding="20"
                cellspacing="20"
              >
                <tr>
                  <th width="100" height="40px">피드 제목 :</th>
                  <td width="500px">
                    <input
                      id="feed_update_title"
                      type="text"
                      id="updateTitle"
                      name="title"
                      height="100px"
                      width="550px"
                      required
                    />
                    <!-- 피드제목 .val()로 박아넣기 -->
                  </td>
                </tr>
                <tr>
                  <th id="feed_content3">피드 내용 :</th>
                  <td height="40px">
                    <textarea
                      name="feedText"
                      rows="10"
                      style="resize: none; width: 580px"
                      id="updateTextArea"
                      required
                    >
                  <!--피드내용 .text()로 박아넣기-->
                </textarea
                    >
                  </td>
                  <br /><br />
                </tr>
                <tr>
                  <th id="feed_tag3">태그 선택 :</th>
                  <br />
                  <br />
                  <td>
                    <input
                      type="checkbox"
                      name="tag"
                      value="일상"
                      checked
                    />일상 &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="뷰티" />뷰티
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="음식" />음식
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="환경" />환경
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="꿀팁" />꿀팁
                  </td>
                </tr>
              </table>
              <br />
            </div>

            <script>
              $(function () {
                $("#file-area3").hide();
                $("#titleImg3").click(function () {
                  $("#file3").click();
                });
              });
            </script>
          </div>
          <div class="feed_modal_btns" align="center">
            <br />
            <button type="submit" class="custom-btn btn-15" id="red_btn2">
              피드수정
            </button>
            <button type="reset" class="custom-btn btn-15">초기화</button>
            <button
              type="button"
              class="custom-btn btn-15 btn-16"
              onclick="offClick3()"
            >
              닫기
            </button>
          </div>
        </form>
      </div>
    </div>

    <script>
      function onClick3() {
        $("#feed_wrap3").css("display", "block");
        $(".black_bg3").css("display", "block");
      }
      function offClick3() {
        $("#feed_wrap3").css("display", "none");
        $(".black_bg3").css("display", "none");
      }
      $(function () {
        $(document).on("click", ".updateFno", function () {
          onClick3(); //onClick3()실행
          // 값 뽑아오기---------------------------------------------------------
          $feedListArr = $(this).val();
          // console.log($feedListArr);
          var flArr = $feedListArr.split(","); // 배열로 바꾸기
          // console.log(flArr);
          var feedNo = Number(flArr[0]);
          var feedTitle = flArr[1];
          var feedText = flArr[2];
          var filePath = flArr[5];
          var feedPhotoOriginName = flArr[3];
          var feedPhotochangedName = flArr[4];
          // 값 뽑아오기 끝

          // 값 박아넣기 시작
          $("#feedNo3").val(feedNo);
          $("#titleImg3").attr("src", filePath + feedPhotochangedName);
          $("#feed_update_title").val(feedTitle);
          $("#updateTextArea").text(feedText);
          $("#originFileName").val(feedPhotochangedName);
          $("#originFilePath").val(filePath);
          //feedPhotoOriginName 등 박아넣기
        });
        $(document).on("click", ".modal_close3", function () {
          offClick3();
        });
      });

      function loadImg1(inputFile) {
        if (inputFile.files.length == 1) {
          // 파일이 첨부되어 있다.

          var reader = new FileReader(); // 자바스크립트에서 파일 읽을때 쓰라고 제공해주는 친구
          reader.readAsDataURL(inputFile.files[0]);
          reader.onload = function (e) {
            $("#titleImg3").attr("src", e.target.result);
          };
        } else {
          // 파일 첨부를 취소했을 때
          $("#titleImg3").attr(
            "src",
            "<%=contextPath%>/resources/feed_resources/img/click_me_and_enroll_photo.gif"
          );
        }
      }
    
      // <!-- 피드 수정하기 모달창 끝 -->
      
      // 삭제하기 - 삭제하기 버튼에 피드 넘버 
      $(function(){
        $(document).on('click', '.deleteFno', function(){
          var feedNo = $(this).val();
          $('#hiddenFeedNo').val(feedNo);
          $('#deleteAvartar').click();
        });
      });
    
    </script>
    <!-- 버튼에서 onclick해서 href에 쿼리스트링,스크립틀릿 써서 바로 가도 됐지만 한번 해 보았습니다...  -->
    <form id="hiddenForm" action="deleteFeed.ih" style="display: none;">
      <input type="text" name="feedNo" id="hiddenFeedNo" value="">
      <button id="deleteAvartar"></button>
    </form>

    <%@ include file="../common/footer.jsp" %>
  </body>
</html>
