// 저장하기버튼
$('#boardWriteBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();	
	if($('#subject').val() == ''){
		Swal.fire({
			icon: 'warning',
			title: '제목을 입력하세요.',
			confirmButtonText: '확인'
		})
	}else if($('#summernote').val() == ''){
		Swal.fire({
			icon: 'warning',
			title: '내용을 입력하세요.',
			confirmButtonText: '확인'
		})
	}else{
			
	}
});
// 리셋버튼
$('.resetBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();	
	$('#subject').val('');
	$('#summernote').summernote('reset');
});
// 공지등록
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
			url: '../admin/communityWrite',
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
					location.href = '../admin/dashboard';
					}
				})
			},
			error: function(err){
				console.log(err);
			}
		});		
	}
});	