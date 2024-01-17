<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%@ page import="java.util.ArrayList,com.freeeat.place.model.vo.Wish" %>
   
 
   
<!DOCTYPE html>
<html>
<head>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>찜한 식당 리스트</title>

<style>


    

    .placeImage {
        width :390px; 
        height :250px;
      object-fit: cover;
        
        padding-top: 10px;
        padding-right: 10px; 
        padding-bottom: 1px;
        padding-left: 10px;

    }
   

   .heart{
 
      width: 30px;
      height: 30px;
      position:absolute;
      top:20px;
      right : 5px;
   }
    .list-area{
      text-align : center;
      border : 1px solid white;
   }

    .thumbnail{
      
      width: 400px;
      display:inline-block;
      margin: 0px;
      
   }

   .thumbnail {
   transition: all 0.2s linear;
   }

   .thumbnail:hover {
   transform: scale(1.05);
   }


   .heart {
     z-index: 10;
   }


   .placeDiv {

      position: absolute;
      top:50%;
      left:35%;
      display:none;
   
   }

   .placeDiv button{
      background-color:rgba(45, 51, 21, 0.7);
      color: white;
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

   
   


    </style>

</head>
<body>
   <%@ include file= "../common/menubar_hj.jsp" %>
   <script>


      
   </script>

    

        <br>
        <h2 align="center" style="font-size: 40px;">찜한식당</h2>
        <br>
    
      
    <div align="center">
      
        <div class="list-area">
         
         <% if(!wish.isEmpty()) {%>   
            <% for(Wish w : wish) { %>
               <div class="thumbnail" align="center" border="1">
                        
                  <div  class="z_area" style="position:relative;">
                     
               
                        <img class="heart"  onclick = "location.href = '<%= contextPath %>/wishDelete.yj?placeNo=<%= w.getPlace_No() %>'" src="<%= contextPath %>/resources/image/heart2.png" alt=""> 

                     <img  class="placeImage"  onclick = "location.href = '<%= contextPath %>/placeDetail.mr?placeNo=<%= w.getPlace_No() %>'" src="<%= contextPath %>/<%= w.getImg_Path() %>/<%= w.getImg_Name() %>">


                     <div  class="placeDiv">
                        <button> 🥑식당 보러가기🌿</button>

                     </div> 
                  </div>
                 
                  <p>
                     <%= w.getPlace_Name() %>
                     
                  </p>
               </div>
               <% } %>
            <% } else {  %>
               <br><br><br>
               <h2 style="font-size: 30px;">찜한식당이 없습니다.</h2>
               <% } %>
               
                
           
      </div>
      
      


        
      </div>

    
            

     <br><br>
     <div>
   

   </div>

   


   <script>

         $(function() {

         $('.heart').click(function() {
               
               $(this).attr("src", "<%= contextPath %>/resources/image/deleteheart.png");
            
            
         });

         });


         $('.z_area').hover(function() {
                $(this).find('.placeDiv').css({'display':'block', 'cursor':'pointer'});
            }, function() {
                $(this).find('.placeDiv').css('display', 'none');
            });



   </script>



 <br><br><br>
 <div>
    <%@ include file= "../common/footer.jsp" %>

 </div>

 
</body>
</html>