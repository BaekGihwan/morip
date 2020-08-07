<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
  <link rel="stylesheet" href="../css/header_footer.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/75c3f69c14.js" crossorigin="anonymous"></script>
</head>
<body>
  <header>
    <div class="header">
      <!-- 메인로고 -->
      <div class="header_logo">
        <a href="#">
          <img src="../image/logo.png" alt=메인로고>
        </a>
      </div>
      <!-- 가운데 메뉴 -->
      <div class="header_menu">
        <ul>
          <li><span id="blog">블로그</span></li>
          <li><span>지역맛집</span></li>
          <li><span>커뮤니티</span></li>
          <li><span>고객센터</span></li>
        </ul>
      </div>
      <!-- 로그인후 버튼 -->
      <div class="header_login header_afterLogin">
	    <button type="button"><i class="fas fa-home fa-2x"></i></button>&emsp;
	    <button type="button"><i class="fas fa-envelope fa-2x"></i></button>&emsp;
	    <button type="button"><i class="fas fa-heart fa-2x"></i></button>&emsp;
	    <button type="button"><i class="fas fa-cog fa-2x"></i></button>&emsp;
	    <button type="button"><i class="fas fa-sign-out-alt fa-2x"></i></button>
      </div>
    </div>
  </header>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$('#blog').click(function(){
	location.href='https://www.naver.com';	
});

</script>
