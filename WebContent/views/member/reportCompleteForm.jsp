<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 제보완료~~~~~</title>

<style>

    

#table_area td {
    width: 70%;
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


    <div align="center">
    <table id="table_area"align="center"  border="1"  >
       <tr align="center">
        <td>
           <br><br><br><br><br>
            <p style="font-size : 27px;">식당제보가 완료되었습니다! <br>
            관리자가 식당을 검토할 예정입니다. 제보해주셔서 감사합니다!</p>
            <br><br>
            <button class="btn_1">메인페이지로</button>
            
        </td>
    
       </tr>

    </table>

    </div>
    <div>
        <%@ include file= "../common/footer.jsp" %>

    </div>
</body>



</html>