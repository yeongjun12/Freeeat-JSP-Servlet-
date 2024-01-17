<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<%@ page import="com.freeeat.feed.model.vo.Feed, com.freeeat.reply.model.vo.Reply, java.util.ArrayList" %>
<%
	Feed feed = (Feed)request.getAttribute("feed");
	ArrayList<Reply> replyList = (ArrayList<Reply>)request.getAttribute("replyList");
%>
<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>피드_상세</title>
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

    .feed-btn {
      width: 90px;
      height: 35px;
      border: 2px solid #ddd;
      margin-left: 90px;
    }

    /* 세번째 div */

    #feed-img {
      width: 250px;
      height: 250px;
      border: 2px solid rgb(205, 205, 205);
    }

    #back {
      margin-top: 10px;
      margin-left: 500px;
      width: 70px;
      height: 40px
    }


    .adminFeedPage {

      width: 30px;
      height: 30px;
      background-color: lightgray;
      border-radius: 70%;
      display: inline-block;
      text-align: center;

    }

    .adminFeedPage > a {
      text-decoration: none;
      color: gray;
    }

    #FeedPageArea {
      width: 100%;
    }

    
    #FeedPageArea div {
      margin: auto;
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
                reviews
              </span>
            </div>
            <div id="header-center">피드</div>
          </div>

          <hr style="border: 1px solid #ddd">

          <table id="" class="table table-bordered">
            <colgroup>
              <col style="width: 15%;" />
              <col style="width: 35%;" />
              <col style="width: 15%;" />
              <col style="width: 35%;" />
            </colgroup>

            <tr>
              <th>피드번호</th>
              <td><%= feed.getFeedNo() %></td>
            </tr>

            <tr>
              <th>작성자</th>
              <td><%= feed.getFeedWriter() %></td>
              <th>작성일</th>
              <td><%= feed.getFeedDate() %></td>
            </tr>

            <tr>
              <th>태그</th>
              <td><%= feed.getFeedTag() %></td>
            </tr>

            <tr>
              <th>내용</th>
              <td colspan="3" style='word-break:break-all'>
			      	<%= feed.getFeedText() %>
              </td>
            </tr>
            <tr>
              <th>사진</th>
              <td colspan="3">
              	<% if (feed.getFilePath() != null) { %>
                	<img src="<%= contextPath %>/<%= feed.getFilePath() %>/<%= feed.getChangeName() %>" id="feed-img">
              	<% } else { %>
              		사진 없음
              	<% } %>
              </td>
            </tr>
          </table>
          <table class="table table-striped">
          	<% if (!replyList.isEmpty()) { %>
	          	<% for (Reply rp : replyList) { %>
	          	<tr>
	          		<td><%= rp.getReplyNo() %></td>
	          		<td><%= rp.getMemNickName() %></td>
	          		<td><%= rp.getReplyContent() %></td>
	          		<td><%= rp.getReplyDeleted() %></td>
	          	</tr>     
	          	<% } %>
          	<% } else { %>
          		<tr>
          			<td colspan="4">등록된 댓글이 없습니다.</td>
          		</tr>
          	<% } %>
          	 
          </table>
          
          <div id="FeedPageArea" align="center">

            <div class="adminFeedPage">
              <a id="plus">&lt;</a>
            </div>
            <div class="adminFeedPage">
              <a id="minus">&gt;</a>
            </div>

          </div>

          <!-- <button id="back" class="feed-btn" onclick="history.back();">목록</button> -->
        </div>

      </div>
    </div>
    
    
    <script>
    	$(function() {
    		
    	
        var feedCount = $('#message input[type=hidden]').eq(0).val();
        var curFeed = <%= feed.getFeedNo() %>;
        var link = '<%= contextPath %>/feedDetail.sk?fno=';
        

        $('#minus').attr('href', link + (curFeed - 1));
        $('#plus').attr('href', link + (curFeed + 1));
        

        if(curFeed == feedCount) {
          $('.adminFeedPage').eq(0).css('display', 'none');
        }

        if(curFeed == 1) {
          $('.adminFeedPage').eq(1).css('display', 'none');
        }

    		
    	});
		
    
    
    
    </script>
    


</body>

</html>