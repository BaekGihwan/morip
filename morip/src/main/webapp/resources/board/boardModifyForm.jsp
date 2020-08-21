<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="../css/board/boardModifyForm.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!--===============================================================================================-->
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <!--AOS 라이브러리-->
     <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
     <!--hover.css-->
     <link href="../../css/board/hover.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/board/board.css" rel="stylesheet" />
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    
    <!-- 썸머노트부분 -->
    <!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<!-- include summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="/js/board/summernote-ko-KR.js"></script>
    

    <title></title>
     
    <script>
 $(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 400, //최소높이
	        maxHeight: null, //최대높이
	        focus: true,  //에디터 로딩 후 초커스를 맞출지 여부
	        lang : 'ko-KR' // 한글 설정
	  });
	}); 
</script> 
<style>

</style>

  </head>
  <body>

    <article class="contentWrapper">
    
  	<input type="hidden" name="boardtable_seq" value="${boardtable_seq }" id="boardtable_seq">
	<input type="hidden" name="pg" value="${pg }">  
     <br><br>
      <div class="writeContent">
        <div class="writeEditor">
        	<br><br>
			<div style="width: 95%; margin: auto;">
				<form method="post" action="/write">
				<input type="text" id="subject" name="subject" placeholder="제  목" value="${boardDTO.subject }">
				 <div id="sujectDiv" ></div>
				<hr align="center" width="100%" size="15" color="black">
					<textarea id="summernote" name="content">${boardDTO.content }</textarea>
					<div id="contentDiv" ></div>	
			</div>
			
			

        </div>
        <div class="writeOption">
          <div class="saveOptionWrapper">
            <button type="reset" class="btn- resetBtn" id="boardWriteBtn-" style="font-size:13px; border-radius:20px; border: 1px solid #343a40; outline: none !important; margin:5px; height:40px;" >다시작성</button><br>
            <button type="button" class="btn-" id="boardModifyBtn"style="font-size:13px; border-radius:20px; border: 1px solid #343a40; outline: none !important; margin:5px; height:40px;">수정하기</button>
            
          </div>
        </div>
				</form>
      </div>
    </article>
  </body>
<!--    <!-- Bootstrap core JS-->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
  
	<!-- Third party plugin JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
  
   <!--AOS 라이브러리-->
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  
  <!-- JS, Popper.js, and jQuery -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
  <!-- Core theme JS-->

 <script src="../js/board/boardModifyForm.js"></script>
</html>
