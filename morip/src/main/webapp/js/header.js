$('.userPhoto').click(function(){ 
	$('.userMenu').toggle();
	$('.userMenu').css({
		position:'absolute',
		top:event.pageY+20,
		left:event.pageX-140,
		width:'200px',
		height:'126px',
		border:'1px solid gray'
	});
});


$('#blog').click(function(){
	location.href='../blog/blogList';	
});


$('#matzip').click(function(){
	location.href='../matzip/matzipListShow';	
});

// 로그인버튼
$('.header_loginBtn').click(function(){
	location.href='../member/loginForm';
});
// 마이페이지 버튼
$('.userPageBtn').click(function(){
	location.href='../myblog/mypage';
});
// 정보수정 버튼
$('.userSettingBtn').click(function(){
	location.href='../member/memberModifyForm';
});
// 로그오프 버튼
$('.userLogoutBtn').click(function(){
	location.href='../member/logout';
});
