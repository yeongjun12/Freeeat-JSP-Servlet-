<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.freeeat.report.model.vo.Report, com.freeeat.feed.model.vo.Feed" %>
<%
	Report report = (Report)request.getAttribute("report");
	Feed feed = (Feed)request.getAttribute("feed");
%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>신고_피드</title>
    <style>
        * {
            box-sizing: border-box;
        }

        .wrap {
            margin-left: 250px;
            padding: 50px;
        }

        .inner-wrap {
            width: 1430px;
            border: 1px solid silver;
            border-radius: 10px;
            padding: 20px;
            margin: auto;
        }

        #mainContent {
            width: 1287px;
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

            width: 60px;
            height: 60px;
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
            margin-left: 800px;
        }

        .report-btn {
            width: 90px;
            height: 35px;
            border: 2px solid #ddd;
            cursor: pointer;
        }

        .report-btn:hover,
        #back:hover {
            background-color: rgb(205, 205, 205);
        }

        /* 세번째 div */
        #reportContent{
        	background-color: rgb(238 238 238);
        }
        
        #feed-table,
        #reportContent {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd;
            font-size: 18px;
            margin-top: 50px;
        }

        #feed-table th,
        #reportContent th {
            width: 200px;
            text-align: center;
            padding: 8px;
        }

        #feed-table td,
        #reportContent td {
            text-align: left;
            padding: 15px 5px 15px 25px;
        }

        #feed-table tr,
        #reportContent tr {
            border-bottom: 1px solid #ddd;
        }

		#feed-img {
            width: 250px;
            height: 250px;
            margin: 10px 10px 10px 10px;
            border: 2px solid rgb(205, 205, 205);
        }
        #back {
            margin-top: 20px;
            margin-left: 620px;
            width: 70px;
            height: 40px;
            border: 2px solid #ddd;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <%@ include file="../common/adminMenubar.jsp" %>
        <div class="wrap">
            <div class="inner-wrap">
                <div id="mainContent">
                    <div id="header">
                        <div><img src="<%= contextPath %>/resources/image/report.png" id="header-left"></div>
                        <div id="header-center">신고</div>

                        <div id="header-right">
                        	<% if(report.getReportResult().equals("")) { %>
	                            <button class="report-btn" id="cancel">신고 취소</button>
	                            <button class="report-btn" id="delete">글 삭제</button>
                            <% } %>
                        </div>
                        <script>
                        	$('#cancel').click(function(){
                        	
                        		location.href="<%=contextPath%>/reportCancel.yk?rno="+<%=report.getReportNo() %>;
                        		
                        	});
                        	
                        	$('#delete').click(function(){
                            	
                        		location.href="<%=contextPath%>/reportDelete.yk?rno="+<%=report.getReportNo() %>+"&&bno="+<%=report.getBoardNo() %>+"&&code=<%=report.getReportCode() %>"
	
                        	});
                        </script>
                    </div>
                    <hr style="border: 1px solid #ddd">

                    <div>
                        <table id="reportContent">
                            <colgroup>
                                <col style="width: 60px;" />
                                <col style="width: 250px;"/>
                                <col style="width: 80px;" />
                                <col style="width: 210px;" />
                            </colgroup>

                            <tr>
                                <th>신고 No.</th>
                                <td><%=report.getReportNo() %></td>
                                <th>신고자</th>
                                <td><%=report.getReportMemId() %></td>
                            </tr>

                            <tr>
                                <th>신고유형</th>
                                <td><%=report.getReportReason() %></td>
                                <th>신고일</th>
                                <td><%=report.getReportDate() %></td>
                            </tr>
                            
                            <tr>
                                <th>신고사유</th>
                                <td colspan="3" style='word-break:break-all'>
                                    <%=report.getReportPlus()%>
                                </td>
                            </tr>
                        </table>

                    </div>
                    
                    <!-- 피드일 경우 보여줄 화면-->
                    <table id="feed-table">
                        <colgroup>
                                <col style="width: 60px;" />
                                <col style="width: 250px;"/>
                                <col style="width: 80px;" />
                                <col style="width: 210px;" />
                            </colgroup>

                        <tr>
                            <th>피드 No.</th>
                            <td><%=feed.getFeedNo() %></td>
                            <th>작성자</th>
                            <td><%=feed.getFeedWriter() %></td>
                        </tr>

                        <tr>
                            <th>태그</th>
                            <td>
                            	<% 
                      				String tag = feed.getFeedTag();
                     				 String[] tArr = tag.split(",");
                  				%>
                  				
                  				<% for(int i = 0; i < tArr.length; i++){ %>
                             			<%= tArr[i] %>
                       			<% } %>
                            </td>
                            <th>작성일</th>
                            <td><%=feed.getFeedDate() %></td>
                        </tr>

						<tr>
                            <th>제목</th>
                            <td><%=feed.getFeedTitle() %></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3" style='word-break:break-all'><%=feed.getFeedText() %></td>
                        </tr>
                        <tr>
                            <th>사진</th>
                            <td colspan="2">
                            <%if(!feed.getOriginName().equals("")) { %>
                            	<img src="<%=contextPath %>/<%=feed.getFilePath() %>/<%=feed.getChangeName() %>" alt="" id="feed-img">
                            <% } else { %>
                            	<img src="<%= contextPath %>/resources/image/noImage.jpg" alt="" class="review-img">
                            <% } %>
                            </td>
                        </tr>
                    </table>
				</div>
                <button id="back" class="report-btn" onclick="location.href='<%=contextPath %>/reportList.yk'">목록</button>
            </div>
        </div>
	</body>
</html>