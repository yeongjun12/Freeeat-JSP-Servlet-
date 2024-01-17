<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<%@ page import="java.util.ArrayList, com.freeeat.common.model.vo.PageInfo, com.freeeat.review.model.vo.Review" %>
<%
   ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");

   PageInfo pi = (PageInfo)request.getAttribute("pi");

   String del = (String)request.getAttribute("del");
   String keyword = (String)request.getAttribute("keyword");
	
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   int maxPage = pi.getMaxPage();	

%>
    
<!DOCTYPE html>
<html>

<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>리뷰_목록</title>
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




      #header-center {
         font-size: 50px;
      }

      #content-bar {
         width: 100%;
         padding: 15px;
      }

      #content-bar .small-div {
         width: 8%;
         display: inline-block;
      }

      #content-bar .big-div {
         width: 30%;
         display: inline-block;
      }

      /* 페이징바 */

      .pagination{
         padding: 30px 0;

      }

      .pagination ul{
         margin: 0;
         padding: 0;
         list-style-type: none;
         margin: auto;
      }

      .pagination a{
         display: inline-block;
         padding: 10px 18px;
         color: #222;
         text-decoration: none;
      }

      .p1 a{
         width: 40px;
         height: 40px;
         line-height: 40px;
         padding: 0;
         text-align: center;
         text-decoration: none;

      }

      .p1 a.is-active{
         background-color: #88A201;
         border-radius: 100%;
         color: #fff;
         text-decoration: none;

      }


      
   </style>
</head>

<body>

   <%@ include file="../common/adminMenubar.jsp" %>
      <div class="wrap">
         <div class="inner-wrap">

            <div id="mainContent">

               <div id="header">
                  <div id="header-center">
                     <span class="material-symbols-outlined" style="font-size: 55px;">
                        rate_review
                     </span>
                     리뷰
                  </div>

               </div>


               <br>
               <hr style="border: 1px solid #ddd">


               <div id="content-bar">
                  <div class="small-div">

                     <select name="deleteSelect" id="sort">
                        <option value="A">전체</option>
                        <option value="N">삭제X</option>
                        <option value="Y">삭제O</option>
                     </select>
                     
                  </div>
                  <div class="small-div">
                     총 <%= listCount %>건
                  </div>

                  <div class="big-div">
                  
                     <form action="<%= contextPath %>/searchReview.sk" method="get">
                        <div class="input-group mb-3">
                          <% if (keyword != null) { %>
                          	<input type="text" class="form-control" name="keyword" placeholder="키워드 입력" value="<%= keyword %>">
                          <% } else { %>                          
                          	<input type="text" class="form-control" name="keyword" placeholder="키워드 입력">
                          <% } %>
                          <input type="hidden" name="cpage" value="1">
                          <div class="input-group-append">
                            <button class="input-group-text">검색</button>
                          </div>
                        </div>
                     </form>

                  </div>
                  

                  <script>
                  	$(function(){
                  		
                  		$('select[name=deleteSelect] option').each(function() {
                  			if($(this).val() == '<%= del %>') {
                  				$(this).prop('selected', true);
                  			} 
                  			
                  		});
                  		
                  		
                  		$('select[name=deleteSelect]').change(function() {

                           if($(this).children().eq(0).is(':selected')) {
                              location.href='<%= contextPath %>/reviewList.sk?del=A&cpage=1';
                           } else if($(this).children().eq(1).is(':selected')) {
                              location.href='<%= contextPath %>/reviewList.sk?del=N&cpage=1';
                           } else if($(this).children().eq(2).is(':selected')) {
                              location.href='<%= contextPath %>/reviewList.sk?del=Y&cpage=1';			
                           }
          

                           
                  		});
                  		
                  	});
                  
                  </script>

                  
               
               </div>


               <div>
                  
                  <table id="review-table" class="table table-border">
                     <thead>
                        <tr class="tHeader">
                           <th style="width:10%;">No.</th>
                           <th style="width:28%;">식당명</th>
                           <th style="width:10%;">평점</th>
                           <th style="width:20%;">작성자</th>
                           <th style="width:17%;">작성일</th>
                           <th style="width:10%;">관리</th>
                        </tr>
                     </thead>
                     <tbody>
                        <% if (!list.isEmpty()) { %>
                           <% for (Review review : list) { %>
                              <tr>
                                 <td><%= review.getReviewNo() %></td>
                                 <td><%= review.getPlaceName() %></td>
                                 <td><%= review.getReviewCount() %></td>
                                 <td><%= review.getNickName() %></td>
                                 <td><%= review.getReviewCreateDate() %></td>
                                 <td>
                                    <button class="btn btn-sm btn-outline-secondary">삭제</button>
                                 </td>
                              </tr>
                           <% } %>
                        <% } else { %>
                           <tr>
                              <td colspan="6">
                                 조회된 결과가 없습니다.
                              </td>
                           </tr>
                        <% } %>
                     </tbody>
                  </table>
                  
               </div>



               
            </div>
            
            <!-- 페이징바 -->
            <div class="pagination p1">
            <% if (del != null) { %>
                <ul>
                    <% if(currentPage != 1) { %>
                       <a href="<%= contextPath %>/reviewList.sk?del=<%= del %>&cpage=<%= currentPage - 1 %>"><li>&lt;</li></a>
                    <% } %>
  
                    <% for(int i = startPage; i <= endPage; i++) { %>
                       <% if(currentPage != i) { %>
                             <a href="<%= contextPath %>/reviewList.sk?del=<%= del %>&cpage=<%= i %>"><li><%= i %></li></a>
                       <% } else { %>
                             <a class="is-active" disabled><li><%= i %></li></a>
                       <% } %> 
                    <% } %>
  
                    <% if(!list.isEmpty() && maxPage != currentPage) { %>
                       <a href="<%= contextPath %>/reviewList.sk?del=<%= del %>&cpage=<%= currentPage + 1 %>"><li>&gt;</li></a>
                    <% } %>
                 </ul>
              <% } else { %>
                 <ul>
                    <% if(currentPage != 1) { %>
                       <a href="<%= contextPath %>/searchReview.sk?keyword=<%= keyword %>&cpage=<%= currentPage - 1 %>"><li>&lt;</li></a>
                    <% } %>
  
                    <% for(int i = startPage; i <= endPage; i++) { %>
                       <% if(currentPage != i) { %>
                             <a href="<%= contextPath %>/searchReview.sk?keyword=<%= keyword %>&cpage=<%= i %>"><li><%= i %></li></a>
                       <% } else { %>
                             <a class="is-active" disabled><li><%= i %></li></a>
                       <% } %> 
                    <% } %>
  
                    <% if(!list.isEmpty() && maxPage != currentPage) { %>
                       <a href="<%= contextPath %>/searchReview.sk?keyword=<%= keyword %>&cpage=<%= currentPage + 1 %>"><li>&gt;</li></a>
                    <% } %>
                 </ul>
               <% } %>
              
            </div>

         </div>
         


         <script>
         
         $(function() {
        	
            $('#review-table tbody tr').click(function() {
               <% if(!list.isEmpty()) { %> 
                  location.href='<%= contextPath %>/reviewDetail.sk?rno=' + $(this).children().eq(0).text();
               <% } %>
            });
            
        	 
         });
         	
         
         
         
         </script>
         
         
         
         

</body>

</html>