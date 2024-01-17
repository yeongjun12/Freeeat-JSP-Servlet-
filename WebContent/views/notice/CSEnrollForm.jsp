<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의쓰기</title>
<style>
    .outer{
        width: 100%;
        height: 1000px;
    }
    #header{
        height: 10%;
    }
    #content{
        height: 90%;
    }
    /* header */
    .outer> #header > h2{
        text-align: center;
        font-weight: 700;
        margin: auto;
    }
    #title{
        font-size: 30px;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <%@include file = "../common/menubar_hj.jsp"%>
    <div class="outer">
        <br><br><br>
        <div id="header">
        <h2 id="title">1:1 문의쓰기</h2>
        <br><br>
        </div>

        <div id="content">
            <form action="<%=contextPath %>/insertCS.hj" method="post">
                <div class="container">  
                    <table class="table">
                        <p>
                            산업안전보건법 제 41조 시행령에 근거하여 <br>
                            2018년 10월 18일 부터 산업안전보건법에 따라 고객응대근로자 보호조치를 시행하고 있습니다. <br>
                            고객응대근로자에게 폭언, 폭행 등을 하지 말아주세요.
                            <br>
                        </p>
                        <br>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" id="csTitle"  class="form-control"></td>
                        </tr>
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <select name="category" id="category" class="form-control">
                                    <option value="회원관련문의">회원관련문의</option>
                                    <option value="장소관련문의">장소관련문의</option>
                                    <option value="콘텐츠관련문의">콘텐츠관련문의</option>
                                    <option value="피드관련문의">피드관련문의</option>
                                    <option value="기타문의">기타문의</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input type="text" name="name" class="form-control" >
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input name="email" type="text" name="csemail" class="form-control" width="40px">
                                <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="@를 포함해서 입력해주세요.">
                                <datalist id="datalistOptions" name="domain">
                                    <option value="@naver.com">@naver.com</option>
                                    <option value="@gmail.com">@gmail.com</option>
                                    <option value="@hanmail.net">@hanmail.net</option>
                                    <option value="@kakao.com">@kakao.com</option>
                                    <option value="@daum.net">@daum.net</option>
                                </datalist>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td><textarea name="content" class="form-control" rows="5" id="comment"></textarea></td>
                        </tr>
                        <tr>
                            <td>비밀글여부</td>
                            <td><input name="lock" type="checkbox" value="Y"></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td><input name="password" type="password" class="form-control" maxlength="4" placeholder="1~4자리 숫자"></td>
                        </tr>
                    </table>
                    <div id="insert" align="center">
                        <button type="submit" class="btn btn-outline-dark" id="insertBtn">등록하기</button>
                    </div>
                </div>
             </form>
        </div>
        <%@include file = "../common/footer.jsp"%>
    </div>
</body>
</html>