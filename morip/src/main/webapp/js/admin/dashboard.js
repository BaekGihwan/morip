window.setTimeout('window.location.reload(true)',36000000);

$(document).ready(function(){
	// 일일방문자, 블로그, 게시판, 신규회원 불러오기  
	$.ajax({
		type: 'post',
		url: '../admin/dashboard',
		dataType: 'json',
		success: function(data){
			$('#todayEnter').text(data.todayDTO.countenter + '명');
			$('#todayblog').text(data.todayDTO.countblog + '개');
			$('#todayboard').text(data.todayDTO.countboard + '개');
			$('#todaySignUp').text(data.todayDTO.countsignup + '명');
		},
		error: function(err){
			console.log(err);
		}	
	}); // ajax
	
	// 총 회원수 불러오기
	$.ajax({
		type: 'post',
		url: '../admin/totalmember',
		dataType: 'json',
		success: function(data){
			$('#totalmember').text(data.totalmember + '명');
		},
		error: function(err){
			console.log(err);
		}	
	}); // ajax
	
	// 총 블로그 불러오기
	$.ajax({
		type: 'post',
		url: '../admin/totalblog',
		dataType: 'json',
		success: function(data){
			$('#totalblog').text(data.totalblog + '개');
		},
		error: function(err){
			console.log(err);
		}	
	}); // ajax
	
	// 총 게시판글 불러오기
	$.ajax({
		type: 'post',
		url: '../admin/totalboard',
		dataType: 'json',
		success: function(data){
			$('#totalboard').text(data.totalboard + '개');
		},
		error: function(err){
			console.log(err);
		}	
	}); // ajax
	
	// 총 맛집수 불러오기
	$.ajax({
		type: 'post',
		url: '../admin/totalmatzip',
		dataType: 'json',
		success: function(data){
			$('#totalmatzip').text(data.totalmatzip + '개');
		},
		error: function(err){
			console.log(err);
		}	
	}); // ajax
});