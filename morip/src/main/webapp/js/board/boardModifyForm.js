 $(document).ready(function() {
 
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 400, //최소높이
	        maxHeight: null, //최대높이
	        focus: true,  //에디터 로딩 후 초커스를 맞출지 여부
	        lang : 'ko-KR' // 한글 설정
	  });
	}); 


$('document').ready(function(){
  $('.switch_infomation').hide();
  $('.writeOptionDiv').hide();
  $('.view_replyBoard').toggle();
  let option= $('.view_controlOption').offset();
});

$('.switch').mouseover(function(){
  $('.switch_infomation').show();
});
$('.switch').mouseout(function(){
  $('.switch_infomation').hide();
});


/*
$('#boardModifyBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val() ==''){
		alert("제목을 입력하세요");
	}else if($('#summernote').val() ==''){
		alert("내용을 입력하세요");
         
	}else{
		$.ajax({
			type: 'post',
			url: '/morip/board/boardModify',
			data: {'subject': $('#subject').val(),
				   'content': $('#summernote').val()},
			success: function(){
			$('#testBtn').trigger('click', 'continue');
					Swal.fire({
 					icon: 'success',
  					title: '글수정 완료!'
				}).then((result) => {
					if (result.value) {											
					location.href = '/morip/board/boardList';
					}
				})
			},
			error: function(err){
				console.log(err);
			}
		});
		
	}
});

*/


