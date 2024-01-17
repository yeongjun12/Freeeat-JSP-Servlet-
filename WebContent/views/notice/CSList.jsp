<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.freeeat.notice.model.vo.Qna, com.freeeat.common.model.vo.PageInfo" %>
<% 
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의내역</title>
<style>
    .outer{
        width: 100%;
        height: 1000px;
    }
    #header{
        height: 10%;
    }
    #content{
        height: 70%;
        margin: auto;
    }
    #footer{
        height: 20%;
    }   
    /* header */
    #header > h2{
        font-size: 35px;
        font-weight: 600;
    }
    #header #inquiryInsert{
        float: right;
    }
    /* content */


    /* footer-페이징바 */
    /* 페이징바 */
	.pagination{
  	padding: 30px 0;
	
	}

	.pagination ul{
	margin: 0;
	padding: 0;
	list-style-type: none;
	margin: auto;
	}

	.pagination a{
	display: inline-block;
	padding: 10px 18px;
	color: #222;
	}

	.p1 a{
	width: 40px;
	height: 40px;
	line-height: 40px;
	padding: 0;
	text-align: center;
	}

	.p1 a.is-active{
	background-color: #88A201;
	border-radius: 100%;
	color: #fff;
	}

    #header #insertBtn{
        padding-right: 30px;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <%@include file = "../common/menubar_hj.jsp"%>
    
    <%@include file = "../common/noticeFaqCs.jsp"%>
    
    <div class="outer">
        <br><br><br>
        <div id="header">
            <!-- 타이틀, 안내내용, 쓰기 버튼 -->
            <h2 align="center">1:1문의내역</h2>
            <div id="insertBtn">
                <a href="<%=contextPath%>/views/notice/CSEnrollForm.jsp" id="inquiryInsert" class="btn btn-outline-dark">1:1문의 쓰기</a>
            </div>
            <br>
        </div>   
        <div id="content">
            <!-- 문의게시글 목록 -->
            <div class="container">        
                <table class="table">
                    <p>
                        <b>상담시간</b> <br>
                        평일(월 ~ 금) 10:00 ~ 17:00 <br>
                        (Off-time 12:30 ~ 13:30, 토/일/공휴일 휴무) <br>
                        
                        한번 등록한 상담내용은 수정이 불가능합니다.   <br><br>
                    </p>
                    <thead>
                        <tr>
                            <th></th>
                            <th>카테고리</th>
                            <th>답변여부</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for(Qna q : list){%>
                            <tr class="tableList">
                            	<input type="hidden" id="lockYN" value="<%=q.getIsLocked()%>">
                            	<input type="hidden" id="PW" value="<%=q.getQnaPwd()%>">
                                <td width="30px">
                                	<%if(q.getIsLocked().equals("Y")){ %>
                                    <!-- lock -->
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
                                    </svg> 
                                	<%}else{ %>
                                    <!-- unlock -->
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-unlock" viewBox="0 0 16 16">
                                    <path d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2zM3 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1H3z"/>
                                    </svg>
                                    <%} %>
                                </td>
                                <td><%=q.getQnaCategory() %></td>
                                <%if(q.getAnsDate() != null){ %>
                                <td>해결완료</td>
                                <%}else{ %>
                                <td>답변대기</td>                                
                                <%} %>
                                <td><%=q.getQnaTitle() %></td>
                                <td><%=q.getQnaWriter() %></td>
                                <td><%=q.getQnaDate() %></td>
                            </tr>
                            <tr id="detailList" style="display: none;">
			                  <td colspan="6">
				               <div class="media border p-3" >
				                   <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-quora" viewBox="0 0 16 16">
				                       <path d="M8.73 12.476c-.554-1.091-1.204-2.193-2.473-2.193-.242 0-.484.04-.707.142l-.43-.863c.525-.45 1.373-.808 2.464-.808 1.697 0 2.568.818 3.26 1.86.41-.89.605-2.093.605-3.584 0-3.724-1.165-5.636-3.885-5.636-2.68 0-3.839 1.912-3.839 5.636 0 3.704 1.159 5.596 3.84 5.596.425 0 .811-.046 1.166-.15Zm.665 1.3a7.127 7.127 0 0 1-1.83.244C3.994 14.02.5 11.172.5 7.03.5 2.849 3.995 0 7.564 0c3.63 0 7.09 2.828 7.09 7.03 0 2.337-1.09 4.236-2.675 5.464.512.767 1.04 1.277 1.773 1.277.802 0 1.125-.62 1.179-1.105h1.043c.061.647-.262 3.334-3.178 3.334-1.767 0-2.7-1.024-3.4-2.224Z"/>
				                       </svg>
				                       &nbsp&nbsp
				                   
				                  <div class="media-body">
				                     <p><%=q.getQnaQ() %></p>
				                   	 <div class="media p-3">
				                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
				                            <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
				                        </svg>
				                        &nbsp&nbsp
				                        	<div class="media-body">
				                         <%if(q.getAnsDate()!=null){ %>
				                          <h8><%=q.getAnsDate()%> 답변완료</h8>
				                          <p><%=q.getQnaA() %></p>
				                         <%}else{ %>
				                          <h8>답변대기중입니다.</h8>
				                          <%} %>
				              	  			</div>
				              	  	  </div>
				           	 		</div>
				           	 	</div>
				           </td>
				    		<!-- 테이블 리스트  끝-->
									
                            </tr>
                    <!-- for문 끝 -->
                    <%} %>
                    </tbody>
                </table>
              </div>
        </div>

        
        <div id="footer">
            <!-- 페이징바, 문의게시글 검색 -->
		<div class="pagination p1">
				<ul>
				<%if(currentPage != 1){ %>
				  <a href="<%=contextPath%>/CSList.hj?cpage=<%=currentPage-1%>"><li><</li></a>
				 <%} %>
				 
				 <%for(int i = startPage; i<=endPage; i++){ %>	
				 		<%if(currentPage != i){ %>
				  		<a href="<%=contextPath%>/CSList.hj?cpage=<%=i%>"><li><%=i%></li></a>
				  		<%}else{ %>
				  		<a  class="is-active" href="#"><li><%= i %></li></a>
						<%} %>
					<%} %>
					
					
				<%if(maxPage != currentPage){ %>
				  <a href="<%=contextPath%>/CSList.hj?cpage=<%=currentPage+1%>"><li>></li></a>
				 <%} %>
				</ul>
			  </div>

        </div>
        <%@include file = "../common/footer.jsp"%>
    </div>
    <script>
        $(function(){
            $('table tr').click(function(){
            	
            	var PW = $(this).children('#PW').val();
            	var lockYN = $(this).children('#lockYN').val();
            	console.log(PW);
            	console.log(lockYN);
            	var $p = $(this).next();
            	
            	if(lockYN == 'Y'){
            		var pwd = prompt('비밀번호를 입력하세요.')
            		if(pwd == PW){
	                        if($p.css('display')=='none'){
	                            $p.siblings('#detail').slideUp();
	                            $p.slideDown();
	                        }else{
	                            $p.slideUp();
	                        }            		
                   	  }else{
            			alert('비밀번호가 일치하지 않습니다.');
            			}
         		}else{
	                if($p.css('display')=='none'){
	                    $p.siblings('#detail').slideUp();
	                    $p.slideDown();
	                }else{
	                    $p.slideUp();
                	}            		
           		}

            	
            });
	
            });
      

    </script>

</body>
</html>