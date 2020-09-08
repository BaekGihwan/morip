<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>view</title>
<!-- jQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="../css/myblog/view.css">
<link rel="stylesheet" type="text/css" href="../css/myblog/modifyForm.css">
<link rel="stylesheet" type="text/css" href="../css/hover.css">

<!-- include Bootstrap and fontawesome-->
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


<!-- flatpicker -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

</head>
<body>
	<input type="hidden" id="nickname" value="${nickname }">
	<input type="hidden" class="view_seq" value="${seq }">
	<input type="hidden" class="bgImgName" value="${myblogDTO.mainimage }">
	<div id="viewheader">
		<div class="background">
			<div class="backgroundImg"
				style="background: url('../storage/${myblogDTO.mainimage}') no-repeat 50% 50%; background-size: cover;">s
			</div>
			<div class="backgroundCover"></div>
		</div>
		<div class="subjectbackground">
			<div class="blogSubjectWrapper">
				<div class="dateWrapper">
					<input type="text" id="startdate" value="${myblogDTO.startdate}"
						readonly> ~ <input type="text" id="enddate"
						value="${myblogDTO.enddate}" readonly>
				</div>
				<div class="subjectWrapper">
					<input type="text" id="subject" value="${myblogDTO.subject}">
				</div>
				<div class="userinfowrapper">
					<img class="view_userImg" src="../image/myblog/pic01.jpg">
					<div class="view_userId" id="view_userId">${myblogDTO.nickname}</div>
				</div>
			</div>
		</div>
	</div>
	<article class="contentContainer">
		<div class="contentWrapper">
			<div id="bgChangeOption"
				style="font-size: 15px; margin-left: 505; left: 75%; top: 50px; cursor: pointer; position: absolute; width: 20px;">
				<i class="fas fa-cog" onclick="backgroundImgChange()"></i>
			</div>
			<div class="content">
				<div class="contentInner" style="margin: 0;">
					<textarea name="content" id="summernote" value="">${myblogDTO.content}</textarea>
				</div>
				<div id="hashtagInputWrapper">
					<div id="hashtagInput">
						<h5>해쉬태그</h5>
						<textarea id="hashtagInputText" placeholder="#해쉬태그 #입력하세요"></textarea>
					</div>
				</div>
				<div id="modifyBtnWrapper">
					<div id="modifyBtn" class="hvr-outline-in">
						<div>수정하기</div>
					</div>
					<div id="returnBtn" class="hvr-outline-in">
						<div>돌아가기</div>
					</div>
				</div>
			</div>
		</div>
	</article>
	<form id="modifyForm">
		<div class="modal fade" id="bgImgChange" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content" style="width: 400px; margin: auto;">
					<div class="modal-header" style="height: 50px;">
						<h4 class="modal-title"></h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<div class="imgInput">
							<h6>배경 사진 선택</h6>
							<br>
							<div class="userChoiceImg">
								<img id="bgImg" src="../storage/basicUserImage.png"
									style="width: 100%; height: 100%;" />
							</div>
							<input name="backgroundImg" id="backgroundImg"
								class="backgroungImgChoice" type="file"
								style="margin-top: 20px;">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" id="bgImageSave" class="btn btn-default"
							data-dismiss="modal">저장</button>
					</div>
					<div id="count" value="1"></div>
				</div>
			</div>
		</div>
	</form>
</body>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/myblog/view.js"></script>
<script src="../js/myblog/writeBlog.js"></script>
<script src="../js/myblog/modifyForm.js"></script>
</html>

