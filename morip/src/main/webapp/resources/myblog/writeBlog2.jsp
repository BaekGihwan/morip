<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">

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
<link href="../css/myblog/step4.css" rel="stylesheet" />

<!-- include jquery -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>

<!-- include Bootstrap and fontawesome-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />

<!-- include summernote css/js-->
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

<!-- include summernote plugin-->
<script type="text/javascript"
	src="../js/myblog/summernote-map-plugin-master/summernote-map-plugin.js"></script>

<title></title>
<style>
iframe {
	height: 100%;
}
</style>
</head>
<body>
	<input type="hidden" id="nickname" value="${nickname }">
	<input type="hidden" id="subject" value="${subject }">
	<input type="hidden" id="backgroundImg" value="${fileName }">
	<input type="hidden" id="startdate" value="${startdate }">
	<input type="hidden" id="enddate" value="${enddate }">
	<article class="contentWrapper">
		<div class="content">
			<div class="writeEditor">
				<!--상태 진행 바-->
				<div class="contentHeader" style="">여행기 작성</div>
				<div class="stepBarWrapper">
					<input type="hidden" id="stepPg" value="2">
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
						<textarea name="content" id="summernote" value=""></textarea>
					</div>
				</div>
			</div>
			<div class="writeOption">
				<div class="stepChoiceWrapper">
					<div class="hvr-backward " id="backwardBtn">
						<div class="stepChoiceContent">이 전</div>
					</div>
				</div>
				<div class="saveOptionWrapper">
					<button type="button" id="previewBtn"class="btn btn-outline-secondary"
						style="font-size: 13px; border-radius: 20px; border: 1px solid gray; margin: 5px; width: 70%; height: 40px;">미리보기</button>
					<br>
					<button type="button" id="saveBtn"
						class="btn btn-outline-secondary"
						style="font-size: 13px; border-radius: 20px; border: 1px solid gray; margin: 5px; width: 70%; height: 40px;">저장하기</button>
					<!--switch-->
<!-- 					<div class="saveOption">
						<div class="switch">
							<p>공개 설정</p>
							<div class="primary-switch">
								<input type="checkbox" id="primary-switch" checked> <label
									for="primary-switch"></label>
							</div>
							<div class="switch_infomation">
								<p>
									공개 여부를 설정합니다.<br> 활성화 시 다른 사용자에게 공개되며,<br> 비활성화시
									다른유저에게 보이지 않습니다.
								</p>
							</div>
						</div>
					</div> -->
					<div class="hashtagWrapper">
						<div class="hashtagTitle">해쉬태그</div>
						<div class="hashtagInput">
							<textarea id="hashtagInputText" style="resize: none;"
								placeholder="#해쉬태그 #입력하세요"></textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>

</body>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!--AOS 라이브러리-->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- Core theme JS-->
<script src="../js/myblog/writeBlog.js"></script>
<script src="../js/myblog/writeBlog2.js"></script>s
</html>
