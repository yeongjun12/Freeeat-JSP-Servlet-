<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.common.model.vo.PageInfo, com.freeeat.notice.model.vo.Notice" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");

    PageInfo pi = (PageInfo)request.getAttribute("pi");

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
<title>관리자 공지사항 목록</title>
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

    


</style>


</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>

    
    <div class="wrap">

        <div class="inner-wrap">

            <div class="content-header">
                <h1>공지사항 목록 보기</h1>
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
                        <a href="<%= contextPath %>/noticeEnrollform.sk" class="btn btn-sm btn-outline-secondary">
                            <span class="material-symbols-outlined" style="font-size:18px;">
                                edit
                            </span>
                            새글쓰기
                        </a>
                    </div>
                </div>
            </div>

            <br>
                
            <div class="content-container">
                <form action="<%= contextPath %>/deleteNotice.sk" method="post">
                    <table class="table table-bordered table-hover" id="contentTable">
                        <thead>
                            <tr>
                                <th>선택</th>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (list.isEmpty()) { %>
                                <tr>
                                   <td colspan="5">등록된 글이 없습니다.</td>
                                </tr>
                            <% } else { %>
                                <% for (Notice n : list) { %>
                                    <tr>
                                        <td><input type="checkbox" name="noticeNo" value="<%= n.getNoticeNo() %>"></td>
                                        <td><%= n.getNoticeNo() %></td>
                                        <td><%= n.getNoticeTitle() %></td>
                                        <td><%= n.getMemNickname() %></td>
                                        <td><%= n.getNoticeDate() %></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-warning noticeUpdate" type="button" onclick="location.href='<%= contextPath %>/updateNoticeForm.sk?nno=<%= n.getNoticeNo() %>'">수정</button>
                                        </td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                        <tfoot>
                            <% if (!list.isEmpty()) { %>
                                <tr style="border: none;">
                                    <td style="border: none;">
                                        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#noticeDeleteCheckModal" id="delete" disabled>
                                            삭제
                                        </button>                                      
                                    </td>
                                    <td colspan="5" style="border:none;"></td>
                                </tr>
                            <% } %>
                        </tfoot>
                    </table>
                    <!-- 목록에서 글 삭제 모달 -->
                    <div class="modal" id="noticeDeleteCheckModal">
                        <div class="modal-dialog">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
	                            <h4 class="modal-title">콘텐츠 삭제</h4>
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
                    <div class="pagination p1">
                       <ul>
                            <% if(currentPage != 1) { %>
                                <a href="<%= contextPath %>/noticeList.sk?cpage=<%= currentPage - 1 %>"><li>&lt;</li></a>
                            <% } %>

                            <% for(int i = startPage; i <= endPage; i++) { %>
                                <% if(currentPage != i) { %>
                                    <a href="<%= contextPath %>/noticeList.sk?cpage=<%= i %>"><li><%= i %></li></a>
                                <% } else { %>
                                    <a class="is-active" disabled><li><%= i %></li></a>
                                <% } %> 
                            <% } %>

                            <% if(!list.isEmpty() && maxPage != currentPage) { %>
                                <a href="<%= contextPath %>/noticeList.sk?cpage=<%= currentPage + 1 %>"><li>&gt;</li></a>
                            <% } %>
                        </ul>
                    </div>
                </div>
                
            </div>



        </div>

    </div>

    <script>


        $(function() {

            $('#contentTable').on('change', 'input[type=checkbox]', function() {
                
                var result = 0;
    
                for(var i = 0; i < <%= list.size() %>; i++) {
                    if($('#contentTable input[type=checkbox]').eq(i).is(':checked')) {
                        result++;
                    };
                };
                
                if(result > 0) {
                    $('#delete').removeAttr('disabled');
                }
                else {
                    $('#delete').attr('disabled', true);
                }
            });




        });



    </script>








</body>
</html>