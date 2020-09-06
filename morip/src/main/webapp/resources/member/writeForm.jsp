<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="../css/member/writeForm.css">
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!--===============================================================================================-->

</head>
<body>
<c:if test="${kakaoEmail != null }">
	<input type="hidden" id="email" value="${kakaoEmail }">
	<input type="hidden" id="pwd" value=null>
	<input type="hidden" id="checkid" value="0">
</c:if>
<c:if test="${googleEmail != null }">
	<input type="hidden" id="email" value="${googleEmail }">
	<input type="hidden" id="pwd" value=null>
	<input type="hidden" id="checkid" value="0">
</c:if>
<c:if test="${email != null }">
	<input type="hidden" id="email" value="${email }">
	<input type="hidden" id="pwd" value="${pwd }">
	<input type="hidden" id="checkid" value="1">
</c:if>

	<div class="container-writeForm">
		<form class="writeForm">
			<span class="writeFormTitle">추가정보</span>
			<!-- <hr align="center" width="400px" size="4" color="black"> -->
			<div class="hr"></div>
<!---------------------------------------------------------------------->
			<div class="container-writeForm-text">
			
				<div class="container-writeFormId">
					<span class="writeForm-Id">이름</span>
				</div>

				<input id="name" type="text" placeholder="이름을 입력하세요">
				<div id="nameDiv"></div>
<!---------------------------------------------------------------------->
			<div class="container-writeFormNickName">
               <span class="writeForm-NickName">닉네임</span>
            </div>

            <input id="nickName" type="text" placeholder="닉네임을 입력하세요"> 
            <div id="nickNameDiv"></div>
<!---------------------------------------------------------------------->
				<div class="container-writeForm-resident">
					<span class="writeForm-resident">주민번호<div id="residentDiv"></div></span>
					<!-- &emsp;&emsp;<input type="text" id="residenDiv" value="유효성검사"> -->
				</div>

					<input class="writeFormResident" type="text" id="idCardNumber1" maxlength=6> -
					<input class="writeFormResident" type="password" id="idCardNumber2" maxlength=7> 
				
				<div class="writeForm-residenDiv" id="writeForm-residenDiv" style="font-size: 3"></div>
<!---------------------------------------------------------------------->
				<div class="container-writeForm-gender">
					<span class="writeForm-gender">성별</span>
				</div>

				<span>
					<input id="gender1" type="radio" name="gender" value="0" checked> 남 &emsp;&emsp;
					<input id="gender2" type="radio" name="gender" value="1"> 여
				</span>
<!---------------------------------------------------------------------->
				<div class="container-writeFormBtn">
					<button type="button" id="writeBtn">가입하기</button>
					<button id="writeFormresetBtn" type="reset">다시작성</button>
				</div>
<!---------------------------------------------------------------------------->
			</div>
		</form>
	</div>

</body>

<script type="text/javascript"src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
$('#writeBtn').click(function(){
	var email = $('#email').val();
	var pwd = $('#pwd').val();
	var nickname = $('#nickName').val();
	var name = $('#name').val();
	var idCardNumber1 = $('#idCardNumber1').val();
	var idCardNumber2 = $('#idCardNumber2').val();
	var gender = document.getElementsByName('gender');
	var genderChoice; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
	for(var i=0; i<gender.length; i++) {
	    if(gender[i].checked) {
	        genderChoice = gender[i].value;
	    }
	}
	var checkid = $('#checkid').val();
	$.ajax({
		type : 'post',
		url : '/morip/member/moripWrite',
		data : 'email=' + email + '&name=' + name+ '&pwd=' + pwd + '&nickname=' + nickname
				+ '&idCardNumber1=' + idCardNumber1 + '&idCardNumber2=' + idCardNumber2 + '&gender=' + genderChoice + '&checkid=' + checkid,
		dataType : 'json',
		success : function(data) {
			if (data.memberDTO != null) {
				Swal.fire({
					title: '가입 성공',
					text: "로그인 화면으로 이동합니다.",
					icon: 'success',
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: 'Yes'
				}).then((result) => {
					if (result.value) {
						location.href='../member/loginForm';
					}
				})
			} else {
				Swal.fire({
					title: '가입 실패',
					text: "로그인 화면으로 이동합니다.",
					icon: 'warning',
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: 'Yes'
				}).then((result) => {
					if (result.value) {
						location.href='../member/loginForm';
					}
				})
			}
		},
		error : function(err) {
			console.log(err);
		}
	});
});

