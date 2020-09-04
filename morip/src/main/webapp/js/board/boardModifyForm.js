


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





$('#boardModifyBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val() ==''){
		Swal.fire({
			icon: 'success',
			title: '제목을 입력하세요.',
			confirmButtonText: '확인'
			}).then((result) => {
		})
	}else if($('#summernote').val() ==''){
		Swal.fire({
			icon: 'success',
			title: '내용을 입력하세요.',
			confirmButtonText: '확인'
			}).then((result) => {
		})
         
	}else{
		$.ajax({
			type: 'post',
			url: '/morip/board/boardModify',
			data: {'subject': $('#subject').val(),
				   'content': $('#summernote').val(),
				   'boardtable_seq': $('#boardtable_seq').val()},
			success: function(){
			$('#testBtn').trigger('click', 'continue');
					Swal.fire({
 					icon: 'success',
 					confirmButtonText: '확인',
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


$('.resetBtn').click(function(){
	$('#subject').val('');
	$('#summernote').summernote('reset');
});


