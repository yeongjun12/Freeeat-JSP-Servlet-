<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.freeeat.report.model.vo.Report, com.freeeat.reply.model.vo.Reply" %>
<%
	Report report = (Report)request.getAttribute("report");
	Reply reply = (Reply)request.getAttribute("reply");
%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>신고_댓글</title>
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
        #reply-table,
        #reportContent {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd;
            font-size: 18px;
            margin-top: 50px;
        }

        #reply-table th,
        #reportContent th {
            width: 200px;
            text-align: center;
            padding: 8px;
        }

        #reply-table td,
        #reportContent td {
            text-align: left;
            padding: 15px 5px 15px 25px;
        }

        #reply-table tr,
        #reportContent tr {
            border-bottom: 1px solid #ddd;
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
                    
                    
					<!-- 댓글일 경우 보여줄 화면-->
                    <table id="reply-table">
                        <colgroup>
                                <col style="width: 60px;" />
                                <col style="width: 250px;"/>
                                <col style="width: 80px;" />
                                <col style="width: 210px;" />
                            </colgroup>

                        <tr>
                            <th>피드 No.</th>
                            <td><%=reply.getFeedNo() %></td>
                        </tr>
                        <tr>
                            <th>댓글 No.</th>
                            <td><%=reply.getFeedNo() %></td>
                            <th>작성자</th>
                            <td><%=reply.getMemNickName() %></td>
                        </tr>

                        <tr>
                            <th>댓글 내용</th>
                            <td colspan="3" style='word-break:break-all'><%=reply.getReplyContent() %></td>
                        </tr>
                    </table>
                </div>
                <button id="back" class="report-btn" onclick="location.href='<%=contextPath %>/reportList.yk'">목록</button>

            </div>
        </div>
	</body>
</html>