<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.place.model.vo.Request" %>
<%
	ArrayList<Request> list = (ArrayList<Request>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>수정요청_목록</title>
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
         width: 80%;
         margin-top: 7px;
         margin-left: 100px;
      }

      /* 두번째 div */
      #content {
         width: 100%;
         height: 40px;
         margin-top: 25px;
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
      #request-table {
         border-collapse: collapse;
         width: 100%;
         font-size: 18px;
      }

      #request-table th,
      #request-table td {
         text-align: left;
         padding: 12px;
         text-align: center;
      }

      #request-table tr {
         border-bottom: 1px solid #ddd;
      }

      #request-table tr.tHeader,
      #request-table tr:hover {
         background-color: #f1f1f1;
      }

   </style>
</head>

<body>

   <%@ include file="../common/adminMenubar.jsp" %>
      <div class="wrap">
         <div class="inner-wrap">
            <div id="mainContent">
               <div id="header">
                  <div><img src="<%= contextPath %>/resources/image/update.png" id="header-left"></div>
                  <div id="header-center">수정요청</div>
               </div>

               <hr style="border: 1px solid #ddd">

               <div id="content">
               	  <div id = "total"></div>
               </div>
               
			   <script>
					var count = "<p id=count><b>총 "+ <%=list.size()%>+ "건</b></p>";
					 $('#total').append(count);			               
			   </script>
			   
               <table id="request-table">
               		<thead>
	                     <tr class="tHeader">
	                        <th style="width:7%;">No.</th>
	                        <th style="width:20%;">식당명</th>
	                        <th style="width:33%;">수정사항</th>
	                        <th style="width:20%;">요청자</th>
	                        <th style="width:20%;">요청일</th>
	                     </tr>
					</thead>
					<tbody>
					<%System.out.println(list); %>
					
						<% if(list.isEmpty()) { %>		
								<tr>
									<td colspan="5">조회된 결과가 없습니다.</td>
								</tr>	
						<% } else { %>
								<% for(int i = 0; i < list.size(); i++){ %>
				                     <tr>
				                        <td><%=list.get(i).getRequesetNo() %></td>
				                        <td><input type="hidden" value="<%=list.get(i).getPlaceNo() %>"><%=list.get(i).getPlaceName() %></td>
				                        <td><%=list.get(i).getRequestContent() %></td>
				                        <td><%=list.get(i).getMemId() %></td>
				                        <td><%=list.get(i).getRequestDate() %></td>
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
					
                    var reqno = $(this).children().eq(0).text(); 
                    var pno = $(this).children().eq(1).children().val(); 
                    console.log(pno);
                    location.href="<%=contextPath%>/requestSelect.yk?reqno="+reqno+"&&pno="+pno; 
                    //신고번호, 식당번호 가져가야함 
                });
         	});
 
         	
         </script>

        

</body>

</html>