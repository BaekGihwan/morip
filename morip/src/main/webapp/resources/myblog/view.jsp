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
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
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

</head>
<body>
	<input type="hidden" id="pageNickname" value="${myblogDTO.nickname }">
	<input type="hidden" id="nickname" value="${nickname}">
	<input type="hidden" class="view_seq" value="${seq }">

	<div id="viewheader">
		<div class="background">
			<div class="backgroundImg"
				style="background: url('../storage/${myblogDTO.mainimage}') no-repeat 50% 50%; background-size: cover;">
			</div>
			<div class="backgroundCover"></div>
		</div>
		<div class="subjectbackground">
			<div class="blogSubjectWrapper">
				<div class="dateWrapper">${myblogDTO.startdate} ~
					${myblogDTO.enddate}</div>
				<div class="subjectWrapper">${myblogDTO.subject}</div>
				<div class="userinfowrapper">
					<img class="view_userImg" src="../storage/${memberDTO.image }">
					<div class="view_userId" id="view_userId">${myblogDTO.nickname}</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sideBar">
		<div class="likeOption">
			<button id="likeBtn">
				<i id="likeI" class="far fa-heart"></i>
			</button>
			<input type="hidden" id="likeViewCheck" value="">
			<p id="likeSize"></p>
		</div>
		<div class="replyOption">
			<i id="replyBtn" class="far fa-comment-dots"></i>
			<p id="replySize"></p>
		</div>
	</div>
	<article class="contentContainer">
		<div class="contentWrapper">
			<div class="content">
				<div class="contentInner">
					${myblogDTO.content}
					<br><br><br><br>
					<div id="hashtagDiv"></div>
				</div>
				<div class="view_boardOption">
					<div class="view_reply">
						<div class="view_replyWrapper">
							<i class="far fa-comment-dots"
								style="margin-right: 10px; margin-bottom: 0px;"></i>
							<p style="margin-bottom: 0px;">댓글쓰기</p>
						</div>
					</div>
				</div>
				<!--하단의 댓글 창 클릭(아마 이 부분은 AJAX 로 구현하실 것 같은데 class="view_replyBoard" 부븐을 전부 append 해주셔야 할 겁니다. )-->
				<div class="view_replyBoard" id="view_replyBoard">
					<div class="view_boardReplyInputWrapper">
						<div class="view_replyContentInputWrapper">
							<div class="reply_contentInput">
								<div class="reply_userID">   ${nickname}</div>
								<textarea id="replyInputBox${seq }" class="form-control"
									aria-label="With textarea" style="resize: none;"></textarea>
								<div class="reply_inputOption">
									<button id="insertBtn" class="btn btn-light"
										onclick="insertBtn(${seq})">등 록</button>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" class="replySeq" value="1">
					<!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
					<input type="hidden" class="checkReplyInput" value="off">
					<div class="replyInsertDiv">
						<!-- 댓글이 추가(append)되는 부분  -->
					</div>
				</div>
			</div>
		</div>
		<div class="view_controlOption">
			<i id="view_boardOption" class="fas fa-ellipsis-v"
				style="cursor: pointer;"></i>
		</div>
	</article>

	<!--view 로 보여주는 글 옵션 버튼 클릭 시 활성화 되는 div-->
	<div class="writeOptionDiv">
		<input type="hidden" id="clickCheck" value="off">
		<div id="modifyBoard">
			수정하기 <i class="far fa-edit"></i>
		</div>
		<div id="deleteBoard">
			삭제하기 <i class="fas fa-trash-alt"></i>
		</div>
	</div>
</body>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/myblog/view.js"></script>
</html>

