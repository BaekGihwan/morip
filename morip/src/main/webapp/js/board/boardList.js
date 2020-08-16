$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/morip/board/getBoardList',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.boardtable_seq
				})).append($('<td/>',{
					align: 'center'
					}).append($('<a/>',{
						id: 'subjectA',
						href: '#',
						text: items.subject,
						class: items.boardtable_seq+''
					}))
				).append($('<td/>',{
					align: 'center',
					text: items.nickname
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime
				})).append($('<td/>',{
					align: 'center',
					text: items.hit
				})).appendTo($('#boardListTable'));
				      
			}); //each
			
			//페이징 처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			//작성한 글 확인
			$('#boardListTable').on('click', '#subjectA', function(){
					let boardtable_seq = $(this).attr('class');
					let pg = data.pg;
					location.href = '/morip/board/boardView?boardtable_seq='+boardtable_seq+'&pg='+pg;
			});
		},
		error: function(err){
			console.log(err);
		}
	});//ajax
});




//검색
$('#boardSearchBtn').click(function(event, str){
	if(str != 'continue') $('input[name=pg]').val(1);
	
	if($('#keyword').val() == ''){
		alert('검색어를 입력하세요');
	}else{
		$.ajax({
			type : 'get',
			url : '/morip/board/getBoardSearch',
			data: {'pg': $('input[name=pg]').val(),
				   'searchOption': $('#searchOption').val(),
				   'keyword': $('#keyword').val()},
			dataType: 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				
				$('#boardListTable tr:gt(0)').remove();
					
				$.each(data.list, function(index, items){
					$('<tr/>').append($('<td/>',{
						align: 'center',
						text: items.boardtable_seq
					})).append($('<td/>',{
						align: 'center',
						text: items.subject
					})).append($('<td/>',{
						align: 'center',
						text: items.nickname
					})).append($('<td/>',{
						align: 'center',
						text: items.logtime
					})).append($('<td/>',{
						align: 'center',
						text: items.hit
					})).appendTo($('#boardListTable'));         
				}); //each
				
				//페이징 처리
				$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});




			