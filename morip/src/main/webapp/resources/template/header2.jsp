<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
  <link rel="stylesheet" href="../css/main/header.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/75c3f69c14.js" crossorigin="anonymous"></script>
</head>
<body onLoad="pageStart()">
  <header >
    <div class="header">
      <!-- 메인로고 -->
      <div class="header_logo">
        <a href="../main/index">
          <img src="../image/main/logo.png" alt=메인로고>
        </a>
      </div>
      <!-- 가운데 메뉴 -->
      <div class="header_menu">
        <ul>
          <li><span id="blog">블로그</span></li>
          <li><span id="matzip">지역맛집</span></li>
          <li><span>커뮤니티</span></li>
          <li><span>고객센터</span></li>
        </ul>
      </div>
      <!-- 로그인후 버튼 -->
      <div class="header_login header_afterLogin">
        <button type="button"><i class="fas fa-home fa-2x"></i></button>&emsp;
        <button type="button"><i class="fas fa-envelope fa-2x"></i></button>&emsp;
	    <button type="button"><i class="fas fa-heart fa-2x"></i></button>&emsp;
	   <!--  <button type="button" class="userPhoto" style="background-image: url('../image/testimg.png')"></button>&emsp; -->
		<img class="userPhoto" alt="" src="../storage/${userPhoto }">
		<!-- userPhoto을 누르면 나오는 메뉴바 -->
      	<div class="userMenu">
      	  <input type="hidden"  id="clickCheck" value="on">
      	  <button class="userPageBtn">
      	    <i class="fas fa-user-alt mypage" aria-hidden="true"></i>&nbsp;&nbsp;마이페이지
      	  </button>      	  
      	  <button class="userSettingBtn">
      	    <i class="far fas fa-cog modify" aria-hidden="true"></i>&nbsp;&nbsp;정보수정
      	  </button>      	  
      	  <button class="userLogoutBtn">
      	    <i class="fas fa-sign-out-alt logout" aria-hidden="true"></i>&nbsp;&nbsp;로그아웃
      	  </button>      	  
      	</div>
      </div>
    </div>
  </header>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/main/header.js" ></script>
<script type="text/javascript">
/* $(function () {
let email = ${memEmail };
alert(email);
	$.ajax({
		type: 'post',
		url: '/morip/member/checkId',
		data: 'email=' + email,
		dataType: 'json',
		success: function(data){
			alert(JSON.stringify(data));
		},
		error: function(err){
			console.log(err);
		}
	});
});  */

</script>
