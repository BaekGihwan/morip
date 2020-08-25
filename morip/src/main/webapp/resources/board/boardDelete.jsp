<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
window.onload=function(){
	$('#testBtn').trigger('click', 'continue');
	Swal.fire({
			icon: 'success',
			title: '글 삭제완료!'
	}).then((result) => {
		if (result.value) {											
		location.href='/morip/board/boardList';
		}
	}) 
}
</script>
