<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

 
<meta charset="UTF-8">
<title>팔로우/팔로잉 목록이다!!!!</title>

<style>
    @font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

body{
    
      font-family: 'S-CoreDream-3Light';
  }


    .hr_line {

        border: 0;
    height: 4px;
    background: #C8E183 ;
    

    }

    .nickName {

        width: 500px;
        height: 50px;
    }

    .follow_Area {

        width:80px;
       
        
    }

    .area {
        border: 1px red;
    }

    .follow_Btn {
        background-color :  rgb(134, 142, 147);
        color: white;
        /* border :none; */
        border-radius: 13%;
      
        
    } 


    .mainBtn {

        width: 100px;
        height: 35px;

    }

    tr:hover{
        background-color: rgb(228, 226, 226);
    }
    
   


</style>
</head>
<body>
 

    <div align="center">
        <h1 style="font-size: 40px;">팔로잉/팔로우 관리</h1>
        <br>
        <table>
            <td><button class="mainBtn">팔로잉 목록</button></td>
            <td><button class="mainBtn">팔로워 목록</button></td>
        </table>
        <br>
        <hr class="hr_line">



    </div>

    <div class="area" align="center">
        <table>
           
            <tr>
                <td class="nickName">닉네임1</td>
                <td class="follow_Area" align="center"><button id="btn" class ="follow_Btn">팔로잉</button></td>
            </tr>



            <tr>
                <td class="nickName">닉네임2</td>
                <td class="follow_Area" align="center"><button id="btn" class ="follow_Btn">팔로잉</button></td>
            </tr>

            <tr>
                <td class="nickName">닉네임3</td>
                <td class="follow_Area" align="center"><button id="btn" class ="follow_Btn">팔로잉</button></td>
            </tr>


            <tr>
                <td class="nickName">닉네임4</td>
                <td class="follow_Area" align="center"><button id="btn" class ="follow_Btn">팔로잉</button></td>
            </tr>


        </table>


    </div>

    <script>


        
        $(function() {

            $('.follow_Btn').click(function() {
                if($(this).text() == '팔로잉') {
                    $(this).css('background-color', 'rgb(79, 170, 212)');
                    $(this).text('팔로우');
                } else { 
                    $(this).css('background-color', 'rgb(134, 142, 147)');
                    $(this).text('팔로잉');
                }
            });

            

            $('.follow_Btn').hover(function() {
                if($(this).text() == '팔로잉') {
                    $(this).css('background-color', 'rgb(184, 192, 199)');
                }
            }, function() {
                if($(this).text() == '팔로잉') {
                    $(this).css('background-color', 'rgb(134, 142, 147)');
                }
            });



        });

        


    </script>


</body>


</html>