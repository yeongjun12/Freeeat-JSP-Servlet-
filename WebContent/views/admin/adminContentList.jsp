<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.common.model.vo.PageInfo, com.freeeat.content.model.vo.Content" %>
<%
	ArrayList<Content> list = (ArrayList<Content>)request.getAttribute("list");

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
<title>관리자 콘텐츠 목록</title>

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

    .content-menu {
        width: 100%;
        height: 50px;

    }

    .content-menu > table {
        width: 100%;
        font-size: 20px;
    }

    .content-container {
        text-align: center;
        font-size: 14px;
    }



</style>


</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>

    
    <div class="wrap">

        <div class="inner-wrap">

            <div class="content-header">
                <h1>콘텐츠 목록 보기</h1>
            </div>
    
            <br><br>
    
            <div class="content-menu">
                <table>
                    <tr>
                        <form action="">
                            <td style="text-align: center;">
                                검색
                            </td>
                            <td style="text-align: left;">
                                <input type="text" name="contentKeyword" placeholder="키워드 입력">
                                <button type="submit" class="btn btn-sm btn-outline-secondary">
                                    <span class="material-symbols-outlined">
                                        search
                                    </span>
                                </button>
                            </td>
                        </form>
                        <td style="text-align: right;">
                            <a href="<%= contextPath %>/contEnrollform.sk" class="btn btn-sm btn-outline-secondary">
                                <span class="material-symbols-outlined">
                                    edit
                                </span>
                                새글쓰기
                            </a>
                        </td>
                    </tr>
                </table>
            </div>
            <br>
            <div class="content-container">

                <table class="table table-bordered table-hover" id="contentTable">
                    <thead>
                        <tr>
                            <th>글번호</th>
                            <th>구분</th>
                            <th>제목</th>
                            <th>소개</th>
                            <th>출처</th>
                            <th>타입</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (!list.isEmpty()) { %>
                            <% for (Content cont : list) { %>
                                <tr>
                                    <td><%= cont.getContNo() %></td>
                                    <td><%= cont.getContCategory() %></td>
                                    <td><%= cont.getContTitle() %></td>
                                    <td><%= cont.getContInfo() %></td>
                                    <td><%= cont.getContSource() %></td>
                                    <td><%= cont.getMenuType() %></td>
                                </tr>
                            <% } %>
                        <% } else { %>
                            <tr>
                                <td colspan="6">등록된 글이 없습니다.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>

                <br>
                <!-- 페이징바 -->
                    <div class="pagination p1">
                       <ul>
                            <% if(currentPage != 1) { %>
                                <a href="<%= contextPath %>/contentList.sk?cpage=<%= currentPage - 1 %>"><li>&lt;</li></a>
                            <% } %>

                            <% for(int i = startPage; i <= endPage; i++) { %>
                                <% if(currentPage != i) { %>
                                    <a href="<%= contextPath %>/contentList.sk?cpage=<%= i %>"><li><%= i %></li></a>
                                <% } else { %>
                                    <a class="is-active" disabled><li><%= i %></li></a>
                                <% } %> 
                            <% } %>

                            <% if(!list.isEmpty() && maxPage != currentPage) { %>
                                <a href="<%= contextPath %>/contentList.sk?cpage=<%= currentPage + 1 %>"><li>&gt;</li></a>
                            <% } %>
                        </ul>
                    </div>
            </div>



        </div>

    </div>


    <script>


        $(function() {

            // 클릭해서 여러 글 삭제버튼 활성화
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


            // tr 클릭해서 수정 화면 요청
            $('#contentTable tbody tr').on('click', function() {
                <% if (!list.isEmpty()) { %>
                    location.href='<%= contextPath %>/updateContForm.sk?cno=' + $(this).children().eq(0).text();
                <% } %>
            });






        });



    </script>










</body>
</html>