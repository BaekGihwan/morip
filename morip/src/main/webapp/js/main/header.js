// 개인 사진누르면 나오는 버튼
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

//집버튼 클릭
$('.homeBtn').click(function(){
	location.href='../main/index';	
});
// 블로그버튼
$('#blog').click(function(){
	location.href='../blog/blogList';	
});
// 맛집 버튼
$('#matzip').click(function(){
	location.href='../matzip/matzipListShow';	
});
// 커뮤니티 버튼
$('#board').click(function(){
	location.href='../board/boardList';	
});
// 고객센터 버튼
$('#serviceCenter').click(function(){
	location.href='../serviceCenter/serviceCenterList';	
});
// 로그인버튼
$('.header_loginBtn').click(function(){
	location.href='../member/loginForm';
});
// 마이페이지 버튼
$('.userPageBtn').click(function(){
	if($('#memEmail').val() == 'admin'){
		location.href='../admin/adminMain';
	}else{
		location.href='../myblog/mypage?nickname='+$('#nickname').val();
	}
	
});
// 정보수정 버튼
$('.userSettingBtn').click(function(){
	location.href='../member/memberModifyForm';
});
// 로그오프 버튼
$('.userLogoutBtn').click(function(){
	location.href='../member/logout';
});
