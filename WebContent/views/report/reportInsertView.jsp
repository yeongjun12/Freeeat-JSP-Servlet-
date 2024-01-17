<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.freeeat.member.model.vo.*" %>    
<%
	String contextPath = request.getContextPath();
	Member m = (Member)request.getAttribute("member");
	Member loginMem = (Member)session.getAttribute("loginMem");
	
	String msg = (String)request.getAttribute("msg");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<style>
	 @font-face {
		font-family: 'S-CoreDream-3Light';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	body {
		font-family: 'S-CoreDream-3Light';
		background-color: rgb(253, 219, 219);
	}


	#reprot_outer{
		width:550px;
		height:840px;
	}


	
	#report_title{
		margin-top: 20px;
		text-align : center;
	}

	#report_title > h1{
		font-weight: 900;
	}

	#report-content-area{
		margin-top: 10px;
		display: flex;
		width:500px;
	}
	
	#report-content-area{
		margin-bottom : 15px;
	
	}
	
	#report-content-area .rca-left{
		width:100px;
		text-align:center;
		font-size:15px;
		padding-right: 10px;
	
	}
	#report-content-area .rca-right{
		 
	}
	
	
	#report-write{
	
		text-align: center;
	}

	#report-write > textarea{
		margin: auto;
	}
	
	#submit-area{
		text-align: center;	
	}

	#select-report td{
		margin: auto;
		width:100%;
	}

	#report-wrap{
		width:500px;
		margin-top:20px;
		margin: auto;
	}
</style>


</head>
<body>
	<div id="report_outer"> 
		<div id="report-wrap">
			<div id="report_top_area">
				<div id="report_title"><h1>신고하기</h1></div>
				
				<% if(m!=null){ %>
				<table id="report-content-area">
					<tr>
						<th class="rca-left">작성자</th>
						
						<td class="rca-right"><%= m.getMemNickName() %></td>
					</tr>
					
					
					<tr>
						<th class="rca-left">내용</th>
						<td class="rca-right"><%= m.getMem_profile_savePath() %></td>
					</tr>
				</table>
				<% } %>
			</div>
			
			<br>
			
			<% if (loginMem != null && m != null){ %>
			<form action="<%= contextPath%>/reportInsert.mr" method="get">
				<input type="hidden" name="loginMemNo" value="<%= loginMem.getMemNo() %>"/>
				<input type="hidden" name="reviewNo" value="<%= m.getReviewNo() %>"/>
				<div id="report-main-area"></div>
					<h5> 사유 선택 </h5>
					
					<div id="select-report">

						<table>
							<tr>
								<td>
									<label for="reason1">
										<input id="reason1" name="report-reason" type="radio" value="스팸홍보/도배글입니다." checked>스팸홍보/도배글입니다.
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="reason2">
										<input id="reason2" name="report-reason" type="radio" value="음란물입니다.">음란물입니다.
									</label>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="reason3">
										<input id="reason3" name="report-reason" type="radio" value="불법정보를 포함하고 있습니다.">불법정보를 포함하고 있습니다.
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="reason4">
										<input id="reason4" name="report-reason" type="radio" value="개인정보 노출 게시물입니다.">개인정보 노출 게시물입니다.
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="reason5">
										<input id="reason5" name="report-reason" type="radio" value="욕설/생명경시/혐오/차별적 표현입니다.">욕설/생명경시/혐오/차별적 표현입니다.
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="reason6">
										<input id="reason6" name="report-reason" type="radio" value="불쾌한 표현이 있습니다.">불쾌한 표현이 있습니다.
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="reason7">
										<input id="reason7" name="report-reason" type="radio" value="기타">기타
									</label>
									<div id="report-write" >
										<textarea name="report-plus" style="width:450px; height:200px; resize:none;" placeholder="기타 선택시 필수 입력입니다." ></textarea>
									</div>
								</td>
							</tr>
						</table>

					</div>
					
				</div>
				
				<div id="submit-area">				
					<input type="submit" value="신고하기" />
				</div>
			</form>
		<% } %>
	
		</div>
	 </div>
	 
	 <script>
		// 기타 눌렸을 때 텍스트박스 입력 안하면 안넘어 가게 
	 	$('#reason7').on('click', function(){
			if($('#reason7').prop('checked') == true){
				$('#report-write').children().attr('required', true);
			} else {
				$('#report-write').children().attr('required', false);
				
			}
	 	})
	 	
	 	


	 </script>
	 

	
</body>
</html>