<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.ArrayList,com.freeeat.review.model.vo.Review" %>
    <%@ page import="java.util.ArrayList,com.freeeat.place.model.vo.Tag" %>
    <%@ page import="com.freeeat.common.model.vo.PageInfo" %>
    <%
      
            ArrayList<Review> review = (ArrayList<Review>)request.getAttribute("review");
            ArrayList<Tag> tag = (ArrayList<Tag>)request.getAttribute("tag");
            PageInfo pi =  (PageInfo)request.getAttribute("pi");


            int listCount = pi.getListCount();
            int currentPage = pi.getCurrentPage();
           int startPage = pi.getStartPage();
           int endPage = pi.getEndPage();
           int maxPage = pi.getMaxPage();
            
        
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 리뷰 관리</title>

<style>

    div>img {

        width: 170px;
        padding: 5px;
  

    }


    .review1 {
        width: 1000px;
        height: 160px;
        
        border: 3px solid  #C8E183;
        border-radius: 20px;
    }
    div.left {
        width: 700px;
        float: left;
        box-sizing: border-box;
        border : none;
  
    }

    .title {
        font-size : 30px;
    }


   

    div.right {
        width: 200px;
        float: right;
        box-sizing: border-box;
        
       border : none;
    }
    .content{
        color :gray;
    }

    .tag {

        background-color: rgb(225, 220, 220);
        width: 120px;
        height: 23px;
        float :left;
        border-radius: 10%;
    }

    .review1:hover {
        background-color: rgb(219, 212, 212);
    }

    button:active {
  box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
  position: relative;
  background-color: #b7cf72;
 
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
   }

   .p1 a{
   width: 40px;
   height: 40px;
   line-height: 40px;
   padding: 0;
   text-align: center;
   }

   .p1 a.is-active{
   background-color: #88A201;
   border-radius: 100%;
   color: #fff;
   }

   #tag {

    display: inline-block;
   
    width: 130px;
    font-size: 15px;
   
   
   }


    


</style>
</head>
<body>
 <%@ include file= "../common/menubar_hj.jsp" %>
    <%
       
        
        int memNo = loginMem.getMemNo();

    
    %>
   
    
    <div align="center">    
   
        <h1 style="font-size:40px;">내 리뷰</h1>
        <br>
    <table class="area" align="center">

     

        <td>

 

        <br>
          <% for(Review r : review) { %>
        <div class="review1" style="padding: 5px;" align="left" border="1">
        
            <div class="left"  onclick = "location.href = '<%= contextPath %>/placeDetail.mr?placeNo=<%= r.getPlaceNo() %>'">
               
                   <h1 style="padding: 2%;" class="title" align="left"><%= r.getPlaceName() %> </h1> 
      
                <p style="font-size:20px; padding: 2%;" class="content" align="left"><%= r.getReviewContent() %></p>
                
              
                        <% for(Tag t : tag) { %>
                            <% if(r.getReviewNo()==t.getReviewNo()) { %>

                         
                           <div style="padding: 5px; background-color: rgb(225, 220, 220); border-radius: 10%;" id="tag" align="left">
                          
                                <p  style="font-size: 16px; text-align: center;" align="center" class="tag"><%= t.getTagContent() %></p>
                        </div>
                         
                          <% } %>
                        <% } %>
            
                <br>

            </div>
    
            <div align="right">
               <span><%= r.getReviewCreateDate() %> 방문</span> 
               <button onclick = "location.href = '<%= contextPath %>/reviewDelete.yj?reviewNo=<%= r.getReviewNo() %>'">x</button>

            </div>

            
            <div class="right">
               
                <img id="imgArea" src="<%= contextPath %>/<%=r.getReviewImagePath() %>/<%=r.getReviewImageName() %>">

            </div>    

        </div>

        <br>

         <% } %>

        <br>

        <div id="footer">
         <!-- 페이징바 -->
         <div class="pagination p1" align="center">
            <ul>
               <% if(currentPage != 1) { %>
                  <a href="<%= contextPath %>/review.yj?cpage=<%= currentPage - 1 %>"><li>&lt;</li></a>
               <% } %>
      
               <% for(int i = startPage; i <= endPage; i++) { %>
                  <% if(currentPage != i) { %>
                     <a href="<%= contextPath %>/review.yj?cpage=<%= i %>"><li><%= i %></li></a>
                  <% } else { %>
                     <a class="is-active" disabled><li><%= i %></li></a>
                  <% } %> 
               <% } %>
      
               <% if(!review.isEmpty() && maxPage != currentPage) { %>
                  <a href="<%= contextPath %>/review.yj?cpage=<%= currentPage + 1 %>"><li>&gt;</li></a>
               <% } %>
            </ul>
         </div>
      </div>

        <br>

        </td>
        </table>
        </div>


        <%@ include file= "../common/footer.jsp" %>
</body>
</html>