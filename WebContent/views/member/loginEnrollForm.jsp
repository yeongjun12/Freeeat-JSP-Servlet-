<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    

<head>
   
<meta charset="UTF-8">
<title>로그인 페이지</title>

<style>
    
input {

width: 300px;
height: 40px;

}

.area2 {

    width:  1000px;
    height: 400px;

}

.btn_1 {

    color : white;
    background-color:#C8E183 ;
    border-color: #C8E183;
    border-radius: 10%;
    width: 300px;
    height: 40px;
}

.btn_2 {

color : #C8E183;
background-color:white ;
border-color : #C8E183 ;
border-radius: 10%;
width: 300px;
height: 40px;
}




</style>



</head>
<body>

    <%@ include file= "../common/menubar_hj.jsp" %>

 

    <br>

        <div align="center">
         
                <table class="area1">

                    <tr>
                        <td class="area2">

                            <div align="center">
                                <br>
                                    <form action="<%= contextPath %>/login.yj" method="post">

                                       





                                        <table align="center">
                                            <h2 align="center" style="font-size:40px;" >로그인</h2>
                                            <br>
                                            <tr >
                                            
                                                <td><input type="text"  placeholder="아이디를 입력하세요" name="memId" maxlength="12" required></td>
                            
                                            </tr>
                            
                                            <tr>
                                
                                                <td><input type="password" placeholder="비밀번호를 입력하세요" name="memPwd" maxlength="15" required></td>
                                            </tr>
                                            <tr>
                                                <td><button type="submit" class="btn_1">로그인</button></td>
                                            
                                            </tr>
                                          
                                            <tr>
                                                <td><button  type="button" class="btn_2" onclick="location.href='<%= contextPath %>/views/member/joinEnrollForm.jsp'">회원가입</button></td>
                                                
                                            </tr>
                                          
                                        </table> 

                                    </form>
                            <div>

                        </td>
                    </tr>

                </table>
         
        </div>

        <div>
            <%@ include file= "../common/footer.jsp" %>
    
        </div>


</body>
</html>