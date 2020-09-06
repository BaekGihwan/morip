//회원리스트
$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/morip/admin/getMemberList',
		dataType: 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				if(items.gender == "0") {
					items.gender = "남자";
				}else if(items.gender == "1"){
					items.gender = "여자";
				}
				$('<tr/>').append($('<td/>',{
					text: items.membertable_seq
				})).append($('<td/>',{
					text: items.name
				})).append($('<td/>',{
					text: items.email
				})).append($('<td/>',{
					text: items.nickname
				})).append($('<td/>',{
					text: items.idCardNumber1
				})).append($('<td/>',{
					text: items.gender
				})).append($('<td/>',{
					text: items.image
				})).append($('<td/>',{
					}).append($('<div/>',{
						id: 'deleteBtn',
						class: items.membertable_seq+''
					}).append($('<i/>',{
						class: 'fas fa-trash-alt'
					})
				)))
				.appendTo($('#dataTable'));
			});
			
			//회원삭제
			$('#dataTable').on('click', '#deleteBtn', function(){
				let seq = $(this).attr('class');
				Swal.fire({
					title: '회원탈퇴',
					text: "정말로 해당 회원을 지우시겠습까?",
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
			  		cancelButtonText: '취소',
				}).then((result) => {
					if (result.value) { 			
						$.ajax({
							type : 'post',
							url : '/morip/admin/deleteMember',
							data: 'seq=' + seq,
							dataType: 'text',
							success: function(data){
								Swal.fire({
				      				icon: 'success',
							  		title: '회원삭제완료!!',
							  		showConfirmButton: true,
							  		confirmButtonText: '확인'
			    				}).then((result) => {
					    			if (result.value) {
					    				location.href = data;
					    			}
					    		})
							},error: function(err){
								console.log(err);
							}
						});
			  		}
				})
			});
		},
		error: function(err){
			console.log(err);
		}
	});
});