<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>morip</title>
    <meta charset="utf-8">
    <title></title>
    <link href="../css/admin/styles.css" rel="stylesheet" />
    <link href="../css/admin/dashboard.css" rel="stylesheet">
    <link href="../css/admin/sb-admin-2.min.css" rel="stylesheet">
    <link href="../css/admin/sb-admin-2.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
  </head>
  <body>
  <!-- 남여 성별 그래프 값 받아오기-->
  <input type="hidden" class="man" value="${man }">
  <input type="hidden" class="woman" value="${woman }">
  <!-- 주간 그래프 값 받아오기 -->
  <input type="hidden" id="mon" value="${weekDTO.mon }">
  <input type="hidden" id="tue" value="${weekDTO.tue }">
  <input type="hidden" id="wed" value="${weekDTO.wed }">
  <input type="hidden" id="thur" value="${weekDTO.thur }">
  <input type="hidden" id="fri" value="${weekDTO.fri }">
  <input type="hidden" id="sat" value="${weekDTO.sat }">
  <input type="hidden" id="sun" value="${weekDTO.sun }">
  <!-- 월간 그래프 값 받아오기 -->
  <input type="hidden" id="jan" value="${monthDTO.jan }">
  <input type="hidden" id="feb" value="${monthDTO.feb }">
  <input type="hidden" id="mar" value="${monthDTO.mar }">
  <input type="hidden" id="apr" value="${monthDTO.apr }">
  <input type="hidden" id="may" value="${monthDTO.may }">
  <input type="hidden" id="jun" value="${monthDTO.jun }">
  <input type="hidden" id="jul" value="${monthDTO.jul }">
  <input type="hidden" id="aug" value="${monthDTO.aug }">
  <input type="hidden" id="sep" value="${monthDTO.sep }">
  <input type="hidden" id="oct" value="${monthDTO.oct }">
  <input type="hidden" id="nov" value="${monthDTO.nov }">
  <input type="hidden" id="dec" value="${monthDTO.dec }">
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
            <div class="container-fluid">
              <!-- Page Heading -->
              <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
              </div>

              <!--첫번째 줄 -->
              <div class="row">
                <!-- 총 방문자 수 -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">총 회원 수</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800" id="totalmember"></div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-user fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 하루 방문자 수 -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-success text-uppercase mb-1">총 블로그 수</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800" id="totalblog"></div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-book-open fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 총 블로그 수 -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">총 커뮤니티 작성 수</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800" id="totalboard"></div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-file-alt fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 하루 블로그 작성 수 -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-info text-uppercase mb-1">총 맛집 등록 개수</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800" id="totalmatzip"></div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-utensils fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!--두번째 줄 -->
              <div class="row">
                <!-- 총 방문자 수 -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">일일 신규 회원 수</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800" id="todaySignUp"></div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-user fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 하루 방문자 수 -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-success text-uppercase mb-1">일일 블로그 작성 수</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800" id="todayblog"></div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-book-open fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 총 블로그 수 -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">일일 커뮤니티 작성 수</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800" id="todayboard"></div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-file-alt fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 하루 블로그 작성 수 -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-info text-uppercase mb-1">일일 방문자 현황</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800" id="todayEnter"></div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Content Row -->
              <div class="row">
                <!-- 주간, 월간, 연간 차트 -->
                <div class="col-xl-8 col-lg-7">
                  <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                      <h6 class="m-0 font-weight-bold text-primary" id="chartTitle">월간 방문자 수</h6>
                      <div class="dropdown no-arrow">
                        <div id="btnWrapper">
                          <div id="weekBtn">
                            주간
                          </div>
                          <div id="monthBtn">
                            월간
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                      <div class="chart-area">
                        <canvas id="monthChart" class="monthChart"></canvas>
                        <canvas id="weekChart" class="weekChart"></canvas>
                      </div>
                    </div>
                  </div>
                </div>
                <!--남녀 비율 파이 그래프 -->
                <div class="col-xl-4 col-lg-5">
                  <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                      <h6 class="m-0 font-weight-bold text-primary">이용자 성별 분포</h6>
                      <div class="dropdown no-arrow">
                      </div>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                      <div class="chart-pie pt-4 pb-2">
                        <canvas id="myPieChart"></canvas>
                      </div>
                      <div class="mt-4 text-center small">
                        <span class="mr-2">
                          <i class="fas fa-circle" style="color:#8e93ae;"></i> man
                        </span>
                        <span class="mr-2">
                          <i class="fas fa-circle" style="color:#bec3e0;"></i> woman
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
          </content>
        </div>
    </div>
  </body>
  <!-- Bootstrap core JavaScript-->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="../js/admin/sb-admin-2.min.js"></script>
  <script src="../js/admin/Chart.min.js"></script>
  <script src="../js/admin/chart-area-demo.js"></script>
  <script src="../js/admin/scripts.js"></script>
  <script type="text/javascript" src="../js/admin/dashboard.js"></script>
</html>
