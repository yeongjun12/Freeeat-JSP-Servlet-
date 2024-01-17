<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//String errorMsg = request.getAttribure("errorMsg");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>



<style>
	
	.outer{
		width:100%;
		
	}
	
	
	@font-face {
	    font-family: 'Happiness-Sans-Title';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/Happiness-Sans-Title.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}

</style>
</head>
<body>
	<div class="outer">
		<div width="500" align="center">
			<br>
			<h1 style="font-family: 'Happiness-Sans-Title'"> 요청하신 페이지는 현재 이용하실 수 없습니다. </h1>
			<h4 style="font-family: 'Happiness-Sans-Title'">이용불가 사유 : <%--<%= errorMsg --%></</h2>
		</div>
	</div>
</body>
</html>