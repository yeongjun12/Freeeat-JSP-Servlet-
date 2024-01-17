<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘텐츠 등록</title>

<style> 

    .wrap {
        margin-left: 250px;
        padding: 50px;

    }

    .inner-wrap {
        width: 90%;
        border: 1px solid silver;
        border-radius: 10px;
        padding: 20px;
        margin: auto;
    }

    .content-header {
        width: 100%;
        height: 50px;
        
        text-align: center;
    }

    .content-enroll-form {
        margin: auto;
        text-align: center;
    }

    .content-enroll-form td input[type=text], .content-enroll-form td input[type=url] {
        width: 100%;
    }

    #linkImgArea > img {
        width: 110px;
        height: 110px;
        border: silver solid 1px;
    }


</style>


</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	

    <div class="wrap">
        <div class="inner-wrap">


            <div class="content-header">
                <h1>콘텐츠 작성하기</h1>
            </div>
    
            <br><br>
    
            <div class="content-enroll-form">
    
                <form action="<%= contextPath %>/insertCont.sk" method="post">
    
                    <div id="contentEnrollForm">
    
                        <table class="table table-bordered content-enroll-table">
                            
                            <tr>
                                <th>제목</th>
                                <td colspan="3">
                                    <input type="text" name="contTitle" required>
                                </td>
                            </tr>
                            <tr>
                                <th>소개</th>
                                <td colspan="3">
                                    <input type="text" name="contInfo" required>
                                </td>
                            </tr>
                            <tr>
                                <th>출처</th>
                                <td>
                                    <input type="text" name="contSource" required>
                                </td>
                                <th>구분</th>
                                <td style="text-align: left;">
                                    <select name="contCategory" id="selectCategory">
                                        <option value="기사">기사</option>
                                        <option value="식당">식당</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>출처링크</th>
                                <td colspan="2">
                                    <input type="url" name="contLink" required>
                                </td>
                                <td rowspan="2">
                                    <div id="linkImgArea">
                                        <img src="https://cdn-icons-png.flaticon.com/512/4671/4671154.png" alt="링크해당사진">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>이미지링크</th>
                                <td colspan="2">
                                    <input type="url" name="contImgLink" required>
                                </td>
                            </tr>
                            <tr>
                                <th>타입</th>
                                <td colspan="3" style="text-align: left;">
                                    <input type="radio" name="menuType" id="type1" value="비건" checked><label for="type1">&nbsp;비건</label>&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="menuType" id="type2" value="락토프리"><label for="type2">&nbsp; 락토프리</label>&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="menuType" id="type3" value="슈가프리"><label for="type3">&nbsp; 슈가프리</label>&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="menuType" id="type4" value="글루텐프리"><label for="type4">&nbsp; 글루텐프리</label>&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="menuType" id="type5" value="동물복지"><label for="type5">&nbsp; 동물복지</label>&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
    
                    </div>
    
                    <br>
                    <div class="content-enroll-btn">
                        <button type="reset" class="btn btn-sm btn-outline-secondary">초기화</button>&nbsp;
                        <button type="button" class="btn btn-sm btn-outline-warning" onclick="history.back();">취소하기</button>&nbsp;
                        <button type="submit" class="btn btn-sm btn-outline-primary">등록하기</button>
                    </div>
    
                </form>
                
    
            </div>


        </div>
    </div>
	

    <script>

        $(function() {

            // 미리보기 이미지 
            $('input[name=contImgLink]').on('change', function() {
                var $linkImg = $(this).val();
                $('#linkImgArea > img').attr('src', $linkImg);
                if($linkImg == "") {
                    $('#linkImgArea > img').attr('src', 'https://cdn-icons-png.flaticon.com/512/4671/4671154.png');
                }
            });


        });


    </script>
	
	

</body>
</html>