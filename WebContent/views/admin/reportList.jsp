<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.report.model.vo.Report" %>
<%
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
	String status = (String)request.getAttribute("sort");
%>
<!DOCTYPE html>
<html>

<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>신고_목록</title>
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
         width: 600px;
         margin-top: 7px;
         margin-left: 100px;
      }

      /* 두번째 div */
      #content {
         width: 100%;
         height: 40px;
        
         display: flex;
      }

	 #count{
		  margin-top : 13px;
		  margin-left : 15px;
		  width:100px;
	 }
	
      #sort {
         width: 100px;
         height: 30px;
         margin-left: 1010px;
      }

      /* 세번째 div */
      #report-table {
         border-collapse: collapse;
         width: 1225px;
         font-size: 18px;
      }

      #report-table th,
      #report-table td {
         text-align: left;
         padding: 12px;
         text-align: center;
      }

      #report-table tr {
         border-bottom: 1px solid #ddd;
      }

      #report-table tr.tHeader,
      #report-table tr:hover {
         background-color: #f1f1f1;
      }

      .YN {
         margin-top: 5px;
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
               </div>

               <hr style="border: 1px solid #ddd">
               <br>
               
               <div id="content">
	               	<div id = "total"></div>
	  
				    <div>
			           	<select name="sort" id="sort">
				            <option value="all">전체</option>
				            <option value="wait">대기</option>
				            <option value="finish">완료</option>
			            </select>
		            </div>
               </div>
               
               <script>
					var count = "<p id=count><b>총 "+ <%=list.size()%>+ "건</b></p>";
					 $('#total').append(count);			               
			   </script>
	               
	           <!-- select 태그 관련 -->
	           <script>
		               $('#sort').on("change", function(){ 
		                   
		                   var str = $(this).val();
		                   location.href = "<%=contextPath%>/reportList.yk?sort="+str;
		               });
		               
		               var status = "<%= status %>";
		     
		               $('option').each(function(){
		   				
		   				if(status.search($(this).val()) != -1){
		   					$(this).prop('selected', true);
		   				}		
		   			});
	           </script>
			
	           <table id="report-table">
	           		<thead>
	                	<tr class="tHeader">
	                           <th style="width:7%;">No.</th>
	                           <th style="width:15%;">분류</th>
	                           <th style="width:30%;">유형</th>
	                           <th style="width:20%;">신고자</th>
	                           <th style="width:20%;">신고일</th>
	                           <th style="width:20%;">관리</th>
	                     </tr>
					</thead>
						
					<tbody>
						<% if(list.isEmpty()) {%>		
								<tr>
									<td colspan="6">조회된 결과가 없습니다.</td>
								</tr>	
						<% } else { %>
								
								<% for(int i = 0; i < list.size(); i++) { %>	
				                        <tr>
				                           <td><%=list.get(i).getReportNo()%></td>
				                           <td><%=list.get(i).getReportCode() %></td>
				                           <td><%=list.get(i).getReportReason() %></td>
				                           <td><%=list.get(i).getReportMemId() %></td>
				                           <td><%=list.get(i).getReportDate() %></td>
				                         
				                           <% if(list.get(i).getReportResult().equals("U")){%>
					                           <td>
					                              <img src="<%= contextPath %>/resources/image/check.png" class="YN">
					                           </td>
					                       <% } else if(list.get(i).getReportResult().equals("D")) { %>
					                       	   <td>
					                              <img src="<%= contextPath %>/resources/image/refuse.png" class="YN">
					                           </td>
					                       <% } else { %>
					                       		<td>
					                              <img src="<%= contextPath %>/resources/image/waiting.png" class="YN">
					                           </td>
					                       <% }  %>
				                        </tr>
				                 <% } %>
	                     <% } %>
					   </tbody>
                </table>
             
                <br>
                
            </div>
         </div>


         <script>
         
         	$(function(){
         		$('tbody>tr').click(function(){

                    var rno = $(this).children().eq(0).text(); 
                    var code = $(this).children().eq(1).text(); 
                    location.href="<%=contextPath%>/reportSelect.yk?rno="+rno+"&&code="+code; 
                    //신고번호, 유형 가져가야함 
                });
         	});
 
         	
         </script>

</body>

</html>