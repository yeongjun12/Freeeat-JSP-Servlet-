<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList,com.freeeat.feed.model.vo.Feed" %>
<%@ page import="java.util.ArrayList,com.freeeat.review.model.vo.Review" %>

<%
      
    ArrayList<Feed> feed = (ArrayList<Feed>)request.getAttribute("feed");
        int feedCount = (int)request.getAttribute("feedCount");
        int reviewCount = (int)request.getAttribute("reviewCount");
        int wishCount = (int)request.getAttribute("wishCount");
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<style>



    .left_Area{
        display: inline-block;
        width:400px;
        height:300px;
        justify-content: center; 
        align-items: center;
        border : 3px solid #C8E183;
        border-radius: 5%;
       }
      


    .right_Area{
        display: inline-block;
        width:400px;
        height:300px;
        justify-content: center; 
        align-items: center;
        border : 3px solid #C8E183;
        border-radius: 5%;
    }
    
   
    
    table td {
    /* width: 150px; */
    height: 30px;


    }

     div>img {
        width :60px; 
        height :40px;
        
        padding-top: 10px;
        padding-right: 10px;
        padding-bottom: 1px;
        padding-left: 10px;
     }
    
    .thumbnail{
		
		width: 70px;
		display:inline-block;
		margin: 6px;
		
	}

 

    button {
        background-color: #C8E183;
        color: white;
        border: #C8E183;
        border-radius: 10%;
    }

    button:active {
  box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
  position: relative;
  background-color: #b7cf72;
 
} 

table td {

    border-radius: 10%;
   

}

#btn {
    width: 100px;
    height: 22px;
    font-size: 15px;
    color: rgb(53, 52, 52);
}





   
</style>
</head>

<body>
    <%@ include file= "../common/menubar_hj.jsp" %>
    
    <%
    	String memNickName = loginMem.getMemNickName();
        String phone = loginMem.getPhone();
        String birthDate = loginMem.getBirthDate();
        String email = loginMem.getEmail();
        String residence = loginMem.getResidence();
        
    %>
    <br><br><br><br>


<div align="center">

    




    <table align="center" border="1px">

       



        <tr align="center">
        
            <td style="width: 400px;  border:3px solid #C8E183; border-radius: 10px;">
         
                <br>
                <h2 style="font-size:30px;">나의 정보</h2>
                <br><br>
                <table>
                   
        
                    <tr>
                        <td>닉네임 </td>
                        <td><input type="text"  name="nickName" value="<%=memNickName %>" readonly ></td>
                        
                    </tr>
            
                    <tr>
                        <td>전화번호 </td>
                        <td><input type="text"  name="phone" value="<%= phone %>" readonly></td>
                    
                    </tr>
        
                    <tr>
                        <td>생년월일  </td>
                        <td><input type="text"  name="birth" value="<%= birthDate %>" readonly></td>
                
                    </tr>
        
                    <tr>
                        <td>이메일 </td>
                        <td><input type="text"  name="email" value="<%= email %>" readonly></td>
                    
                    </tr>
                    <tr>
                        <td>거주지 </td>
                        <td><input  type="text"  name="residence" value="<%= residence %>" readonly></td>
                    
                    </tr>
                </table>
                
                <button id="btn" onclick="location.href='<%= contextPath %>/views/member/EditMember.jsp'">수정하기</button>
                <br>
                
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               

            </td>
          
            <td style="width: 400px;  border:3px solid #C8E183;">
                
                        <br>
                        <h2 style="font-size:15px;"><%=memNickName %></h2>
                        
                
                        <table style="text-align: center;">
                            
                                <tr>
                            
                                    <td ><%=feedCount %></td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td><%=reviewCount%></td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td><%=wishCount%></td>
                                   
                                </tr>
                            
                                <tr >
                                   <td>피드</td><br>
                                   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                   <td>리뷰</td>
                                   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                   <td>찜한식당</td>
                                </tr>
                                
                     
                        </table> 
                        
                        <div style="width: 400px;">
                            <div align="center">
                                <div class="list-area">

                                    
                                    <% for(Feed f : feed) { %>
                                        
                                    <div class="thumbnail" align="center" border="1">
                                      
                                        <img src="<%= contextPath %>/<%=f.getFilePath() %>/<%=f.getChangeName() %>">
                                      
                                    </div>

                                    <% } %>
                                 
                                  
        
                                </div>
        
                            </div>
                            


                        </div>
                        
                      
                
                        
                
                        </div>
                        <div>

                            <button id="btn"  onclick="location.href='<%= contextPath %>/FeedGo.ih' ">피드</button>&nbsp;&nbsp;
                            <button id="btn"  onclick="location.href='<%= contextPath %>/review.yj?cpage=1' ">내 리뷰</button>&nbsp;&nbsp;
                            <button id="btn" onclick="location.href='<%= contextPath %>/wish.yj' ">찜한식당</button>

        
          
                        </div>
                
                    </td>
                
                
                </tr>
    </table>


    <br><br><br>
    <div>
     
        <%@ include file= "../common/footer.jsp" %>

    </div>
</body>
</html>