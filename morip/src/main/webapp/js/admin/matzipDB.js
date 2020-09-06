$(document).ready(function(){
	$.ajax({
		type:'post',
		url:'../matzip/matzipListAll',
		dataType:'json',
		success:function(data){
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					text: index+1
				})).append($('<td/>',{
					text:items.category
				})).append($('<td/>',{
					text: items.title
				})).append($('<td/>',{
					text: items.telephone
				})).append($('<td/>',{
					text: items.address
				})).append($('<td/>',{
					text: items.roadAddress
				})).append($('<td/>',{
					}).append($('<div/>',{
						id: 'deleteBtn',
						class: 'matzipDeleteBtn'
					}).append($('<i/>',{
						class:'fas fa-trash-alt'
					})
					)))
				.appendTo($('#matzipDBBody'));
			}); //each
		},
		error:function(err){
			console.log(err);
		}
	});
});

 $('#matzipDBBody').on('click','.matzipDeleteBtn', function(){
 	$.ajax({
 		type:'post',
 		url:'../matzip/deleteMatzip',
 		data:'title='+$(this).parent().siblings().eq(2).text(),
 		success:function(){
 			Swal.fire({
			  icon: 'success',
			  title: '삭제했습니다!',
			  showConfirmButton: false,
			  timer: 1500
			})
 		},
 		error:function(err){
 			console.log(err);
 		}
 	});
 });