<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/75c3f69c14.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/blog/blogList.css">
  <!--hover.css-->
  <link href="../css/hover.css" rel="stylesheet" />
  <!--AOS 라이브러리-->
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
</head>
<body>
<!-- contentFilter -->
  <div id="contentFilter" style="display: none;"></div>
  <input type="hidden" id="pg" value="1">
  <input type="hidden" id="email" value="${memEmail }">
  <input type="hidden" id="title" value="${title }">
  <br><br> 
 
  <div class="blogSearch">
    <input type="text" name="hashtagText" class="hashtagText" placeholder="     #해쉬태그를 입력하세요">
  	<input type="submit" class="hashtagSearchBtn" value="검  색" >  
  </div>
  <br><br>  
  <div class="morip_banner_slider">
  	<div class="img img0" id="divImg0">
  	  <div class="content" id="content0"><i class="fab fa-sistrix fa-2x"></i></div>
      <div class="img-cover"></div>
  	</div>
  
	<div class="img img1" id="divImg1">
  	  <div class="content" id="content1"> 서울 </div>
      <div class="img-cover"></div>
  	</div>
  
  	<div class="img img2" id="divImg2">
  	  <div class="content" id="content2"> 부산 </div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img3" id="divImg3">
  	  <div class="content" id="content3">대구</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img4" id="divImg4">
  	  <div class="content" id="content4"> 인천 </div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img5" id="divImg5">
  	  <div class="content" id="content5">광주</div>
      <div class="img-cover"></div>
  	</div>
  
  	<div class="img img6" id="divImg6">
  	  <div class="content" id="content6">대전</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img7" id="divImg7">
  	  <div class="content" id="content7">울산</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img8" id="divImg8">
  	  <div class="content" id="content8">강원도</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img9" id="divImg9">
  	  <div class="content" id="content9">경기도</div>
      <div class="img-cover"></div>
  	</div>
  
  	<div class="img img10" id="divImg10">
  	  <div class="content" id="content10">충북</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img11" id="divImg11">
  	  <div class="content" id="content11">충남</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img12" id="divImg12">
  	  <div class="content" id="content12">전북</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img13" id="divImg13">
  	  <div class="content" id="content13">전남</div>
      <div class="img-cover"></div>
  	</div>
  
  	<div class="img img14" id="divImg14">
  	  <div class="content" id="content14">경북</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img15" id="divImg15">
  	  <div class="content" id="content15">경남</div>
  	  <div class="img-cover"></div>
  	</div>
  	
  	<div class="img img16" id="divImg16">
  	  <div class="content" id="content16">제주도</div>
  	  <div class="img-cover"></div>
  	</div>
  </div>  
  <!-- 리스트 보여주기 -->
  <div class="writeBlog">
    <span class="write_text">#여행기</span>
    <!-- <p class="write_blog">블로그 작성하기</p> -->
    <c:if test="${memEmail ne null}">
  	  <button type="button" class="btn btn-outline-secondary write_blog" id="writeOptionBtn" >블로그 작성하기</button>
	</c:if>    
  </div>
  <!-- 인피니티! -->
  <div class="blogList_wrapper">    
  </div>
</body> 
  

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script type="text/javascript" src="../js/blog/blogList.js" ></script>
<script type="text/javascript">
AOS.init({
    easing: 'ease-out-back',
    duration: 1000
});
</script>
