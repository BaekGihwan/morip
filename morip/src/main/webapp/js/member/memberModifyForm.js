var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
var regPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

// 정보수정 버튼
$('#memberModifyFormBtn').click(function(){
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();	
	$('#nickNameDiv').empty();	
	if($('#memberModifyFormPwd').val() == '') {
    	$('#pwdDiv').text('비밀번호를 입력하세요');
        $('#pwdDiv').css('color', 'red');
        $('#pwdDiv').css('font-size', '8pt');
        $('#pwdDiv').css('font-weight', 'bold');
        $('#memberModifyFormPwd').focus();    
    }else if($('#memberModifyFormRepwd').val() == '') {
    	$('#repwdDiv').text('재확인비밀번호를 입력하세요');
        $('#repwdDiv').css('color', 'red');
        $('#repwdDiv').css('font-size', '8pt');
        $('#repwdDiv').css('font-weight', 'bold');
        $('#memberModifyFormRepwd').focus();     	
    }else if($('#memberModifyFormPwd').val() != $('#memberModifyFormRepwd').val()){
    	$('#repwdDiv').text('비밀번호가 일치하지 않습니다.');
        $('#repwdDiv').css('color', 'red');
        $('#repwdDiv').css('font-size', '8pt');
        $('#repwdDiv').css('font-weight', 'bold');
        $('#memberModifyFormRepwd').focus();            
    }else if($('#memberModifyFormNickName').val() == ''){
    	$('#nickNameDiv').text('닉네임을 입력하세요.');
        $('#nickNameDiv').css('color', 'red');
        $('#nickNameDiv').css('font-size', '8pt');
        $('#nickNameDiv').css('font-weight', 'bold');
        $('#memberModifyFormNickName').focus();    
    }else {
		// a작스 실행
		Swal.fire({
 		icon: 'success',
  		title: '회원정보 수정완료!'
		}).then((result) => {
			if (result.value) {
				location.href='https://www.google.com';
			}
		})	
	}
});
// 리셋 버튼
$('#memberModifyFormResetBtn').click(function(){
	$('#memberModifyFormPwd').val("");
	$('#memberModifyFormRepwd').val("");
	$('#memberModifyFormNickName').val("");
});

// 회원탈퇴쪽
$('#memberModifyFormDropBtn').click(function(){
	/* swal("회원탈퇴 성공!", "이용해주셔서 감사합니다.", "success"); */
	Swal.fire({
		title: '회원탈퇴',
		text: "정말로 탈퇴하시겠습니까?",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Yes'
	}).then((result) => {
		if (result.value) {
			Swal.fire(
				'회원탈퇴완료',
      			'그동안 이용해주셔서 감사합니다.',
      			'success'
    		).then((result) => {
    			if (result.value) {
    				location.href='https://www.naver.com';
    			}
    		})
  		}
	})
});
// 비밀번호 조합
$('#memberModifyFormPwd').focusout(function(){
	if(!regPwd.test($('#memberModifyFormPwd').val())){
		$('#pwdDiv').text('8-15자 이내의 영문, 숫자, 특수문자 조합으로 입력해주세요!.');
        $('#pwdDiv').css('color', 'red');
        $('#pwdDiv').css('font-size', '8pt');
        $('#pwdDiv').css('font-weight', 'bold');
        $('#memberModifyFormPwd').focus();
	} else{
		$('#pwdDiv').text('');
		$('#repwd').focus();
	}
});

// 프로필 사진변경
$('input[type=file]').change(function(){
	console.log("change들어와야지");
	readURL(this);
});
function readURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('.modifyProfile').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
// 모디파이하기



