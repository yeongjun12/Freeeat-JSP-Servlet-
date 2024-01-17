<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      @font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
    }


    #ft-list-area> ul li{
        list-style: none;
        line-height: 30px;
    }

    #ft-list-area li a:hover{
        font-weight: 900;
    }


    #ft-info-area{
        margin-top: 40px;
        margin-left: 20px;
    }

    #ft-list-area{
    	margin-left:30px;
        margin-top: 28px;
    }

    #footer-area{
        width:100%;
        /* background-color: blanchedalmond; */
        height:450px;
        

    }
    #footer-area-all, #footer-area-right, #footer-area-left{
        height: 450px;
    }

    #footer-area-all{
        width:1100px;
        margin: auto;
        background-color: aliceblue;
        
    }
    
    #footer-area-right{
        width:500px;
        background-color: rgba(161, 165, 156, 0.678);
        display: inline-block;
    }


    #footer-area-left{
        width:600px;
        background-color: rgba(168, 178, 197, 0.603);
        float: left;
        
    }
    
    .click-box {
        margin-top: 10px;
        width:100px;
        height: 60px;
        background-color: rgba(98, 154, 133, 0.668);
        color: white;
        cursor: pointer;
        border: 1px solid rgba(98, 154, 133, 0.668);
        border-radius: 30px;
        font-size: 20px;
        font-weight: bold;
    }

    .click-box:hover{
        font-weight: bold;
        background-color:  rgba(138, 178, 164, 0.837);
    }


    #ft-btn-table img{
        width:180px;
        height:180px;
         margin: auto;

    }


    #ft-btn-table{
        width:500px;
        margin: auto;
    }

</style>


</head>
<body>

	<br><br><br>
	<div id="footer-area">
        <div id="footer-area-all">
            <div id="footer-area-left">
                <!-- -->
                <div id="ft-list-area">
                    <ul>
                        <li><a href="#">회사소개</a></li> 
                        <li><a href="#">광고문의</a></li> 
                        <li><a href="#">인재채용</a></li> 
                        <li><a href="#">이용약관</a></li> 
                        <li><a href="#">개인정보처리방침</a></li> 
                        <li><a href="#">커뮤니티 가이드라인</a></li> 
                        <li><a href="#">이용안내</a></li>
                    </ul>
                </div>

               <div id="ft-info-area">
                    <p>
                        (주)FREEEAT친구들 <br>
                        서울특별시 남대문로120 대일빌딩 2층 C-Class <br>
                        대표이사:6명 <br>
                        사업자 등록번호 : 123-12-1234555 <a href="#">[사업자정보확인]</a> <br>
                        고객센터:02-1234-1234 <br>
                        <br>
                        © 2022 Freeeat Co., Ltd. All rights reserved.
                    </p>
               </div>

               
            </div>
            <div id="footer-area-right">
                <table id="ft-btn-table">
                    <tr>
                        <th colspan="2">
                            <img src="<%= path%>/resources/image/freeeatlogo.png" alt="">
                        </th>
                    </tr>
                    <tr>
                        <th class="ft-table-area"><button class="click-box">FAQ</button></th>
                        <td> 궁금해할까봐 궁금증 적어놨음😉 </td>
                    </tr>
                    <tr>
                        <th class="ft-table-area"><button class="click-box">문의</button></th>
                        <td> 뭐든지 물어봐삼~~😘 </td>
                    </tr>
                    <tr>
                        <th class="ft-table-area"><button class="click-box">공지사항</button></th>
                        <td> FREEEAT한 공지공지사항사항 👀🌼 </td>
                    </tr>


                </table>
            </div>


        </div>
    </div>
</body>
</html>