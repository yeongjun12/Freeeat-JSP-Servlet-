<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.common.model.vo.PageInfo, com.freeeat.member.model.vo.Member" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    
    String status = (String)request.getAttribute("status");
    
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
<title>관리자 회원관리</title>
<style>

    a {
        text-decoration: none;
        color: black;
    }

    .wrap {

        margin-left: 250px;
        padding: 50px;

    }

    .inner-wrap {
        width: 1250px;
        border: 1px solid silver;
        border-radius: 10px;
        padding: 20px;
        margin: auto;
    }

    .tap-outer {
        width: 100%;
    }
    
    .tap-btn {
        width: 200px;
        height: 50px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        
        text-align: center;
        font-size: 17px;
        padding-top: 10px;
    }

    .tap-btn:hover {cursor: pointer;}
    
    .tap-content {
        width: 1200px;
        height: 1200px;
        display: none;
        vertical-align: center;
        padding: 15px;
        font-size: 13px;
    }

    .tap-btn {
        float: left;
    }

    .tap1 {background-color: #D6F2FE;}
    .tap2 {background-color: #E7F8FF;}
    .tap3 {background-color: #C8E183;}
    .tap4 {background-color: #88A201;}

    .on {
        display: block;
    }

    .member_list table {
        background-color: white;
    }

    .member-chart-area {
        padding-top: 20px;
    }

    .member-chart-area>.member-chart {
        width: 500px;
        height: 500px;
        margin: 25px;
        
        background-color: white;
        border: 1px solid silver;
        border-radius: 15px;

        display: inline-block;
        box-shadow: 2px 2px 5px 0px lightgrey;
    }

    .barChart-area {
        width: 450px;
        margin: auto;
        padding: 20px;
    }

    .member-count { /* 테이블 */

        width: 400px;
        height: 50px;
        border: 1px solid silver;

        margin-top: 30px;
        text-align: center;
    }

    .member-count td {
        border: 1px solid silver;
    }

    .member-count th {
        border: 1px solid silver;
    }

    .member-count thead th {
        font-size: 22px;
        padding: 5px;
    }
    
    .member-count td span:hover {
    	cursor : pointer;
    	color : rgb(214, 242, 254);
    }




</style>

</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>


    
    <div class="wrap">

        <div class="inner-wrap">

            <div class="tap-outer">
    
                <div class="tap-btn-area">
                    <div class="tap-btn tap1">목록</div>
                    <div class="tap-btn tap2">통계</div>
                </div>
                <br clear="both">
                <div class="tap-content-area">
                    <!-- 탭1 : 회원 목록 -->
                    <div class="tap-content tap1 on">
                        <!-- 회원 목록 표 -->
                        <div class="container member_list">
                            <h2 align="center">회원 목록 보기</h2>
                            <p>
                            	총 <%= listCount %>명
                            </p>
                            <div>
                                &nbsp;
                                <input type="checkbox" id="statusCheck"> 탈퇴한 회원 포함
                            </div>
                            <table class="table table-bordered table-hover">
                              <thead>
                                <tr>
                                  <th>회원번호</th>
                                  <th>닉네임</th>
                                  <th>아이디</th>
                                  <th>전화번호</th>
                                  <th>생년월일</th>
                                  <th>이메일</th>
                                  <th>타입</th>
                                  <th>지역</th>
                                  <th>가입일자</th>
                                  <th>상태</th>
                                </tr>
                              </thead>
                              <tbody>
	                           	<% if(!list.isEmpty()) { %>
	                           		<% for (Member m : list) { %>
		                              <tr>
		                                <td><%= m.getMemNo() %></td>
		                                <td><%= m.getMemNickName() %></td>
		                                <td><%= m.getMemId() %></td>
		                                <td><%= m.getPhone() %></td>
		                                <td><%= m.getBirthDate() %></td>
		                                <td><%= m.getEmail() %></td>
		                                <td><%= m.getType() %></td>
		                                <td><%= m.getResidence() %></td>
		                                <td><%= m.getEnrollDate() %></td>
		                                <td><%= m.getStatus() %></td>
		                              </tr>
	                              	<% } %>
	                             <% } else { %>
	                             	<tr>
	                             		<td colspan="10">조회된 회원이 없습니다.</td>
	                             	</tr>
	                             <% } %>
                              </tbody>
                            </table>                            
                          </div>
                          <br>
                          <div id="footer">
                            <!-- 페이징바 -->
                            <div class="pagination p1">
            					<% if(status == null) { %>
	                               <ul>
	                                    <% if(currentPage != 1) { %>
	                                        <a href="<%= contextPath %>/memberList.sk?&cpage=<%= currentPage - 1 %>"><li>&lt;</li></a>
	                                    <% } %>
	        
	                                    <% for(int i = startPage; i <= endPage; i++) { %>
	                                        <% if(currentPage != i) { %>
	                                            <a href="<%= contextPath %>/memberList.sk?&cpage=<%= i %>"><li><%= i %></li></a>
	                                        <% } else { %>
	                                            <a class="is-active" disabled><li><%= i %></li></a>
	                                        <% } %> 
	                                    <% } %>
	        
	                                    <% if(!list.isEmpty() && maxPage != currentPage) { %>
	                                        <a href="<%= contextPath %>/memberList.sk?&cpage=<%= currentPage + 1 %>"><li>&gt;</li></a>
	                                    <% } %>
	                                </ul>
                                <% } else { %>
	                               <ul>
	                                    <% if(currentPage != 1) { %>
	                                        <a href="<%= contextPath %>/memberListN.sk?&status=n&cpage=<%= currentPage - 1 %>"><li>&lt;</li></a>
	                                    <% } %>
	        
	                                    <% for(int i = startPage; i <= endPage; i++) { %>
	                                        <% if(currentPage != i) { %>
	                                            <a href="<%= contextPath %>/memberListN.sk?&status=n&cpage=<%= i %>"><li><%= i %></li></a>
	                                        <% } else { %>
	                                            <a class="is-active" disabled><li><%= i %></li></a>
	                                        <% } %> 
	                                    <% } %>
	        
	                                    <% if(!list.isEmpty() && maxPage != currentPage) { %>
	                                        <a href="<%= contextPath %>/memberListN.sk?&status=n&cpage=<%= currentPage + 1 %>"><li>&gt;</li></a>
	                                    <% } %>
	                                </ul>
                                <% } %>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                    <!-- 탭2 : 회원 통계 -->
                    <div class="tap-content tap2">
                        <!-- 회원 통계 조회 -->
                        <div class="container member_chart">
                            <div class="member-chart-area">
                                <!-- 회원 수 -->
                                <div class="member-chart chart1">
    
                                    <table class="member-count" align="center" id="totalMem">
                                        <tr>
                                            <th>
                                            	총 회원 수
                                            	<% if (status != null) { %>
                                            	<span>(탈퇴 회원 포함)</span>
                                            	<% } %>
                                            </th>
                                            <td><%= listCount %> 명</td>
                                        </tr>
                                    </table>
    
                                    <table class="member-count" align="center">
                                        <thead>
                                            <tr>
                                                <th colspan="2">일자별 가입 회원 수</th>
                                            </tr>
                                            <tr>
                                                <td width="300">
                                                    <input type="date" name="selectDate">
                                                </td>
                                                <td width="100">
                                                    <span class="material-symbols-outlined" onclick="selectMemDate();">
                                                        search
                                                    </span>
                                                </td>
                                            </tr>
                                        </thead>
                                            <tr>
                                                <th>날짜</th>
                                                <th>가입</th>
                                            </tr>
                                        <tbody id="dateCountBody">
											<!-- AJAX로 값 추가 -->
                                        </tbody>
                                        <tfoot id="dateCountFoot">
												<!-- AJAX로 값 추가 -->
                                        </tfoot>
                                    </table>
    
                                </div>
                                <!-- 유형별 회원 그래프 -->
                                <div class="member-chart chart2">
                                    
                                    <div class="barChart-area">
                                        <canvas id="typeChart" width="400" height="300"></canvas>
                                    </div>
    
    
                                </div>
                                <!-- 지역별 회원 그래프 -->
                                <div class="member-chart chart3">
    
                                    <div class="barChart-area">
                                        <canvas id="residenceChart" width="400" height="300"></canvas>
                                    </div>
                                    
    
                                </div>
                                <!-- 연령별 회원 그래프 -->
                                <div class="member-chart chart4">
    
                                    <div class="barChart-area">
                                        <canvas id="ageChart" width="400" height="300"></canvas>
                                    </div>
    
                                </div>
    
                            </div>

                        </div>
    
                    </div>
    
                </div>    
    
            </div>

        </div>

    </div>
        
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        
        <script>
        // 날짜별 회원 조회하는 메소드
        function selectMemDate() {

            var date = $('input[name=selectDate]').val();

            $.ajax({
                url : 'selectMemEnrollDate.sk',
                type : 'post',
                data : {'date' : date},
                success : function(dateValues) {
                   var strBody = '';
                   var strFoot = '';
                   if (dateValues.length == 0) {
                      strBody = '<tr>'
                          + '<td colspan="2">해당 기간 가입 없음</td>'
                          + '</tr>';
                   }
                   else {
                      var sum = 0;
                      var j = 0;
                      for (var i = 0; i < (dateValues.length / 2); i++) {
                         strBody += '<tr>'
                             + '<td>' + dateValues[j] + '</td>'
                             + '<td>' + dateValues[j + 1] + '</td>'
                             + '</tr>';
                         sum += Number(dateValues[j + 1]);
                         strFoot = '<tr>'
                            + '<td>합계</td>'
                            + '<td>' + sum + '</td>'
                            + '</tr>';
                         j += 2;
                      }                
                   }
               $('#dateCountBody').html(strBody);
               $('#dateCountFoot').html(strFoot);
                },
                error : function() {
               alert('날짜별 가입회원수 조회 실패');
                }          


            });


        };


         // ---------------- chart 부분 ---------------------      

         // typeChart 값 담을 변수 선언
         var typeValues;
         // residenceChart 값 담을 변수 선언
         var residenceValues;
         // ageChart 값 담을 변수 선언
         var ageValues;
         
         
         
         // typeChart 값 불러오는 AJAX
         function getTypeValues() {
             $.ajax({
                     url : 'typeChart.sk',
                     type : 'post',
                     async : false,
                     success : function(result) {
                         typeValues = result;
                     },
                     error : function() {
                         console.log('typeValues실패');
                     }
                 });
         };

         
         // residenceChart 값 불러오는 AJAX
         function getResidenceValues() {
             $.ajax({
                     url : 'residenceChart.sk',
                     type : 'post',
                     async : false,
                     success : function(result) {
                         residenceValues = result;
                     },
                     error : function() {
                         console.log('residenceValues실패');
                     }
                 });
         
         };
         
         // ageChart 값 불러오는 AJAX
         function getAgeValues() {
             $.ajax({
                 url : 'ageChart.sk',
                 type : 'post',
                 async : false,
                 success : function(result) {
                     ageValues = result;
                 },
                 error : function() {
                     console.log('ageValues')
                 }
                 
             })
         
         };
     

        $(function() {


             // 오늘 날짜 입력
             var today = new Date();

             var year = today.getFullYear();
             var month = ('0' + (today.getMonth() + 1)).slice(-2);
             var day = ('0' + today.getDate()).slice(-2);
             var dateString = year + '-' + month  + '-' + day;

             $('input[name=selectDate]').val(dateString);
           
           
           // 요청 응답 시, 체크박스 체크속성 주기
          if('<%= status %>' == 'n') {
             $('#statusCheck').attr('checked', true);
          };
    

            
             
             // 탈퇴한 회원 포함 체크박스 클릭 시, 체크됨에 따라 보이는 화면 변경
             $('#statusCheck').click(function() {
                
                if($('#statusCheck').is(':checked')) {
                   location.href = '<%= contextPath %>/memberListN.sk?status=n&cpage=1'                      
                } else {
                   location.href = '<%= contextPath %>/memberList.sk?cpage=1'
                }
                
             });


             // 탭 선택시 변경사항
             $('.tap-btn').click(function() {                
                
                 var index = $(this).index(); // 선택한 탭버튼의 인덱스 추출
                   // 클래스 추가/제거로 영역 숨기기/보이기
                 $('.tap-content-area>div').removeClass('on');
                 $('.tap-content').eq(index).addClass('on');
                
                 
                 if ($('.tap-content').eq(1).hasClass('on')) {
                    // 날짜별 가입 회원 조회하는 AJAX 실행
                    selectMemDate();
                   // typeChart 값 불러오는 AJAX 실행
                  getTypeValues();
                   // residenceChart 값 불러오는 AJAX 실행
                  getResidenceValues();
                  // ageChart 값 불러오는 AJAX 실행
                  getAgeValues();
                 }
   
                 // 차트 색 -------------------------
                 const rainbows = [
                     'rgba(255, 99, 132, 0.2)',
                     'rgba(255, 159, 64, 0.2)',
                     'rgba(255, 205, 86, 0.2)',
                     'rgba(75, 192, 192, 0.2)',
                     'rgba(54, 162, 235, 0.2)',
                     'rgba(153, 102, 255, 0.2)',
                     'rgba(201, 203, 207, 0.2)'
                 ];
                 
                 const rainbowLine = [
                     'rgb(255, 99, 132)',
                     'rgb(255, 159, 64)',
                     'rgb(255, 205, 86)',
                     'rgb(75, 192, 192)',
                     'rgb(54, 162, 235)',
                     'rgb(153, 102, 255)',
                     'rgb(201, 203, 207)'
                 ];
        

        
                 // 차트 1 : typeChart -----------------------------------------
                 

                 var typeChart = new Chart(document.getElementById('typeChart'), {
                 type: 'bar',
                 data: {
                     labels: ['비건', '락토프리', '슈가프리', '글루텐프리', '동물복지'],
                     datasets: [{
                     label: '유형별 회원 수',
                     data: typeValues,
                     datalabels:{
                         color:'black',   
                         font:{'size':24}
                     },
                     backgroundColor: rainbows,
                     borderColor: rainbowLine,
                     borderWidth: 1
                     }]
                     
                 },
                 options: {
                     responsive: false,
                     scales: {
                     y: {
                         beginAtZero: true
                     }
                     }
                 }
                 });
     

             
                 // 차트 2 : areaChart --------------------------------------------
                 
                 var residenceChart = new Chart(document.getElementById('residenceChart'), {
                 type: 'bar',
                 data: {
                     labels: ['서울', '인천', '경기', '강원', '충청', '전라', '경상', '제주'],
                     datasets: [{
                     label: '지역별 회원 수',
                     data: residenceValues,
                     backgroundColor: rainbows,
                     borderColor: rainbowLine,
                     borderWidth: 1
                     }]
                 },
                 options: {
                     responsive: false,
                     indexAxis: 'y',
                     scales: {
                     y: {
                         beginAtZero: true
                     }
                     }
                 }
                 });
                 

     
                 // 차트 3 : ageChart -------------------------------------------
                 
                 var ageChart = new Chart(document.getElementById('ageChart'), {
                 type: 'bar',
                 data: {
                     labels: ['10대', '20대', '30대', '40대', '50대', '60대 이상'],
                     datasets: [{
                     label: '연령별 회원 수',
                     data: ageValues,
                     backgroundColor: rainbows,
                     borderColor: rainbowLine,
                     borderWidth: 1
                     }]
                 },
                 options: {
                     responsive: false,
                     scales: {
                     y: {
                         beginAtZero: true
                     }
                     }
                 }
                  });
                 
                 
                



           });
             
             
         
         });



        </script>
</body>
</html>