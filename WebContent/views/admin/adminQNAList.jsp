<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.common.model.vo.PageInfo, com.freeeat.qna.model.vo.Qna" %>
<%
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");

    PageInfo pi = (PageInfo)request.getAttribute("pi");
    
	int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	String answer = (String)request.getAttribute("answer");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 문의사항 목록</title>
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

    
    .search-bar > div {
        display: inline-block;
        width: 33%;
        padding: 10px;
    }


    .content-container {
        text-align: center;
    }

    #deleteCheckModal {
        display: none;
    }

    .btn-setting {
        position: absolute;
        top: 10px;
        left: 20%;
    }

    




</style>


</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>


    <script>
    
    	$(function() {
    		
    		$('#answerYN').click(function() {
                if($('#answerYN').is(':checked')) {
                    location.href = '<%= contextPath %>/qnaListN.sk?cpage=1&answer=no';
                } else {
                    location.href = '<%= contextPath %>/qnaList.sk?cpage=1';
                }

            });
    		
    		if('<%= answer %>' == 'no') {
    			$('#answerYN').attr('checked', true);
    		}
    		
    	});
    
    </script>
    
    <div class="wrap">

        <div class="inner-wrap">

            <div class="content-header">
                <h1>문의사항 목록 보기</h1>
            </div>

            <br><br>

            <div class="content-menu">
                <div class="search-bar">
                    <div>
                        <p>
                            총 <%= listCount %>개의 글
                        </p>
                    </div>
                    <div class="search-keyword">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="키워드 검색">
                            <div class="input-group-append">
                                <button class="btn btn-secondary" type="submit">
                                    <span class="material-symbols-outlined" style="font-size:18px;">
                                        search
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
	                <div class="search-answer" align="right">
	                    <input type="checkbox" id="answerYN"> 미답변
	                </div>
                </div>
            </div>

            <div class="content-container">
                <form action="<%= contextPath %>/deleteQna.sk" method="post">
                    <table class="table table-bordered table-hover" id="QNATable">
                        <thead>
                            <tr>
                                <th>선택</th>
                                <th>글번호</th>
                                <th>카테고리</th>
                                <th>문의글제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>답변여부</th>
                                <th>답변일</th>
                                <th>비밀글여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (list.isEmpty()) { %>
                                <tr>
                                    <td colspan="9">등록된 글이 없습니다.</td>
                                </tr>
                            <% } else { %>
                                <% for (Qna qna : list) { %>
                                    <tr>
                                        <td><input type="checkbox" name="qnaNo" value="<%= qna.getQnaNo() %>"></td>
                                        <td><%= qna.getQnaNo() %></td>
                                        <td><%= qna.getQnaCategory() %></td>
                                        <td><%= qna.getQnaTitle() %></td>
                                        <td><%= qna.getQnaWriter() %></td>
                                        <td><%= qna.getQnaDate() %></td>
                                        <td style="position:relative">
                                        	<%= qna.getAnsYN() %>
                                            <% if(qna.getAnsYN().equals("미답변")) { %>
                                                <button type="button" class="btn btn-sm btn-success btn-setting" style="display: none;" onclick="location.href='<%= contextPath %>/qnaAnswerForm.sk?qno=<%= qna.getQnaNo() %>'">
                                                    답변하기
                                                </button>
                                            <% } else { %>
                                                <button type="button" class="btn btn-sm btn-warning btn-setting" style="display: none;" onclick="location.href='<%= contextPath %>/qnaUpdateForm.sk?qno=<%= qna.getQnaNo() %>'">
                                                    답변수정
                                                </button>
                                            <% } %>
                                        </td>
                                        <td>
                                        	<%= qna.getAnsDate() %>
                                        
                                        </td>
                                        <td><%= qna.getIsLocked() %></td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                        <tfoot>
                            <tr style="border: none;">
                                <% if (!list.isEmpty()) { %>
                                    <tr style="border: none;">
                                        <td style="border: none;">
                                            <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#deleteCheckModal" id="delete" disabled>
                                                        삭제
                                            </button>                                      
                                        </td>
                                        <td colspan="5" style="border:none;"></td>
                                    </tr>
                                <% } %>
                        </tfoot>
                    </table>
                    <!-- 목록에서 글 삭제 모달 -->
                    <div class="modal" id="deleteCheckModal">
                        <div class="modal-dialog">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">문의사항 삭제</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                해당 글을 모두 삭제하시겠습니까?
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary">확인</button>
                            </div>
                        </div>
                        </div>
                    </div>
                </form>
                <br>

                <div id="footer">
                    <!-- 페이징바 -->
                    <% if (answer != null) { %>
	                    <div class="pagination p1">
	                       <ul>
	                            <% if(currentPage != 1) { %>
	                                <a href="<%= contextPath %>/qnaListN.sk?cpage=<%= currentPage - 1 %>&answer=no"><li>&lt;</li></a>
	                            <% } %>
	
	                            <% for(int i = startPage; i <= endPage; i++) { %>
	                                <% if(currentPage != i) { %>
	                                    <a href="<%= contextPath %>/qnaListN.sk?cpage=<%= i %>&answer=no"><li><%= i %></li></a>
	                                <% } else { %>
	                                    <a class="is-active" disabled><li><%= i %></li></a>
	                                <% } %> 
	                            <% } %>
	
	                            <% if(!list.isEmpty() && maxPage != currentPage) { %>
	                                <a href="<%= contextPath %>/qnaListN.sk?cpage=<%= currentPage + 1 %>&answer=no"><li>&gt;</li></a>
	                            <% } %>
	                        </ul>
	                    </div>
                    <% } else { %>
	                    <div class="pagination p1">
	                       <ul>
	                            <% if(currentPage != 1) { %>
	                                <a href="<%= contextPath %>/qnaList.sk?cpage=<%= currentPage - 1 %>"><li>&lt;</li></a>
	                            <% } %>
	
	                            <% for(int i = startPage; i <= endPage; i++) { %>
	                                <% if(currentPage != i) { %>
	                                    <a href="<%= contextPath %>/qnaList.sk?cpage=<%= i %>"><li><%= i %></li></a>
	                                <% } else { %>
	                                    <a class="is-active" disabled><li><%= i %></li></a>
	                                <% } %> 
	                            <% } %>
	
	                            <% if(!list.isEmpty() && maxPage != currentPage) { %>
	                                <a href="<%= contextPath %>/qnaList.sk?cpage=<%= currentPage + 1 %>"><li>&gt;</li></a>
	                            <% } %>
	                        </ul>
	                    </div>
                    <% } %>
                </div>


            </div>



        </div>

    </div>

    <script>


        $(function() {

            $('#QNATable').on('change', 'input[type=checkbox]', function() {
                
                var result = 0;

                $('#QNATable input[type=checkbox]').each(function() {
                    if ($(this).is(':checked')) {
                        result++;
                    }
                });
                
                if(result > 0) {
                    $('#delete').removeAttr('disabled');
                }
                else {
                    $('#delete').attr('disabled', true);
                }

            });


            $('#QNATable tbody tr').hover(function(){
                $(this).find('.btn-setting').css('display', 'inline-block');
            }, function() {
                $(this).find('.btn-setting').css('display', 'none');
            });




        });



    </script>








</body>
</html>