<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->

<!--AOS 라이브러리-->
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
<!--hover.css-->
<link href="../css/hover.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/myblog/writeBlog.css" rel="stylesheet" />
<!-- CSS only -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="../css/myblog/step2.css" rel="stylesheet" />

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<title></title>
</head>
<body>
	<form method="post" id="writeBlogForm" name="writeBlogForm"
		enctype="multipart/form-data" action="">
		<input type="hidden" id="startdate" value="${startdate }"> <input
			type="hidden" id="enddate" value="${enddate }">
		<article class="contentWrapper">
			<div class="content">
				<div class="writeEditor">
					<!--상태 진행 바-->
					<div class="contentHeader" style="">여행기 작성</div>
					<div class="stepBarWrapper">
						<input type="hidden" id="stepPg" value="1">
						<div class="step1">
							<div class="stepHeader">STEP1</div>
							<div class="stepContent">여행 일정 등록</div>
						</div>
						<div class="step2">
							<div class="stepHeader">STEP2</div>
							<div class="stepContent">에세이 제목과 배경 설정</div>
						</div>
						<div class="step3">
							<div class="stepHeader">STEP3</div>
							<div class="stepContent">에세이 내용 작성</div>
						</div>
					</div>
					<!--본격적인 에디터 본문-->
					<div class="editorContentWrapper">
						<div class="editorContent">
							<div class="inputWrapper">
								<div class="input">
									<div class="subjectInput">
										<h6>여행기 제목</h6>
										<br> <input type="text" name="subject" id="subject"
											placeholder="여행기 제목을 입력하세요!" onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'First Name'" required
											class="single-input">
									</div>
									<div class="imgInput">
										<h6>배경 사진 선택</h6>
										<br>
										<div class="userChoiceImg">
											<img id="bgImg" src="../storage/basicUserImage.png"
												style="width: 100%; height: 100%;" />
										</div>
										<input name="backgroundImg" id="backgroundImg"
											class="backgroungImgChoice" type="file">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="writeOption">
					<div class="stepChoiceWrapper">
						<div class="hvr-backward " id="backwardBtn">
							<div class="stepChoiceContent">이 전</div>
						</div>
						<div class="hvr-forward" id="forwardBtn">
							<div class="stepChoiceContent">다 음</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</form>
</body>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Bootstrap core JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!--AOS 라이브러리-->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- Core theme JS-->
<script src="../js/myblog/writeBlog.js"></script>
</html>