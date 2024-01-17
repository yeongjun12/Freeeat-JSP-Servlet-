<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>

<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>댓글_목록</title>
   <style>
      * {
         box-sizing: border-box;
      }

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

      #mainContent {
         width: 90%;
         margin-top: 30px;
         margin: auto;
      }

      /*header 영역(첫번째 div)*/

      #header {
         width: 100%;
         /* border : 1px solid black; */
         display: flex;
         margin-top: 40px;
      }

      #header-left {

         width: 60px;
         height: 60px;
         margin-left: 20px;
         padding-top: 10px;
      }

      #header-center {
         width: 20%;
         font-size: 45px;
         margin-left: 15px;
      }

      #header-right {
         width: 80%;
         height: 50px;
         margin-top: 9px;
      }

      #myInput {
         background-image: url('/css/searchicon.png');
         background-position: 10px 10px;
         background-repeat: no-repeat;
         width: 60%;
         font-size: 16px;
         padding: 6px 0px 6px 40px;
         border: 1px solid #ddd;
         margin-bottom: 16px;
         margin-top: 7px;
      }

      #myInputBtn {
         width: 10%;
         height: 40px;
         font-size: 16px;
         cursor: pointer;
         margin-top: 7px;
         border: none;
      }

      /* 두번째 div */
      #middle {
         width: 100%;
         height: 40px;
         /* border: 2px solid blue; */
         margin-top: 30px;
         display: flex;
      }

      #delete-btn {
         width: 55px;
         height: 30px;
         /* border: 2px solid green; */
         margin-top: 6px;
         border-style: none;
      }

      #myInputBtn:hover,
      #delete-btn:hover {
         background-color: rgb(205, 205, 205);
      }

      #sort {
         width: 100px;
         height: 30px;
         /* border: 2px solid red; */
         margin-left: 910px;
         margin-top: 7px;
      }

      /* 세번째 div */
      #reply-table {
         border-collapse: collapse;
         width: 100%;
         /* border: 1px solid #ddd; */
         font-size: 18px;
         margin-top: 5px;
      }

      #reply-table th,
      #reply-table td {
         text-align: left;
         padding: 12px;
         text-align: center;
      }


      #reply-table tr {
         border-bottom: 1px solid #ddd;
      }

      #reply-table tr.tHeader,
      #reply-table tr:hover {
         background-color: #f1f1f1;
      }

   </style>
</head>

