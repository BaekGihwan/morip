<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>morip</title>
    <meta charset="utf-8">
    <title></title>
    <link href="../css/admin/styles.css" rel="stylesheet" />
    <link href="../css/admin/sb-admin-2.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    
    <!-- ======================================================================== -->
    <link href="../css/admin/matzipWriteForm.css" rel="stylesheet" type="text/css">
    <!-- ======================================================================== -->
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
                                 <!-- <a class="nav-link" href="blogDB">블로그 DB 관리</a> -->
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
                <h6 class="m-0 font-weight-bold">맛집 정보 등록</h6>
              </div> 
	          <form name="matzipWriteForm" id="matzipWriteForm" method="post" enctype="multipart/form-data">
	          <div class="container-matzipWriteForm">            
				<div class="matzipWriteForm">			
				  <div class="mainImage">			
					<div class="imageInput">
				      <p class="matzipText">대표이미지</p>
					  <div class="matzipChoiceImage">
					    <img id="mainImg" src="../storage/noimage2.png" style="width: 100%; height: 100%;">
					  </div><br>					 
					  <div class="changeMatzipImage">
	             	    <label for="image">이미지 등록</label>
			     		<input type="file" name="image" id="image" class="btn-file" onchange="change(this.files)">
	             	  </div>
					</div>
				  </div>
				  <div class="information">
					<div class="matzipTitleForm">
					  <div class="matzipForm">
					    <span class="matzipText">가게이름</span>
					  </div>
					  <input type="text" name="matzipTitle" id="matzipTitle" class="matzip" placeholder="ex) 밀레니엄 안동찜닭">
					  <div id="matzipTitleDiv"></div>
					</div>			  
				    <div class="matzipCategoryForm">			    
					  <div class="matzipForm">
						<span class="matzipText">카테고리</span>
					  </div>
					  <input type="text" name="matzipCategory" id="matzipCategory" class="matzip" placeholder="ex) 한식>찜닭">
					  <div id="matzipCategoryDiv"></div>
				    </div>
					<div class="matzipTelephoneForm">
					  <div class="matzipForm">
						<span class="matzipText">전화번호</span>
					  </div>
					  <input type="text" name="matzipTelephone" id="matzipTelephone" class="matzip" placeholder="전화번호를 입력해주세요.">
					  <div id="matzipTelephoneDiv"></div>
					</div>
					<div class="matzipRoadaddressForm">
					  <div class="matzipForm">
						<span class="matzipText">도로명주소</span>
					  </div>
					  <input type="text" name="matzipRoadaddress" id="matzipRoadaddress" class="matzip" placeholder="도로명주소를 입력해주세요.">
					  <div id="matzipRoadaddressDiv"></div>
					</div>
					<div class="matzipAddressForm">
					  <div class="matzipForm">
						<span class="matzipText">지번주소</span>
					  </div>
					  <input type="text" name="matzipAddress" id="matzipAddress" class="matzip" placeholder="지번주소를 입력해주세요.">
					  <div id="matzipAddressDiv"></div>
					</div>			    
					<div class="matzipTimeForm">
					  <div class="matzipForm">
					    <span class="matzipText">영업시간</span>
					  </div>
					  <input type="text" name="matzipTime" id="matzipTime" class="matzip" placeholder="영업시간을 적어주세요">
					</div>
					<div class="matzipLinkForm">
					  <div class="matzipForm">
					    <span class="matzipText">홈페이지주소</span>
					  </div>
					  <input type="text" name="matzipLink" id="matzipLink" class="matzip" placeholder="없을경우 작성하지마시오.">
					</div>
				  </div>
	            </div><br>
				<div class="matzipButtonForm">
				  <button type="button" class="matzipBtn" id="matzipWriteBtn">작성하기</button>
				  <button type="reset" class="matzipBtn">다시작성</button>
				</div><br><br>
	          </div>
	          </form>
            </div>       

          </content>
        </div>
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="../js/admin/scripts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script type="text/javascript">
  	$('#matzipWriteBtn').click(function(){
  		
  		if($('#matzipTitle').val()==''){
  			Swal.fire({
  				icon:'warning',
  				title:'가게이름을 입력하세요.',
  				confirmButtonText:'확인'
  			})
  		}else if($('#matzipCategory').val()==''){
  			alert($('#matzipTitle').val())
  			Swal.fire({
  				icon:'warning',
  				title:'카테고리를 입력하세요.',
  				confirmButtonText:'확인'
  			})
  		}else if($('#matzipTelephone').val()==''){
  			Swal.fire({
  				icon:'warning',
  				title:'전화번호를 입력하세요.',
  				confirmButtonText:'확인'
  			})
  		}else if($('#matzipRoadaddress').val()==''){
  			Swal.fire({
  				icon:'warning',
  				title:'도로명주소를 입력하세요.',
  				confirmButtonText:'확인'
  			})
  		}else if($('#matzipAddress').val()==''){
  			Swal.fire({
  				icon:'warning',
  				title:'지번주소를 입력하세요.',
  				confirmButtonText:'확인'
  			})
  		}else if($('#matzipTime').val()==''){
  			Swal.fire({
  				icon:'warning',
  				title:'영업시간을 입력하세요.',
  				confirmButtonText:'확인'
  			})
  		}else{
  			$.ajax({
  				type: 'post',
  				enctype: 'multipart/form-data',
  				processData: false, //문자열이 아닌 파일 형식으로 보내준다
  				contentType: false,
  				url:'../admin/writematzip',
  				data: new FormData($('#matzipWriteForm')[0]),
  				
  				 
  				success:function(){
  					
  					Swal.fire({
  						icon:'success',
  						title:'맛집등록 완료!',
  						text:'맛집이 등록 되었습니다.',
  						confirmButtonText:'확인'
  					}).then((result) => {
  						if (result.value) {
  							location.href='../admin/dashboard';
  						}
  					})

  				},
  				error:function(err){
  					console.log(err);

  				}
  			});
  		}
  	});
  	
  //사진을 업로드 하였을 때 바로 화면에 뿌려주기
    $('#image').change(function() {
        readURL(this);
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#mainImg').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
  	
  </script>
</html>
