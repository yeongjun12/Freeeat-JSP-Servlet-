<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<%@ page import="java.util.ArrayList, com.freeeat.review.model.vo.Review, com.freeeat.common.model.vo.Photo" %>
<%
	ArrayList<Photo> list = (ArrayList<Photo>)request.getAttribute("list");
	Review review = (Review)request.getAttribute("review");
%>
<!DOCTYPE html>

<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>리뷰_상세</title>
  <style>
    * {
      box-sizing: border-box;
    }

    .wrap {
      margin-left: 250px;
      padding: 50px;
    }

    .inner-wrap {
      width: 90%;
      border: 1px solid silver;
      border-radius: 10px;
      padding: 20px;
      margin: auto;
    }

    #mainContent {
      width: 90%;
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
      padding-top: 10px;
    }

    #header-center {
      width: 20%;
      font-size: 45px;
      margin-left: 15px;
    }

    #header-right {
      width: 450px;
      margin-top: 25px;
      margin-left: 670px;
    }

    .review-btn {
      width: 90px;
      height: 35px;
      border: 2px solid #ddd;
      margin-left: 90px;
    }

    /* 세번째 div */
    #review-table {
      border-collapse: collapse;
      width: 100%;
      border: 1px solid #ddd;
      font-size: 18px;
      margin-top: 50px;
    }

    #review-table th {
      width: 200px;
      text-align: center;
      padding: 8px;
    }

    #review-table td {
      text-align: left;
      padding: 17px 5px 17px 25px;
    }

    #review-table tr {
      border-bottom: 1px solid #ddd;
    }

    .review-img {
      width: 250px;
      height: 250px;
      margin: 10px 10px 10px 50px;
      border: 2px solid rgb(205, 205, 205);
    }

    #back {
      margin-top: 10px;
      margin-left: 500px;
      width: 70px;
      height: 40px
    }

    .feed-btn:hover,
    #back:hover {
      background-color: rgb(205, 205, 205);
    }
  </style>
</head>

<body>

  <%@ include file="../common/adminMenubar.jsp" %>

    <div class="wrap">

      <div class="inner-wrap">

        <div id="mainContent">
          <div id="header">
            <div>
              <span class="material-symbols-outlined" style="font-size: 55px;">
                rate_review
              </span>
            </div>
            <div id="header-center">리뷰</div>
            <div id="header-right">
              <button class="review-btn" location.href="#">삭제</button>
            </div>
          </div>

          <hr style="border: 1px solid #ddd">

          <table id="review-table">
            <colgroup>
              <col style="width: 15%;" />
              <col style="width: 35%;" />
              <col style="width: 15%;" />
              <col style="width: 35%;" />
            </colgroup>
            <tr>
              <th>No.</th>
              <td><%= review.getReviewNo() %></td>
              <th>타입</th>
              <td><%= review.getReviewMenuType() %></td>
            </tr>

            <tr>
              <th>작성일</th>
              <td><%= review.getReviewCreateDate() %></td>
              <th>작성자</th>
              <td><%= review.getNickName() %></td>
            </tr>

            <tr>
              <th>식당명</th>
              <td><%= review.getPlaceName() %></td>
              <th>별점</th>
              <td><%= review.getReviewCount() %></td>
            </tr>

            <tr>
              <th>내용</th>
              <td colspan="3" >
               	 <%= review.getReviewContent() %>
              </td>
            </tr>
            <tr>
              <th>사진</th>
              <td>
              	<% if (!list.isEmpty()) { %>
					<% for (Photo rp: list) { %>
						<img class="review-img" src="<%= contextPath %>/<%= rp.getFilePath() %>/<%= rp.getChangeName() %>" style="display:inline;">
					<% } %>
				<% } else { %>
					등록한 사진이 없습니다.
				<% } %>
              </td>

            </tr>

          </table>
        </div>

        <button id="back" class="report-btn" onclick="history.back();">목록</button>

      </div>
    </div>



</body>

</html>