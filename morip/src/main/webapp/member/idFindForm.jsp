<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../css/idFind.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<!--===============================================================================================-->
</head>
<body>

	<div class="container-idFindForm">
		
			<span class="idFindFormTitle">아이디 찾기</span>
			<hr align="center" width="400px" size="4" color="black">
<!---------------------------------------------------------------------->
			<div class="container-idFindForm-text">
			
				<div class="container-idFindFormId">
					<span class="idFindForm-Id">이름</span>
				</div>

				<input id="name" name="name" type="text" placeholder="이름을 입력하세요">
				<div id="nameDiv"></div>
<!---------------------------------------------------------------------->
				<div class="container-idFindForm-resident">
					<span class="idFindForm-resident">주민번호</span>
					<!-- &emsp;&emsp;<input type="text" id="residenDiv" value="유효성검사"> -->
				</div>

					<input class="idFindFormResident" type="text" id="idCardNumber1" name="idCardNumber1" maxlength=6> -
					<input class="idFindFormResident" type="password" id="idCardNumber2" name="idCardNumber2" maxlength=7> 
				
				<div id="residenDiv" style="color: red; font-size: 3"></div>
<!---------------------------------------------------------------------->
				<div class="container-idFindFormBtn">
					<button type="button" id="idFindBtn" >아이디 찾기</button>
					<button id="idFindFormresetBtn" type="reset">다시작성</button>
				</div>
<!---------------------------------------------------------------------------->

<!---------------------------------------------------------------------------->
			</div>
				<div id="modal" style="border: 1px red solid;">
					<div class="modal_content" style="border: 1px blue solid;">
						<span class = "modaltext">아이디 찾기 </span><br><br>
						<hr align="center" width="400px" size="2" color="black">
						
						<div id="modalId-">
							<div id="modalname"> </div> <span id="modalspan">회원님의 아이디는 </span></br>
							<div id="modalId"></div> <span id="modalspan">입니다.</span>
						</div>
						<div class="madalBtn-">
						<button id="modalBtn" type= "submit">확 인</button>
						<button id="cancelBtn">취 소</button>
						</div>
				</div>
					
					<div class="modal_layer"></div>
				
			</div>
			
		
	</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">	

//아이디찾기
$('#idFindBtn').click(function(){
		$('#nameDiv').empty();
		$('#residenDiv').empty();
		
	    if($('#name').val() == '') { 
	        $('#nameDiv').text('이름을 입력하세요.');
	        $('#nameDiv').css('color', 'red');
	        $('#nameDiv').css('font-size', '8pt');
	        $('#nameDiv').css('font-weight', 'bold');
	        $('#name').focus();
	        
	    }else if($('#idCardNumber1').val() == '') { 
	        $('#residenDiv').text('주민번호를 입력하세요.');
	        $('#residenDiv').css('color', 'red');
	        $('#residenDiv').css('font-size', '8pt');
	        $('#residenDiv').css('font-weight', 'bold');
	        $('#idCardNumber1').focus();
	    }else if($('#idCardNumber2').val() == '') { 
	        $('#residenDiv').text('주민번호를 입력하세요.');
	        $('#residenDiv').css('color', 'red');
	        $('#residenDiv').css('font-size', '8pt');
	        $('#residenDiv').css('font-weight', 'bold');
	        $('#idCardNumber2').focus();    
	        
	    }else{
    		$.ajax({
	   			type: 'post',
	   			url: '/morip/member/findId',
	   			data: {	'name': $('#name').val(),
	   					'idCard1': $('#idCardNumber1').val(),
						'idCard2': $('#idCardNumber2').val(),	},
				dataType : 'json',		
	   			success: function(data){
	   				//alert(JSON.stringify(data));
	   				$('#modal').css({
			      		"display": "block"
			   		});
	   				$('#modalname').text($('#name').val());
	   				$('#modalId').text(data.memberDTO.email);
	   			},
	   			error: function(err){
	   				console.log(err);
	   			}
   			}); // ajax
   			
    		$('#modalBtn').click(function(){
    			location.href="../member/loginForm.jsp";
    		});
   	 	}
});

document.getElementById("cancelBtn").onclick = function() {
    document.getElementById("modal").style.display="none";//모달창 닫기했을때 창끄기
} 

</script>

</body>
</html>