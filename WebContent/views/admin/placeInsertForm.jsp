<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<%
	String type=""; 
	String menu=""; 
	String price=""; 
%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>식당_등록</title>
    <style>
        * {
            box-sizing: border-box;
        }

        .wrap {
            margin-left: 250px;
            padding: 50px;
        }

        .inner-wrap {
            width: 1430px;
            border: 1px solid silver;
            border-radius: 10px;
            padding: 20px;
            margin: auto;
        }

        #mainContent {
            width: 1287px;
            margin-top: 30px;
            margin: auto;
        }

        /*header 영역(첫번째 div)*/
        #header {
            width: 100%;
            display: flex;
            margin-top: 40px;
        }

        #placelogo {
            width: 55px;
            height: 55px;
            margin-left: 20px;
            padding-top: 5px;
        }

        #header-center {
            width: 20%;
            font-size: 45px;
            margin-left: 15px;
        }

        #header-right {
            width: 450px;
            margin-top: 25px;
            margin-left: 810px;
        }

        .place-btn {
            width: 90px;
            height: 35px;
            border: 2px solid #ddd;
            cursor: pointer;
        }

        .place-btn:hover,
        #back:hover {
            background-color: rgb(205, 205, 205);
        }

        #placeTable {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd;
            font-size: 18px;
            margin-top: 50px;
        }

        #placeTable th {
            text-align: center;
            padding: 12px;
        }

        #placeTable td {
            text-align: left;
            padding: 17px 5px 17px 75px;
        }

        #placeTable input {
            text-align: left;
            font-size: 11pt;
            padding: 3px;
            margin-left: 3px;
        }

        .longInput {
            width: 90%;
            height: 40px;
        }

        #placeTable tr {
            border-bottom: 1px solid #ddd;
        }

        .textarea {
            width: 90%;
            height: 6.25em;
            /* border: none; */
            /* style="resize: none;" */
            resize: none;
        }

		#placeImg{
			width: 240px;
            height: 240px;
			align :center;
		}
        #back {
            margin-top:20px;
            margin-left: 620px;
            width: 70px;
            height: 40px;
            border: 2px solid #ddd;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <%@ include file="../common/adminMenubar.jsp" %>
        <div class="wrap">
            <div class="inner-wrap">
                <div id="mainContent">
                    <form action="<%=contextPath %>/placeInsert.yk" method="post" enctype="multipart/form-data" id="insertform">
                        <div id="header">
                            <div><img src="<%= contextPath %>/resources/image/place.png" id="placelogo"></div>
                            <div id="header-center">식당</div>
                            <div id="header-right">
                                <button type="submit" class="place-btn">등록</button>
                                <button type="reset" class="place-btn">초기화</button>
                            </div>
                        </div>

                        <hr style="border: 1px solid #ddd">

                        <div>
                            <table id="placeTable">
                                <tr>
                                    <th>식당명</th>
                                    <td colspan="3"><input type="text" required class="longInput" placeholder="내용을 입력해 주세요." name="placeName"></td>
                                </tr>
                                <tr>
                                    <th>매장소개</th>
                                    <td colspan="3"><textarea class="textarea" name="placeInfo"></textarea></td>
                                </tr>

                                <tr>
                                    <th>주소</th>
                                    <td colspan="3"><textarea class="textarea"
                                            placeholder="내용을 입력해 주세요." required name="placeAddress"></textarea></td>
                                </tr>

                                <tr>
                                    <th>업종</th>
                                    <td colspan="1">
                                        <label for="kind1"><input type="radio" id="kind1" checked="checked" name="placeKind" value="식당">식당</label>
                                    </td>

                                    <td colspan="2">
                                        <label for="kind2"><input type="radio" id="kind2" name="placeKind" value="카페">카페</label>
                                    </td>
                                </tr>

                                <tr>
                                    <th>영업시간</th>
                                    <td colspan="3"><textarea class="textarea" placeholder="내용을 입력해 주세요." required name="placeTime"></textarea></td>
                                </tr>
                                
                                <tr>
                                    <th>휴무일</th>
                                    <td colspan="3"><textarea class="textarea" name="placeDayoff"></textarea></td>
                                </tr>
                                
                                <tr>
                                    <th>주차</th>
                                    <td colspan="1">
                                        <label for="parking1"><input type="radio" id="parking1" name="placeParking" checked="checked" value="N">불가능</label>
                                    </td>

                                    <td colspan="2">
                                        <label for="parking2"><input type="radio" id="parking2" name="placeParking" value="Y">가능</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td colspan="3"><textarea class="textarea" placeholder="내용을 입력해 주세요." required name="placePhone"></textarea></td>
                                </tr>
                      
                      			<% for(int i=0; i < 5; i++) { %>
									<% 
										type="type"+(i+1); 
										menu="menu"+(i+1); 
										price="price"+(i+1); 
									%>
									
								<tr>
                                    <% if(i == 0){%>
										<th rowspan="5">메뉴</th>
									<% } %>
									
                                    <td>타입 :
                                        <select name="<%=type%>"> 
                                            <option value="비건">비건</option>
                                            <option value="락토프리">락토프리</option>
                                            <option value="슈가프리">슈가프리</option>
                                            <option value="글루텐프리">글루텐프리</option>
                                            <option value="동물복지">동물복지</option>
                                        </select>
                                    </td>
                                    <td>메뉴명 : <input type="text" name="<%=menu%>"></td>
                                    <td>가격(원) : <input type="number" name="<%=price%>"></td>
                                </tr>
                                
                                <% } %>
                                <tr>
                                    <th>사진</th>
                                    <td>
                                    	<img id="placeImg" src="<%=contextPath%>/resources/image/noImage.jpg">   
                                    </td>
                                    <td>
                                    	<input type="file" name="file1" id="file1" onchange="loadImg(this);">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </form>
					<button onclick="location.href='<%=contextPath %>/plist.yk'" id="back">목록</button>
                </div>
            </div>
        </div>

        <script>
        
            $(function(){

            	$('#placeImg').click(function(){
            		$('#file1').click();
            	});
            });
            
            function loadImg(inputFile){
            	if(inputFile.files.length == 1){
            		var reader = new FileReader();
            		
            		reader.readAsDataURL(inputFile.files[0]);
            		
            		reader.onload = function(e){
                		$('#placeImg').attr("src", e.target.result);
                	}
            	}else{
            		$('#placeImg').attr("src", "<%=contextPath%>/resources/image/noImg.png");
            	}	
            }
   
        </script>

</body>

</html>