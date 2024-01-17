<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.freeeat.qna.model.vo.Qna" %>
<%
	Qna qna = (Qna)request.getAttribute("qna");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 답변수정</title>

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
    }

    .content-enroll-form td input[type=text], .content-enroll-form td input[type=url] {
        width: 100%;
    }

    .editor {
        width: 100%;
        height: 150px;
        resize: none;
        padding: 10px;
    }
    
    .QNAeditor {
        width: 100%;
        height: 300px;
        resize: none;
        padding: 10px;
    }

    .content-enroll-btn {
        text-align: center;
    }


</style>


</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	

    <div class="wrap">
        <div class="inner-wrap">


            <div class="content-header">
                <h1>문의사항 답변하기</h1>
            </div>
    
            <br><br>
    
            <div class="content-enroll-form">
    
                <form action="<%= contextPath %>/updateAnswer.sk" method="post">
                	<input type="hidden" name="qnaNo" value="<%= qna.getQnaNo() %>">    
                    <div id="contentEnrollForm">
    
                        <table class="table table-bordered content-enroll-table">
                             <tr>
                                <th>질문글번호</th>
                                <td><%= qna.getQnaNo() %></td>
                                <th>카테고리</th>
                                <td>
                                    <select disabled>
                                        <option><%= qna.getQnaCategory() %></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td>
                                    <input type="text" name="qnaWriter" value="<%= qna.getQnaWriter() %>" disabled>
                                </td>
                                <th>작성일자</th>
                                <td>
                                    <input type="text" name="qnaDate" value="<%= qna.getQnaDate() %>" disabled>
                                </td>
                            </tr>
                            <tr>
                                <th>질문</th>
                                <td colspan="3">
                                    <input type="text" name="qnaTitle" value="<%= qna.getQnaTitle() %>" disabled>
                                </td>
                            </tr>
                            <tr>
                                <th>질문내용</th>
                                <td colspan="3">
                                    <textarea name="qnaQ" class="editor" disabled><%= qna.getQnaQ() %></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>답변</th>
                                <td colspan="3">
                                    <textarea name="qnaA" class="QNAeditor" placeholder="답변을 입력하세요"><%= qna.getQnaA() %></textarea>
                                </td>
                            </tr>
                        </table>
    
                    </div>
    
                    <br>
                    <div class="content-enroll-btn">
                        <button type="button" class="btn btn-sm btn-outline-warning" onclick="history.back();">취소하기</button>&nbsp;
                        <button type="submit" class="btn btn-sm btn-outline-primary">등록하기</button>
                    </div>
    
                </form>
                
    
            </div>


        </div>
    </div>
	
	
	

</body>
</html>