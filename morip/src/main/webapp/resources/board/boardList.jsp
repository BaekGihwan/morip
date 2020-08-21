
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../css//board/boardList.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!--===============================================================================================-->
</head>
<body>
	
	<div class="container-boardList">
		<input type="hidden" value="${memEmail }" id="email">
		<input type="hidden" id="pg" value="${pg }">
		<div class="bordListTitle-">
		<span class="bordListTitle">커뮤니티</span> <!-- <button type="button" id="boardWriteBtn">글쓰기</button> -->
		<p id="boardWriteBtn">게시판 작성하기</p>
		</div>
		<table id="boardListTable" cellspacing="0" cellpadding="3" frame="hsides" rules="rows" height="100px;">
			<tr>
				<th width='160' >글번호</th>
				<th width='475'>제목</th>
				<th width='160'>작성자</th>
				<th width='160'>작성일</th>
				<th width='160'>조회</th>
			</tr>
		</table>
		<br>
		<div id="boardPagingDiv" style="text-align: center;"></div>




		<form>
			<input type="hidden" name="pg" value="1">
			<div class="searchba"style="width: 1120px; text-align: center;">
				<select name="searchOption" id="searchOption">
					<option  value="subject" selected>제목</option>
					<option value="nickname">작성자</option>
				</select>
				 <input type="search" name="keyword" id="keyword" placeholder="검색어를 입력하세요."
					value="${keyword }"> 
					<input type="button" id="boardSearchBtn" value="검색">
			</div>
			<br>
		</form>
	</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript" src="../js/board/boardList.js?var=1"></script>
<script type="text/javascript">
 	window.onload = function() {
		if ("${searchOption}" == "subject" || "${searchOption}" == "nickname") {
			document.getElementById("searchOption").value = "${searchOption}";
		}
	}

	
	function boardPaging(pg) {
		var keyword = document.getElementById("keyword").value;
		if (keyword == "") {
			location.href = "boardList?pg=" + pg;
		} else {
			//location.href="getBoardSearch?pg="+pg+"&searchOption=${searchOption}&keyword="+encodeURIComponent("${keyword}");

			$('input[name=pg]').val(pg);
			$('#boardSearchBtn').trigger('click', 'continue');
		}
	} 
	
	

</script>

