<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">


<title>식당 제보 하세욧</title>


<style>

.btn_1 {

    background-color: #C8E183 ;
    border-color: #C8E183;
    border-radius: 10%;
    color: white;
     
}
 
table td{

   border: 1px solid rgb(175, 171, 171);
   
   height: 30px;
}

button:active {
  box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
  position: relative;
  background-color: #b7cf72;
 
}

table {

   width: 460px;


}

.table_Area td{
   text-align: center;
}






</style>
</head>
<body>
    <%@ include file= "../common/menubar_hj.jsp" %>
  

    <div class="outer">
      <br>

      <h2 align="center"style="font-size:40px;" >나만 아는 식당 제보</h2>
      <br>

      <div align="center">
      <form  action="<%= contextPath %>/report.yj"  id="report-form" method="post"s enctype="multipart/form-data">

           <table class="table_Area" id="newTable" align="center"  border="1" style="width:600px;" >
            <tr>
               <td align="center">*식당명 </td>
               <td><input type="text" name="placeName"  style="width: 350px ;"   placeholder="식당명을 입력해주세요" required></td>
               
            </tr>

            <tr>
               
               <td>*주소 </td>
               <td><input type="text"  id="detailAddress" style="width: 350px ;"  name="detailAddress"    placeholder="주소를 입력해주세요" readonly></td>
            </tr>


      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      
      <script>
          
                  window.onload = function(){
               document.getElementById("detailAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면
                  //카카오 지도 발생
                  new daum.Postcode({
                        oncomplete: function(data) { //선택시 입력값 세팅
                           document.getElementById("detailAddress").value = data.address; // 주소 넣기
                           document.querySelector("input[name=residence]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}

       

      </script>
            
            <tr>
               <td>*상세주소</td>
               <td><input type="text"  name="residence" style="width: 350px ;"   placeholder="클릭해주세요" required></td>
               
            </tr>

            <tr>
               <td>*업종</td>
               <td>
                  
                  <input type="radio" name="placeKind" value="식당" required> 식당
                  <input type="radio" name="placeKind" value="카페">카페/베이커리
                  
               </td>
               
               
               
            </tr>

            <tr>
               <td>*영업시간</td>
            
               <td><input type="time" name="time1" required>&nbsp;&nbsp; ~ &nbsp;&nbsp;  <input type="time" name="time2" required></td>
            </tr>




            <tr>
               <td>*주차 </td>
               <td>
                  
                  <input type="radio" name="parking" value="Y" required> 가능
                  <input type="radio" name="parking" value="N">불가능
               </td>
               
            </tr>

            <tr>
               <td>*연락처 </td>
               <td><input type="text" name="call" style="width: 350px ;"    placeholder="-포함 입력해주세요." required></td>
               
            </tr>         
            <tr>
               <td>*휴무일</td>
               <td>
                  
                           
                     <input type="checkbox" id="dayoff" name="dayoff" value="월"> 월
                      <input type="checkbox" id="dayoff" name="dayoff" value="화">화
                      <input type="checkbox" id="dayoff" name="dayoff" value="수"> 수
                      <input type="checkbox" id="dayoff" name="dayoff" value="목"> 목
                      <input type="checkbox" id="dayoff" name="dayoff" value="금">금
                      <input type="checkbox" id="dayoff" name="dayoff" value="토"> 토
                      <input type="checkbox" id="dayoff" name="dayoff" value="일">일
                     </td>

            </tr>
            
            <tr>
               <td>매장소개 </td>
               <td><input  name="info" style="width: 350px;"  type="text" placeholder="매장소개를 입력해주세요."></td>
              
            </tr>
            <tr>
               <td>사진 </td>
               <td style="text-align: left;"><input  name="upfile"  type="file" ></td>
              
            </tr>
            


         </table>


         <table id="testTable" style="width:600px;">
            <tr>
               <!-- 타입,메뉴명,가격 추가 -->
               <td style="text-align:center; width: 99px;" > <br><br>*메뉴<br>
                  <button class="more"  type="button" onclick="return test1();">추가</button>
               </td>
               <input type="text" name="count" id="count" value="1" hidden>
               <td style="padding-top: 20px; padding-right: 20px; padding-bottom: 20px;  padding-left: 20px;">
                  
                           
                        타입:<input type="radio" id="type" name="menuType" value="비건" required> 비건&nbsp;
                            <input type="radio" id="type" name="menuType" value="락토프리">락토프리&nbsp;
                            <input type="radio" id="type" name="menuType" value="슈가프리"> 슈가프리&nbsp;
                            <input type="radio" id="type" name="menuType" value="동물복지"> 동물복지&nbsp;
                            <input type="radio" id="type" name="menuType" value="글루텐프리">글루텐프리
                            <br><br>
                            메뉴명:<input type="text" name="menu" placeholder="메뉴를 입력해주세요.">
                            <br><br>
                            가격:<input type="text" name="price" placeholder="숫자만 입력하세요.">
                           
                            <p></p>
                           </td>
               
                          
                   
                           

            </tr>


         </table>


         <table id="1" style="width:600px;">

         </table>
         <table id="2" style="width:600px;">

         </table>
         <table id="3" style="width:600px;">

         </table>
         <table id="4" style="width:600px;">

         </table>
         <table id="5" style="width:600px;">

         </table>


         <br>

         <div align="center">
            <button class="btn_1"  type="submit" onclick="test2();" style="width:100px; height: 40px; font-size:20px;">제보하기</button>
            

            </div>
            <br><br>

            <input type="text" name="placeType" id="placeType" hidden >

            </form>
         </div>

      </div>




      <script>
      
      
      var count = document.getElementById('count').value;
      

      function test1() {
         // console.log(count);
         

         console.log(count);

         //값뽑기 => menutype.. menuType1... menuType2...
                     

         if(count < 5) {
           count = parseInt(count);
           document.getElementById(count).innerHTML += 
                                                    '<tr>'+
                                                   '<td style="text-align:center; width:99px;">'+'<br><br>'+'*메뉴'+(count+1)+'</td>' + 
                                                   '<td style="padding-top: 20px; padding-right: 20px; padding-bottom: 20px;  padding-left: 20px;">'+
                                                   '타입:' + 
                                                   '<input type="radio" id="type" name="menuType' + (count+1)  + '" value="비건"  required> 비건&nbsp;'+
                                                   '<input type="radio" id="type" name="menuType' + (count+1)  + '" value="락토프리">락토프리&nbsp;'+
                                                   '<input type="radio" id="type" name="menuType' + (count+1)  + '" value="슈가프리"> 슈가프리&nbsp;'+
                                                   '<input type="radio" id="type" name="menuType' + (count+1)  + '" value="동물복지"> 동물복지&nbsp;'+
                                                   '<input type="radio" id="type" name="menuType' + (count+1)  + '" value="글루텐프리">글루텐프리'+
                                                   '<br><br>'+
                                                   '메뉴명:<input type="text" name="menu' + (count+1)  + '" placeholder="메뉴를 입력해주세요.">'+
                                                   '<br><br>'+
                                                   '가격:<input type="text" name="price' + (count+1)  + '" placeholder="숫자만 입력하세요.">'+
                                                   '</td>'+
                                                    '</tr>';
                                                    
                                                    count++;
                                                    document.getElementById('count').value = count;
         }
         
         
     
      }

      function test2(){

         var arr =[];

         
        // console.log(arr);

       

            $("input[name*=menuType]:checked").each(function(){
              
             var value = $(this).val(); 
             arr.push(value);
               
            });

            var result = new Set(arr);
            var list = Array.from(result); //최종: set으로 중복제거후 문자열로 변환
           
            $('#placeType').val(list);

           console.log(list.join(','));

      }


     
           
    </script>


   




      <%@ include file= "../common/footer.jsp" %>



</body>
</html>