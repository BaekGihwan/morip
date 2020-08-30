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
