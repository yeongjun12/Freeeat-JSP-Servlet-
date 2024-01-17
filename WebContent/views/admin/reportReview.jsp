<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.report.model.vo.Report, 
com.freeeat.review.model.vo.Review, com.freeeat.common.model.vo.Photo, com.freeeat.place.model.vo.Tag" 
%>
<%
	Report report = (Report)request.getAttribute("report");
	Review review =(Review)request.getAttribute("review");
	ArrayList<Photo> list = (ArrayList<Photo>)request.getAttribute("list");
	ArrayList<Tag> tlist = (ArrayList<Tag>)request.getAttribute("tlist");
%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>신고_리뷰</title>
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
        	background-color: rgb(240, 240, 240);
        }
        #review-table,
        #reportContent{
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd;
            font-size: 18px;
            margin-top: 50px;
        }

		#photo-table{
			border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd;
            border-top: none;
		}
		
        #review-table th,
        #reportContent th,
        #photo-table th {
            width: 200px;
            text-align: center;
            padding: 8px;
        }

        #review-table td,
        #reportContent td,
        #photo-table td {
            text-align: left;
            padding: 15px 5px 15px 25px;
        }

        #review-table tr,
        #reportContent tr,
        #photo-table tr {
            border-bottom: 1px solid #ddd;
        }

        #back {
            margin-top:20px;
            margin-left: 620px;
            width: 70px;
            height: 40px;
            border: 2px solid #ddd;
            cursor: pointer;
        }

        .review-img {
            width: 240px;
            height: 240px;
            margin: 10px 10px 10px 50px;
            border: 2px solid rgb(205, 205, 205);
        }
        
        #photo{
        	display:flex;
        }
        .star{
        	 width: 20px;
            height: 20px; 
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
                            <button class="report-btn" id ="cancel">신고 취소</button>
                            <button class="report-btn" id="delete">글 삭제</button>
                        	<% } %>
                        </div>
                    </div>
                    
                    <script>
                        	$('#cancel').click(function(){                      	
                        		location.href="<%=contextPath%>/reportCancel.yk?rno="+<%=report.getReportNo() %>;		
                        	});
                        	
                        	$('#delete').click(function(){
                            	
                        		location.href="<%=contextPath%>/reportDelete.yk?rno="+<%=report.getReportNo() %>
                        		             +"&&bno="+<%=report.getBoardNo() %>
                        		             +"&&code=<%=report.getReportCode() %>"
	
                        	});
                    </script>
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
                                  
                    <!-- 리뷰일 경우 보여줄 화면-->
					
                    <table id="review-table">
                        <colgroup>
                                <col style="width: 60px;" />
                                <col style="width: 250px;"/>
                                <col style="width: 80px;" />
                                <col style="width: 210px;" />
                        </colgroup>
						
                        <tr>
                            <th>리뷰 No.</th>
                            <td><%=review.getReviewNo() %></td>
                            <th>메뉴 타입</th>
                            <td><%=review.getReviewMenuType() %></td>
                        </tr>

                        <tr>
                            <th>작성일</th>
                            <td><%=review.getReviewCreateDate() %></td>
                            <th>작성자</th>
                            <td><%=review.getNickName() %></td>
                            <!-- 해당 컬럼에 id 담아오기 -->
                        </tr>
						
                        <tr>
                            <th>식당명</th>
                            <td><%=review.getPlaceName() %></td>
                            <th>별점</th>
                            <td>
	                            <% for(int i = 1; i <= 5; i++) { %>
	                            	<% if(i <= review.getReviewCount()) { %>
	                            	<img class="star" src ="<%= contextPath %>/resources/image/star1.png">
	                            	<% } else { %>
	                            		<img class="star" src ="<%= contextPath %>/resources/image/star2.png">
	                            	<% } %>
	                            <% }  %>
                            </td>
                        </tr>
                        
                        <tr>
                        	<th>내용</th>
                        	<td colspan="3"> <%=review.getReviewContent() %> </td>
                        </tr>
                    </table>
                    
                    <table id="photo-table">
                    	<tr>
                            <% if(list.isEmpty()) { %>
                            	<td>
	                                <img src="<%= contextPath %>/resources/image/noImage.jpg" alt="" class="review-img">
	                                <img src="<%= contextPath %>/resources/image/noImage.jpg" alt="" class="review-img">
	                                <img src="<%= contextPath %>/resources/image/noImage.jpg" alt="" class="review-img">
	                                <img src="<%= contextPath %>/resources/image/noImage.jpg" alt="" class="review-img">
                            	</td>
                            <% }else { %>
                            	<td id="photo">
	                            <% for(int i = 0; i < 4; i++) { %>
	                            	<% if(i < list.size()) {%>
	                            	
		                                <img src="<%=contextPath%>/<%= list.get(i).getFilePath()+"/"+ list.get(i).getChangeName()%>" alt="" class="review-img">
		                            
	                            	<% } else { %>
			                                <img src="<%= contextPath %>/resources/image/noImage.jpg" alt="" class="review-img">
	                            	<% } %>
	                            
	                            <% } %>
	                            
	                            </td>
                            <% } %>         
                        </tr>
                    </table>
                </div>

                <button id="back" class="report-btn" onclick="location.href='<%=contextPath %>/reportList.yk'">목록</button>
            </div>
        </div>
	</body>
</html>