/* ---------------------- 닉네임 존재 유무 ------------------------ */
$('#nickName').focusout(function(){
	if ($('#nickName').val() == '') {
		$('#nickNameDiv').text('닉네임을 입력해주세요.');
		$('#nickNameDiv').css('color', 'red');
		$('#nameDiv').css('font-size', '9pt');
        $('#nickNameDiv').css('font-weight', 'bold');
        $('#nickName').focus();
	} else {
		$.ajax({
			type : 'post',
			url : '/morip/member/checkNickname',
			data : '&nickname=' + $('#nickName').val(),
			dataType : 'json',
			success : function(data) {
				if (data.memberDTO == null) {
					$('#nickNameDiv').text('사용가능한 닉네임입니다.');
					$('#nickNameDiv').css('color', 'blue');
					$('#nameDiv').css('font-size', '9pt');
			        $('#nickNameDiv').css('font-weight', 'bold');
				} else {
					$('#nickNameDiv').text('존재하는 닉네임입니다.');
					$('#nickNameDiv').css('color', 'red');
					$('#nameDiv').css('font-size', '9pt');
			        $('#nickNameDiv').css('font-weight', 'bold');
			        $('#nickName').focus();
				}
			},
			error : function(err) {
				console.log(err);
			}
		});	
	}
});

/*----------------------- 주민번호 유효성 검사 ----------------------*/
$('#idCardNumber1').focusout(function(){
	$('#writeForm-residenDiv').empty();
	if($('#idCardNumber2').val()==''){
		$('#writeForm-residenDiv').text('주민번호를 입력해주세요.');
        $('#writeForm-residenDiv').css('color', 'red');
        $('#writeForm-residenDiv').css('font-size', '9pt');
        $('#writeForm-residenDiv').css('font-weight', 'bold');
	}
});
$('#idCardNumber2').focusout(function(){
	$('#writeForm-residenDiv').empty();
	if($('#idCardNumber1').val()=='' || $('#idCardNumber2').val()==''){
		$('#writeForm-residenDiv').text('주민번호를 입력해주세요.')
        $('#writeForm-residenDiv').css('color', 'red')
        $('#writeForm-residenDiv').css('font-size', '9pt');
        $('#writeForm-residenDiv').css('font-weight', 'bold')
	}else {
		var num1 = document.getElementById("idCardNumber1");
        var num2 = document.getElementById("idCardNumber2");
		var arrNum1 = new Array();
		var arrNum2 = new Array();
		for (var i=0; i<num1.value.length; i++) {
            arrNum1[i] = num1.value.charAt(i);
        } // 주민번호 앞자리를 배열에 순서대로 담는다.

        for (var i=0; i<num2.value.length; i++) {
            arrNum2[i] = num2.value.charAt(i);
        } // 주민번호 뒷자리를 배열에 순서대로 담는다.

        var tempSum=0;

        for (var i=0; i<num1.value.length; i++) {
            tempSum += arrNum1[i] * (2+i);
        } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함

        for (var i=0; i<num2.value.length-1; i++) {
            if(i>=2) {
                tempSum += arrNum2[i] * i;
            }
            else {
                tempSum += arrNum2[i] * (8+i);
            }
        } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함

        if((11-(tempSum%11))%10!=arrNum2[6]) {
        	$('#writeForm-residenDiv').text('올바른 주민번호가 아닙니다.')
            $('#writeForm-residenDiv').css('color', 'red')
            $('#writeForm-residenDiv').css('font-size', '9pt');
            $('#writeForm-residenDiv').css('font-weight', 'bold')
            return false;
        }else{
        	$('#writeForm-residenDiv').text('올바른 주민번호 입니다.')
            $('#writeForm-residenDiv').css('color', 'blue')
            $('#writeForm-residenDiv').css('font-size', '9pt');
            $('#writeForm-residenDiv').css('font-weight', 'bold')
        }
	}
});
</script>