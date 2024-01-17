<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료~~~~~</title>

<style>

#area{
    width : 100%;
    margin:auto;
}

    


.talbe_Area td {
    width: 60%;
    height: 400px;

    
}

.btn_1 {
    color: white;
    background-color: #C8E183;
    width: 150px;
    height: 40px;
    border-radius: 10%;
    border: #C8E183;

}

button:active {
  box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
  position: relative;
  background-color: #b7cf72;
 
}




</style>

</head>
<body>
    <%@ include file= "../common/menubar_hj.jsp" %>

    <div id="area">

        <div align="center">

            <table  class ="table_Area" align="center"  border="1"  >
              
            <tr align="center">
                <td>
                    <br><br><br>
                   <p style="font-size : 27px;"> 회원가입이 완료되었습니다! <br>
                    회원님은 Freeeat에 모든 기능을 사용할 수 있습니다!</p>
                    <br><br>
                    <button class="btn_1" onclick="location.href='<%= contextPath %>/views/member/loginEnrollForm.jsp'">로그인</button>
                    
                </td>
                <br>
            
                <br>
                    </tr>

            </table>

         </div>
    </div>      

    
    <br><br><br>
    <div>
        <%@ include file= "../common/footer.jsp" %>

    </div>
</body>



</html>