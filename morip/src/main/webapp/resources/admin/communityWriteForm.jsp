<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>morip</title>
    <meta charset="utf-8">
    <title></title>
    <link href="../css/admin/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
 	<!-- 추가본 -->
 	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
 	<link href="../css//admin/communityWriteForm.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="../css/admin/bootstrap.min.css" rel="stylesheet" />
	<link href="../css/admin/sb-admin-2.min.css" rel="stylesheet">
  </head>
  <body>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <div class="">
        <a class="navbar-brand" href="dashboard">[MO:RIP]</a>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

        </form>
        <!-- Navbar-->
        <div class="topbar-divider d-none d-sm-block"></div>
      </div>
      <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="dashboard">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            통계
                        </a>
                        <div class="sb-sidenav-menu-heading">management</div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#blog" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                              블로그 관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="blog" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="blogDB">블로그 DB 관리</a>
                                <a class="nav-link" href="../blog/blogList">블로그 페이지 이동</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#matzip" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-utensils" style="width: 16.2px; height: 14.5px;"></i></div>
                              맛집 관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="matzip" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                              <a class="nav-link" href="matzipDB">맛집 DB 관리</a>
                              <a class="nav-link" href="matzipWriteForm">맛집 등록</a>
                                <a class="nav-link" href="../matzip/matzipListShow">맛집 페이지 이동</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#board" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                              커뮤니티 관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="board" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                              <a class="nav-link" href="communityDB">커뮤니티 DB 관리</a>
                              <a class="nav-link" href="communityWriteForm">커뮤니티 공지사항 등록</a>
                                <a class="nav-link" href="../board/boardList">커뮤니티 페이지 이동</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="memberDB">
                            <div class="sb-nav-link-icon"><i class="fas fa-user" style="width: 16.2px; height: 14.5px;"></i></div>
                              회원 DB 관리
                        </a>
                        <div class="sb-sidenav-menu-heading">Addons</div>
                        <a class="nav-link" href="../main/index">
                            <div class="sb-nav-link-icon"><i class="fas fa-home"></i></i></div>
                            메인화면으로 이동
                        </a>
                        <a class="nav-link" href="../member/logout">
                            <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                            관리자 로그아웃
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Admin
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
          <content>
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold">커뮤니티 공지사항 등록</h6>
              </div>
            <!-- 글작성부분  -->
		    <article class="container">		    
			<form class="communityWriteForm" method="post" action="/write">
			<div class="container_writeForm">
				<div class="writeForm">
					<div class="subjectForm">
					<br>
						<input type="text" id="subject" name="subject" placeholder="제  목">
						<div id="subjectDiv"></div>
						<hr align="center" width="100%" size="15">
					</div>
					<textarea id="summernote" name="content"></textarea>
					<div id="summernoteDiv"></div>
				</div>
			</div>
			<div class="writeOption">
				<div class="saveOptionWrapper">
					<button type="reset" class="btn- resetBtn" id="boardResetBtn">다시작성</button>
					<br>
					<button type="button" class="btn-" id="boardWriteBtn">저장하기</button>
				</div>
			</div>
			</form>
		  </article>
            </div>
          </content>
        </div>
    </div>
  </body>
<!-- 위에 있어서 필요 없고 -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script> -->
<script src="../js/admin/scripts.js"></script>
<!-- 다필요 없는거같은데 잘 모르겠다. -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script> -->
<!-- 추가 -->
<script type="text/javascript" src="../js/admin/communityWriteForm.js"></script>
<script>
	$(document).ready(function() {
    	$('#summernote').summernote({
    		placeholder: "content",
	    	minHeight: 500,             // 최소 높이
	   	 	maxHeight: 500,             // 최대 높이
	    	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	    	lang: "ko-KR"	    	
    	});
	});
	
	$('#boardWriteBtn').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();	
		if($('#subject').val() ==''){
			Swal.fire({
				icon: 'warning',
				title: '제목을 입력하세요.',
				confirmButtonText: '확인'
				})
		}else if($('#summernote').val() ==''){
			Swal.fire({
				icon: 'warning',
				title: '내용을 입력하세요.',
				confirmButtonText: '확인'
				})
		}else{
			$.ajax({
				type: 'post',
				url: '../admin/communityWrite',
				data: {'subject': $('#subject').val(),
					   'content': $('#summernote').val()},
				success: function(){
				$('#testBtn').trigger('click', 'continue');
						Swal.fire({
	 					icon: 'success',
	  					title: '글작성 완료!',
	  					text: '작성하신글이 저장 되었습니다.',
	  					confirmButtonText: '확인'
					}).then((result) => {
						if (result.value) {							
						location.href = '../admin/communityWriteForm';
						}
					})
				},
				error: function(err){
					console.log(err);
				}
			});		
		}
	});	
</script>
</html>
