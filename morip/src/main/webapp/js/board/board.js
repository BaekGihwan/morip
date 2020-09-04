/***************************boardWrite.jsp**********************************/

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

$('#boardWriteBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();	
	if($('#subject').val() ==''){
		Swal.fire({
			icon: 'warning',
			title: '제목을 입력하세요.',
			confirmButtonText: '확인'
			})
	}else if($('#summernote').val() ==''){
		Swal.fire({
			icon: 'warning',
			title: '내용을 입력하세요.',
			confirmButtonText: '확인'
			})
	}else{
		$.ajax({
			type: 'post',
			url: '/morip/board/boardWrite',
			data: {'subject': $('#subject').val(),
				   'content': $('#summernote').val()},
			success: function(){
			$('#testBtn').trigger('click', 'continue');
					Swal.fire({
 					icon: 'success',
  					title: '글작성 완료!',
  					text: '작성하신글이 저장 되었습니다.',
  					confirmButtonText: '확인'
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

$('.resetBtn').click(function(){
	$('#subject').val('');
	$('#summernote').summernote('reset');
});





