<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">
<%@ include file= "../common/menubar_hj.jsp" %>

<title>회원가입dd</title>


<style>

.btn_1 {

    background-color: #C8E183 ;
}

.table_Area  tr{
	height: 30px;
	border: 1px solid rgb(175, 171, 171);

	
}


</style>
</head>
<body>
  

    <div align="center" class="outer">
		<br>

		<h2 align="center" style="font-size:40px;" >회원가입</h2>
		<br>

		<form action="<%= contextPath %>/insert.yj" method="post" id="enroll-form">

			<!-- 아이디,비밀번호,이름,전화번호,이메일주소,주소,취미 -->

			<table class="table_Area" id="table_Area" align="center"  border="1" >
				<tr>
					<td> * 아이디</td>
					<td><input type="text" name="memId"  minlength="5"  placeholder="아이디는 5글자 이상입니다." required></td>
					<td><button type="button" onclick="idCheck();">중복확인</button></td>
				</tr>

                <tr>
					<td> * 닉네임</td>
					<td><input type="nickName" name="memNickName"    placeholder="닉네임을 입력하세요" required></td>
                    <td><button type="button" onclick="nickNameCheck()">중복확인</button></td>
				</tr>

				<tr>
					<td> * 비밀번호</td>
					<td><input type="password" name="memPwd"   size ="40"  required></td>
				</tr>
				<!-- <tr>
					<td style="font-size:13px;"> 비밀번호 확인</td>
					<td><input  type="password" maxlength="15"  size ="40" required></td>
					


				</tr> -->
				
				<tr>
					<td>휴대폰 번호 </td>
					<td><input type="text" name="phone" placeholder="숫자만 입력해주세요" required></td>
				</tr>

                <tr>
					<td>생년월일 </td>
					<td><input type="date" name="memBirth" required ></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" size="40" placeholder="@을 포함한 주소를 입력해주세요" required></td>

				</tr>
				
				<tr> 
					<td style="font-size:14px;">관심 카테고리</td>
					<td colspan="2" style="font-size:14px;">
						<input type="checkbox" id="lacto" value="락토" name="type"><label for="lacto">락토</label>
						<input type="checkbox" id="animal" value="동물복지" name="type"><label for="animal">동물복지</label>
						<input type="checkbox" id="lactofree" value="락토프리" name="type"><label for="lactofree">락토프리</label>
					    <input type="checkbox" id="sugarfree" value="슈가프리" name="type"><label for="sugarfree"> 슈가프리</label>
						<input type="checkbox" id="environment" value="환경" name="type"><label for="environment">환경</label>


						
						<button type="button" onclick="check();">확인</button>

					</td>


				</tr>

                <tr>
                    <td>거주지</td>
                    <td>
                        <select name="residence" id="residence" >
                            <option value="서울" selected>서울</option>
                            <option value="인천">인천</option>
                            <option value="경기">경기</option>
                            <option value="강원">강원</option>
                            <option value="충청">충청</option>
                            <option value="전라">전라</option>
                            <option value="경상">경상</option>
                            <option value="제주">제주</option>
                        </select>

                    </td>
                    
                </tr>


			</table>
			<br>
			<div align="center">
				<button class="btn_1" type="submit" disabled >회원가입</button>
				<button class="btn_2" type="reset">초기화</button>
			</div>
			<br><br>

		</form>

		</div>

		
    <div>
        <%@ include file= "../common/footer.jsp" %>

    </div>



	<script>
		function check() {
			if ($("input:checkbox[name='type']").is(":checked")==false) {
				alert("적어도 하나는 선택하여 주십시오.");
			
			}
			else {
				alert("ㅇㅋ통과!");
			}
		}


		function idCheck(){

			
		
				var $memId = $('#table_Area input[name=memId]');
			
				
				$.ajax({
					url : 'idCheck.yj',
					data : {checkId : $memId.val()},
					success : function(result){

						
						
						if(result == 'NNNNN') { 
							alert('이미 존재하거나 탈퇴한 회원의 아이디입니다.');
							// 재입력	
							$memId.focus();
						}
						else { 
							
						
							if(confirm('사용가능한 아이디입니다. 사용하시겠습니까?')){
								
							
								
								// 아이디 값은 이후에 변경이 불가능하도록 ==> readonly
								$memId.attr('readonly', true);
							}
							else{
								$memId.focus();
							}
						}
					},
					error : function(){
						console.log("아이디 중복체크용 비동기요청 실패");						
					}
					
				});
				
			};


	function nickNameCheck(){

			
		

	var $memNickName = $('#table_Area input[name=memNickName]');


	
	$.ajax({
		url : 'nickName.yj',
		data : {memNickName : $memNickName.val()},
		success : function(result){

			
			
			if(result == 'NNNNN') { 
				alert('이미 사용중인 닉네임 입니다.');
				
				$memNickName.focus();
			}
			else { 
				
				
				if(confirm('사용가능한 닉네임입니다. 사용하시겠습니까?')){
					
					
					$('#enroll-form button[type=submit]').removeAttr('disabled');
					
				
					$memNickName.attr('readonly', true);
				}
				else{
					$memNickName.focus();
				}
			}
		},
		error : function(){
			console.log("아이디 중복체크용 비동기요청 실패");						
		}
		
	});

};
			




		</script>

		


</body>
</html>