<body>

   <%@ include file="../common/adminMenubar.jsp" %>
      <div class="wrap">
         <div class="inner-wrap">


            <div id="mainContent">
               <div id="header">
                  <div>
                     <span class="material-symbols-outlined" style="font-size: 55px;">
                        chat
                     </span>
                  </div>
                  <div id="header-center">댓글</div>
                  <div id="header-right">
                     <input id="myInput" type="text" onkeyup="myFunction()" placeholder="Search for names.."
                        title="Type in a name">
                     <button id="myInputBtn" location.href="#">검색</button>
                  </div>
               </div>

               <hr style="border: 1px solid #ddd">

               <div id="middle">
                  <div>
                     <button location.href="#" id="delete-btn">삭제</button>
                  </div>
               </div>

               <form action="">
                  <table id="reply-table">
                  <thead>
                     <tr class="tHeader">
                        <th style="width:5%;"></th>
                        <th style="width:10%;">No.</th>
                        <th style="width:20%;">작성자</th>
                        <th style="width:45%;">내용</th>
                        <th style="width:10%;">피드번호</th>
                        <th style="width:10%;">관리</th>
                     </tr>
                   </thead>
				   <tbody>
					 
					 <!-- AJAX로 추가 -->
					 	
				   </tbody>

                  </table>
                 
               </form>
               <div id="addBtnArea">
			     <!-- <button type="button" class="btn btn-outline-primary" id="addBtn">더보기</button>  -->
               
               </div>
               <br>
              
            </div>
 	       </div>
			
			
			
		<script>
		
			$(function() {

				
				var lastRepNo = 10;
	
				$.ajax({					
					url : 'replyListAdd.sk',
					type : 'post',
					data : {lastNo:lastRepNo},
					success : function(list) {
						var str = '';
						var val = 0;
						for(var i in list) {
		                 str += '<tr>'
		                      + '<td><input type="checkbox"></td>'
		                      + '<td>' + list[i].replyNo + '</td>'
		                      + '<td>' + list[i].memNickName + '</td>'
		                      + '<td>' + list[i].replyContent + '</td>'
		                      + '<td class="moveTofeed">' +  list[i].feedNo + '</td>'
		                      + '<td>'
		                      + '<button class="btn btn-sm btn-outline-secondary">X</button>'
		                      + '</td>'
		                      + '</tr>';
		                      val = list[i].replyNo;
		                }
		
						$('#reply-table tbody').html(str);
		
						$('#addBtnArea').html('<button type="button" class="btn btn-outline-primary btn-block" id="addBtn">더보기</button>');
		
						lastRepNo += 10;
					},
					error : function() {
						alert('고장');
					}
					
				});
				
				
		
				
				$('#addBtnArea').on('click', '#addBtn', (function(){			
					
					$.ajax({					
						url : 'replyListAdd.sk',
						type : 'post',
						data : {lastNo:lastRepNo},
						success : function(list) {
							var str = '';
							var val = 0;
							for(var i in list) {
		                    str += '<tr>'
		                         + '<td><input type="checkbox"></td>'
		                         + '<td>'+ list[i].replyNo +'</td>'
		                         + '<td>'+ list[i].memNickName +'</td>'
		                         + '<td>'+ list[i].replyContent +'</td>'
		                         + '<td class="moveTofeed">'+ list[i].feedNo +'</td>'
		                         + '<td>'
		                          + '<button class="btn btn-sm btn-outline-secondary">X</button>'
		                         + '</td>'
		                         + '</tr>';
		                         val = list[i].replyNo;
		                       }	
		                   $('#reply-table tbody').html(str);
		                   lastRepNo += 10;
							if (val == 1) {
								$('#addBtnArea').html('<button type="button" class="btn btn-outline-secondary btn-block" id="addBtn">숨기기</button>');
								lastRepNo = 10;
							} else {
								$('#addBtnArea').html('<button type="button" class="btn btn-outline-primary btn-block" id="addBtn">더보기</button>');
							}
		                   
		                },
		                error : function() {
		                   alert('고장');
						}
						
					});
					
				}));
		
		
				
				$('#reply-table').on('click', '.moveTofeed', function() {
					location.href = "<%= contextPath %>/feedDetail.sk?fno=" + $(this).text(); 
				});			
				
				

				
					
				
			});




		
		
		
		
		</script>
			
			
			
			
			
			
			
			
			
			
			
			
			
			<!--
			
			<script>

			
			$(function() {
				
				var lastRepNo = 10;
			
				lastRepNo = selectReplyList(lastRepNo);
				
			});
			
			
			
			
			
			function selectReplyList(lastRepNo) {
			
				
				$.ajax({					
					url : 'replyListAdd.sk',
					type : 'post',
					data : {lastNo:lastRepNo},
					success : function(list) {
						var str = '';
						var val = 0;
						for(var i in list) {
                        str += '<tr>'
                             + '<td><input type="checkbox"></td>'
                             + '<td>'+ list[i].replyNo +'</td>'
                             + '<td>'+ list[i].memNickName +'</td>'
                             + '<td>'+ list[i].replyContent +'</td>'
                             + '<td class="moveTofeed">'+ list[i].feedNo +'</td>'
                             + '<td>'
                              + '<button class="btn btn-sm btn-outline-secondary">X</button>'
                             + '</td>'
                             + '</tr>';
                             val = list[i].replyNo;
                        }	
                        $('#reply-table tbody').html(str);
					    if (val == 1) {
					   		$('#addBtnArea').html('');
					    } else {
					    	$('#addBtnArea').html('<button type="button" class="btn btn-outline-primary" id="addBtn">더보기</button>');
					    }
                       lastRepNo += 10;
                       
                    },
                    error : function() {
                       alert('고장');
					}
					
				});
				
				
				return lastRepNo;
			}
			
			
			$('#addBtnArea').on('click', '#addBtn', function(lastRepNo) {
				
				selectReplyList(lastRepNo);
				
			});
			
			
			

			</script>
			
			-->
			
			

</body>

</html>