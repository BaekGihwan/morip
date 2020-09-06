//공지사항리스트
$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/morip/admin/getBoardList',
		data : '&nickname=' + '운영자',
		dataType: 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){	
				$('#contentFilter').html(items.content);
				let content = $('#contentFilter').text();				
				$('<tr/>').append($('<td/>',{
					text: items.boardtable_seq
				})).append($('<td/>',{
					text: items.subject
				})).append($('<td/>',{
					text: content
				})).append($('<td/>',{
					text: items.nickname
				})).append($('<td/>',{
					text: items.logtime
				})).append($('<td/>',{
					}).append($('<div/>',{
						id: 'deleteBtn',
						class: items.boardtable_seq+''
					}).append($('<i/>',{
						class: 'fas fa-trash-alt'
					})
				)))
				.appendTo($('#dataTable'));
			});
			
			//공지사항삭제
			$('#dataTable').on('click', '#deleteBtn', function(){
				let seq = $(this).attr('class');
				Swal.fire({
					title: '공지사항 삭제',
					text: "정말로 해당 공지사항을 삭제하시겠습까?",
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
							url : '/morip/admin/deleteBoard',
							data: '&seq=' + seq,
							dataType: 'text',
							success: function(data){
								Swal.fire({
									icon: 'success',
			  						title: '공시사항 삭제했습니다!',
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