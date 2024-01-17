<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>

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

    .editor {
        width: 100%;
        height: 300px;
        resize: none;
        padding: 10px;
    }


</style>


</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	

    <div class="wrap">
        <div class="inner-wrap">


            <div class="content-header">
                <h1>공지사항 작성하기</h1>
            </div>
    
            <br><br>
    
            <div class="content-enroll-form">
    
                <form action="<%= contextPath %>/insertNotice.sk" method="post">
    
                    <div id="contentEnrollForm">
    
                        <table class="table table-bordered content-enroll-table">
                            
                            <tr>
                                <th>제목</th>
                                <td colspan="3">
                                    <input type="text" name="noticeTitle" placeholder="제목을 입력해주세요" required>
                                </td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td colspan="3">
                                    <textarea name="noticeCont" class="editor" placeholder="내용을 입력해주세요" required></textarea>
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




	

</body>
</html>